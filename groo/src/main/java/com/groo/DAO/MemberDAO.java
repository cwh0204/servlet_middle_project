package com.groo.DAO;

import org.apache.ibatis.session.SqlSession;

import com.groo.model.MemberDTO;

public interface MemberDAO {

	public void signUp(MemberDTO memberDto, SqlSession session);
	public MemberDTO selectLoginId(MemberDTO memberDto, SqlSession session);
	public MemberDTO selectEmail(MemberDTO memberDto, SqlSession session);

	//이수민
	public void userDelete(MemberDTO member, SqlSession session);
	public void userUpdate(MemberDTO member, SqlSession session);

	public String selectUserNicknameCheck(MemberDTO member, SqlSession session);
<<<<<<< HEAD
	public MemberDTO selectUserNicknameCheck(MemberDTO member, SqlSession session);

=======
>>>>>>> eb47e4af82baf361e1aa9d6015dc7053392898b3

	//소셜로그인
	public MemberDTO selectSocialLoginCheck(MemberDTO member, SqlSession session);
	public void insertSociallMember(MemberDTO member, SqlSession session);
	public MemberDTO selectLoginMember(MemberDTO member, SqlSession session);
}