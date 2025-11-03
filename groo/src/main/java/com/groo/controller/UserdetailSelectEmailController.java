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

public class UserdetailSelectEmailController implements Controller {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain; charset=UTF-8");

		String memEmail = request.getParameter("memEmail");

		MemberDTO member = new MemberDTO();

		member.setMemEmail(memEmail);

		MemberService service = new MemberServiceImpl();

		 try {
			 MemberDTO memberEmail = service.selectUserEmailCheck(member);

			 response.setContentType("application/json");
			 response.setCharacterEncoding("UTF-8");

			 Gson gson = new Gson();
			 String json = gson.toJson(memberEmail);

			 PrintWriter out = response.getWriter();
				out.print(json);
				out.flush();

		 } catch (InternalServiceException ise) {
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


