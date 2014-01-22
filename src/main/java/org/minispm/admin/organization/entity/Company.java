package org.minispm.admin.organization.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * User: shibaoxu
 * Date: 12-12-2
 * Time: 下午12:41
 */
@Entity
@Table(name = "ila_company")
public class Company extends Unit {
    public Company(){
    }
    public Company(String name){
        super(name);
    }
}
