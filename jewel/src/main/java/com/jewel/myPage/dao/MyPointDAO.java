package com.jewel.myPage.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.jewel.common.dao.AbstractDAO;

@Repository("myPointDAO")
public class MyPointDAO extends AbstractDAO{
	//나의 포인트 목록 조회
	public List<Map<String, Object>> selectMyPointList(Map<String, Object> map) throws Exception{
		return(List<Map<String, Object>>) selectList("myPage.selectMyPointList", map);
	}
	//나의 포인트 변경내역 개수
	public int myPointTotal(Map<String, Object> map) throws Exception {
		return (Integer) selectOne("myPage.myPointTotal", map);		
	}
}
