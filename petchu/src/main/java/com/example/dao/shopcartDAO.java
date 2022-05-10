package com.example.dao;

import java.util.List;

import com.example.domain.shopcartVO;


public interface shopcartDAO {
	public List<shopcartVO> cart_read(String uid);
	public void cart_insert(shopcartVO vo);
	public void cart_delete(int cno);
	public void cart_update(int amount, int cno);
	public void cart_chk_update(int chk, int cno);
	public List<shopcartVO> cart_buy(String uid);
	public void order_insert(shopcartVO vo);
	public void chk_delete(shopcartVO vo);
	public List<shopcartVO> order_list(String uid);
	public List<shopcartVO> order_read(String orno);
	public shopcartVO cart_check(shopcartVO vo);
	public shopcartVO order_read_user(String orno);
	public void sell_update(int amount, int pno);
	public List<shopcartVO> today_best_items();
	public List<shopcartVO> best_items();
	public shopcartVO user_point(String uid);
}
