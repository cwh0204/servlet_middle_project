package com.groo.service;

import java.util.List;

import com.groo.model.BoardDTO;

public interface BoardService {
	public void insertBoard(BoardDTO board);
	public List<BoardDTO>selectBoard(BoardDTO board);
	public BoardDTO selectBoardDetail(BoardDTO board);
	public void updateViews(BoardDTO board);
	public void insertBoardLike(BoardDTO board);
	public BoardDTO selectBoardLikeSearch(BoardDTO board);
}
