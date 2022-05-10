package com.example.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.RateVO;

@Repository
public class RateDAOImpl implements RateDAO{
	
	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.HoschoolMapper";
	
	@Override
	public void rateInsert(RateVO vo) {
		session.insert(namespace + ".rateInsert", vo);
	}

	@Override
	public List<RateVO> reviewList(int scno, int start, int perPageNum) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("scno", scno);
		map.put("perPageNum", perPageNum);
		return session.selectList(namespace + ".reviewList", map);
	}

	@Override
	public int reviewCount(int scno) {
		return session.selectOne(namespace + ".reviewCount", scno);
	}

}
