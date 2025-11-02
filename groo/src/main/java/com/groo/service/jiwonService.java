package com.groo.service;

import com.groo.model.MemberDTO;

public interface jiwonService {
	public void insertMember(MemberDTO member);
	public MemberDTO selectLoginId(MemberDTO member);
	public MemberDTO selectEmail(MemberDTO member);
}
