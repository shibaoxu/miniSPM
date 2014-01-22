package org.minispm.admin.organization.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * User: shibaoxu
 * Date: 12-12-2
 * Time: 下午12:44
 */
@Entity
@Table(name = "ila_staff")
public class Staff extends Unit implements java.io.Serializable {
    public Staff(){
        this.setTags("staff");
    }
    public Staff(String name){
        super(name);
        this.setTags("staff");
    }
}
