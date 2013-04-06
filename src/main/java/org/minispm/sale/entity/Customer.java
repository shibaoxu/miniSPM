package org.minispm.sale.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.minispm.core.persistence.IdEntity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * User: shibaoxu
 * Date: 12-12-16
 * Time: 下午5:32
 */
@Entity
@Table(name = "ila_customer")
public class Customer extends IdEntity {
    private String name;
    private String des;
    private Industry industry;
    private Scale scale;
    private Ownership ownership;
    private boolean develop;
    private List<Contact> contacts = new ArrayList<Contact>();


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    @JsonIgnore
    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    @ManyToOne
    @JoinColumn(name = "INDUSTRY_ID")
    @JsonIgnore
    public Industry getIndustry() {
        return industry;
    }

    public void setIndustry(Industry industry) {
        this.industry = industry;
    }

    @ManyToOne
    @JoinColumn(name = "SCALE_ID")
    @JsonIgnore
    public Scale getScale() {
        return scale;
    }

    public void setScale(Scale scale) {
        this.scale = scale;
    }

    @ManyToOne
    @JoinColumn(name = "OWNERSHIP_ID")
    @JsonIgnore
    public Ownership getOwnership() {
        return ownership;
    }

    public void setOwnership(Ownership ownership) {
        this.ownership = ownership;
    }

    @OneToMany(mappedBy = "customer")
    @JsonIgnore
    public List<Contact> getContacts() {
        return contacts;
    }

    public void setContacts(List<Contact> contacts) {
        this.contacts = contacts;
    }

    public boolean isDevelop() {
        return develop;
    }

    public void setDevelop(boolean develop) {
        this.develop = develop;
    }
}
