package com.example.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.ReviewVO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {
	@Autowired
	SqlSession session;
	String namespace = "com.example.mapper.ReviewMapper";
	
	@Override
	public List<ReviewVO> list(int bno) {
		return session.selectList(namespace + ".list", bno);
	}

	@Override
	public void insert(ReviewVO vo) {
		session.insert(namespace + ".insert", vo);
		
	}

	@Override
	public ReviewVO read(int rid, int pno) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("rid", rid);
		map.put("pno", pno);
		return session.selectOne(namespace + ".read", map);
	}

	@Override
	public void update(ReviewVO vo) {
		session.update(namespace + ".update", vo);
		
	}

	@Override
	public void delete(int rid) {
		session.delete(namespace + ".delete", rid);
	}

	@Override
	public List<ReviewVO> r_join() {
		return session.selectList(namespace + ".r_join");
	}


}
