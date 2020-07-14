<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" type="text/css"/>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript">
$( document ).ready(function() {
	/*
	�̸��� ���� ��ư Ŭ���� �߻��ϴ� �̺�Ʈ
	*/
	$("#emailSend").on("click", function(){
		var email = $("#email1").val()+"@"+$("#email2").val();
		$("#MEM_EMAIL").val(email);
	/* �̸��� �ߺ� üũ �� ���� �߼� �񵿱� ó�� */

		$.ajax({
			type:"GET",
			url : "<c:url value='/login/findPwConfirm'/>",
			data : "MEM_ID=" + $("#MEM_ID").val() + "&MEM_EMAIL=" +$("#MEM_EMAIL").val(),
			success : function(data){
					if(data){
						alert("�Է��Ͻ� ���Ϸ� �ӽú�й�ȣ�� ���� �߽��ϴ�.");
					}else{
						alert("����: ���̵�� �̸����� Ȯ�� ���ּ���!.");
					}
				
			},
			error: function(data){
				alert("������ �߻��߽��ϴ�.");
				return false;
			}
		});
	});
	
});


</script>
<!-- �ε� css -->
<style>
	#mask {  
	  position:absolute;  
	  left:0;
	  top:0;
	  z-index:100;  
	  background-color:#000;  
	  display:none;  
	}
       #loadingImg {
	  position:absolute;
	  left:45%;
	  top:50%;
	  z-index:120;
	}
</style>
<!-- �ε� ������ ��ũ��Ʈ -->
<script>
function wrapWindowByMask(){
	//ȭ���� ���̿� �ʺ� ���Ѵ�.
	var maskHeight = $(document).height();  
	var maskWidth = $(window).width();  
	
	//����ũ�� ���̿� �ʺ� ȭ�� ������ ����� ��ü ȭ���� ä���.
	$('#mask').css({'width':maskWidth,'height':maskHeight});  
	
	//�ִϸ��̼� ȿ�� - �ϴ� 1�ʵ��� ��İ� �ƴٰ� 80% �������� ����.
	//$('#mask').fadeIn(1000);      
	$('#mask').fadeTo("slow",0.6);    
}
/*ȭ����������� �̹���  */
function beforeSend() {
        var width = 0;
        var height = 0;
        var left = 0;
        var top = 0;



        width = 50;
        height = 50;
        top = ( $(window).height() - height ) / 2 + $(window).scrollTop();
        left = ( $(window).width() - width ) / 2 + $(window).scrollLeft();

        if($("#loadingImg").length != 0) {
               $("#loadingImg").css({
                      "top": top+"px",
                      "left": left+"px"
               });
               $("#loadingImg").show();
        }
        else {
               $('body').append('<div id="loadingImg" style="position:absolute; top:' + top + 'px; left:' + left + 'px; width:' + width + 'px; height:' + height + 'px; z-index:9999; filter:alpha(opacity=50); opacity:alpha*0.5; margin:auto; padding:0; "><img src="<c:url value='/resources/icon-img/ajax-loader.gif'/>"></div>');
        }

 }
jQuery(function($) {
	
	/* �ε� �������� */
	$(window).resize(function(){
		var left = ( $(window).width() - 50 ) / 2 + $(window).scrollLeft();
        var top = ( $(window).height() - 50 ) / 2 + $(window).scrollTop();
		var maskHeight = $(document).height();  
		var maskWidth = $(window).width(); 
		$('#mask').css({'width':maskWidth,'height':maskHeight});
		$("#loadingImg").css({
            "top": top+"px",
            "left": left+"px"
     	});
	 });

	$(document).ajaxStart(function(){
		   beforeSend();
		   wrapWindowByMask();
		})
		.ajaxStop(function(){
		   $('#loadingImg').hide();
		   $('#mask').hide();
		});
});
function fclose(){
	location.href="<c:url value='/main/main'/>";
}
</script>

<script type="text/javascript">
$(document).ready(function(){
		$("#email").change(function(){
			$("#email2").val($(this).val());
		});
	});

/* 
����
���
�ݱ�
 */
</script>
</head>
<!-- �ε�����ũ -->
<div id = "mask">

</div>
<body>

<div class="container findpw" style="display: block">
<form class="mb-3" action="<c:url value='/login/findPwConfirm'/>" method="post" id="frm">
	<h1 class="mb-5">��й�ȣ ã��</h1>
	<input type="text" id="MEM_ID" name="MEM_ID" placeholder="���̵�"><br>
	<input type="hidden" id="MEM_EMAIL" name="MEM_EMAIL">
	<input type="text" id="email1"  placeholder="�̸���">
	@
	<input type="text" id="email2"  value="">
	<select id="email">
	<option>�����Է�</option>
	<option>naver.com</option>
	<option>hanmail.net</option>
	<option>gmail.com</option>
	<option>nate.com</option>
	</select>
	<br>
</form>
	<a href="#" class="btn" id="emailSend">ã��</a>
	<a href="#" class="btn" onclick="fclose();">���</a>
</div>

</body>
</html>