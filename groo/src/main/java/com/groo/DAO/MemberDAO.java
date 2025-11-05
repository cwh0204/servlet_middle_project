package com.groo.DAO;

import org.apache.ibatis.session.SqlSession;

import com.groo.model.MemberDTO;

public interface MemberDAO {

	//이수민
	public void userDelete(MemberDTO member, SqlSession session);
	public void userUpdate(MemberDTO member, SqlSession session);
	public MemberDTO selectUserNicknameCheck(MemberDTO member, SqlSession session);
	public MemberDTO selectUserEmailCheck(MemberDTO member, SqlSession session);
	public MemberDTO selectUserDetail(MemberDTO member, SqlSession session);

	//소셜로그인
	public MemberDTO selectSocialLoginCheck(MemberDTO member, SqlSession session);
	public void insertSociallMember(MemberDTO member, SqlSession session);
	public MemberDTO selectLoginMember(MemberDTO member, SqlSession session);

	//아아디 비밀번호 찾기
	public MemberDTO selectFindMemberId(MemberDTO member, SqlSession session);
	public void updateFindMemberPass(MemberDTO member, SqlSession session);
}