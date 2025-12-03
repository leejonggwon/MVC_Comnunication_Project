package kr.spring.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.spring.entity.Member;
import kr.spring.entity.Reservation;
import kr.spring.entity.Seat;
import kr.spring.service.SeatService;

@RestController
@RequestMapping("/seat/*")
public class SeatRestController {
	
	@Autowired
	private SeatService service;
	
	//seatAvailable +1
	@PostMapping("/seatAvailable")
	public void seatAvailable(Seat seat) {
		System.out.println("seatAvailable +1실행");
		service.seatAvailable(seat);
	}
	
	//memStatus → 1
		@PostMapping("/memStatus1")
		public void memStatus1(@RequestParam String memID) {
			System.out.println("memStatus1 +1실행");
			service.memStatus1(memID);
		}
	
	
	
	//발권한 seat정보 불러오기
	@RequestMapping("/selectSeat")
	@ResponseBody
	public Seat selectSeat(@RequestParam int seatNum) {
		System.out.println("발권한 seat정보 불러오기");
		Seat seatInfo = service.selectSeat(seatNum);
		return seatInfo;
	}
	
	
	//발권정보정보생성하기 
	@PostMapping("/insertR")
	public void insertR(Reservation rInfo) {
		System.out.println("발권정보생성하기 ");
		service.insertR(rInfo);
	}
	
	
	//반납시간생성하기
	@PostMapping("/returnR")
	@ResponseBody
	public void returnR(int rIdx) {
		System.out.println("반납시간생성하기 ");
		service.returnR(rIdx);
	}
	
	
	//현재발권한 정보만 불러오기
	@PostMapping("/nowRInfo")
	@ResponseBody
	public Reservation nowRInfo(@RequestParam String memID) {
		System.out.println("현재발권한 정보만 불러오기");
		Reservation list = service.nowRInfo(memID);
		return list;
	}
	
	//발권기록 출력
	@PostMapping("/rRecord")
	@ResponseBody
	public List<Reservation> rRecord(@RequestParam String memID) {
		System.out.println("발권기록 불러오기");
		List<Reservation> list = service.rRecord(memID);
		return list;
	}
	
	
	
	//SeatAvailable → 0
	@PostMapping("/returnSeatAvailable0")
	public void returnSeatAvailable0(@RequestParam int seatNum) {
		System.out.println("SeatAvailable → 0");
		service.returnSeatAvailable0(seatNum);
	}
	
	//memStatus → 0
	@PostMapping("/returnMemStatus0")
	public void returnMemStatus0(@RequestParam String memID) {
		System.out.println("memStatus → 0");
		service.returnMemStatus0(memID);
	}
	
	
	//반납시간넣기 
	@PostMapping("/endTime")
	@ResponseBody
	public Reservation endTime(@RequestParam int seatNum, @RequestParam String memID) {
		System.out.println("반납시간넣기 ");
		service.endTime(seatNum);
		Reservation list = service.nowRInfo(memID);
		return list;
	}
	
}

