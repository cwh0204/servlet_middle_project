package com.groo.model;

import lombok.Data;

@Data
public class VoteDTO {
	private String voteId;
	private String memId;
	private String studyId;
	private String voteTitle;
	private String voteStart;
	private String voteEnd;
	private String voteOk;
	private String voteContent;
	private String voteSubject;
	private String studyMax;
	private String memLoginId;
	private String studyRoll;
	private String memNick;
}
