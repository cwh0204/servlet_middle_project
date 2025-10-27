package com.groo.DAO;

import org.apache.ibatis.session.SqlSession;

import com.groo.model.BoardDTO;

public interface BoardDAO {
	public void insertBoard(BoardDTO board, SqlSession session);
}
