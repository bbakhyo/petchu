package com.example.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.dao.PetDAO;
import com.example.domain.PetVO;

@RestController
@RequestMapping("/pet")
public class PetController {
	
	@Autowired
	PetDAO dao;
	
	@RequestMapping("/petlist")
	public List<PetVO> petlist(HttpSession session){
		return dao.readPetList(session.getAttribute("id").toString());
	}
	@RequestMapping("/readpet")
	public PetVO readpet(int pno){
		return dao.readPet(pno);
	}

}
