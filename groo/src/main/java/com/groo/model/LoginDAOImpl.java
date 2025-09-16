package com.groo.model;

import org.apache.ibatis.mapping.Environment;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.ibatis.transaction.jdbc.JdbcTransactionFactory;

import com.groo.mapper.UserMapper;

import oracle.jdbc.datasource.impl.OracleDataSource;

public class LoginDAOImpl implements LoginDAO {
	
	static SqlSessionFactory sqlSessionFactory;
	static {
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
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(configuration);

		} catch (Exception e) {

		}
	}

	@Override
	public String loginUser(LoginDTO loginDTO) {
		// TODO Auto-generated method stub
		SqlSession session = sqlSessionFactory.openSession();
		UserMapper mapper = session.getMapper(UserMapper.class);
		String loginCk = mapper.loginUser(loginDTO);
		return loginCk;
	}
}
