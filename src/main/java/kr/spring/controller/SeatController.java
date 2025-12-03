package kr.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.spring.entity.Member;
import kr.spring.entity.Reservation;
import kr.spring.entity.Seat;
import kr.spring.service.SeatService;

@Controller 
@RequestMapping("/seat/*") 
public class SeatController {
	
	@Autowired
	private SeatService service;
	
	
	//좌석발권페이지이동
	@GetMapping("/seat")
	public String seatReservation(Model model, HttpSession session) {
		
		List<Seat> seatInfo = service.getSeat();
		model.addAttribute("seatInfo", seatInfo);
		
		//현재로그인정보 
		Member mvo = (Member)session.getAttribute("mvo"); 
		
		//회원정보 다시불러오기
		String memID = mvo.getMemID();
		Member smvo = service.selectMem(memID);
		
		model.addAttribute("mvo", mvo);
		model.addAttribute("smvo", smvo);
		return "seat/seat";
	}
	
	
	//발권정보페이지이동
	@RequestMapping("/rInfo")
	public String rInfo(Model model, HttpSession session) {
		
		Member mvo = (Member)session.getAttribute("mvo"); 
		
		String memID = mvo.getMemID();
		//memID로 현재발권한 정보가져오기 
		Reservation rvo = service.nowRInfo(memID);
		
		model.addAttribute("mvo", mvo);
		model.addAttribute("rvo", rvo);
		return "seat/rInfo";
	}
	
	
	
	
	
	
	
}
