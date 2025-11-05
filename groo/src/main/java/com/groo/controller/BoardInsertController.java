package com.groo.controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.google.genai.Client;
import com.google.genai.types.GenerateContentResponse;
import com.google.gson.Gson;
import com.groo.error.ErrorDTO;
import com.groo.error.InternalServiceException;
import com.groo.model.BoardDTO;
import com.groo.model.GrooBotDTO;
import com.groo.service.BoardServiceImpl;
import com.groo.service.GrooBotService;
import com.groo.service.GrooBotServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * 게시판 등록을 하는 Controller 구현 클래스 Service 계층을 호출하고 조회 결과를 json 형태로 클라이언트에 응답
 */

public class BoardInsertController implements Controller {

	/**
	 * HTTP 요청을 받아 회원 목록을 조회하고 JSON 응답을 생성합니다.
	 *
	 * @param request  HTTP 요청 객체
	 * @param response HTTP 응답 객체
	 * @throws ServletException 서블릿 관련 오류 발생 시
	 * @throws IOException      입출력 오류 발생 시
	 */
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String memLoginId = request.getParameter("memLoginId");
		String boardType = request.getParameter("boardType");
		String postTitle = request.getParameter("postTitle");
		String postContent = request.getParameter("postContent");

		BoardDTO board = new BoardDTO();

		board.setMemLoginId(memLoginId);
		board.setBoardTypeId(boardType);
		board.setPostTitle(postTitle);
		board.setPostContent(postContent);

		BoardServiceImpl service = new BoardServiceImpl();
		try {

			service.insertBoard(board);
			
			if (boardType != null && !boardType.isEmpty()) {
				char firstChar = boardType.charAt(0);

				if (firstChar == 'S') {

					String userQuestion = "제목은" + postTitle + "이고 내용은" + postContent
							+ "인데 이 글에대해서 리뷰와 보완점을 반드시 300글자 이내로 대답해줘";

					Client client = new Client(); // 2. API 호출

					GenerateContentResponse geminiResponse = client.models.generateContent("gemini-2.5-flash",
							userQuestion, null);
					// 3.응답 파싱 (Optional 객체를 안전하게 해제)
					// Optional<List<Candidate>>에서 List<Candidate>를꺼내고, 첫 번째 Candidate를 선택합니다.
					
					String generatedText = geminiResponse.candidates().orElseThrow(() -> new RuntimeException("응답에 후보 목록이 없습니다.")).get(0)
							.content().orElseThrow(() -> new RuntimeException("후보에 내용 객체가 없습니다.")).parts()
							.orElseThrow(() -> new RuntimeException("내용 객체에 Parts 목록이 없습니다.")).get(0).text()
							.orElseThrow(() -> new RuntimeException("Part에 텍스트 내용이 없습니다."));
					
					GrooBotDTO bot = new GrooBotDTO();
					bot.setBoardId(board.getBoardId());
					bot.setBotComment(generatedText);
					GrooBotService botService = new GrooBotServiceImpl();
					botService.insertGrooBot(bot);
				}
			}

			Gson gson = new Gson();
			String json = gson.toJson("성공");

			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");

			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();

		} catch (InternalServiceException ise) {
			ise.printStackTrace();
			ErrorDTO error = new ErrorDTO();
			error.setStatus(500);
		} catch (Exception e) {
			e.printStackTrace();
			ErrorDTO error = new ErrorDTO();
			error.setStatus(500);
		}
	}

}
