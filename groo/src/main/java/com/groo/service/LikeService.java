package com.groo.service;

import java.util.List;

import com.groo.model.BoardDTO;
import com.groo.model.MemberDTO;

public interface LikeService {

	List<BoardDTO> selectMyLikeList(MemberDTO member);

}
