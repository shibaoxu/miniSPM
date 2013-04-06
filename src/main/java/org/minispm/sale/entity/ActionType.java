package org.minispm.sale.entity;

import org.minispm.core.persistence.IdEntity;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * User: shibaoxu
 * Date: 12-12-16
 * Time: 下午7:13
 */
@Entity
@Table(name = "ila_action_type")
public class ActionType extends IdEntity {
    private String name;
    public static final String SYSTEM_ACTIOM = "system";

    public ActionType(){}

    public ActionType(String id){
        this.setId("system");
    }
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
