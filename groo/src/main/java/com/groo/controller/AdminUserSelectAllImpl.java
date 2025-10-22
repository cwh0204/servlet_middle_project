package com.groo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.Gson;
import com.groo.error.ErrorDTO;
import com.groo.error.InternalServiceException;
import com.groo.model.MemberDTO;
import com.groo.service.AdminService;
import com.groo.service.AdminServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AdminUserSelectAllImpl implements Controller {
	private static final Logger log = LoggerFactory.getLogger(AdminUserSelectAllImpl.class);
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain; charset=UTF-8");
		
		MemberDTO member = new MemberDTO();
		ErrorDTO Error = new ErrorDTO();
		
		try {
			AdminService adminService = new AdminServiceImpl();
			List<MemberDTO> list = adminService.adminSelectAll(member);
			Gson gson = new Gson();
			String json = gson.toJson(list);
			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			
			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
			
		}catch(InternalServiceException ise) {
			log.error("DB 접근 오류로 인한 서비스 예외로 인한 컨트롤러 예외: {}", ise.getMessage(), ise);
			Error.setStatus(500);
		}catch(Exception e) {
			log.error("예상치못한 컨트롤러 오류 발생 {}", e.getMessage(), e);
			Error.setStatus(500);
		}
	}
}
