package com.groo.mapper;

import com.groo.model.LoginDTO;
import com.groo.model.UserDTO;

public interface UserMapper {
	void insertUser(UserDTO user);
	
	String loginUser(LoginDTO login);
}
