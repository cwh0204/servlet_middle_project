package com.groo.service;

import com.groo.model.GrooBotDTO;

public interface GrooBotService {
	public void insertGrooBot(GrooBotDTO bot);
	public GrooBotDTO selectGrooBot(GrooBotDTO bot);
}
