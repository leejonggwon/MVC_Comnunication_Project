package kr.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.spring.entity.Board;
import kr.spring.entity.Like;
import kr.spring.service.LikeService;


@RestController
@RequestMapping("/like/*")
public class LikeRestController {

	@Autowired
	private LikeService service;
	
	//likeCount 불러오기
	@GetMapping("/likeCount")
	@ResponseBody
	public Board likeCount(@RequestParam int idx){
		System.out.println("좋아요갯수불러오기실행");
		
		return service.likeCount(idx);
	}
	
	
	//Like객체생성
	@PostMapping("/insertLike")
	public void insertLike(Like like){
		System.out.println("like객체생성 실행");
		service.insertLike(like);
	}
	
	//Like객체삭제
	@PostMapping("/deleteLike")
	public void deleteLike(Like like){
		System.out.println("like객체삭제");
		service.deleteLike(like);
	}
	
	
	//Like객체 likeAvailable 불러오기
	@GetMapping("/selectLike")
	@ResponseBody
	public int selectLike(Like like){
		System.out.println("like객체 불러오기");
		return service.selectLike(like);
	}
	
	//likeCount -1
	@PostMapping("/unLike")
	public void unLike(@RequestParam int idx) {
		System.out.println("좋아요-1 실행");
		service.unLike(idx);
	}
	
	//likeCount +1
	@PostMapping("/likePlus")
	public void likePlus( @RequestParam int idx){
		System.out.println("좋아요+1 실행");
		service.likePlus(idx);
	}
	
}
