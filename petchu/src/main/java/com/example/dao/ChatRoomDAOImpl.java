package com.example.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChatRoomDAOImpl implements ChatRoomDAO{

	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.ChatRoomMapper";
	
	@Override
	public void create() {
		session.insert(namespace + ".create");		
	}
	
}
