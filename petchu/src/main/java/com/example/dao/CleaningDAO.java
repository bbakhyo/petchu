package com.example.dao;

import java.util.List;

import com.example.domain.CleaningRequestVO;

public interface CleaningDAO {
	public void cleangingInsert(CleaningRequestVO vo);
	public List<CleaningRequestVO> cleanList();
	public CleaningRequestVO cleanRead(int crno);
	public CleaningRequestVO myCleanRead(String uid);
	public List<CleaningRequestVO> cleanDeadlineList(String uid);
	public List<CleaningRequestVO> cleanChooseList(String uid);
	public int cleaningCount(String uid);
	public void cisDeleteUpdate(int crno);
	public void cleanChooseUpdate(int crno);
	public int crno(String uid);
}
