package com.groo.service;

import java.util.List;

import com.groo.model.VoteDTO;

public interface VoteService {
	public void insertVote(VoteDTO vote);
	public List<VoteDTO> selectVote(VoteDTO vote);
}
