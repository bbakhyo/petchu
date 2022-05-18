package com.example.dao;

import java.util.List;

import com.example.domain.DoctorRequestVO;

public interface DoctorRequestDAO {
	public void replyRequest(DoctorRequestVO vo);
	public List<DoctorRequestVO> resultRequestList(String id);
	public DoctorRequestVO resultRequest(int drno);
}
