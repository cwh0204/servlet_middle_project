package com.groo.service;

import com.groo.model.MemberDTO;

public interface jiwonService {
	public void insertUserService(MemberDTO memberDTO);
	public MemberDTO selectLoginIdService(MemberDTO memberDTO);
	public MemberDTO selectEmailService(MemberDTO memberDTO);
}
