package com.groo.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.text.ParseException;

public interface SocialLogin {

	/**
     * 획득한 액세스 토큰을 사용하여 소셜 사용자 프로필 정보를 조회합니다.
     * @param accessToken 소셜부터 발급받은 액세스 토큰
     * @return 사용자 프로필 정보가 담긴 JSON 문자열 (실패 시 null)
     * @throws IOException 네트워크 통신 오류 발생 시
     */
	public String getUserProfile(String accessToken) throws IOException;

    /**
     * 요청으로온 code와 state를 통해 토큰을 생성후 리턴
     * @param code, state
     * @return 토큰
     * @throws IOException, ParseException
     */
	public String getAccessToken(String code, String state) throws IOException, ParseException;

    /**
     * BufferedReader로부터 모든 응답 내용을 읽어 String으로 반환하는 헬퍼 메서드
     * @param br BufferedReader
     * @return 응답 내용 문자열
     * @throws IOException
     */
	public String readResponse(BufferedReader br) throws IOException;
}
