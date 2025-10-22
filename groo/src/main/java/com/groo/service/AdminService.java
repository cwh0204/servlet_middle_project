package com.groo.service;

import java.util.List;

import com.groo.model.MemberDTO;

public interface AdminService {
	public List<MemberDTO> adminSelectAll(MemberDTO member);
}
