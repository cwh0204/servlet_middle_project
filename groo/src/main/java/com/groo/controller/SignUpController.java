package com.groo.controller;

import java.io.IOException;
import java.sql.Date;

import com.groo.model.MemberDTO;
import com.groo.service.MemberServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SignUpImpl
 */

public class SignUpController extends HttpServlet implements Controller {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain; charset=UTF-8");

<<<<<<< HEAD
//		String name = request.getParameter("userName");
//		String userId = request.getParameter("userId");
//		String password = request.getParameter("userPw");
//		
//		System.out.println(name);
//		System.out.println(userId);
//		System.out.println(password);
//		
//		MemberDTO memberDTO = new MemberDTO();
//
//		memberDTO.setName(name);
//		memberDTO.setUserId(userId);
//		memberDTO.setPassword(password);
//
//		try {
//			MemberServiceImpl serviceImpl = new MemberServiceImpl();
//			serviceImpl.insertUserService(memberDTO);
//			response.getWriter().println("사용자 등록 완료: " + memberDTO.getUserId());
//			/* response.sendRedirect("login.do"); */
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//			response.getWriter().println("사용자 등록 실패: " + e.getMessage());
//		}
		
		String memLoginId = request.getParameter("userLoginId");
		String memPass = request.getParameter("userPass");
		String memName = request.getParameter("userName");
		String memEmail = request.getParameter("userEmail");
		String memBirth = request.getParameter("userBirth");
		String memGender = request.getParameter("userGender");
		
		System.out.println(memLoginId);
		System.out.println(memPass);
		System.out.println(memName);
		System.out.println(memEmail);
		System.out.println(memBirth);
		System.out.println(memGender);
		
		MemberDTO memberDto = new MemberDTO();
		
		memberDto.setMemLoginId(memLoginId);
		memberDto.setMemPass(memPass);
		memberDto.setMemName(memName);
		memberDto.setMemEmail(memEmail);
		memberDto.setMemBirth(memBirth);
		memberDto.setMemGender(memGender);
		
		try {
			MemberServiceImpl serviceImpl = new MemberServiceImpl();
			serviceImpl.insertUserService(memberDto);
			response.getWriter().println("회원가입 완료: "+ memberDto.getMemId());
		}catch(Exception e) {
=======
		String name = request.getParameter("userName");
		String userId = request.getParameter("userId");
		String password = request.getParameter("userPw");

		System.out.println(name);
		System.out.println(userId);
		System.out.println(password);

		MemberDTO memberDTO = new MemberDTO();

		memberDTO.setName(name);
		memberDTO.setUserId(userId);
		memberDTO.setPassword(password);

		try {
			MemberServiceImpl serviceImpl = new MemberServiceImpl();
			serviceImpl.insertUserService(memberDTO);
			response.getWriter().println("사용자 등록 완료: " + memberDTO.getUserId());
			/* response.sendRedirect("login.do"); */

		} catch (Exception e) {
>>>>>>> 3a9a40ba71211eee6914313d568effa99e774eb3
			e.printStackTrace();
			response.getWriter().println("회원가입 실패: "+ e.getMessage());
		}
	}

}
