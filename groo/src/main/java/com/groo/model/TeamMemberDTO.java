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
	
	private String stdyTitle;
	private String memNick;
	private String memEmail;
	private String memLoginId;
}
