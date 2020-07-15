<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포인트 조회1</title>
</head>
<script type="text/javascript">
 function numberWithCommas(e) {
	    return e.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
</script>
<style>
.btn-group{
	align:center;
	width:100%;
}
input::-webkit-outer-spin-button,
tbody td{
	font-size:14px;
}
</style>
 <link href="<c:url value='/resources/css/default.css'/>" rel="stylesheet">
<body>
	<table class="table table-hover" style="width:80%; margin-left:10%;" id="myPoint">
		<br><br>
		<h5 style="margin-left:10%;">포인트 조회</h5>
		<colgroup>
			<col width="20%"/>
	        <col width="25%"/>
	        <col width="30%"/>
	        <col width="25%"/>
        </colgroup>
        <br>
        <thead>
        	<tr class="table-primary" style="text-align:center;">
        		<th scope="col">포인트 변동일</th>
        		<th scope="col">적립.차감 포인트</th>
        		<th scope="col">포인트 적립.차감 결과</th>
        		<th scope="col">포인트 적립.차감 사유</th>       		
        	</tr>
        </thead>
        <tbody id="tbody">
        	<c:forEach items="${pointList}" var="point" varStatus="status" >       		
        		<tr align="center" id="row">
        			<td>${point.PO_DATE}</td>
        			<td>${point.PO_POINT}</td>
        			<td>${point.PO_RESULT}</td>
        			<td>${point.PO_WHY}</td>
        		</tr>      		
        	</c:forEach>	        	
        </tbody>            
	</table>
	
	<br><br>
	<div align="center">
		<button type="button" class="btn btn-primary" onclick="location.href='<c:url value='/main/main'/>';">메인으로</button>
	</div>
	<div align="center"class="container pt-5" id="categoryPaging" >
	${myPointListPaing.pagingHTML}
	</div>
</body>
</html>