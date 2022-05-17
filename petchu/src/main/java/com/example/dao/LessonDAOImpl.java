package com.example.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.LessonRequestVO;

@Repository
public class LessonDAOImpl implements LessonDAO {
	
	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.LessonRequestMapper";
	

	@Override
	public void lessonInsert(LessonRequestVO vo) {
		session.insert(namespace + ".lessonInsert", vo);
		
	}


	@Override
	public List<LessonRequestVO> lessonList() {
		return session.selectList(namespace + ".lessonList");
	}


	@Override
	public LessonRequestVO lessonRead(int lrno) {
		return session.selectOne(namespace + ".lessonRead", lrno);
	}


	@Override
	public LessonRequestVO myLessonRead(String uid) {
		return session.selectOne(namespace + ".myLessonRead", uid);
	}


	@Override
	public int lessonCount(String uid) {
		return session.selectOne(namespace + ".lessonCount", uid);
	}


	@Override
	public void lisDeleteUpdate(int lrno) {
		session.update(namespace + ".lisDeleteUpdate", lrno);
		
	}


	@Override
	public List<LessonRequestVO> lessonDeadlineList(String uid) {
		return session.selectList(namespace + ".lessonDeadlineList", uid);
	}


	@Override
	public int lrno(String uid) {
		return session.selectOne(namespace + ".lrno", uid);
	}
}
