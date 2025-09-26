package com.groo.config;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.ibatis.session.SqlSessionFactory;

public class SessionFactory {
/* SqlSession은 DB에 SQL문을 실행하기 위해 필요한 모든 메소드를 가지고 있다.
 *  SqlSession은 JDBC에서 개발자가 직접 Connection을 생성하고 PreparedStatement를
 *   이용해서 SQL을 실행하던 모든 작업을 내부적으로 자동으로 처리해 준다. 
 *   SqlSession 인스턴스를 만들기 위해서는 SqlSessionFactory가 필요하다.  
 */
	
	static SqlSessionFactory sqlSessionFactory;
	
	static { //클래스 로딩시 초기화
		String resource = "com/groo/mapper/Configuration.xml"; //설정파일의 이름과 경로 지정
		InputStream inputStream = null;//InputStream은 바이트 입력스트림의 최상위 추상클래스
		try {
			inputStream = Resources.getResourceAsStream(resource); //설정파일 읽어오기
			//System.out.println("Configuration.xml 로딩 성공");
			//System.out.println("==============================\n");
		} catch (IOException e) {
			e.printStackTrace();
		}
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream); 
		//SqlSessionFactoryBuilder 객체 생성 후, 읽어온 설정파일로 SqlSessionFactory 빌드
	}//클래스 초기화 블럭
	
	public static SqlSession getSqlSession() { //SqlSession 반환 
		SqlSession session = sqlSessionFactory.openSession(); //SqlSessionFactory에서 SqlSession 생성
		return session;//mybatis에서 쿼리문을 수행할 session 반환
	}
}
