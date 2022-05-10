package com.example.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.dao.StarDAO;
import com.example.domain.RatingAvgDTO;
import com.example.domain.StarVO;
@Service
public class StarServiceImpl implements StarService{
	
	@Autowired
	StarDAO sdao;
	
	@Transactional
	@Override
	public void updatehelpcount(int rid) {
		sdao.updateHelpcount(rid);		
	}

	@Transactional
	@Override
	public void updatehelpcountcancel(int rid) {
		sdao.updateHelpcountCancel(rid);
		
	}
	
	@Transactional
	@Override
	public double helpcount(int rid) {
		double vo=sdao.helpcount(rid);
		return vo; 
	}

	@Override
	public void updateRatingAvg(int pno) {
		StarVO vo=new StarVO();
		double ratingAvg = sdao.RatingAvg(pno); //상품별 평균 평점 구하기
		
		vo.setPno(pno);
		vo.setRatingAvg(ratingAvg); 
		
		sdao.updateRating(vo); // 평균 평점 DB에 적용
	}
}
