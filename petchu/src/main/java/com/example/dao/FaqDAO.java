package com.example.dao;
 
import java.util.List;

import com.example.domain.FaqVO;
import com.example.domain.Criteria;

public interface FaqDAO {
	public List<FaqVO>list(Criteria cri);
	public FaqVO read(int fno);
	public void insert(FaqVO vo);	 
	public void update(FaqVO vo);
	public void delete(int fno);
}
