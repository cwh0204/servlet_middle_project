package com.groo.controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.google.gson.Gson;
import com.groo.error.ErrorDTO;
import com.groo.error.InternalServiceException;
import com.groo.model.BoardDTO;
import com.groo.service.BoardServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * 게시판 등록을 하는 Controller 구현 클래스
 * Service 계층을 호출하고 조회 결과를 json 형태로 클라이언트에 응답
 */

public class BoardInsertController implements Controller {
	
	/**
	 * HTTP 요청을 받아 회원 목록을 조회하고 JSON 응답을 생성합니다.
	 *
	 * @param request HTTP 요청 객체
	 * @param response HTTP 응답 객체
	 * @throws ServletException 서블릿 관련 오류 발생 시
	 * @throws IOException 입출력 오류 발생 시
	 */
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String memId = request.getParameter("memId");
		String boardType = request.getParameter("boardType");
		String postTitle = request.getParameter("postTitle");
		String postContent = request.getParameter("postContent");
		
		BoardDTO board = new BoardDTO();
		
		board.setMemId(memId);
		board.setBoardTypeId(boardType);
		board.setPostTitle(postTitle);
		board.setPostContent(postContent);
		
		BoardServiceImpl service = new BoardServiceImpl();
		try {
			
			service.insertBoard(board);
			Gson gson = new Gson();
			String json = gson.toJson("성공");

			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");

			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();

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

}
