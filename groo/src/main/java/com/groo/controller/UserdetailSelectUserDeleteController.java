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
 * 탈퇴페이지에서 아이디 정보를 조회하는 Controller 구현 클래스 Service 계층을 호출하고 처리 결과를 json 형태로
 * 클라이언트에 응답
 */
public class UserdetailSelectUserDeleteController implements Controller {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memLoginId = request.getParameter("memLoginId");
		
		
		MemberDTO member = new MemberDTO();
		
		member.setMemLoginId(memLoginId);
		
		MemberService service = new MemberServiceImpl();
		
		try {
			MemberDTO deleteid = service.selectuserDelete(member);
			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");

			Gson gson = new Gson();
			String json = gson.toJson(deleteid);
			
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
