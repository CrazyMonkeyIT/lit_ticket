package cn.zjtx.report.shiro.auth;

import org.apache.shiro.authz.Permission;

public class ShiroPermission implements Permission {

	private Integer resourceId;
	
	private String resourceUrl;
	
	private String cssCls;
	
	private Integer parentId;
	
	private Integer orderNo;
	
	
	@Override
	public boolean implies(Permission p) {
		// TODO Auto-generated method stub
		return false;
	}


	public String getResourceUrl() {
		return resourceUrl;
	}


	public void setResourceUrl(String resourceUrl) {
		this.resourceUrl = resourceUrl;
	}


	public String getCssCls() {
		return cssCls;
	}


	public void setCssCls(String cssCls) {
		this.cssCls = cssCls;
	}


	public Integer getParentId() {
		return parentId;
	}


	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}


	public Integer getResourceId() {
		return resourceId;
	}


	public void setResourceId(Integer resourceId) {
		this.resourceId = resourceId;
	}


	public Integer getOrderNo() {
		return orderNo;
	}


	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}

}
