package cn.zjtx.report.bean;

public class BaseResult {
	
	private boolean success;
	
	private String msg;

	public BaseResult(boolean success,String msg){
		this.success = success;
		this.msg = msg;
	}
	
	public BaseResult(){
		
	}
	
	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}

	

}
