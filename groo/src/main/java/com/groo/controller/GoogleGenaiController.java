package com.groo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.google.genai.Client;
import com.google.genai.types.Candidate;
import com.google.genai.types.Content;
import com.google.genai.types.GenerateContentResponse;
import com.google.genai.types.Part;
import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class GoogleGenaiController implements Controller {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			String userQuestion = request.getParameter("userQuestion");
			// 1. Client 생성: 환경 변수 GOOGLE_API_KEY를 자동으로 사용합니다.
			
			/*
			 * String apiKey = System.getenv("GOOGLE_API_KEY");
			 * System.out.println("환경변수 확인"+apiKey);
			 */
			
			Client client = new Client();
			// 2. API 호출
			
			GenerateContentResponse geminiResponse = client.models.generateContent("gemini-2.5-flash",
					userQuestion, null);
			// 3. 응답 파싱 (Optional 객체를 안전하게 해제)
			// Optional<List<Candidate>>에서 List<Candidate>를 꺼내고, 첫 번째 Candidate를 선택합니다.
			String generatedText = geminiResponse.candidates()
					.orElseThrow(() -> new RuntimeException("응답에 후보 목록이 없습니다.")).get(0).content()
					.orElseThrow(() -> new RuntimeException("후보에 내용 객체가 없습니다.")).parts()
					.orElseThrow(() -> new RuntimeException("내용 객체에 Parts 목록이 없습니다.")).get(0).text()
					.orElseThrow(() -> new RuntimeException("Part에 텍스트 내용이 없습니다."));

			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			
			Gson gson = new Gson();
			String json = gson.toJson(generatedText);
			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();

		} catch (Exception e) {
			System.out.println("❌ Gemini API 호출 또는 응답 파싱 중 오류 발생:");
			System.out.println("------------------------------------------");
			e.printStackTrace();
			System.out.println("------------------------------------------");
			System.out.println("오류 원인: JAR 파일 누락, 환경 변수 GOOGLE_API_KEY 미설정, 또는 네트워크 문제일 수 있습니다.");
		}
	}
}
