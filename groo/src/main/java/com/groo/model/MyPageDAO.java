package com.groo.model;

public interface MyPageDAO {
	
	public void update_id(MyPageDTO id);
	public void update_email(MyPageDTO email);
	public MyPageDTO getuserId(String id);
	public MyPageDTO getemail(String email);
	
	

}
