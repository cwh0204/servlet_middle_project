package com.groo.mapper;

import java.util.List;

import com.groo.model.LoginDTO;
import com.groo.model.UserDTO;

public interface UserMapper {
	void insertUser(UserDTO user);
	
	String loginUser(LoginDTO login);
	
//	List<Object> userAll(UserDataDTO userData);
}
