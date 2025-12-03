package kr.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.spring.entity.Comment;

@Mapper
public interface CommentMapper {

	//댓글작성
	void cmtInsert(Comment cmt);

	//댓글조회하기
	List<Comment> loadCmt(int idx);

	//댓글삭제하기
	void cmtDelete(int cmtIdx);
	
	
}
