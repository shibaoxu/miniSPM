package org.minispm.security.entity;

import org.minispm.core.persistence.IdEntity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * User: shibaoxu
 * Date: 13-1-19
 * Time: 下午5:38
 */
@Entity
@Table(name = "ila_role")
public class Role extends IdEntity {
    private String name;
    private String description;
    private List<User> users = new ArrayList<User>();
    private List<Permission> permissions = new ArrayList<Permission>();

    public List<String> buildStringPermissions(){
        List<String> stringPermissions = new ArrayList<String>();
        for(Permission p : permissions){
            stringPermissions.add(p.toString());
        }
        return stringPermissions;
    }

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

    @ManyToMany
    @JoinTable(name = "ila_user_role",
            joinColumns = {@JoinColumn(name = "role_id")},
            inverseJoinColumns = {@JoinColumn(name = "user_id")})
    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

    @ManyToMany
    @OrderBy("operation, scope")
    @JoinTable(name = "ila_role_permission",
            joinColumns = {@JoinColumn(name = "role_id")},
            inverseJoinColumns = {@JoinColumn(name = "permission_id")}
    )
    public List<Permission> getPermissions() {
        return permissions;
    }

    public void setPermissions(List<Permission> permissions) {
        this.permissions = permissions;
    }

    @Override
    public String toString(){
        return name;
    }
}
