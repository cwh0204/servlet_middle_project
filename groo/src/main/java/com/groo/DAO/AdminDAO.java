package com.groo.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.groo.model.AdminAvgReportDTO;
import com.groo.model.AdminReportDTO;
import com.groo.model.AdminStatsDTO;
import com.groo.model.MemberDTO;

public interface AdminDAO {
	public List<MemberDTO> adminSelectAll(MemberDTO member, SqlSession session);
	public List<MemberDTO> adminSelectUserInsertCheck(MemberDTO member, SqlSession session);
	public void adminInsertUser(MemberDTO member, SqlSession session);
	public void adminUpdateUser(MemberDTO member, SqlSession session);
	public List<MemberDTO> adminSelectSearchUser(MemberDTO member, SqlSession session);
	public AdminStatsDTO adminStatsUser(SqlSession session);
	
	public AdminAvgReportDTO adminStatsReport(SqlSession session);
	
	public List<AdminReportDTO> adminReportSerch(AdminReportDTO report, SqlSession session);
}
