package com.groo.controller;

import java.io.IOException;

import com.groo.model.PostDTO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class boardController_EX implements Controller {
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String postId = request.getParameter("id");
		// 💡 JS에서 전송한 writer 파라미터를 받습니다.
		String writer = request.getParameter("writer"); 
		
		PostDTO post = new PostDTO();
		post.setPostId(postId);
		
		// 💡 URL에서 받은 writer 값을 DTO에 설정합니다.
		post.setWriter(writer != null ? writer : "작성자 정보 오류"); 
		
		// 나머지 더미 데이터는 필요에 따라 하드코딩
		post.setTitle("[" + postId + "번] 상세보기 테스트 제목");
		post.setContent("작성자: " + post.getWriter() + "의 글 내용입니다.");
		post.setRegDate("2025.10.27");
		post.setViews(100); 
		
		request.setAttribute("post", post);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/board/boarddetail.jsp");
        rd.forward(request, response);
	}
}
