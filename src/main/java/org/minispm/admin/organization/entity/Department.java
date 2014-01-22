package org.minispm.admin.organization.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * User: shibaoxu
 * Date: 12-12-2
 * Time: 下午12:42
 */
@Entity
@Table(name = "ila_department")
public class Department extends Unit {
    public Department(){
    }
    public Department(String name){
        super(name);
    }
}
