package com.groo.service;

import com.groo.model.MemberDTO;

public interface MemberService {

	//이수민
	public void userDelete(MemberDTO member);
	public void userUpdate(MemberDTO member);

	public MemberDTO selectUserNicknameCheck(MemberDTO member);
	public MemberDTO selectUserEmailCheck(MemberDTO member);

	//일반 로그인
	public MemberDTO selectLoginMember(MemberDTO member);

	//소셜로그인
	public MemberDTO selectSocialLoginCheck(MemberDTO member);
	public void insertSociallMember(MemberDTO member);
}