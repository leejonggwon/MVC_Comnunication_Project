package kr.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.entity.Member;
import kr.spring.entity.Reservation;
import kr.spring.entity.Seat;
import kr.spring.mapper.SeatMapper;

@Service
public class SeatServiceImpl implements SeatService {

	@Autowired
	private SeatMapper mapper;

	//좌석정보
	@Override
	public List<Seat> getSeat() {
		List<Seat> seatInfo = mapper.getSeat();
		return seatInfo;
	}

	//seatAvailable+1
	@Override
	public void seatAvailable(Seat seat) {
		mapper.seatAvailable(seat);
	}

	//발권한 정보가져오기
	@Override
	public Seat selectSeat(int seatNum) {
		return mapper.selectSeat(seatNum);
	}

	//발권정보정보생성하기 
	@Override
	public void insertR(Reservation rInfo) {
		mapper.insertR(rInfo);
		
	}
	
	//반납시간생성
	@Override
	public void returnR(int rIdx) {
		mapper.returnR(rIdx);
		
	}
	
	//memStatus +1
	@Override
	public void memStatus1(String memID) {
		mapper.memStatus1(memID);
	}
	
	//발권정보조회
	@Override
	public Reservation nowRInfo(String memID) {
		return mapper.nowRInfo(memID);
	}

	//발권기록출력
	@Override
	public List<Reservation> rRecord(String memID) {
		return mapper.rRecord(memID);
	}

	//SeatAvailable → 0
	@Override
	public void returnSeatAvailable0(int seatNum) {
		mapper.returnSeatAvailable0(seatNum);
		
	}

	//memStatus → 0
	@Override
	public void returnMemStatus0(String memID) {
		mapper.returnMemStatus0(memID);
		
	}

	//반납시간넣기
	@Override
	public void endTime(int seatNum) {
		mapper.endTime(seatNum);
	}

	//회원정보 다시불러오기
	@Override
	public Member selectMem(String memID) {
		return mapper.selectMem(memID); 
	}
	
}
