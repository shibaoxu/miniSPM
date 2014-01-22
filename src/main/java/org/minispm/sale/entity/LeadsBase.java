package org.minispm.sale.entity;

import org.minispm.admin.organization.entity.Department;
import org.minispm.core.persistence.IdEntity;
import org.minispm.security.entity.User;
import org.springframework.format.annotation.NumberFormat;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * User: shibaoxu
 * Date: 12-12-16
 * Time: 下午5:33
 */

@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(
        name = "OPPORTUNITY",
        discriminatorType = DiscriminatorType.INTEGER
)
@Table(name = "ila_leads")
public class LeadsBase extends IdEntity{
    private String name;
    private String des;
    private Customer customer;
    private Source source;
    @NumberFormat(style = NumberFormat.Style.NUMBER)
    private double lowAmount;
    @NumberFormat(style = NumberFormat.Style.NUMBER)
    private double highAmount;
    @NumberFormat(style = NumberFormat.Style.NUMBER)
    private double dealAmount;
    private User owner;
    private List<Action> actions = new ArrayList<Action>();
    private LeadsStatus status = LeadsStatus.OPENING;
    private ClosedReason closedReason;
    private String closeReasonDetail;
    private Date closeDate;
    private String lastInfo;
    private Department department;

    public LeadsBase(){
        this.setStatus(LeadsStatus.OPENING);
    }

    public void close(ClosedReason reason, String closeReasonDetail){
        this.setStatus(LeadsStatus.CLOSED);
        this.setClosedReason(reason);
        this.setCloseReasonDetail(closeReasonDetail);
        this.setCloseDate(new Date());
    }

    public void addAction(Action action){
        this.actions.add(action);
        action.setLeadsBase(this);
    }
    public String getName() {
        return name;
    }


    public void setName(String name) {
        this.name = name;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "CUSTOMER_ID")
    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "SOURCE_ID")
    public Source getSource() {
        return source;
    }

    public void setSource(Source source) {
        this.source = source;
    }

    public double getLowAmount() {
        return lowAmount;
    }

    public void setLowAmount(double lowAmount) {
        this.lowAmount = lowAmount;
    }

    public double getHighAmount() {
        return highAmount;
    }

    public void setHighAmount(double highAmount) {
        this.highAmount = highAmount;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "USER_ID")
    public User getOwner() {
        return owner;
    }

    public void setOwner(User owner) {
        this.owner = owner;
    }

    @OneToMany(cascade = {CascadeType.MERGE},mappedBy = "leadsBase")
    public List<Action> getActions() {
        return actions;
    }

    public void setActions(List<Action> actions) {
        this.actions = actions;
    }


    public LeadsStatus getStatus() {
        return status;
    }

    public void setStatus(LeadsStatus status) {
        this.status = status;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "CLOSED_REASON_ID")
    public ClosedReason getClosedReason() {
        return closedReason;
    }

    public void setClosedReason(ClosedReason closedReason) {
        this.closedReason = closedReason;
    }

    public String getCloseReasonDetail() {
        return closeReasonDetail;
    }

    public void setCloseReasonDetail(String closeReasonDetail) {
        this.closeReasonDetail = closeReasonDetail;
    }

    public double getDealAmount() {
        return dealAmount;
    }

    public void setDealAmount(double dealAmount) {
        this.dealAmount = dealAmount;
    }

    public String getLastInfo() {
        return lastInfo;
    }

    public void setLastInfo(String lastInfo) {
        this.lastInfo = lastInfo;
    }

    @ManyToOne
    @JoinColumn(name = "DEPARTMENT_ID")
    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public Date getCloseDate() {
        return closeDate;
    }

    public void setCloseDate(Date closeDate) {
        this.closeDate = closeDate;
    }


}
