package com.groo.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class MemberSelectImplAPI implements Controller	{
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		HttpSession httpSession = request.getSession(false);
		Gson gson = new Gson();
		Map<String, String> resultMap = new HashMap<>();

		String userId = (httpSession != null) ? (String) httpSession.getAttribute("userId") : null;

		if (userId != null) {
			resultMap.put("status", "success");
			resultMap.put("userId", userId);
		} else {
			resultMap.put("status", "failure");
			resultMap.put("message", "로그인 정보가 없습니다.");
		}

		response.getWriter().write(gson.toJson(resultMap));
	}
}
