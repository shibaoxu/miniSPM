package org.minispm.admin.organization.service;

import org.minispm.admin.organization.dao.AccountabilityDao;
import org.minispm.admin.organization.dao.AccountabilityTypeDao;
import org.minispm.admin.organization.dao.StaffDao;
import org.minispm.admin.organization.dao.UnitDao;
import org.minispm.admin.organization.entity.*;
import org.minispm.admin.organization.utils.UnitTree;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

/**
 * User: shibaoxu
 * Date: 12-12-2
 * Time: 下午8:19
 */
@Service
@Transactional(readOnly = true)
public class OrganizationService {

    private AccountabilityDao accountabilityDao;
    private AccountabilityTypeDao accountabilityTypeDao;
    private UnitDao unitDao;
    private StaffDao staffDao;

    /*=========Accountability===============*/
    /***
     * 获得某个组织架构的跟节点
     * @param accountabilityTypeid 组织结构类型
     * @return 组织结构的根节点
     */
    public Unit getRoot(String accountabilityTypeid){
        List<Accountability> accountabilities = accountabilityDao.findRoot(accountabilityTypeid);
        if (accountabilities.size() > 0){
            return accountabilities.get(0).getChild();
        }else {
            return null;
        }
    }

    /***
     * 获得某一组织节点的下级借点
     * @param parentId 上级Id
     * @param accountabilityTypeId 组织结构类型
     * @return
     */
    public List<Unit> getChildren(String parentId, String accountabilityTypeId){
        List<Accountability> accountabilities = accountabilityDao.getChildren(parentId, accountabilityTypeId);
        List<Unit> units = new ArrayList<Unit>();
        for(Accountability accountability : accountabilities){
            units.add(accountability.getChild());
        }
        return units;
    }

    /**
     * 获取所在组织及所有下级组织
     * @param staffId 员工Id
     * @param accountabilityTypeId 组织结构类型
     * @return
     */
    public List<Unit> getBelongAndDescendantOrg(String staffId, String accountabilityTypeId){
        Unit belongOrg = getBelongOrg(staffId, accountabilityTypeId);
        List<Unit> descendants = new ArrayList<Unit>();
        descendants.add(belongOrg);
        getChildOrg(belongOrg.getId(), accountabilityTypeId, descendants);
        return descendants;
    }

    /***
     * 获得自身及所有直接下属员工
     * @param staffId
     * @param accountabilityTypeID
     * @return
     */
    public List<Staff> getSelfAndDescendantStaff(String staffId, String accountabilityTypeID){
        Staff self = staffDao.findOne(staffId);
        if (self == null){
            throw  new RuntimeException("编号为{" + staffId + "}的员工不存在");
        }
        List<Staff> descendants = new ArrayList<Staff>();
        descendants.add(self);
        getDescendantsStaff(staffId, accountabilityTypeID, descendants);
        return descendants;
    }
    /***
     * 获得上级组织或个人
     * @param accountabilityTypeId
     * @param unitId
     * @return
     */
    public Unit getParent(String accountabilityTypeId, String unitId){
        Accountability parent = accountabilityDao.getParent(accountabilityTypeId, unitId);
        if (null != parent){
            return parent.getParent();
        }else {
            return null;
        }
    }
    /**
     * 获得所属组织
     * @param accountabilityTypeId
     * @param staffId
     * @return
     */
    public Unit getBelongOrg(String staffId, String accountabilityTypeId){
        Unit unit = unitDao.findOne(staffId);
        if(unit instanceof Company || unit instanceof Department){
            throw new RuntimeException("数据出现错误，该ID对应为公司或部门，应该对应员工");
        }

        Unit parent = getParent(accountabilityTypeId, staffId);
        while(parent != null){
            if(parent instanceof Department || parent instanceof Company){
                return parent;
            }else{
                parent = getParent(accountabilityTypeId, parent.getId());
                continue;
            }
        }
        return null;
    }

    @Transactional(readOnly = false)
    public void removeUnitFromTree(String orgTypeId, String unitId){
        if(isLeafNode(orgTypeId, unitId)){
            Accountability accountability = accountabilityDao.findByAccountabilityTypeIdAndChildId(orgTypeId, unitId);
            accountabilityDao.delete(accountability.getId());
        }else{
            throw new RuntimeException("只能从组织树中删除末级节点");
        }
    }
    @Transactional(readOnly = false)
    public void addUnitToTree(String orgTypeId, String parentId, String unitId){
        Accountability accountability = new Accountability();
        Unit parent = unitDao.findOne(parentId);
        Unit unit = unitDao.findOne(unitId);
        AccountabilityType accountabilityType = accountabilityTypeDao.findOne(orgTypeId);
        accountability.setParent(parent);
        accountability.setChild(unit);
        accountability.setAccountabilityType(accountabilityType);
        accountabilityDao.save(accountability);
    }

    public boolean isLeafNode(String orgTypeId, String unitId){
        List<Accountability> accountabilities = accountabilityDao.findByAccountabilityTypeIdAndParentId(orgTypeId, unitId);
        if (accountabilities.size() == 0)
            return true;
        else
            return false;
    }


    private void getChildOrg(String unitId, String accountabilityTypeId, List<Unit> descendants){
        List<Unit> children = getChildren(unitId, accountabilityTypeId);
        for(Unit unit : children){
            if(unit instanceof Company || unit instanceof Department){
                descendants.add(unit);
                getChildOrg(unit.getId(), accountabilityTypeId, descendants);
            }
        }
    }




    private void getDescendantsStaff(String staffId, String accountabilityTypeId, List<Staff> descendants){
        List<Unit> children = getChildren(staffId, accountabilityTypeId);
        for(Unit unit : children){
            if(unit instanceof Company || unit instanceof Department){
                throw new RuntimeException("违反组织结构规则，员工的下级只能是员工");
            }else{
                descendants.add((Staff)unit);
                getDescendantsStaff(unit.getId(), accountabilityTypeId, descendants);
            }
        }
    }






    /***
     * 获得某一类型的整个结构，通常为了输出z-tree使用的json格式
     * @param accountabilityTypeId 组织结构类型
     * @return 构建好的组织结构树
     */
    public UnitTree getStructure(String accountabilityTypeId){
        return getStructure(accountabilityTypeId, null);
    }
    public UnitTree getStructure(String accountabilityTypeId, String tagFilters){
        Unit root = getRoot(accountabilityTypeId);
        AccountabilityType orgAccountabilityType = new AccountabilityType();
        orgAccountabilityType.setId(accountabilityTypeId);
        UnitTree unitTree  = UnitTree.buildStructure(accountabilityDao.findByAccountabilityTypeId(accountabilityTypeId), orgAccountabilityType, root, tagFilters);
        return unitTree;
    }


    @Autowired
    public void setStaffDao(StaffDao staffDao) {
        this.staffDao = staffDao;
    }

    @Autowired
    public void setAccountabilityDao(AccountabilityDao accountabilityDao) {
        this.accountabilityDao = accountabilityDao;
    }

    @Autowired
    public void setUnitDao(UnitDao unitDao) {
        this.unitDao = unitDao;
    }

    @Autowired
    public void setAccountabilityTypeDao(AccountabilityTypeDao accountabilityTypeDao) {
        this.accountabilityTypeDao = accountabilityTypeDao;
    }
}
