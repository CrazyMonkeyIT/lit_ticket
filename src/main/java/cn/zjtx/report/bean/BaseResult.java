package cn.zjtx.report.bean;

public class BaseResult {
	
	private boolean success;
	
	private String message;

	public BaseResult(boolean success,String msg){
		this.success = success;
		this.message = msg;
	}
	
	public BaseResult(){
		
	}
	
	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}
