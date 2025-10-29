package com.groo.DAO;

import org.apache.ibatis.session.SqlSession;

import com.groo.model.ComentDTO;

public interface ComentDAO {
	public void comentInsert(ComentDTO coment, SqlSession session);
}
