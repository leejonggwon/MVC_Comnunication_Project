package kr.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.entity.Criteria;
import kr.spring.entity.Member;
import kr.spring.entity.Message;
import kr.spring.entity.MsgDTO;
import kr.spring.mapper.MessageMapper;

@Service
public class MessageServiceImpl implements MessageService {
	
	@Autowired
	private MessageMapper mapper;

	//메세지 리스트
	@Override
	public List<Message> msgList(Criteria cri) {
		return mapper.msgList(cri);
	}

	//메세지 상세보기
	@Override
	public Message msgContent(int msgIdx) {
		return mapper.msgContent(msgIdx);
	}
	
	//총게시글수
	@Override
	public int totalCount(Criteria cri) {
		return mapper.totalCount(cri);
	}

	//메세지보내기
	@Override
	public void sendMsg(Message sendM) {
		mapper.sendMsg(sendM);
	}

	//메세지삭제하기
	@Override
	public void deleteMsg(int msgIdx) {
		mapper.deleteMsg(msgIdx);
	}

	//메세지삭제2
	@Override
	public void deleteMsg2(List<Integer> idxList) {
		mapper.deleteMsg2(idxList);
		
	}
	
	//readStatus 0 → 1
	@Override
	public void readStatus1(int msgIdx) {
		mapper.readStatus1(msgIdx);
	}

	//arriveStatus 0 → 1
	@Override
	public void arriveStatus1(String memID) {
		mapper.arriveStatus1(memID);
	}

	//새 매세지갯수
	@Override
	public int newMsgCount(String toID) {
		return mapper.newMsgCount(toID);
	}

	//보낸메세지 이력
	@Override
	public List<Message> msgRecordList(Criteria cri) {
		return mapper.msgRecordList(cri);
	}
	
	//전체 보낸 메세지수 
	@Override
	public int recordTotalCount(Criteria cri) {
		return mapper.recordTotalCount(cri);
	}

	//보낸메세지 삭제하기
	@Override
	public void recordDeleteMsg(int msgIdx) {
		mapper.recordDeleteMsg(msgIdx);
	}

	//보낸메세지 메세지 체크삭제
	@Override
	public void deleteRecordMsg2(List<Integer> idxList) {
		mapper.deleteRecordMsg2(idxList);
	}

	//안읽은 메세지수
	@Override
	public int readStatus0TotalCount(Criteria cri) {
		return mapper.readStatus0TotalCount(cri);
	}

	//보낸메세지 않읽음 수 
	@Override
	public int recordReadStatusTotalCount(Criteria cri) {
		return mapper.recordReadStatusTotalCount(cri);
		
	}
	
	
	
	
}
