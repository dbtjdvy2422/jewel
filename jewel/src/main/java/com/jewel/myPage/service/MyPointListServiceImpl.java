package com.jewel.myPage.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jewel.myPage.dao.MyPointDAO;

@Service("myPointService")
public class MyPointListServiceImpl implements MyPointListService {

	@Resource(name="myPointDAO")
	MyPointDAO myPointDAO;

	@Override
	public List<Map<String, Object>> selectMyPointList(Map<String, Object> map) throws Exception {
		return myPointDAO.selectMyPointList(map);
	}

	@Override
	public int myPointTotal(Map<String, Object> map) throws Exception {
		return myPointDAO.myPointTotal(map);
	}
}
