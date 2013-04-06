package org.minispm.core.persistence;

/**
 * Created with IntelliJ IDEA.
 * User: shibaoxu
 * Date: 12-11-27
 * Time: 下午8:46
 */
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Date;

/**
 * 统一定义id的entity基类.
 *
 * 基类统一定义id的属性名称、数据类型、列名映射及生成策略.
 *
 * @author calvin
 */
//JPA 基类的标识
@MappedSuperclass
public abstract class IdEntity {


    protected String id;
    protected Date createdDate;
    protected Date lastModifiedDate;

    protected IdEntity(){
        this.createdDate = new Date();
    }
    @Id
    @GenericGenerator(name="idGenerator", strategy="uuid")
    @GeneratedValue(generator = "idGenerator")
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Column(nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }
    @Temporal(TemporalType.TIMESTAMP)
    public Date getLastModifiedDate() {
        return lastModifiedDate;
    }

    public void setLastModifiedDate(Date lastModifiedDate) {
        this.lastModifiedDate = lastModifiedDate;
    }
}
