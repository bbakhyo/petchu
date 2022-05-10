package com.example.dao;

import java.util.List;

import com.example.domain.ChatMessageVO;

public interface ChatMessageDAO {
	public List<ChatMessageVO> print(int crno);
	public void send(ChatMessageVO vo);
	public List<ChatMessageVO> chatList(String id);
	public String recedname(int crno);
	public String recenick(int crno);
	public void readdate(int crno, String id);
	public int notread(int crno, String id);
	public int notreadall(String id);
}
