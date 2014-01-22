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
public class UnitTree extends Unit {

    private String pid;
    private List<UnitTree> children = new ArrayList<UnitTree>();

    public static UnitTree buildStructure(List<Accountability> accountabilities, AccountabilityType accountabilityType, Unit root, String tagFilter) {
        if (root == null) return null;

        UnitTree rootNode = new UnitTree();
        rootNode.setId(root.getId());
        rootNode.setName(root.getName());
        buildChildren(accountabilities, rootNode, tagFilter);

        return rootNode;
    }

    private static void buildChildren(List<Accountability> accountabilities, UnitTree parent, String tagFilter) {
        List<Unit> units = new ArrayList<Unit>();
        for (Accountability acc : accountabilities) {
            if (acc.getParent() == null) continue;
            if (StringUtils.equals(acc.getParent().getId(), parent.getId()) && !StringUtils.equals(acc.getParent().getId(), acc.getChild().getId())) {
                if (acc.getChild().filter(tagFilter)) {
                    units.add(acc.getChild());
                }
            }
        }

        for (Unit child : units) {
            UnitTree unitTree = new UnitTree();
            unitTree.setId(child.getId());
            unitTree.setName(child.getName());
            unitTree.setPid(parent.getId());
            parent.getChildren().add(unitTree);
            buildChildren(accountabilities, unitTree, tagFilter);
        }
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public List<UnitTree> getChildren() {
        return children;
    }

    public void setChildren(List<UnitTree> children) {
        this.children = children;
    }
}
