package com.groo.model;

import lombok.Data;

@Data
public class AdminDashBoardDTO {
	
	private String newBoard;
	private String newMember;
	private String outMember;
	
	private String studyCategory;
	private String categoryCount;
	
	private String dayOfWeek;
	private String postCount;
	
	private String signupMonthName;
	private String monthlySignups;
}
