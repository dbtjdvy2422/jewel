<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="utf-8">
<meta charset="UTF-8">
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<!-- 부트스트랩 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

 
 <script type="text/javascript">

$(document).ready(function() {
	$("#myOrder").click(function(){
    location.href="<c:url value='/myPage/myOrderList'/>";
	});
	$("#myJJim").click(function(){
	    location.href="<c:url value='/myPage/myJJimList'/>";
	});
	$("#myQnA").click(function(){
	    location.href="<c:url value='/myPage/myQnAList'/>";
	});
	$("#myReview").click(function(){
	    location.href="<c:url value='/myPage/myReviewList'/>";
	});
	$("#modiMember").click(function(){
	    location.href="<c:url value='/myPage/myInfoModify'/>";
	});
	$("#delMember").click(function(){
		if (confirm("정말 탈퇴하시겠습니까??") == true){			 
			 alert("탈퇴되었습니다.");
			 location.href="<c:url value='/myPage/myInfoDelete'/>";
		 }else{   
		     return false;
		 }
	});
	
});
</script>
<style>
.btn-group{
	align:center;
	width:100%;
	
}
.myPageInfo{
	border: 1px solid #e7e7e7;
	font-size: 14px;
	width:80%;
	margin-left:10%;
	margin-right:10%;
}
.myPageInfo .info1{
	border: 1px solid #e7e7e7;
	width: 20%;
	text-align: center;
	height:100px;
	padding-top:20px;
	float:left;
}
.myPageInfo .info2{
	border: 1px solid #e7e7e7;
	width: 40%;
	text-align: left;
	height:100px;
	padding-top:20px;
	padding-left:10px;
	float:left;
}
.myPageInfo .info2 span{
	font-weight: bold;
}
.myPageInfo .info3, .info4 {
	float:left;
	height:100px;
	padding-top:20px;
	padding-left:10px;
	width: 20%;
	text-align: center;
	border: 1px solid #e7e7e7;
	
}

</style>
<br>
 <h3 style="margin-left:10%;">마이페이지</h3>
<!-- 상단박스영역 -->
	<div class="myPageInfo">
	<!-- 상단박스1 -->
		<div class="info1">
			<span style="font-weight: bold;">${myInfo.MEM_NAME}</span>님
			<br>안녕하세요.
		</div>
	<!-- 상단박스2 -->
		<div class="info2">
			<span>${myInfo.MEM_NAME}</span>님은<br>
			<span>[${myInfo.MEM_RANK }]</span>등급입니다.<br>
			적립금:&nbsp;&nbsp;<span style="color: red;">${myInfo.MEM_POINT }</span>원
		</div>
		<div class="info3">
			<span>
				<img src="<c:url value="/images/myPage/iconfinder-basket-4341280_120547.png"/>" style="width:60px">
			</span>
			<span><a href="<c:url value='/myPage/myCart'/>">장바구니</a></span>
		</div>
		<div class="info4">
			<span>
				<img src="<c:url value="/images/myPage/points.png"/>" style="width:60px">
			</span>
			<span><a href="<c:url value='/myPage/myPointList'/>">포인트조회</a></span>
		</div>
		<br>
		<!-- 목록박스 -->
		<div class="btn-group" role="group" aria-label="Basic example">
		  <button type="button" class="btn btn-primary" id="myOrder">주문내역</button>
		  <button type="button" class="btn btn-primary" id="myJJim">찜한상품</button>
		  <button type="button" class="btn btn-primary" id="myQnA">나의Q&A</button>
		  <button type="button" class="btn btn-primary" id="myReview">나의리뷰</button>
		  <button type="button" class="btn btn-primary" id="modiMember">정보수정</button>
		  <button type="button" class="btn btn-primary" id="delMember">회원탈퇴</button>
		</div>
	</div>
	