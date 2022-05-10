package com.example.dao;

import java.util.List;

import com.example.domain.BeautyRequestVO;

public interface BeautyDAO {
	public void beautyInsert(BeautyRequestVO vo);
	public List<BeautyRequestVO> beautyList();
	public BeautyRequestVO beautyRead(int brno);
	public BeautyRequestVO myBeautyRead(String uid);
	public int beautyCount(String uid);
	public void bisDeleteUpdate(int brno);
}
