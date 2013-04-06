package org.minispm.sale.entity;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

/**
 * Created with IntelliJ IDEA.
 * User: shibaoxu
 * Date: 13-3-17
 * Time: 下午8:36
 * To change this template use File | Settings | File Templates.
 */
@Entity
@DiscriminatorValue("0")
public class Leads extends LeadsBase {
}
