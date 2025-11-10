package com.groo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import com.google.gson.Gson;
import com.groo.error.ErrorDTO;
import com.groo.error.InternalServiceException;
import com.groo.model.MemberDTO;
import com.groo.service.MemberService;
import com.groo.service.MemberServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class MemberSelectPassController implements Controller {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memLoginId = request.getParameter("memLoginId");
		String memPass = request.getParameter("memPass"); // 클라이언트에서 생성된 임시 비밀번호
		String memEmail = request.getParameter("memEmail");

		MemberDTO member = new MemberDTO();
		member.setMemLoginId(memLoginId);
		member.setMemPass(memPass);
		member.setMemEmail(memEmail);

		MemberService service = new MemberServiceImpl();

		Object jsonResponseData = null; // 응답할 데이터를 담을 객체 (탈퇴, 성공, 미조회 상태)

		try {
            // 1. 상태 조회: 아이디와 이메일로 회원의 상태(MEM_STATUS) 및 기타 정보를 조회
            //    (selectFindMemberPass는 MEM_STATUS를 포함한 DTO를 반환함)
			MemberDTO statusCheck = service.selectFindMemberPass(member);

			if (statusCheck != null) {

				// 2. 조회된 회원의 상태가 'Y' (탈퇴) 인 경우
				if ("Y".equals(statusCheck.getMemStatus())) {
					// 🚨 요청하신 대로 탈퇴 상태를 "WITHDRAWN"으로 응답 (아이디 찾기 로직과 동일)
					Map<String, String> withdrawnResponse = new HashMap<>();
					withdrawnResponse.put("status", "WITHDRAWN");
					jsonResponseData = withdrawnResponse; // {"status": "WITHDRAWN"} 반환
				}

				// 3. 조회된 회원의 상태가 'N' (정상)인 경우
				else {
					// ✅ 정상 회원이므로 비밀번호 업데이트 실행 (Mapper는 MEM_STATUS='N' 조건으로 안전함)
					service.updateFindMemberPass(member);

                    // 비밀번호 찾기 성공 상태를 클라이언트에게 전달
					Map<String, String> successResponse = new HashMap<>();
					successResponse.put("status", "success");
					jsonResponseData = successResponse;
				}
			}
            // 4. 아이디와 이메일이 일치하는 계정을 찾지 못한 경우
            else {
				// 클라이언트에서 '정보 불일치' 메시지를 띄우도록 null을 유지
				jsonResponseData = null;
			}

			Gson gson = new Gson();
			String json = gson.toJson(jsonResponseData);

			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");

			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();

		} catch (InternalServiceException ise) {
			ise.printStackTrace();
			// DB 접근 오류 등 서비스 내부 오류 발생 시 처리
			ErrorDTO error = new ErrorDTO();
			error.setStatus(500);
            jsonResponseData = new HashMap<String, String>() {{ put("status", "error"); }};
		} catch (Exception e) {
			e.printStackTrace();
			// 예상치 못한 오류 발생 시 처리
			ErrorDTO error = new ErrorDTO();
			error.setStatus(500);
            jsonResponseData = new HashMap<String, String>() {{ put("status", "error"); }};
		}
	}
}
