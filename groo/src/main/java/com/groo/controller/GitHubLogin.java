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

public class GitHubLogin implements Controller {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String code = request.getParameter("code"); // 인가 코드
		String state = request.getParameter("state"); // 상태값
		try {
			String token = getAccessToken(code, state);
			String userDate = getUserProfile(token);
			
            HttpSession session = request.getSession();
            session.setAttribute("gitHubServiceResponse", userDate);
            
            response.sendRedirect(request.getContextPath() + "/main.do");
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		System.out.println(code);
	}
	public String getUserProfile(String accessToken) throws IOException {
		String userProfile = "https://api.github.com/user";
		
		try {
			URL url = new URL(userProfile);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        
	        conn.setRequestMethod("GET");
	        
	        conn.setRequestProperty("Authorization", "Bearer " + accessToken);
	        conn.setRequestProperty("Accept", "application/json");
	        
	        
	        int responseCode = conn.getResponseCode();
	        
	        if (responseCode == HttpURLConnection.HTTP_OK) {
	            // 성공적인 응답 (200 OK)
	            try (BufferedReader reader = new BufferedReader(
	                    new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8))) {
	                String line;
	                StringBuilder response = new StringBuilder();
	                while ((line = reader.readLine()) != null) {
	                    response.append(line);
	                }
	                
	                String jsonResponse = response.toString();
	                
	                // 여기에서 JSON 파싱을 통해 필요한 필드(예: login, name, email 등)를 추출하여 사용
	                // 예: ObjectMapper 등을 사용하여 자바 객체로 변환
	                
	                return jsonResponse;
	            }
	        } else {
	            // 실패 응답 처리
	            // 에러 스트림을 읽어서 자세한 에러 메시지를 확인할 수도 있습니다.
	        }
	        
	        conn.disconnect();

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return null;
	}
	
	
	public String getAccessToken(String code, String state) throws IOException, ParseException {

		String tokenUrl = "https://github.com/login/oauth/access_token";
		
		String params = "&client_id=" + "Ov23liAv6BKSjMxB6XaF" + 
						"&client_secret=" + "8070a851919ec42833ec7c0a00b48f4b88358d25" + 
						"&code=" + code +
						"&redirect_uri=" + "http://localhost:8080/groo/githublogin.do";

		URL url = new URL(tokenUrl);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();

		conn.setRequestMethod("POST"); // POST 메소드 설정
		conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded"); 
		conn.setRequestProperty("Accept", "application/json");
		conn.setDoOutput(true); // 출력 스트림을 사용해서 본문 데이터를 전송할 것을 명시
		
        try (OutputStream os = conn.getOutputStream()) {
            byte[] input = params.getBytes(StandardCharsets.UTF_8);
            os.write(input, 0, input.length);
        }
        
        // 5. 응답 코드 확인 및 응답 데이터 읽기
        int responseCode = conn.getResponseCode();
        
        System.out.println(responseCode);
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
    private String readResponse(BufferedReader br) throws IOException {
        StringBuilder responseJson = new StringBuilder();
        String line;
        while ((line = br.readLine()) != null) {
            responseJson.append(line);
        }
        return responseJson.toString();
    }
}
