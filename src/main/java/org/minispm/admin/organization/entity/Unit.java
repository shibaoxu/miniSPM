package org.minispm.admin.organization.entity;

import org.apache.commons.lang3.StringUtils;
import org.minispm.core.persistence.IdEntity;

import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 * User: shibaoxu
 * Date: 12-12-2
 * Time: 下午12:47
 */
@Entity
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
public abstract class Unit extends IdEntity {

    //部门以下组织
    public final static String TAG_GROUP = "org";
    //部门
    public final static String TAG_DEPARTMENT = "org;department";
    //事业部
    public final static String TAG_DIVISION = "org;department;division";
    //行业（对应副总裁）
    public final static String TAG_TRADE = "org;trade";
    //公司
    public final static String TAG_COMPANY = "org;company";
    //员工
    public final static String TAG_STAFF = "staff";


    @NotNull
    @Size(min = 5, message = "{unit.validation.name.length}")
    private String name;
    private String tags;

    public Unit(){}
    public Unit(String name){
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

    public void appendTags(String tags){
        if(StringUtils.isBlank(getTags())){
            setTags(tags);
        }else{
            setTags(getTags() + ';' + tags);
        }
    }

    public boolean filter(String tags){
        if(StringUtils.isBlank(tags)) return true;
        if(StringUtils.isBlank(getTags())) return false;
        String[] filters = StringUtils.split(tags, "+");
        for(String filter : filters){
            if(!StringUtils.contains(getTags(),filter)) return false;
        }
        return true;
    }
}
