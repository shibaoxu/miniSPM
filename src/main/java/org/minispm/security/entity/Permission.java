package org.minispm.security.entity;

import org.minispm.core.persistence.IdEntity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * User: shibaoxu
 * Date: 13-1-29
 * Time: 下午7:16
 */
@Entity
@Table(name = "ila_permission")
public class Permission extends IdEntity {
    public static final String PERMISSION_SCOPE_SELF = "SELF";
    public static final String PERMISSION_SCOPE_SELFANDLOW = "SELFANDLOW";
    public static final String PERMISSION_SCOPE_BELONG = "BELONG";
    public static final String PERMISSION_SCOPE_BELONGANDLOW = "BELONGANDLOW";
    public static final String PERMISSION_SCOPE_WHOLE = "WHOLE";

    private Operation operation;
    private String scope;

    public String toString(){
        return operation.toString() + ":" + scope;
    }

    @ManyToOne
    @JoinColumn(name = "OPERATION_ID")
    public Operation getOperation() {
        return operation;
    }

    public void setOperation(Operation operation) {
        this.operation = operation;
    }

    public String getScope() {
        return scope;
    }

    public void setScope(String scope) {
        this.scope = scope;
    }
}
