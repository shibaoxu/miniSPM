package org.minispm.security.dao;

import org.minispm.security.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

/**
 * User: shibaoxu
 * Date: 12-11-27
 * Time: 下午10:09
 */
public interface UserDao extends JpaRepository<User, String>, JpaSpecificationExecutor<User> {
    User findByJobNumber(String jobNumber);
    User findByJobNumberAndStatus(String jobNumber, String status);
    List<User> findByJobNumberLikeOrNameLikeOrStaffNameLike(String condition1, String condition2, String condition3 );
}
