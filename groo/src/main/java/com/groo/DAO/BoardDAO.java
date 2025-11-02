package com.groo.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.groo.model.BoardDTO;

public interface BoardDAO {
	public void insertBoard(BoardDTO board, SqlSession session);
	public List<BoardDTO> selectBoard(BoardDTO board, SqlSession session);
	public BoardDTO selectBoardDetail(BoardDTO board, SqlSession session);
	public void updateViews(BoardDTO board, SqlSession session);

	public BoardDTO selectBoardLikeSearch(BoardDTO board, SqlSession session);
	public void insertBoardLike(BoardDTO board, SqlSession session);
	public void deleteBoardLike(BoardDTO board, SqlSession session);

	public void updateBoard(BoardDTO board, SqlSession session);
	public void deleteBoard(BoardDTO board, SqlSession session);
}
