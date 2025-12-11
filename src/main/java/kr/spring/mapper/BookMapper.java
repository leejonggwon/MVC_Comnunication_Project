package kr.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.spring.entity.Book;
import kr.spring.entity.Criteria;

@Mapper
public interface BookMapper {

	//도서리스트
	List<Book> bookList(Criteria cri);

	//새 글 작성
	void bookInsert(Book book);

	//삭제하기
	void bookDelete(int bkNum);

	//글 상세보기(업데이트폼)
	Book bookContent(int bkNum);

	//글수정
	void bookUpdate(Book book);

	//전체 게시글수 
	int totalCount(Criteria cri);
	
	
	
	

}
