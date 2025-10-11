package com.groo.service;

import com.groo.model.MemberDTO;

public interface MemberService extends MemberInsertUser, MemberLoginUser{

	@Override
	default MemberDTO loginUserService(MemberDTO memberDTO) {
		return null;
	}

	@Override
	default void insertUserService(MemberDTO memberDTO) {
	}
}
