package com.groo.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.groo.DAO.LikeDAO;
import com.groo.DAO.LikeDAOImpl;
import com.groo.config.SessionFactory;
import com.groo.error.InternalDataAccessException;
import com.groo.error.InternalServiceException;
import com.groo.model.BoardDTO;
import com.groo.model.MemberDTO;

public class LikeServiceImpl implements LikeService {

	LikeDAO dao = new LikeDAOImpl();

	/* 내가 누른 좋아요를 가져오는 메서드 */
	@Override
	public List<BoardDTO> selectMyLikeList(MemberDTO member) {
		SqlSession session = SessionFactory.getSqlSession();
		List<BoardDTO> list = new ArrayList<>();

		try {
			list = dao.selectMyLikeList(member, session);
		} catch (InternalDataAccessException ide) {
			ide.printStackTrace();
			throw new InternalServiceException("DB 접근 오류로 인한 서비스 예외", ide);
		} catch (Exception e) {
			e.printStackTrace();
			throw new InternalServiceException("예상치 못한 서비스 내부 오류", e);
		} finally {
			session.close();
		}
		return list;
	}
}
