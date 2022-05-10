package com.example.dao;

import java.util.List;

import com.example.domain.shopcartVO;
import com.example.domain.shopproductVO;


public interface shopproductDAO {
	public List<shopproductVO> list();
	public shopproductVO read(int pno);
	public List<shopproductVO> contents_list(String selectCate, String selectCate2, String selectCate3);
	public shopcartVO cart_read(String uid); //주문목록
}
