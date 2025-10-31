package com.groo.service;

import com.groo.model.MemberDTO;

public interface MemberService {

	public void insertUserService(MemberDTO memberDTO);
	public String selectLoginIdService(String memLoginId);
	public String selectEmailService(String memEmail);

	//이수민
	public void userDelete(MemberDTO member);
	public void userUpdate(MemberDTO member);
<<<<<<< HEAD

=======
	public String selectUserNicknameCheck(MemberDTO member);

>>>>>>> ecdae6bb7ec53ce6473d2f953a7a29cda4e33d44
	//일반 로그인
	public MemberDTO selectLoginMember(MemberDTO member);

	//소셜로그인
	public MemberDTO selectSocialLoginCheck(MemberDTO member);
	public void insertSociallMember(MemberDTO member);
}
