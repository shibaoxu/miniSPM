package org.minispm.admin.organization.utils;

import org.apache.commons.lang3.StringUtils;
import org.minispm.admin.organization.entity.Accountability;
import org.minispm.admin.organization.entity.AccountabilityType;
import org.minispm.admin.organization.entity.Unit;

import java.util.ArrayList;
import java.util.List;

/**
 * User: shibaoxu
 * Date: 12-12-16
 * Time: 下午12:06
 */
public class UnitForTree extends Unit {

    private String pid;
    private List<UnitForTree> children = new ArrayList<UnitForTree>();

    public static UnitForTree buildStructure(List<Accountability> accountabilities, AccountabilityType accountabilityType, Unit root){
        if (root == null) return null;

        UnitForTree rootNode = new UnitForTree();
        rootNode.setId(root.getId());
        rootNode.setName(root.getName());
        buildChildren(accountabilities, rootNode);

        return rootNode;
    }

    private static void buildChildren(List<Accountability> accountabilities, UnitForTree parent){
        List<Unit> units = new ArrayList<Unit>();
        for(Accountability acc : accountabilities){
            if(acc.getParent() == null) continue;
            if (StringUtils.equals(acc.getParent().getId(), parent.getId()) && !StringUtils.equals(acc.getParent().getId(), acc.getChild().getId())){
                units.add(acc.getChild());
            }
        }

        for(Unit child : units){
            UnitForTree unitForTree = new UnitForTree();
            unitForTree.setId(child.getId());
            unitForTree.setName(child.getName());
            unitForTree.setPid(parent.getId());
            parent.getChildren().add(unitForTree);
            buildChildren(accountabilities, unitForTree);
        }
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public List<UnitForTree> getChildren() {
        return children;
    }

    public void setChildren(List<UnitForTree> children) {
        this.children = children;
    }
}
