package org.minispm.admin.organization.entity;

import org.minispm.core.persistence.IdEntity;

import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;

/**
 * User: shibaoxu
 * Date: 12-12-2
 * Time: 下午12:47
 */
@Entity
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
public abstract class Unit extends IdEntity {

    private String name;

    public Unit(){}
    public Unit(String name){
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
