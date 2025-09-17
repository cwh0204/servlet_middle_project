package com.groo.model;

public interface MemberDAO {
	public String login(MemberDTO memberDTO);
	public void signUP(MemberDTO memberDTO);
}
