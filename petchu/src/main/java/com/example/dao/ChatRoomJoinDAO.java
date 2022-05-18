package com.example.dao;

import java.util.List;

import com.example.domain.ChatRoomJoinVO;

public interface ChatRoomJoinDAO {
	public void create(String id, int crno);
	public List<ChatRoomJoinVO> chatList(String id);

}
