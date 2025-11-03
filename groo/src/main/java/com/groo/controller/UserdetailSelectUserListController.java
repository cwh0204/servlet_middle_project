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
 * 회원가입 상세페이지에서 아이디, 이름, 주민등록번호를 조회하는 Controller 구현 클래스 Service 계층을 호출하고 처리 결과를 json 형태로
 * 클라이언트에 응답
 */
public class UserdetailSelectUserListController implements Controller {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memLoginId = request.getParameter("memLoginId");
		
		MemberDTO member = new MemberDTO();
		
		member.setMemLoginId(memLoginId);
		
		MemberService service = new MemberServiceImpl();
		
		try {
			MemberDTO userselect = service.selectUserDetail(member);
			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			
			Gson gson = new Gson();
			String json = gson.toJson(userselect);
			
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