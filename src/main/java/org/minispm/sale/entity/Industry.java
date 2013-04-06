package org.minispm.sale.entity;

import org.minispm.core.persistence.IdEntity;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * User: shibaoxu
 * Date: 12-12-16
 * Time: 下午5:38
 */
@Entity
@Table(name = "ila_industry")
public class Industry extends IdEntity {
    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
