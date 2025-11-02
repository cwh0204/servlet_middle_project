package com.groo.model;

import lombok.Data;

@Data
public class BoardDTO {
	private String boardId;
	private String memId;
	private String boardTypeId;
	private String postTitle;
	private String postContent;
	private String postingDate;
	private String postUpdate;
	private String postDel;
	private String postingDelCheck;
	private String memNick;
	private String memLoginId;
	private int postViews;
	private int comentCount;
	//검색
	private String findField;
	private String findName;

	private int boardLikeCount;
}
