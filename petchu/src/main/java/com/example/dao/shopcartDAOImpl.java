package com.example.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.shopcartVO;

@Repository
public class shopcartDAOImpl implements shopcartDAO{

	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.shopcartMapper";
	
	@Override
	public List<shopcartVO> cart_read(String uid) {
		return session.selectList(namespace+".cart_read", uid);
	}

	@Override
	public void cart_insert(shopcartVO vo) {
		session.insert(namespace+".cart_insert", vo);
	}

	@Override
	public void cart_delete(int cno) {
		session.delete(namespace+".cart_delete", cno);
	}

	@Override
	public void cart_update(int amount, int cno) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("amount", amount);
		map.put("cno", cno);
		session.update(namespace+".cart_update", map);
	}

	@Override
	public void cart_chk_update(int chk, int cno) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("chk", chk);
		map.put("cno", cno);
		session.update(namespace+".cart_chk_update", map);
	}

	@Override
	public List<shopcartVO> cart_buy(String uid) {
		return session.selectList(namespace+".cart_buy", uid);
	}

	@Override
	public void order_insert(shopcartVO vo) {
		session.insert(namespace+".order_insert", vo);
	}

	@Override
	public void chk_delete(shopcartVO vo) {
		session.delete(namespace+".chk_delete", vo);
	}

	@Override
	public List<shopcartVO> order_list(String uid) {
		return session.selectList(namespace+".order_list", uid);
	}

	@Override
	public shopcartVO order_read(int bno) {
		return session.selectOne(namespace+".order_read", bno);
	}
	@Override
	public shopcartVO cart_check(shopcartVO vo) {
		return session.selectOne(namespace+".cart_check", vo);
	}

	@Override
	public List<shopcartVO> order_read_else(int bno, String orno) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("bno", bno);
		map.put("orno", orno);
		return session.selectList(namespace+".order_read_else", map);
	}

	@Override
	public void sell_update(int amount, int pno) {
		//수량증가
		HashMap<String, Object> map = new HashMap<>();
		map.put("amount", amount);
		map.put("pno", pno);
		session.update(namespace+".sell_update", map);
	}

	@Override
	public List<shopcartVO> today_best_items() {
		return session.selectList(namespace+".today_best_items");
	}

	@Override
	public List<shopcartVO> best_items() {
		return session.selectList(namespace+".best_items");
	}
}
