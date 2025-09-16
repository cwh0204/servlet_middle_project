package com.groo.controller;

import java.io.IOException;

import org.apache.ibatis.mapping.Environment;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.ibatis.transaction.TransactionFactory;
import org.apache.ibatis.transaction.jdbc.JdbcTransactionFactory;

import com.groo.mapper.UserMapper;
import com.groo.model.SignUpDAOImpl;
import com.groo.model.UserDTO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import oracle.jdbc.pool.OracleDataSource;

/**
 * Servlet implementation class SignUpImpl
 */
@WebServlet("/signup")
public class SignUpImpl extends HttpServlet implements SignUp {

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SignUpImpl() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain; charset=UTF-8");

		String name = request.getParameter("name");
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");

		UserDTO user = new UserDTO();
		user.setName(name);
		user.setUserId(userId);
		user.setPassword(password);

		try {
			SignUpDAOImpl signUp = new SignUpDAOImpl();
			signUp.signUP(user);
			response.sendRedirect("Login.jsp");
			response.getWriter().println("사용자 등록 완료: " + user.getUserId());

		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("사용자 등록 실패: " + e.getMessage());
		}

	}

}
