<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<title>QNA</title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/ui.css'/>" /> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<body>
<div class="container">
<table class="board_view">
		<colgroup>
			<col width="15%"/>
			<col width="35%"/>
			<col width="15%"/>
			<col width="35%"/>
		</colgroup>
		
		<tbody>
			<tr>
				<th scope="row">글 번호</th>
				<td>${map.ET_NUM }</td>
				<th scope="row">이벤트 기간</th>
				<td>${map.ET_SD }~${map.ET_FD }</td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td colspan="3">${map.ET_TITLE }</td>
			</tr>
			<tr>
				<td colspan="4">${map.ET_CONTENT }</td>
			</tr>
		</tbody>
	</table>
	<br/>
	<a href="<c:url value='/event/eventList'/>" class="btn1" id="list">목록으로</a>
</div>
</body>
</html>