package kr.spring.service;

import java.util.List;

import kr.spring.entity.Comment;

public interface CommentService {

	//댓글작성
	void cmtInsert(Comment cmt);

	//댓글조회
	List<Comment> loadCmt(int idx);

	//댓글삭제
	void cmtDelete(int cmtIdx);
	

}
