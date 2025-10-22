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
import jakarta.servlet.http.HttpSession;

public class KakaoLoginController implements Controller, SocialLogin {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("application/json;charset=UTF-8");
		
		String code = request.getParameter("code"); // 인가 코드
        String state = request.getParameter("state"); // 상태값
        
        try {
        	String token = getAccessToken(code,state);
        	System.out.println(token);
        	String userDate = getUserProfile(token);
        	
            HttpSession session = request.getSession();
            session.setAttribute("kakaoServiceResponse", userDate);
            
            response.sendRedirect(request.getContextPath() + "/main.do");
        }catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	@Override
	public String getUserProfile(String accessToken) throws IOException {
		URL url = new URL("https://kapi.kakao.com/v2/user/me");
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		
		conn.setRequestMethod("GET");
		
		conn.setRequestProperty("Authorization", "Bearer " + accessToken);
		
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

	@Override
	public String getAccessToken(String code, String state) throws IOException, ParseException {
		// TODO Auto-generated method stub
		String tokenUrl = "https://kauth.kakao.com/oauth/token";
        String grantType = "authorization_code";
        String params = "grant_type=" + grantType
                + "&client_id=" + "27b3c6cc330385465c1b7c244ef648c6"
                + "&client_secret=" + "tZ4IuGHwy7sDUf4ACif4m0BniAQJQi5g"
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
        
		return null;
	}

	@Override
	public String readResponse(BufferedReader br) throws IOException {
        StringBuilder responseJson = new StringBuilder();
        String line;
        while ((line = br.readLine()) != null) {
            responseJson.append(line);
        }
        return responseJson.toString();
	}
}
