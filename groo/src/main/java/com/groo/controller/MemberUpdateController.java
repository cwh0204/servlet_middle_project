package com.groo.controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.google.gson.Gson;
import com.groo.error.ErrorDTO;
import com.groo.error.InternalServiceException;
import com.groo.model.MemberDTO;
import com.groo.service.MemberServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class MemberUpdateController implements Controller {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memLoginId = request.getParameter("memLoginId");
		String memNick = request.getParameter("memNick");
		String memPass = request.getParameter("memPass");
		String memEmail = request.getParameter("memEmail");
		String memAddr = request.getParameter("memAddr");
		String memInterest = request.getParameter("memInterest");

		MemberDTO member = new MemberDTO();

		member.setMemLoginId(memLoginId);
		member.setMemNick(memNick);
		member.setMemPass(memPass);
		member.setMemEmail(memEmail);
		member.setMemAddr(memAddr);
		member.setMemInterest(memInterest);

		MemberServiceImpl service = new MemberServiceImpl();
		try {
			service.userUpdate(member);

			Gson gson = new Gson();
			String json = gson.toJson("success");

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
