package com.groo.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.text.ParseException;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.JsonSyntaxException;
import com.groo.error.ErrorDTO;
import com.groo.error.InternalServiceException;
import com.groo.model.MemberDTO;
import com.groo.service.MemberService;
import com.groo.service.MemberServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class NaverLoginController implements Controller,SocialLogin{

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		response.setContentType("application/json;charset=UTF-8");

		String code = request.getParameter("code"); // 인가 코드
        String state = request.getParameter("state"); // 상태값

        try {
        	String token = getAccessToken(code, state);
        	String userDate = getUserProfile(token);

            JsonObject responseObject = extractIdFromJson(userDate);

            String memLoginId = responseObject.get("id").getAsString();
            String memName = responseObject.get("name").getAsString();

            MemberDTO member = new MemberDTO();
            member.setMemLoginId(memLoginId);
            member.setMemName(memName);

            MemberService service = new MemberServiceImpl();

			MemberDTO socialMember = service.selectSocialLoginCheck(member);
            HttpSession session = request.getSession();
			if(socialMember == null) {
				service.insertSociallMember(member);
	            session.setAttribute("loginServiceResponse", memLoginId);
				response.sendRedirect(request.getContextPath() + "/main.do");
			}else {
	            session.setAttribute("loginServiceResponse", memLoginId);
				response.sendRedirect(request.getContextPath() + "/main.do");
			}
        }catch (InternalServiceException ise) {
			ise.printStackTrace();
			ErrorDTO error = new ErrorDTO();
			error.setStatus(500);
		}
		catch (Exception e) {
			e.printStackTrace();
			ErrorDTO error = new ErrorDTO();
			error.setStatus(500);
		}
	}

	/**
     * 획득한 액세스 토큰을 사용하여 네이버 사용자 프로필 정보를 조회합니다.
     * @param accessToken 네이버로부터 발급받은 액세스 토큰
     * @return 사용자 프로필 정보가 담긴 JSON 문자열 (실패 시 null)
     * @throws IOException 네트워크 통신 오류 발생 시
     */
	@Override
    public String getUserProfile(String accessToken) throws IOException {
        URL url = new URL("https://openapi.naver.com/v1/nid/me");
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
    @Override
	public String getAccessToken(String code, String state) throws IOException, ParseException{

        String tokenUrl = "https://nid.naver.com/oauth2.0/token";
        String grantType = "authorization_code";

        String params = "grant_type=" + grantType
                + "&client_id=" + "TfAk2Y0BAm7L0CK2K9br"
                + "&client_secret=" + "oK7EL5nq2O"
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
	@Override
    public String readResponse(BufferedReader br) throws IOException {
        StringBuilder responseJson = new StringBuilder();
        String line;
        while ((line = br.readLine()) != null) {
            responseJson.append(line);
        }
        return responseJson.toString();
    }


    /**
     * Json 형식의 데이터중 객체로 변환후 id를 반환하는 메서드
     * @param jsonString 유저정보를 담고있는 json
     * @return String 형식으로 변환된 userId
     * @throws IOException
     */
	public static JsonObject extractIdFromJson(String jsonString) {
        try {
            // 1. 문자열을 JsonElement로 파싱합니다.
            JsonElement jsonElement = JsonParser.parseString(jsonString);
            // 2. 최상위 객체(JsonObject)로 변환합니다.
            JsonObject rootObject = jsonElement.getAsJsonObject();
            // 3. 'response' 키를 가진 중첩 객체를 가져옵니다.
            JsonObject responseObject = rootObject.getAsJsonObject("response");
            // 4. 'response' 객체에서 'id' 키의 값을 문자열로 추출합니다.
			/* String idValue = responseObject.get("id").getAsString(); */
            return responseObject;

        } catch (JsonSyntaxException e) {
            System.err.println("JSON 파싱 오류: 유효하지 않은 JSON 형식입니다.");
            return null;
        } catch (Exception e) {
            System.err.println("JSON 키 접근 오류: 'response'나 'id' 키가 존재하지 않거나 형식이 다릅니다.");
            return null;
        }
    }
}
