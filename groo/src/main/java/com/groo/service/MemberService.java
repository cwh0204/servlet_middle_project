package com.groo.service;

import com.groo.model.MemberDTO;

public interface MemberService {
	public MemberDTO loginUserService(MemberDTO memberDTO);
	public void insertUserService(MemberDTO memberDTO);
}
