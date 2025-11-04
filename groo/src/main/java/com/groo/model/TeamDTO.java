package com.groo.model;

import lombok.Data;

@Data
public class TeamDTO {
	private String studyId;
	private String studyTitle;
	private String studyCategory;
	private int studyMax;
	private int studyPick;
	private String studyReview;
	private String studyPass;
	private String studyIntro;
	private String studyIntroContent;
	private String studyCreateDate;
	private String studyUpdateDate;
	private String studyDeleteDate;

	private String studyGold;
	private String studySilver;
	private String studyBlonze;
	private String studyLike;

	//로그인 세션 아이디
	private String memLoginId;
	private String memNick;
}
