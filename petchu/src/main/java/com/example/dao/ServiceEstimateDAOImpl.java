package com.example.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.ServiceEstimateVO;

@Repository
public class ServiceEstimateDAOImpl implements ServiceEstimateDAO {

	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.ServiceEstimateMapper";
	
	@Override
	public void binsert(ServiceEstimateVO vo) {
		session.insert(namespace + ".brnoInsert", vo);
	}

	@Override
	public void cinsert(ServiceEstimateVO vo) {
		session.insert(namespace + ".crnoInsert", vo);
	}

	@Override
	public void linsert(ServiceEstimateVO vo) {
		session.insert(namespace + ".lrnoInsert", vo);
	}

	@Override
	public List<ServiceEstimateVO> blist(int scno) {
		return session.selectList(namespace + ".brnoList", scno);
	}

	@Override
	public int overlabCheck(ServiceEstimateVO vo) {
		return session.selectOne(namespace + ".overlapCheck", vo);
	}

	@Override
	public int overlabCheck2(ServiceEstimateVO vo) {
		return session.selectOne(namespace + ".overlapCheck2", vo);
	}

	@Override
	public int overlabCheck3(ServiceEstimateVO vo) {
		return session.selectOne(namespace + ".overlapCheck3", vo);
	}

	@Override
	public List<ServiceEstimateVO> beautyViewList(int scno) {
		return session.selectList(namespace + ".beautyViewList", scno);
	}

	@Override
	public List<ServiceEstimateVO> cleaningViewList(int scno) {
		return session.selectList(namespace + ".cleaningViewList", scno);
	}

	@Override
	public List<ServiceEstimateVO> lessonViewList(int scno) {
		return session.selectList(namespace + ".lessonViewList", scno);
	}

	@Override
	public ServiceEstimateVO beautyViewRead(ServiceEstimateVO vo) {
		return session.selectOne(namespace+ ".beautyViewRead" , vo);
	}

	@Override
	public ServiceEstimateVO cleaningViewRead(ServiceEstimateVO vo) {
		return session.selectOne(namespace+ ".cleaningViewRead" , vo);
	}
	
	@Override
	public ServiceEstimateVO lessonViewRead(ServiceEstimateVO vo) {
		return session.selectOne(namespace+ ".lessonViewRead" , vo);
	}
	
}
