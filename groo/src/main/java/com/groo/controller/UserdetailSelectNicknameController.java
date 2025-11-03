package com.groo.controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.google.gson.Gson;
import com.groo.error.ErrorDTO;
import com.groo.error.InternalServiceException;
import com.groo.model.MemberDTO;
import com.groo.service.MemberService;
import com.groo.service.MemberServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
/**
 * user상세페이지 닉네임을 중복확인하는  Controller 구현 클래스
 * Service 계층을 호출하고 업데이트 처리 결과를 json 형태로 클라이언트에 응답
 */
public class UserdetailSelectNicknameController implements Controller {
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain; charset=UTF-8");

		String memNick = request.getParameter("memNick");

		MemberDTO member = new MemberDTO();

		member.setMemNick(memNick);

		MemberService service = new MemberServiceImpl();

		try {
			MemberDTO memberNickname = service.selectUserNicknameCheck(member);

			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");

			Gson gson = new Gson();
			String json = gson.toJson(memberNickname);

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
