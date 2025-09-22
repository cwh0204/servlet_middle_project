package com.groo.model;

import java.util.List;

import org.apache.ibatis.mapping.Environment;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.ibatis.transaction.TransactionFactory;
import org.apache.ibatis.transaction.jdbc.JdbcTransactionFactory;

import com.groo.mapper.TeamMapper;

import oracle.jdbc.pool.OracleDataSource;

public class TeamDAOImpl implements TeamDAO{
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
			configuration.addMapper(TeamMapper.class);

			// 4. SqlSessionFactory 생성
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(configuration);

		} catch (Exception e) {

		}
	}

	@Override
	public void createTeam(TeamDTO teamDTO) {
		// TODO Auto-generated method stub
		SqlSession session = sqlSessionFactory.openSession();
		TeamMapper mapper = session.getMapper(TeamMapper.class);
		mapper.insertTeam(teamDTO);
		session.commit();
	}

	@Override
	public List<TeamDTO> selectTeam(TeamDTO teamDTO) {

		System.out.println("selectTeam = "+teamDTO.getUserId());
		SqlSession session = sqlSessionFactory.openSession();
		TeamMapper mapper = session.getMapper(TeamMapper.class);
		List<TeamDTO> teamList = mapper.selectTeam(teamDTO);
		return teamList;
	}

	@Override
	public List<TeamDTO> selectTeamAll() {
		SqlSession session = sqlSessionFactory.openSession();
		TeamMapper mapper = session.getMapper(TeamMapper.class);
		List<TeamDTO> teamList = mapper.selectTeamAll();
		return teamList;
	}
}
