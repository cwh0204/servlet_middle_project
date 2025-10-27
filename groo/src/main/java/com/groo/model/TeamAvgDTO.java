package com.groo.model;

import lombok.Data;

@Data
public class TeamAvgDTO {
	private int totalTeams;
	private int activeTeams;
	private int inactiveTeams;
	private int weeklyTeams;
}
