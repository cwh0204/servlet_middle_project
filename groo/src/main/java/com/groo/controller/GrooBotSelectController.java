package com.groo.controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.google.gson.Gson;
import com.groo.error.InternalServiceException;
import com.groo.model.GrooBotDTO;
import com.groo.service.GrooBotService;
import com.groo.service.GrooBotServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * 그루 코멘트를 조회하는 Controller 구현 클래스 Service 계층을 호출하고 처리 결과를 json 형태로
 * 클라이언트에 응답
 */
public class GrooBotSelectController implements Controller {

	/**
	 * HTTP 요청을 받아 그루 코멘트를 조회하고 JSON 응답을 생성합니다.
	 *
	 * @param request  HTTP 요청 객체
	 * @param response HTTP 응답 객체
	 * @throws ServletException 서블릿 관련 오류 발생 시
	 * @throws IOException      입출력 오류 발생 시
	 */
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		String boardId = request.getParameter("boardId");
		GrooBotDTO bot = new GrooBotDTO();

		bot.setBoardId(boardId);

		try {
			GrooBotService service = new GrooBotServiceImpl();
			GrooBotDTO list = service.selectGrooBot(bot);
			Gson gson = new Gson();
			String json = gson.toJson(list);

			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();

		}catch(InternalServiceException ise) {
			ise.printStackTrace();
			//오류를 클라이언트에 전달 (형식: 페이지, json) 구현예정
		}catch(Exception e) {
			e.printStackTrace();
			//오류를 클라이언트에 전달 (형식: 페이지, json) 구현예정
		}
	}

}
