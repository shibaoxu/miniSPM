package org.minispm.security.entity;

import org.minispm.core.persistence.IdEntity;

import javax.persistence.*;

/**
 * User: shibaoxu
 * Date: 13-1-30
 * Time: 上午11:52
 */
@Entity
@Table(name = "ila_operation")
public class Operation extends IdEntity {
    private String name;
    private String brief;
    private Domain domain;

    public String toString(){
        return domain.getName() + ":" + name;
    }
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBrief() {
        return brief;
    }

    public void setBrief(String brief) {
        this.brief = brief;
    }

    @ManyToOne
    @JoinColumn(name = "DOMAIN_ID")
    public Domain getDomain() {
        return domain;
    }

    public void setDomain(Domain domain) {
        this.domain = domain;
    }
}
