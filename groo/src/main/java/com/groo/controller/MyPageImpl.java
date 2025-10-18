package com.groo.controller;

import java.io.IOException;

import com.groo.model.MyPageDTO;
import com.groo.service.MpageselectNick;
import com.groo.service.MpageselectService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class MyPageImpl implements Controller {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain; charset=UTF-8");

		HttpSession session = request.getSession(false);

		if( session == null || session.getAttribute("userId")== null){

			request.setAttribute("message", "로그인 정보가 없습니다. 로그인 후 이용해 주세요.");
			RequestDispatcher rd = request.getRequestDispatcher("login.do");
			rd.forward(request, response);
			return;
		}


		String userId = request.getParameter("userId");
		MpageselectNick service = new MpageselectService();
		MyPageDTO myPageDTO = new MyPageDTO();
		myPageDTO.setUser_id(userId);

		MyPageDTO getnickDTO = service.selectNickName(myPageDTO);
		session.setAttribute("userId", getnickDTO);
		//System.out.println("로그인 세션 정보 "+httpSession.getAttribute("userId"));
		RequestDispatcher rd = request.getRequestDispatcher("mypage.do");
		rd.forward(request, response);


	}

}
