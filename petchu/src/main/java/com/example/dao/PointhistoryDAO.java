package com.example.dao;

import java.util.List;

import com.example.domain.PointhistoryVO;

public interface PointhistoryDAO {
	public List<PointhistoryVO> readPH(String id);
	public void insertPH(PointhistoryVO vo);
}
