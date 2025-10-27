package com.groo.controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.google.gson.Gson;
import com.groo.error.ErrorDTO;
import com.groo.error.InternalServiceException;
import com.groo.model.AdminStatsDTO;
import com.groo.service.AdminServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * 관리자 페이지에서 유저 통계를 가져오는 Controller 구현 클래스
 * Service 계층을 호출하고 조회 결과를 json 형태로 클라이언트에 응답
 */
public class AdminStatsUserController implements Controller{

	/**
	 * HTTP 요청을 받아 회원 목록을 조회하고 JSON 응답을 생성합니다.
	 * @param request  HTTP 요청 객체
	 * @param response HTTP 응답 객체
	 * @throws ServletException 서블릿 관련 오류 발생 시
	 * @throws IOException      입출력 오류 발생 시
	 */
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		AdminServiceImpl service = new AdminServiceImpl();
		try {

			AdminStatsDTO stats = service.adminStatsUser();

			Gson gson = new Gson();
			String json = gson.toJson(stats);

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
