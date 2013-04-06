package org.minispm.sale.entity;

import org.apache.commons.lang3.StringUtils;
import org.minispm.core.persistence.IdEntity;
import org.minispm.core.utils.DateUtils;
import org.minispm.security.entity.User;

import javax.persistence.*;
import java.util.Date;

/**
 * User: shibaoxu
 * Date: 12-12-16
 * Time: 下午5:34
 */
@Entity
@Table(name = "ila_action")
public class Action extends IdEntity {
    private ActionType actionType;
    private LeadsBase leadsBase;
    private String customerParticipants;
    private String selfParticipants;
    private String brief;
    private String detail;
    private boolean milestone;
    private Date occurDate = new Date();
    private User owner;

    public static final String CREATED = "CREATED";
    public static final String CONVERT = "CONVERT";
    public Action(){}
    public Action(String actionType){
        if(StringUtils.equals(actionType, Action.CREATED)){
            this.actionType = new ActionType(ActionType.SYSTEM_ACTIOM);
            this.brief = "创建";
        }else if(StringUtils.equals(actionType, Action.CONVERT)){
            this.actionType = new ActionType(ActionType.SYSTEM_ACTIOM);
            this.brief = "转化成销售机会";
        }else{

        }
    }

    public String buildLastActionInfo(){
        return DateUtils.formatDate(this.occurDate) + ":" + this.brief;
    }
    @ManyToOne
    @JoinColumn(name = "ACTION_TYPE_ID")
    public ActionType getActionType() {
        return actionType;
    }

    public void setActionType(ActionType actionType) {
        this.actionType = actionType;
    }

    @ManyToOne
    @JoinColumn(name = "LEADS_ID")
    public LeadsBase getLeadsBase() {
        return leadsBase;
    }

    public void setLeadsBase(LeadsBase leadsBase) {
        this.leadsBase = leadsBase;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public boolean isMilestone() {
        return milestone;
    }

    public void setMilestone(boolean milestone) {
        this.milestone = milestone;
    }

    public Date getOccurDate() {
        return occurDate;
    }

    public void setOccurDate(Date occurDate) {
        this.occurDate = occurDate;
    }

    @ManyToOne
    @JoinColumn(name = "USER_ID")
    public User getOwner() {
        return owner;
    }

    public void setOwner(User owner) {
        this.owner = owner;
    }

    public String getBrief() {
        return brief;
    }

    public void setBrief(String brief) {
        this.brief = brief;
    }

    public String getCustomerParticipants() {
        return customerParticipants;
    }

    public void setCustomerParticipants(String customerParticipants) {
        this.customerParticipants = customerParticipants;
    }

    public String getSelfParticipants() {
        return selfParticipants;
    }

    public void setSelfParticipants(String selfParticipants) {
        this.selfParticipants = selfParticipants;
    }
}
