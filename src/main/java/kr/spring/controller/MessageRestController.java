package kr.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.spring.service.MessageService;

@RestController
@RequestMapping("/message/*")
public class MessageRestController {
	
	@Autowired
	private MessageService service;
	
	//새 매세지갯수
	@RequestMapping("/newMsgCount")
	@ResponseBody
	public int newMsgCount(@RequestParam("toID") String toID){
		System.out.println("새 매세지갯수불러오기실행");
		return service.newMsgCount(toID);
	}
	
	
	
	
	

}
