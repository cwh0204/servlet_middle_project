package com.groo.controller;

import java.io.IOException;
import java.util.List;

import com.google.genai.Client;
import com.google.genai.types.Candidate;
import com.google.genai.types.Content;
import com.google.genai.types.GenerateContentResponse;
import com.google.genai.types.Part;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class GoogleGenaiController implements Controller {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			// 1. Client 생성: 환경 변수 GOOGLE_API_KEY를 자동으로 사용합니다.
			Client client = new Client();
			// 2. API 호출
			GenerateContentResponse geminiResponse = client.models.generateContent("gemini-2.5-flash",
					"오늘은 뭘하면 좋을까요", null);
			// 3. 응답 파싱 (Optional 객체를 안전하게 해제)
			// Optional<List<Candidate>>에서 List<Candidate>를 꺼내고, 첫 번째 Candidate를 선택합니다.
			String generatedText = geminiResponse.candidates()
					.orElseThrow(() -> new RuntimeException("응답에 후보 목록이 없습니다.")).get(0).content()
					.orElseThrow(() -> new RuntimeException("후보에 내용 객체가 없습니다.")).parts()
					.orElseThrow(() -> new RuntimeException("내용 객체에 Parts 목록이 없습니다.")).get(0).text()
					.orElseThrow(() -> new RuntimeException("Part에 텍스트 내용이 없습니다."));

			
			System.out.println("✅ Gemini 응답: " + generatedText);

		} catch (Exception e) {
			System.out.println("❌ Gemini API 호출 또는 응답 파싱 중 오류 발생:");
			System.out.println("------------------------------------------");
			e.printStackTrace();
			System.out.println("------------------------------------------");
			System.out.println("오류 원인: JAR 파일 누락, 환경 변수 GOOGLE_API_KEY 미설정, 또는 네트워크 문제일 수 있습니다.");
		}
	}
}
