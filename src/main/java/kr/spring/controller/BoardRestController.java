package kr.spring.controller;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import kr.spring.service.BoardService;

@RestController
@RequestMapping("/board/*")
public class BoardRestController {
	
	@Autowired
	private BoardService service;
	
	
	
	
	

	
	
	
}
