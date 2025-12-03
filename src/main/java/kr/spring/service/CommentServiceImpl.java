package kr.spring.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.entity.Comment;
import kr.spring.mapper.CommentMapper;


@Service
public class CommentServiceImpl implements CommentService {
	
	@Autowired
	private CommentMapper mapper;

	//댓글작성
	@Override
	public void cmtInsert(Comment cmt) {	
		mapper.cmtInsert(cmt);
	}

	//댓글조회
	@Override
	public List<Comment> loadCmt(int idx) {
		return mapper.loadCmt(idx);
	}

	//댓글삭제하기
	@Override
	public void cmtDelete(int cmtIdx) {
		mapper.cmtDelete(cmtIdx);
	}

}
