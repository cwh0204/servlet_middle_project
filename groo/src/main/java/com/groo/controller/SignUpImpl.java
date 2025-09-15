package com.groo.controller;

import java.io.IOException;
import java.sql.SQLException;

import org.apache.ibatis.mapping.Environment;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.groo.mapper.UserMapper;
import com.groo.model.UserDTO;
import oracle.jdbc.pool.OracleDataSource;
import org.apache.ibatis.transaction.TransactionFactory;
import org.apache.ibatis.transaction.jdbc.JdbcTransactionFactory;

/**
 * Servlet implementation class SignUpImpl
 */
@WebServlet("/signup")
public class SignUpImpl extends HttpServlet implements SignUp {
	private static final long serialVersionUID = 1L;

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
			// 1. Oracle DB 연결 설정
			OracleDataSource dataSource = new OracleDataSource();
			dataSource.setURL("jdbc:oracle:thin:@localhost:1521:XE"); //로컬호스트 고정
			dataSource.setUser("c##groo"); //데이터베이스 유저이름
			dataSource.setPassword("0204"); //데이터베이스 비밀번호

			// 2. MyBatis 환경 구성
			TransactionFactory transactionFactory = new JdbcTransactionFactory();
			Environment environment = new Environment("dev", transactionFactory, dataSource);
			Configuration configuration = new Configuration(environment);

			// 3. Mapper 등록
			configuration.addMapper(UserMapper.class);

			// 4. SqlSessionFactory 생성
			SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(configuration);

			// 5. 사용자 등록 처리
			try (SqlSession session = sqlSessionFactory.openSession()) {
				UserMapper mapper = session.getMapper(UserMapper.class);
				mapper.insertUser(user);
				session.commit();
				response.getWriter().println("사용자 등록 완료: " + user.getUserId());
			}

		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("사용자 등록 실패: " + e.getMessage());
		}

	}

}
