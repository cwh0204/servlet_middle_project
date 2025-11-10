package com.groo.model;

import lombok.Data;

@Data
public class ComentDTO {
	private String comentId;
	private String memId;
	private String boardId;
	private String comentContent;
	private String comentDate;
	private String comentEnd;

	private String memLoginId;
	private String memNick;

	private String findName;
}
