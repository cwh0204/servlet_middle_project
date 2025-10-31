package com.groo.DAO;

import org.apache.ibatis.session.SqlSession;

import com.groo.model.MemberDTO;

public interface MemberDAO {

	public void signUp(MemberDTO memberDto, SqlSession session);
	public String selectLoginId(String memLoginId, SqlSession session);
	public String selectEmail(String memEmail, SqlSession session);

	//이수민
	public void userDelete(MemberDTO member, SqlSession session);
	public void userUpdate(MemberDTO member, SqlSession session);
<<<<<<< HEAD

	public String selectUserNicknameCheck(MemberDTO member, SqlSession session);
=======
	public MemberDTO selectUserNicknameCheck(MemberDTO member, SqlSession session);

>>>>>>> 0390814727718b37476b1b19fafc9692365950a0

	//소셜로그인
	public MemberDTO selectSocialLoginCheck(MemberDTO member, SqlSession session);
	public void insertSociallMember(MemberDTO member, SqlSession session);
	public MemberDTO selectLoginMember(MemberDTO member, SqlSession session);
}
