package org.minispm.sale.entity;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import java.util.Date;

/**
 * User: shibaoxu
 * Date: 12-12-16
 * Time: 下午5:33
 */
@Entity
@DiscriminatorValue("1")
public class Opportunity extends LeadsBase {
    private Date planDealDate;

    public Date getPlanDealDate() {
        return planDealDate;
    }

    public void setPlanDealDate(Date planDealDate) {
        this.planDealDate = planDealDate;
    }
}
