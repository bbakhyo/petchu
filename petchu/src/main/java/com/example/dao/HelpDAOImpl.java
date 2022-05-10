package com.example.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.HelpVO;

@Repository
public class HelpDAOImpl implements HelpDAO{
	
	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.HelpMapper";
	
	@Override
	public void inserthelp(HelpVO vo) {
		session.insert(namespace + ".insertHelp", vo);
	}

	@Override
	public void deletehelp(HelpVO vo) {
		session.delete(namespace + ".deleteHelp", vo);
	}

	@Override
	public void updatehelpcheck(HelpVO vo) {
		session.update(namespace + ".updateHelpCheck", vo);
		
	}

	@Override
	public void updatehelpcheckcancel(HelpVO vo) {
		session.update(namespace + ".updateHelpCheckCancel", vo);
		
	}

	@Override
	public int helpcheckcount(HelpVO vo) {
		return session.selectOne(namespace + ".helpCheck", vo);
	}

}
