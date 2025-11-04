package com.groo.controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.google.gson.Gson;
import com.groo.error.ErrorDTO;
import com.groo.error.InternalServiceException;
import com.groo.model.MemberDTO;
import com.groo.model.VoteDTO;
import com.groo.service.MemberService;
import com.groo.service.MemberServiceImpl;
import com.groo.service.VoteService;
import com.groo.service.VoteServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


/**
 * 투표를 생성하는 Controller 구현 클래스 Service 계층을 호출하고 처리 결과를 json 형태로
 * 클라이언트에 응답
 */
public class VoteInsertController implements Controller {
	
	/**
	 * HTTP 요청을 받아 투표를 생성하고 JSON 응답을 생성합니다.
	 *
	 * @param request  HTTP 요청 객체
	 * @param response HTTP 응답 객체
	 * @throws ServletException 서블릿 관련 오류 발생 시
	 * @throws IOException      입출력 오류 발생 시
	 */
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain; charset=UTF-8");

		String memLoginId = request.getParameter("memLoginId");
		String studyId = request.getParameter("studyId");
		String voteTitle = request.getParameter("voteTitle");
		String voteContent = request.getParameter("voteContent");
		String voteSubject = request.getParameter("voteSubject");
		String voteEnd = request.getParameter("voteEnd");

		VoteDTO vote = new VoteDTO();
		
		vote.setMemLoginId(memLoginId);
		vote.setStudyId(studyId);
		vote.setVoteTitle(voteTitle);
		vote.setVoteContent(voteContent);
		vote.setVoteSubject(voteSubject);
		vote.setVoteEnd(voteEnd);

		VoteService service = new VoteServiceImpl();

		try {
			
			service.insertVote(vote);

			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");

			Gson gson = new Gson();
			String json = gson.toJson("sucsess");

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
