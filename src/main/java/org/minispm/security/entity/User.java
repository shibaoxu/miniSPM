package org.minispm.security.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.minispm.core.persistence.IdEntity;
import org.minispm.admin.organization.entity.Staff;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: shibaoxu
 * Date: 12-11-27
 * Time: 下午8:43
 * To change this template use File | Settings | File Templates.
 */
@Entity
@Table(name = "ila_user")
public class User extends IdEntity implements Serializable{
    private static final long serialVersionUID = -1373760761780840081L;
    private String jobNumber;
    private String name;
    private String plainPassword;
    private String password;
    private String salt;
    private String mail;
    private String status;
    private transient Staff staff;
    private transient List<Role> roles = new ArrayList<Role>();

    public static final String ENABLED = "正常";
    public static final String LOCKED = "锁定";
    public static final String NOT_ACTIVE = "未激活";

    public User(){
        this.setSalt(User.ENABLED);
        this.setStatus(User.NOT_ACTIVE);
    }

    @Column(nullable = false)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Column(nullable = false)
    @JsonIgnore
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Column(nullable = false)
    @JsonIgnore
    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    @Column(nullable = false)
    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getJobNumber() {
        return jobNumber;
    }

    public void setJobNumber(String jobNumber) {
        this.jobNumber = jobNumber;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Transient
    public String getPlainPassword() {
        return plainPassword;
    }
    @Transient
    public String getLoginName(){
        return jobNumber;
    }
    public void setPlainPassword(String plainPassword) {
        this.plainPassword = plainPassword;
    }

    @JsonIgnore
    @ManyToMany(mappedBy = "users", fetch = FetchType.EAGER)
    public List<Role> getRoles() {
        return roles;
    }

    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }

    @ManyToOne
    @JoinColumn(name = "STAFF_ID")
    public Staff getStaff() {
        return staff;
    }

    public void setStaff(Staff staff) {
        this.staff = staff;
    }


}
