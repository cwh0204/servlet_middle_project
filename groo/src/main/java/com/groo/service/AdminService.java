package com.groo.service;

import java.util.List;

import com.groo.model.AdminAvgReportDTO;
import com.groo.model.AdminReportDTO;
import com.groo.model.AdminStatsDTO;
import com.groo.model.MemberDTO;

public interface AdminService {
	public List<MemberDTO> adminSelectAll(MemberDTO member);
	public List<MemberDTO> adminSelectUserInsertCheck(MemberDTO member);
	public void adminInsertUser(MemberDTO member);
	public void adminUpdateUser(MemberDTO member);
	public List<MemberDTO> adminSelectSearchUser(MemberDTO member);
	public AdminStatsDTO adminStatsUser();

	public List<AdminReportDTO> adminReportSerch(AdminReportDTO report);
	public List<AdminReportDTO> adminReportProcessUserSerch(AdminReportDTO report);

	public AdminAvgReportDTO adminStatsReport();
}
