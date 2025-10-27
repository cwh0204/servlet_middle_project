package com.groo.model;

import lombok.Data;

@Data
public class PostDTO {
	private String postId;
	private String title;
	private String content;
	private String writer;
	private String regDate;
	int Views;
	int like;
	int CommentCount;
}
