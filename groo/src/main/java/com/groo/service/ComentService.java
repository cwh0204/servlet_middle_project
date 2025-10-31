package com.groo.service;

import java.util.List;

import com.groo.model.ComentDTO;

public interface ComentService {
	public void comentInsert(ComentDTO coment);
	public List<ComentDTO> comentSelect(ComentDTO coment);
	public void comentDelete(ComentDTO coment);
	public void comentEdit(ComentDTO coment);
}
