package kr.spring.service;

import java.util.List;

import kr.spring.entity.Book;
import kr.spring.entity.Criteria;

public interface BookService {

	//도서리스트
	List<Book> bookList(Criteria cri);

	//도서등록
	void bookInsert(Book book);

	//도서삭제
	void bookDelete(int bkNum);

	//도서상세보기
	Book bookContent(int bkNum);

	//글수정
	void bookUpdate(Book book);

	//총게시글수
	int totalCount(Criteria cri);



}
