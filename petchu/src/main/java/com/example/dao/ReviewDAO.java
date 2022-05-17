package com.example.dao;

import java.util.List;

import com.example.domain.Criteria;
import com.example.domain.ReviewVO;

public interface ReviewDAO {

	public List<ReviewVO> list(int bno);//리스트
	public void insert(ReviewVO vo);//insert
	public ReviewVO read(int rid, int pno); //read
	public List<ReviewVO> idReview(String uid);
	public int idReviewCount(String uid);
	public void update(ReviewVO vo); //update
	public void delete(int rid);//delete
	public List<ReviewVO> join(Criteria cri);//reviewjoin
	public int count();
	public ReviewVO updateread(int rid);
	
}

