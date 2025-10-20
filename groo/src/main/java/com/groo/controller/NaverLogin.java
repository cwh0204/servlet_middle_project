package com.groo.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.text.ParseException;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class NaverLogin implements Controller {
	
	private static final String CLIENT_ID = "TfAk2Y0BAm7L0CK2K9br";
	private static final String CLIENT_SECRET = "oK7EL5nq2O";
	private static final String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";
	
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("application/json;charset=UTF-8");
		
		String code = request.getParameter("code"); // 인가 코드
        String state = request.getParameter("state"); // 상태값
        
        System.out.println(code);
        System.out.println(state);
        
        try {
        	String token = getAccessToken(code, state);
        	String userDate = getUserProfile(token);
        	response.getWriter().println(userDate);
        }catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	/**
     * 획득한 액세스 토큰을 사용하여 네이버 사용자 프로필 정보를 조회합니다.
     * @param accessToken 네이버로부터 발급받은 액세스 토큰
     * @return 사용자 프로필 정보가 담긴 JSON 문자열 (실패 시 null)
     * @throws IOException 네트워크 통신 오류 발생 시
     */
    public String getUserProfile(String accessToken) throws IOException {
        URL url = new URL(PROFILE_API_URL);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        
        // 1. GET 요청 설정
        conn.setRequestMethod("GET");
        
        // 2. Authorization 헤더에 Bearer 토큰 추가 (가장 중요한 부분)
        // curl -H "Authorization: Bearer {액세스 토큰}" 와 동일
        conn.setRequestProperty("Authorization", "Bearer " + accessToken); 

        // 3. 응답 코드 확인 및 응답 데이터 읽기
        int responseCode = conn.getResponseCode();
        String responseBody = null;

        if (responseCode == HttpURLConnection.HTTP_OK) { 
            // 성공 (200 OK)
            try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8))) {
                responseBody = readResponse(br);
            }
        } else {
            // 실패
            System.err.println("Profile Request Failed. Response Code: " + responseCode);
            try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getErrorStream(), StandardCharsets.UTF_8))) {
                responseBody = readResponse(br);
                System.err.println("Naver API Profile Error: " + responseBody);
            }
            return null;
        }
        
        // 4. 프로필 정보가 담긴 JSON 문자열 반환
        return responseBody;
    }
    
    /**
     * 요청으로온 code와 state를 통해 토큰을 생성후 리턴
     * @param code, state
     * @return 토큰
     * @throws IOException, ParseException
     */
	public String getAccessToken(String code, String state) throws IOException, ParseException{
		
        String tokenUrl = "https://nid.naver.com/oauth2.0/token";
        String grantType = "authorization_code";
		
        String params = "grant_type=" + grantType
                + "&client_id=" + CLIENT_ID
                + "&client_secret=" + CLIENT_SECRET
                + "&code=" + code
                + "&state=" + state;
        
        URL url = new URL(tokenUrl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        
        conn.setRequestMethod("POST");
        conn.setDoOutput(true);
        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded"); // Content-Type 설정

        // 4. 파라미터(Body) 전송
        try (OutputStream os = conn.getOutputStream()) {
            byte[] input = params.getBytes(StandardCharsets.UTF_8);
            os.write(input, 0, input.length);
        }

        // 5. 응답 코드 확인 및 응답 데이터 읽기
        int responseCode = conn.getResponseCode();
        
        // 응답 내용을 담을 변수
        String responseBody = null;
        
        if (responseCode == HttpURLConnection.HTTP_OK) { 
            // 성공 (200 OK): 일반 입력 스트림 사용
            try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8))) {
                responseBody = readResponse(br);
            }
        } else {
            // 실패: 에러 스트림 사용 및 오류 로그 출력
            System.err.println("Access Token Request Failed. Response Code: " + responseCode);
            try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getErrorStream(), StandardCharsets.UTF_8))) {
                responseBody = readResponse(br);
                System.err.println("Naver API Error: " + responseBody);
            }
            return null; // 토큰 발급 실패 시 즉시 null 반환
        }
        
        // 6. JSON 응답에서 액세스 토큰 추출 (Gson 사용)
        if (responseBody != null) {
            try {
                // Gson의 JsonParser를 사용하여 응답 문자열을 JsonObject로 파싱
                JsonObject jsonObject = JsonParser.parseString(responseBody).getAsJsonObject();
                
                // access_token 값을 String으로 추출하여 반환
                return jsonObject.get("access_token").getAsString();
            } catch (Exception e) {
                System.err.println("JSON 파싱 오류: " + e.getMessage());
                return null;
            }
        }
        
        return null; // 응답 본문이 비었을 경우
    }
    
    /**
     * BufferedReader로부터 모든 응답 내용을 읽어 String으로 반환하는 헬퍼 메서드
     * @param br BufferedReader
     * @return 응답 내용 문자열
     * @throws IOException
     */
    private String readResponse(BufferedReader br) throws IOException {
        StringBuilder responseJson = new StringBuilder();
        String line;
        while ((line = br.readLine()) != null) {
            responseJson.append(line);
        }
        return responseJson.toString();
    }
}
