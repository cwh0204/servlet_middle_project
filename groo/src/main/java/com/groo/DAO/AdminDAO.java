package com.groo.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.groo.model.AdminAvgReportDTO;
import com.groo.model.AdminDashBoardDTO;
import com.groo.model.AdminRankDTO;
import com.groo.model.AdminReportDTO;
import com.groo.model.AdminStatsDTO;
import com.groo.model.AdminTeamMemberDTO;
import com.groo.model.BoardDTO;
import com.groo.model.ComentDTO;
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
	public List<AdminReportDTO> adminReportProcessUserSerch(AdminReportDTO report, SqlSession session);
	public void adminUpdateReport(AdminReportDTO report, SqlSession session);
	public List<AdminTeamMemberDTO> adminSelectStudyMember(AdminTeamMemberDTO member, SqlSession session);
	public void adminStudyMemberDelete(AdminTeamMemberDTO member, SqlSession session);
	public void adminUpdateStudyRoll(AdminTeamMemberDTO member, SqlSession session);
	public List<AdminTeamMemberDTO> adminSelectDisableStudyMember(AdminTeamMemberDTO member, SqlSession session);
	public void adminUpdateStudyMemberActivate(AdminTeamMemberDTO member, SqlSession session);
	public List<BoardDTO> adminSelectBoard(BoardDTO board, SqlSession session);
	public void adminDeleteBoard(BoardDTO board, SqlSession session);
	public AdminStatsDTO adminAvgBoard(SqlSession session);
	public List<ComentDTO> adminSelectComment(ComentDTO comment,SqlSession session);
	public void adminDeleteComment(ComentDTO coment, SqlSession session);
	public List<AdminRankDTO> adminSelectRank(AdminRankDTO rank, SqlSession session);
	public void adminUpdateStudyRank(AdminRankDTO rank, SqlSession session);
	public AdminDashBoardDTO adminSelectStatsDay(SqlSession session);
	public List<AdminDashBoardDTO> adminSelectStatsPostDay(SqlSession session);
	public List<AdminDashBoardDTO> adminSelectStatsCategory(SqlSession session);
	public List<AdminDashBoardDTO> adminSelectStatsSignUpMonth(SqlSession session);
}
