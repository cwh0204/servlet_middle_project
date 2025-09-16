package com.groo.controller;

import java.io.IOException;

import org.apache.ibatis.mapping.Environment;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.ibatis.transaction.jdbc.JdbcTransactionFactory;
import org.apache.naming.factory.TransactionFactory;

import com.groo.mapper.UserMapper;
import com.groo.model.LoginDTO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import oracle.jdbc.datasource.impl.OracleDataSource;

/**
 * Servlet implementation class LoginImpl
 */
@WebServlet("/login")
public class LoginImpl extends HttpServlet implements Login{
    
	
	
    @Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
    	
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain; charset=UTF-8");
		
    	String userId = request.getParameter("userId");
    	String password = request.getParameter("password");
    	
    	LoginDTO login = new LoginDTO();
    	
    	login.setUserId(userId);
    	login.setPassword(password);
    	
    	try {
    		OracleDataSource dataSource = new OracleDataSource();
    		dataSource.setURL("jdbc:oracle:thin:@localhost:1521:XE");
    		dataSource.setUser("c##groo");
    		dataSource.setPassword("java");
    		
    		JdbcTransactionFactory transactionFactory = new JdbcTransactionFactory();
			Environment environment = new Environment("dev", transactionFactory, dataSource);
			Configuration configuration = new Configuration(environment);
			
			// 3. Mapper 등록
			configuration.addMapper(UserMapper.class);
			
			// 4. SqlSessionFactory 생성
			SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(configuration);

			// 5. 사용자 등록 처리
			try (SqlSession session = sqlSessionFactory.openSession()) {
				UserMapper mapper = session.getMapper(UserMapper.class);
				
				String loginCk = mapper.loginUser(login);
				
				if(loginCk != null) {
					HttpSession httpSession = request.getSession();
					httpSession.setAttribute("userId", loginCk);
					
//					response.sendRedirect("Login.jsp");
					response.getWriter().println("로그인 완료: " + login.getUserId());
				}else {
					response.getWriter().println("로그인 실패: ");
				}
				
			}

		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("로그인 실패: " + e.getMessage());
		}
    	System.out.println();
    }

}
