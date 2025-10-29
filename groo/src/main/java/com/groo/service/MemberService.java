package com.groo.service;

import com.groo.model.MemberDTO;

public interface MemberService {
	public MemberDTO loginUserService(MemberDTO memberDTO);
	public void insertUserService(MemberDTO memberDTO);
	public String selectLoginIdService(String memLoginId);
	public String selectEmailService(String memEmail);

	//이수민
	public void userDelete(MemberDTO member);
	public void userUpdate(MemberDTO member);
}
