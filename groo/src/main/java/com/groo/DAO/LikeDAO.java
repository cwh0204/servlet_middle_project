package com.groo.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.groo.model.BoardDTO;
import com.groo.model.MemberDTO;

public interface LikeDAO {
	List<BoardDTO> selectMyLikeList(MemberDTO member, SqlSession session);
}
