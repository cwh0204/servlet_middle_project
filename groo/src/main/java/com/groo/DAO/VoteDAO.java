package com.groo.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.groo.model.VoteDTO;

public interface VoteDAO {
	public void insertVote(VoteDTO vote, SqlSession session);
	public List<VoteDTO> selectVote(VoteDTO vote, SqlSession session);
	public void updateVoteOk(VoteDTO vote, SqlSession session);
}
