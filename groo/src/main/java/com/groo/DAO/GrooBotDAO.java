package com.groo.DAO;

import org.apache.ibatis.session.SqlSession;

import com.groo.model.GrooBotDTO;

public interface GrooBotDAO {
	public void insertGrooBot(GrooBotDTO bot, SqlSession session);
	public GrooBotDTO selectGrooBot(GrooBotDTO bot, SqlSession session);
}
