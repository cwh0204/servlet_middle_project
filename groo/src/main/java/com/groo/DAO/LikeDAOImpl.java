package com.groo.DAO;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.groo.error.InternalDataAccessException;
import com.groo.model.BoardDTO;
import com.groo.model.MemberDTO;

public class LikeDAOImpl implements LikeDAO {

	@Override
	public List<BoardDTO> selectMyLikeList(MemberDTO member, SqlSession session) {
		List<BoardDTO> list = new ArrayList<>();

		try {
			list = session.selectList("selectMyLikeList", member);
		} catch (Exception e) {
			throw new InternalDataAccessException("DAO:selectTeam 예외발생", e);
		}
		return list;

	}
}
