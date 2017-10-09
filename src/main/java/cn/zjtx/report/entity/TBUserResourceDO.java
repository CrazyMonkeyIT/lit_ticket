package cn.zjtx.report.entity;

import java.util.Date;

public class TBUserResourceDO {
    private Integer userResourceId;

    private Integer userId;

    private Integer resourceId;

    private Integer active;

    private Date createTime;

    private Date updateTime;

    public Integer getUserResourceId() {
        return userResourceId;
    }

    public void setUserResourceId(Integer userResourceId) {
        this.userResourceId = userResourceId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getResourceId() {
        return resourceId;
    }

    public void setResourceId(Integer resourceId) {
        this.resourceId = resourceId;
    }

    public Integer getActive() {
        return active;
    }

    public void setActive(Integer active) {
        this.active = active;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}