package com.groo.model;

import org.apache.ibatis.mapping.Environment;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.ibatis.transaction.TransactionFactory;
import org.apache.ibatis.transaction.jdbc.JdbcTransactionFactory;

import com.groo.mapper.UserMapper;

import oracle.jdbc.pool.OracleDataSource;

public class SignUpDAOImpl implements SignUpDAO {
	public static Configuration configuration;
	public static SqlSessionFactory sqlSessionFactory;
	static {
		try {
			OracleDataSource dataSource = new OracleDataSource();
			dataSource.setURL("jdbc:oracle:thin:@localhost:1521:XE"); // 로컬호스트 고정
			dataSource.setUser("c##groo"); // 데이터베이스 유저이름
			dataSource.setPassword("java"); // 데이터베이스 비밀번호

			// 2. MyBatis 환경 구성
			TransactionFactory transactionFactory = new JdbcTransactionFactory();
			Environment environment = new Environment("dev", transactionFactory, dataSource);
			configuration = new Configuration(environment);

			// 3. Mapper 등록
			configuration.addMapper(UserMapper.class);

			// 4. SqlSessionFactory 생성
		} catch (Exception e) {

		}
	}

	@Override
	public void signUP(UserDTO userDTO) {
		// TODO Auto-generated method stub
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(configuration);
		// 5. 사용자 등록 처리
		SqlSession session = sqlSessionFactory.openSession();
		UserMapper mapper = session.getMapper(UserMapper.class);
		mapper.insertUser(userDTO);
		session.commit();
	}
	
}
