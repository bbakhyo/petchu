package com.example.dao;

import java.util.List;

import com.example.domain.CashhistoryVO;

public interface CashhistoryDAO {
	public List<CashhistoryVO> readCH(String id);
	public void insertCH(CashhistoryVO vo);
}