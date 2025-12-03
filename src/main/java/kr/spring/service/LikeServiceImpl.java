package kr.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.entity.Board;
import kr.spring.entity.Like;
import kr.spring.mapper.LikeMapper;

@Service
public class LikeServiceImpl implements LikeService {
	
	@Autowired
	private LikeMapper mapper;
	
		//likeCount +1
		@Override
		public void likePlus(int idx) {
			mapper.likePlus(idx);
		}
		
		//likeCount -1
		@Override
		public void unLike(int idx) {
			mapper.unLike(idx);
		}

		//Like객체생성하기
		@Override
		public void insertLike(Like like) {
			mapper.insertLike(like);
		}
		
		//Like 객체삭제
		@Override
		public void deleteLike(Like like) {
			mapper.deleteLike(like);		
		}
		
		//Like객체 likeAvailable 불러오기
		@Override
		public int selectLike(Like like) {
			return mapper.selectLike(like);
		}

		//likeCount 불러오기
		@Override
		public Board likeCount(int idx) {
			return mapper.likeCount(idx);
		}

		

		


}
