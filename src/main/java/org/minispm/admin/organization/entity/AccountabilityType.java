package org.minispm.admin.organization.entity;

import org.minispm.core.persistence.IdEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * User: shibaoxu
 * Date: 12-12-2
 * Time: 下午1:01
 */

@Entity
@Table(name = "ila_org_accountability_type")
public class AccountabilityType extends IdEntity {
    private String name;
    private String description;

    public static final String ADMINISTRATOR_ORG = "ADMINISTRATOR";
    public static final String SALE_ORG = "SALE";

    @Column(nullable = false)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
