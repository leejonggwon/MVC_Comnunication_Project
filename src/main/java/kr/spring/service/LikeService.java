package kr.spring.service;

import kr.spring.entity.Board;
import kr.spring.entity.Like;

public interface LikeService {
	
		//likeCount +1
		public void likePlus(int idx);
		
		//likeCount -1
		public void unLike(int idx);

		//Like 객체생성
		public void insertLike(Like like);
		
		//Like객체삭제
		public void deleteLike(Like like);
		
		//Like객체 likeAvailable 불러오기
		public int selectLike(Like like);

		//likeCount 불러오기
		public Board likeCount(int idx);

		

		
}
