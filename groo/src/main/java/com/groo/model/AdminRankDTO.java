package com.groo.model;

import lombok.Data;

@Data
public class AdminRankDTO {
	private String boardId;
	private String memNick;
	private String postTitle;
	private String postViews;
	private String postingDate;
	private int likeCount;
	private String studyCategory;
	private String studyId;

	private String findName;
}
