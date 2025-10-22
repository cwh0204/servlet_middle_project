package com.groo.model;

import lombok.Data;

@Data
public class MemberDTO {

//	private String name;
//	private String userId;
//	private String password;

	private String mem_id;
	private String mem_name;
	private String mem_login_id;
	private String mem_pass;
	private String mem_type;
	private String mem_login_token;
	private String mem_nick;
	private int mem_birth;
	private String mem_gender;
	private String mem_email;
	private String mem_img_path;
	private String mem_phone;
	private String mem_addr;
	private String mem_interest;
	private int mem_signup_date;
	private int mem_out_date;
	private String mem_status;
}
