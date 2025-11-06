package com.groo.model;

import lombok.Data;

@Data
public class TeamMemberDTO {
	private String memId;
	private String studyId;
	private String studyRoll;
	private String studyMstate;
	private String studyJoinedDate;
	private String studyOutDate;
	
	//멤버닉네임
	private String memNick;
}
