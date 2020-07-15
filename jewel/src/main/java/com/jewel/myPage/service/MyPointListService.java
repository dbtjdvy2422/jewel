package com.jewel.myPage.service;

import java.util.List;
import java.util.Map;

public interface MyPointListService {
	List<Map<String, Object>> selectMyPointList(Map<String, Object> map) throws Exception;
	int myPointTotal(Map<String,Object> map) throws Exception;
}
