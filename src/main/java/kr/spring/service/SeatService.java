package kr.spring.service;

import java.util.List;

import kr.spring.entity.Member;
import kr.spring.entity.Reservation;
import kr.spring.entity.Seat;

public interface SeatService {

	//좌석정보
	public List<Seat> getSeat();

	//seatAvailable +1
	public void seatAvailable(Seat seat);

	//발권한 정보가져오기
	public Seat selectSeat(int seatNum);

	//발권정보정보생성하기 
	public void insertR(Reservation rInfo);

	
	//반납시간생성
	public void returnR(int rIdx);

	//memStatus +1
	public void memStatus1(String memID);

	//현재발권정보만 조회
	public Reservation nowRInfo(String memID);

	//발권기록출력
	public List<Reservation> rRecord(String memID);

	//SeatAvailable → 0
	public void returnSeatAvailable0(int seatNum);

	//memStatus → 0
	public void returnMemStatus0(String memID);

	//반납시간넣기
	public void endTime(int seatNum);

	//회원정보 다시불러오기
	public Member selectMem(String memID);

}
