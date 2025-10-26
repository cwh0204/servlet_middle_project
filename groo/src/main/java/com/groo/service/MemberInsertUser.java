package com.groo.service;

import com.groo.model.MemberDTO;

public interface MemberInsertUser {
	public void insertUserService(MemberDTO memberDTO);
	public String selectLoginIdService(String memLoginId);
	public String selectEmailService(String memEmail);
}
