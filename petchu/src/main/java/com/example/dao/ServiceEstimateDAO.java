package com.example.dao;

import java.util.List;

import com.example.domain.ServiceEstimateVO;

public interface ServiceEstimateDAO {
	//중복체크
	public int overlabCheck(ServiceEstimateVO vo);
	
	public int overlabCheck2(ServiceEstimateVO vo);
	
	public int overlabCheck3(ServiceEstimateVO vo);
	
	//미용
	public void binsert(ServiceEstimateVO vo);
	
	public List<ServiceEstimateVO> blist(int scno);
	
	//홈 클리닝
	public void cinsert(ServiceEstimateVO vo);
	
	
	//레슨
	public void linsert(ServiceEstimateVO vo);
	
	//내가 쓴 견적서 보기
	
	public List<ServiceEstimateVO> beautyViewList(int scno);
	public ServiceEstimateVO beautyViewRead(ServiceEstimateVO vo);
	
	public List<ServiceEstimateVO> cleaningViewList(int scno);
	public ServiceEstimateVO cleaningViewRead(ServiceEstimateVO vo);
	
	public List<ServiceEstimateVO> lessonViewList(int scno);
	public ServiceEstimateVO lessonViewRead(ServiceEstimateVO vo);
}
