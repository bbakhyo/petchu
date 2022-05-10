package com.example.controller;



import java.util.List;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dao.ChatMessageDAO;
import com.example.dao.ChatRoomJoinDAO;
import com.example.dao.UserDAO;
import com.example.domain.ChatMessageVO;

@Controller
@RequestMapping("chat")
public class ChatController {
	
	@Autowired
	UserDAO udao;
	
	@Autowired
	ChatMessageDAO mdao;
	
	@RequestMapping("/main")
	public void main(Model model,HttpSession session){
		model.addAttribute("type", udao.typechk(session.getAttribute("id").toString()));
		model.addAttribute("chatList", mdao.chatList(session.getAttribute("id").toString()));
		model.addAttribute("pageName", "chat/main.jsp");
	}
	
	@RequestMapping("/room")
	public void main(Model model, int crno, HttpSession session){
		model.addAttribute("type", udao.typechk(session.getAttribute("id").toString()));
		model.addAttribute("dname", mdao.recedname(crno));
		model.addAttribute("nick", mdao.recenick(crno));
		model.addAttribute("crno", crno);
		model.addAttribute("message", mdao.print(crno));
		model.addAttribute("pageName", "chat/room.jsp");
	}
	
	@ResponseBody
	@RequestMapping("/message.json")
	public List<ChatMessageVO> messageList(int crno){
		return mdao.print(crno);
	}
	
	@ResponseBody
	@RequestMapping("/notread")
	public int notread(int crno, HttpSession session){
		return mdao.notread(crno, session.getAttribute("id").toString());
	}
	
	@RequestMapping(value="update", method=RequestMethod.POST)
	public void update(int crno, HttpSession session){
		mdao.readdate(crno, session.getAttribute("id").toString());
	}
	@RequestMapping(value="send", method=RequestMethod.POST)
	public void send(ChatMessageVO vo){
		mdao.send(vo);
	}


}
