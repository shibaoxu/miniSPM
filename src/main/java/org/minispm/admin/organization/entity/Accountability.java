package org.minispm.admin.organization.entity;

import org.minispm.core.persistence.IdEntity;

import javax.persistence.*;

/**
 * User: shibaoxu
 * Date: 12-12-2
 * Time: 下午1:00
 */
@Entity
@Table(name = "ila_org_accountability")
public class Accountability extends IdEntity {

    private Unit parent;
    private Unit child;
    private AccountabilityType accountabilityType;

    @OneToOne(cascade = CascadeType.PERSIST, fetch = FetchType.EAGER)
    @JoinColumn(name = "PARENT_ID", nullable = true)
    public Unit getParent() {
        return parent;
    }

    public void setParent(Unit parent) {
        this.parent = parent;
    }

    @OneToOne(cascade = CascadeType.PERSIST, fetch = FetchType.EAGER)
    @JoinColumn(name = "CHILD_ID")
    public Unit getChild() {
        return child;
    }

    public void setChild(Unit child) {
        this.child = child;
    }

    @OneToOne(cascade = CascadeType.PERSIST)
    @JoinColumn(name = "ACCOUNTABILITY_TYPE_ID")
    public AccountabilityType getAccountabilityType() {
        return accountabilityType;
    }

    public void setAccountabilityType(AccountabilityType accountabilityType) {
        this.accountabilityType = accountabilityType;
    }
}
