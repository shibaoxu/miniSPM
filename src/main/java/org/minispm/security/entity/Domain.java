package org.minispm.security.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.minispm.core.persistence.IdEntity;

import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.util.ArrayList;
import java.util.List;

/**
 * User: shibaoxu
 * Date: 13-1-30
 * Time: 上午11:52
 */
@Entity
@Table(name = "ila_domain")
public class Domain extends IdEntity {
    private String name;
    private String detail;
    private List<Operation> operations = new ArrayList<Operation>();

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    @JsonIgnore
    @OneToMany(mappedBy = "domain")
    public List<Operation> getOperations() {
        return operations;
    }

    public void setOperations(List<Operation> operations) {
        this.operations = operations;
    }
}
