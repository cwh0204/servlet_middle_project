package com.groo.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.groo.model.ComentDTO;

public interface ComentDAO {
	public void comentInsert(ComentDTO coment, SqlSession session);
	public List<ComentDTO> comentSelect(ComentDTO coment, SqlSession session);
	public void comentDelete(ComentDTO coment, SqlSession session);
	public void comentEdit(ComentDTO coment, SqlSession session);
}
