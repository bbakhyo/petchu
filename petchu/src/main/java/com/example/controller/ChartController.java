package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.dao.ChartdataDAO;
import com.example.domain.ChartdataVO;

@RestController
@RequestMapping("/chart")
public class ChartController {
	@Autowired
	ChartdataDAO dao;
	
	@RequestMapping("/list")
	public ChartdataVO list(String dname){
		return dao.chartlist(dname);
	}
}
