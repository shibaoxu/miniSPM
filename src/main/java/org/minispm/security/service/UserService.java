package org.minispm.security.service;

import org.apache.commons.lang3.StringUtils;
import org.minispm.admin.organization.entity.Staff;
import org.minispm.core.utils.Encodes;
import org.minispm.security.dao.UserDao;
import org.minispm.security.entity.Role;
import org.minispm.security.entity.User;
import org.minispm.security.utils.Digests;
import org.minispm.security.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import org.springframework.web.bind.annotation.RequestParam;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.List;

/**
 * User: shibaoxu
 * Date: 12-11-28
 * Time: 下午10:07
 */
@Service
@Transactional(readOnly = true)
public class UserService {
    public static final String HASH_ALGORITHM = "SHA-1";
    public static final int HASH_INTERATIONS = 1024;
    private static final int SALT_SIZE = 8;
    private static final int PASSWORD_LENGTH = 8;

    private UserDao userDao;

    public List<User> findAll() {
        return userDao.findAll();
    }

    public List<User> findByCondition(String condition){
        String cond = "%" + condition + "%";
        return userDao.findByJobNumberLikeOrNameLikeOrStaffNameLike(cond, cond, cond);
    }
    public User findById(String id) {
        return userDao.findOne(id);
    }

    public User findByJobNumber(String jobNumber) {
//        return userDao.findByJobNumber(jobNumber);
        return userDao.findByJobNumberAndStatus(jobNumber, User.ENABLED);
    }

    public List<Role> getRolesByUserId(String id) {
        User user = userDao.findOne(id);
        if (user != null) {
            return user.getRoles();
        } else {
            return null;
        }
    }

    public List<String> getPermissionsByUserId(String id) {
        User user = userDao.findOne(id);
        List<String> stringPermissions = new ArrayList<String>();
        if (user != null) {
            for (Role role : user.getRoles()) {
                stringPermissions.addAll(role.buildStringPermissions());
            }
        }
        return stringPermissions;
    }

    public List<String> getRolesByJobNumber(String jobNumber) {
        User user = userDao.findByJobNumber(jobNumber);
        if (user != null) {
            List<Role> roles = user.getRoles();
            List<String> stringRoles = new ArrayList<String>();
            for (Role role : roles) {
                stringRoles.add(role.toString());
            }
            return stringRoles;
        } else {
            return null;
        }
    }

    public List<User> transStaffsToUsers(final List<Staff> staffs) {
        return userDao.findAll(
                new Specification<User>() {
                    @Override
                    public Predicate toPredicate(Root<User> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                        return root.get("staff").in(staffs);
                    }

                });
    }

    @Transactional(readOnly = false)
    public void changePassword(@RequestParam String oldPassword, @RequestParam String newPassword){
        if(StringUtils.isBlank(newPassword)){
            throw new RuntimeException("不能设置空密码");
        }
        String userId = SecurityUtils.getCurrentShiroUser().getId();
        User user = userDao.findOne(userId);
        String encryptOldPassword = Encodes.encodeHex(Digests.sha1(oldPassword.getBytes(), Encodes.decodeHex(user.getSalt()), HASH_INTERATIONS));
        if(user.getPassword().equals(encryptOldPassword)){
            user.setPlainPassword(newPassword);
            encryptPassword(user);
            userDao.save(user);
        }else{
            throw new RuntimeException("你输入的旧密码错误");
        }
    }

    @Transactional(readOnly = false)
    public User save(User user) {
        if (StringUtils.isBlank(user.getId())) {
//            String randomPassword = RandomStringUtils.randomAlphanumeric(PASSWORD_LENGTH);
//            user.setPlainPassword(randomPassword);
            user.setPlainPassword(user.getJobNumber());
            encryptPassword(user);
        }
        return userDao.save(user);
    }

    @Transactional(readOnly = false)
    public void delete(String id) {
        userDao.delete(id);
    }

    @Transactional(readOnly = false)
    public void lock(String id){
        User user = userDao.findOne(id);
        if(StringUtils.equalsIgnoreCase(user.getStatus(),User.ENABLED)){
            user.setStatus(User.LOCKED);
            save(user);
        }
    }

    @Transactional(readOnly = false)
    public void unlock(String id){
        User user = userDao.findOne(id);
        if(StringUtils.equalsIgnoreCase(user.getStatus(),User.LOCKED)){
            user.setStatus(User.ENABLED);
            save(user);
        }
    }

    @Transactional(readOnly = false)
    public void active(String id){
        User user = userDao.findOne(id);
        if(StringUtils.equalsIgnoreCase(user.getStatus(),User.NOT_ACTIVE)){
            user.setStatus(User.ENABLED);
            save(user);
        }
    }

    private void encryptPassword(User user) {
        byte[] salt = Digests.generateSalt(SALT_SIZE);
        user.setSalt(Encodes.encodeHex(salt));

        byte[] hashPassword = Digests.sha1(user.getPlainPassword().getBytes(), salt, HASH_INTERATIONS);
        user.setPassword(Encodes.encodeHex(hashPassword));
    }

    public UserDao getUserDao() {
        return userDao;
    }

    @Autowired
    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }
}
