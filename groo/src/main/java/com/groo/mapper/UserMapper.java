package com.groo.mapper;

import com.groo.model.MemberDTO;

public interface UserMapper {
	void insertUser(MemberDTO user);

	String loginUser(MemberDTO login);

//	List<Object> userAll(UserDataDTO userData);
}
