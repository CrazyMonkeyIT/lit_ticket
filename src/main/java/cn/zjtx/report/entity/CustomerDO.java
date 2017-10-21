package cn.zjtx.report.entity;

import java.util.Date;

public class CustomerDO {
    private Integer id;

    private String custName;

    private String custCode;

    private Integer custScale;

    private Integer nationalStandardId;

    private Integer industrySasacId;

    private Integer enterpriseAttribute;

    private Integer active;

    private Integer createUserId;

    private Date createTime;

    private Integer updateUserId;

    private Date updateTime;

    /**
     * 表外字段
     */
    private String nationalStandardName;
    /**
     * 表外字段
     */
    private String industrySasacName;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCustName() {
        return custName;
    }

    public void setCustName(String custName) {
        this.custName = custName == null ? null : custName.trim();
    }

    public String getCustCode() {
        return custCode;
    }

    public void setCustCode(String custCode) {
        this.custCode = custCode == null ? null : custCode.trim();
    }

    public Integer getCustScale() {
        return custScale;
    }

    public void setCustScale(Integer custScale) {
        this.custScale = custScale;
    }

    public Integer getNationalStandardId() {
        return nationalStandardId;
    }

    public void setNationalStandardId(Integer nationalStandardId) {
        this.nationalStandardId = nationalStandardId;
    }

    public Integer getIndustrySasacId() {
        return industrySasacId;
    }

    public void setIndustrySasacId(Integer industrySasacId) {
        this.industrySasacId = industrySasacId;
    }

    public Integer getEnterpriseAttribute() {
        return enterpriseAttribute;
    }

    public void setEnterpriseAttribute(Integer enterpriseAttribute) {
        this.enterpriseAttribute = enterpriseAttribute;
    }

    public Integer getActive() {
        return active;
    }

    public void setActive(Integer active) {
        this.active = active;
    }

    public Integer getCreateUserId() {
        return createUserId;
    }

    public void setCreateUserId(Integer createUserId) {
        this.createUserId = createUserId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getUpdateUserId() {
        return updateUserId;
    }

    public void setUpdateUserId(Integer updateUserId) {
        this.updateUserId = updateUserId;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getNationalStandardName() {
        return nationalStandardName;
    }

    public String getIndustrySasacName() {
        return industrySasacName;
    }

    public void setNationalStandardName(String nationalStandardName) {
        this.nationalStandardName = nationalStandardName;
    }

    public void setIndustrySasacName(String industrySasacName) {
        this.industrySasacName = industrySasacName;
    }
}