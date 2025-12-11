package kr.spring.service;

import java.util.List;

import kr.spring.entity.Criteria;
import kr.spring.entity.Member;
import kr.spring.entity.Message;
import kr.spring.entity.MsgDTO;

public interface MessageService {

	//메세지 리스트
	List<Message> msgList(Criteria cri);

	//메세지 상세보기
	Message msgContent(int msgIdx);
	
	//전체 게시글 수 
	public int totalCount(Criteria cri);

	//메세지보내기
	void sendMsg(Message sendM);

	//메세지삭제
	void deleteMsg(int msgIdx);

	//메세지삭제2
	void deleteMsg2(List<Integer> idxList);

	//readStatus 0 → 1
	void readStatus1(int msgIdx);

	//arriveStatus 0 → 1
	void arriveStatus1(String memID);

	//새 매세지갯수
	int newMsgCount(String toID);

	//보낸메시지이력
	List<Message> msgRecordList(Criteria cri);

	//전체 보낸 메세지수 
	int recordTotalCount(Criteria cri);

	//보낸메세지 삭제하기
	void recordDeleteMsg(int msgIdx);

	//보낸메세지 메세지 체크삭제
	void deleteRecordMsg2(List<Integer> idxList);

	//안읽은 메세지수
	int readStatus0TotalCount(Criteria cri);

	//보낸메세지 안읽음 수
	int recordReadStatusTotalCount(Criteria cri);

	
	
}
