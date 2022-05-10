package com.example.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
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
	public List<PetVO> petlist(String id){
		return dao.readPetList(id);
	}
	@RequestMapping("/readpet")
	public PetVO readpet(int pno){
		return dao.readPet(pno);
	}

}
