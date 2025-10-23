package com.groo.model;

import lombok.Data;

@Data
public class AdminStatsDTO {
	private int totalMembers;
	private int inactiveMembers;
	private int activeMembers;
	private int weeklySignups;
}
