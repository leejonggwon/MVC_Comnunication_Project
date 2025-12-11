package kr.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.entity.Book;
import kr.spring.entity.Criteria;
import kr.spring.mapper.BookMapper;


@Service
public class BookServiceImpl implements BookService {

	@Autowired
	private BookMapper mapper;

	
	//도서리스트
	@Override
	public List<Book> bookList(Criteria cri) {
		return mapper.bookList(cri);
	}

	//새 글 작성
	@Override
	public void bookInsert(Book book) {
		mapper.bookInsert(book);
	}
	
	//삭제하기
	@Override
	public void bookDelete(int bkNum) {
		mapper.bookDelete(bkNum);
		
	}
	
	//글 상세보기(업데이트폼)
	@Override
	public Book bookContent(int bkNum) {
		return mapper.bookContent(bkNum);
	}

	//글수정
	@Override
	public void bookUpdate(Book book) {
		mapper.bookUpdate(book);
	}

	//총게시글수
	@Override
	public int totalCount(Criteria cri) {
		return mapper.totalCount(cri);
	}
	

}
