package com.groo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;
import com.groo.error.ErrorDTO;
import com.groo.error.InternalServiceException;
import com.groo.model.BoardDTO;
import com.groo.model.MemberDTO;
import com.groo.service.BoardService;
import com.groo.service.BoardServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class MyBoardListController implements Controller {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		String memLoginId = request.getParameter("memLoginId");

		MemberDTO member = new MemberDTO();

		member.setMemLoginId(memLoginId);

		BoardService service = new BoardServiceImpl();

		List<BoardDTO> myBoardList = new ArrayList<>();

		try {

			myBoardList = service.selectMyBoardList(member);

			Gson gson = new Gson();
			String json = gson.toJson(myBoardList);

			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
		} catch (InternalServiceException ise) {
			ise.printStackTrace();
			ErrorDTO error = new ErrorDTO();
			error.setStatus(500);
		} catch (Exception e) {
			e.printStackTrace();
			ErrorDTO error = new ErrorDTO();
			error.setStatus(500);
		}
	}
}
