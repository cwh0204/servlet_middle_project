package com.groo.service;

import java.util.List;

import com.groo.model.MemberDTO;
import com.groo.model.VoteDTO;

public interface VoteService {
	public void insertVote(VoteDTO vote);
	public List<VoteDTO> selectVote(VoteDTO vote);
	public void updateVoteOk(VoteDTO vote);
	public List<VoteDTO> selectVoteRank(VoteDTO vote);
	public List<VoteDTO> selectMyVoteList(MemberDTO member);
}
