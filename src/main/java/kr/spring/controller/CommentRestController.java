package kr.spring.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.spring.entity.Comment;
import kr.spring.service.CommentService;

@RestController
@RequestMapping("/comment/*")
public class CommentRestController {
	
	@Autowired
	private CommentService service;
	
	
	//댓글삭제하기
	@GetMapping("/cmtDelete") 
	@ResponseBody
	public void cmtDelete(@RequestParam int cmtIdx) { 
		System.out.println("댓글 삭제 기능수행");
		service.cmtDelete(cmtIdx);
	}
	
	
	//@ResponseBody = 리턴값을 JSP로 보내지 말고, 그대로 HTTP Response로 보내라는 의미
	//@RequestParam은 GET/POST 요청에서 query string(파라미터)을 받을 때 사용되는 기본 어노테이션이다(동기비동기상관없다)
	//개별 값 단위로 받는 방식으로 단체로 받을 수 없고 여러개로 받을 수 있다 
	
	
	//댓글 조회
	@GetMapping("/loadCmt")
	@ResponseBody
	public List<Comment> loadCmt(@RequestParam int idx){
		
		System.out.println("댓글조회 기능수행");
		List<Comment> cmtInfo = service.loadCmt(idx);
		return cmtInfo;
	}
	
	
	//댓글등록
	@PostMapping("/cmtInsert")  
	public void cmtInsert(Comment cmt) { 
		
		System.out.println("댓글등록 기능수행");
		service.cmtInsert(cmt);
	}

}
