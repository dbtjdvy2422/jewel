package com.jewel.myPage.controller;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jewel.common.CommandMap;
import com.jewel.myPage.service.MyPointListService;
import com.jewel.paging.MyPointListPaging;


@Controller
public class MyPointController {
	
	@Resource(name="myPointService") 
	private MyPointListService myPointListService;
	
	@Resource(name="myPointListPaging")
	private MyPointListPaging myPointListPaing;

	//포인트 목록 조회
	@RequestMapping(value="/myPage/myPointList")
	public ModelAndView myInfoModifyForm(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("myPointList");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("MEM_ID");
		commandMap.put("MEM_ID", id);
		
		Map<String, Object> map =commandMap.getMap();
		
		String pg=(String) commandMap.get("pg");  
		
		if(map.get("pg")==null|| map.get("pg").equals("")) {
	    	  pg="1";   	  
		}
		
		int show=7;//페이지당 보여줄 상품 개수
    	int block=5;//페이지당 보여줄 페이지개수
    	int endNum = Integer.parseInt(pg)*show;
		int startNum = endNum-(show-1);

		
		commandMap.put("START_NUM", startNum);
		commandMap.put("END_NUM", endNum);
		
    	@SuppressWarnings("unused")
		int totalList =  myPointListService.myPointTotal(map);
    	myPointListPaing.setPath(request.getContextPath());
    	myPointListPaing.setCurrentPage(pg);
    	myPointListPaing.setTotalList(totalList);
    	myPointListPaing.setPageBlock(block);
    	myPointListPaing.setPageSize(show);

    	myPointListPaing.makePagingHTML();
		mv.addObject("myPointListPaing",myPointListPaing);
		
		List<Map<String, Object>> pointList = myPointListService.selectMyPointList(commandMap.getMap());
		mv.addObject("pointList", pointList);
		
		return mv;
	}
	
}   
  