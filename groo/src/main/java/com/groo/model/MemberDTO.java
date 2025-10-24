package com.groo.model;

import lombok.Data;

@Data
public class MemberDTO {

//	private String name;
//	private String userId;
//	private String password;

	private String memId;
	private String memName;
	private String memLoginId;
	private String memPass;
	private String memType;
	private String memLoginToken;
	private String memNick;
	private String memBirth;
	private String memGender;
	private String memEmail;
	private String memImgPath;
	private String memPhone;
	private String memAddr;
	private String memInterest;
	private int memSignupSysdate;
	private int memOutDate;
	private String memStatus;
}
