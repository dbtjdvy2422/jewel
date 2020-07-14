<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.standalone.min.css">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.css" rel="stylesheet">
</head>
<script type="text/javascript">

function fsubmit(){
	var form = $('#frm')[0];
	 var formData = new FormData(form);
	 var inum=$('#ITEM_NUM').val();
	 
	 
	var ITEM_TYPE = document.getElementById("ITEM_TYPE").value;
	var ITEM_NAME = document.getElementById("ITEM_NAME").value;
	var ITEM_PRICE = document.getElementById("ITEM_PRICE").value;
	var ITEM_DCP = document.getElementById("ITEM_DCP").value;
	var ITEM_IMAGE1 = document.getElementById("ITEM_IMAGE1").value;
	
	var ITEM_STOCK = document.getElementById("ITEM_STOCK").value;
	
	
	if(ITEM_TYPE==null || ITEM_TYPE==''){
		alert("카테고리 종류를 입력하세요.");
		return false;
	}
	if(ITEM_NAME==null || ITEM_NAME==''){
		alert("상품 이름을 입력하세요.");
		return false;
	}
	if(ITEM_PRICE==null || ITEM_PRICE==''){
		alert("상품 가격을 입력하세요.");
		return false;
	}
	if(ITEM_DCP==null || ITEM_DCP==''){
		alert("할인율을 입력하세요.");
		return false;
	}
	if(ITEM_IMAGE1==null || ITEM_IMAGE1==''){
		alert("사진1 을 입력하세요.");
		return false;
	}

	if(ITEM_STOCK ==null || ITEM_STOCK ==''){
		alert("재고를 입력하세요.");
		return false;
	}
	$.ajax({
	      type : "POST",
	      enctype: 'multipart/form-data',
	      url : '<c:url value="/adminItemUpdate"/>',
	      data:formData,
	      processData: false,
        contentType: false,
        async: false,
	      success : function(data){
	    	
	      }
	      });
	
	
	var count=$('#opt >tbody tr').length
	
	for(var i=0;i<count;i++){
		var OPt=$('#opt >tbody tr').eq(i).find('#OP_TYPE').val();
		var OPv=$('#opt >tbody tr').eq(i).find('#OP_VALUE').val();
		var	OPp=$('#opt >tbody tr').eq(i).find('#OP_PRICE').val();
		
		$.ajax({
		      type : "POST",
		      url : '<c:url value="/insertOption"/>',
		      async: false,
		      data : {ITEM_NUM:inum,OP_TYPE:OPt,OP_VALUE:OPv,OP_PRICE:OPp}, 
		      success : function(data){
		    	 
		    	  
		      }
		      })
	}
	alert("수정완료");
	location.href = "/common/adminItemList";
	
}





$(document).ready(function(){
	$('#summernote').summernote({
	    height: 300,
	    minHeight: null,
	    maxHeight: null,
	    focus: true,
	    callbacks: {
	      onImageUpload: function(files, editor, welEditable) {
	        for (var i = files.length - 1; i >= 0; i--) {
	          sendFile(files[i], this);
	        }
	      }
	    }
	  });
	
	$.ajax({
		type : "POST",
		url : '<c:url value="/selectOptionList"/>',
		data : "ITEM_NUM="+$('#ITEM_NUM').val(),
		async: false,
		success : function(data){
			
			
			$.each(data.list,function(index,items){
				
				var str = '<tr>	<td><input type="text" style="width:100%;" id="OP_TYPE" name="OP_TYPE" value="'+items.OP_TYPE+'"></td><td>	<input type="text" style="width:100%;" id="OP_VALUE" name="OP_VALUE" value="'+items.OP_VALUE+'"> </td><td>	<input type="text" style="width:90%;" id="OP_PRICE" name="OP_PRICE" value="'+items.OP_PRICE+'"><a href="#" class="sbtn" id="delete" name="delete">삭제</a></td></tr>';
				 $("#opt > tbody:last").append(str); 
				 
				 	
			})
					
		}
	});
	$(document).on("click",'.sbtn', function(e){
		 
		 e.preventDefault();
		$(this).parent().parent('tr').remove(); 
		
		}); 
	
	
	$('#add_opt').on("click",function(){
		
	 	
		var str = '<tr>	<td><input type="text" style="width:100%;" id="OP_TYPE" name="OP_TYPE" ></td><td>	<input type="text" id="OP_VALUE" style="width:100%;" name="OP_VALUE"> </td><td>	<input type="text" style="width:90%;" id="OP_PRICE" name="OP_PRICE"><a href="#" class="btn" id="delete" name="delete">삭제</a></td></tr>';
	 $("#opt > tbody:last").append(str);
	 
	});
	
	$(document).on("click",'.btn', function(e){
		 
		 e.preventDefault();
		$(this).parent().parent('tr').remove(); 
		
		}); 	
	

});
function sendFile(file, el) {
	  var form_data = new FormData();
	  form_data.append('file', file);
	  $.ajax({
	    data: form_data,
	    type: "POST",
	    url: "<c:url value='/adminContentImage'/>",
	    cache: false,
	    contentType: false,
	    enctype: 'multipart/form-data',
	    processData: false,
	    success: function(url) {
	    	url=url.trim();
	    	
	      $(el).summernote('editor.insertImage', "<c:url value='/images/item/"+url+"'/>");
	     
	     
	    }
	  });


	}
	
</script>
<body>
	<div class="card card-info">
              <div class="card-header">
                <h3 class="card-title">상품 수정</h3>
              </div>
	<form class="form-horizontal" id="frm" name="frm"  action="<c:url value='/adminItemUpdate'/>" method="post" enctype="multipart/form-data">
		<div class="card-body">
		<div class="form-group  row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">카테고리 종류</label>
                    <div class="col-sm-10">
                      <select class="form-control" id="ITEM_TYPE" name="ITEM_TYPE">
						<option value="N" <c:if test="${map.ITEM_TYPE == 'N'}">selected</c:if>>N</option>
						<option value="R" <c:if test="${map.ITEM_TYPE == 'R'}">selected</c:if>>R</option>
						<option value="E" <c:if test="${map.ITEM_TYPE == 'E'}">selected</c:if>>E</option>
						<option value="W" <c:if test="${map.ITEM_TYPE == 'W'}">selected</c:if>>W</option>
						<option value="C" <c:if test="${map.ITEM_TYPE == 'C'}">selected</c:if>>C</option>
					
					</select>
                    </div>
        </div>
		
        <div class="form-group row">
                    <label for="ITEM_NAME" class="col-sm-2 col-form-label">이름</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="ITEM_NAME" name="ITEM_NAME" value="${map.ITEM_NAME}" placeholder="이름">
                      <input type="hidden" id="ITEM_NUM" name="ITEM_NUM" value="${map.ITEM_NUM}">
                    </div>
        </div>
        <div class="form-group row">
                    <label for="ITEM_PRICE" class="col-sm-2 col-form-label">가격</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="ITEM_PRICE" name="ITEM_PRICE" value="${map.ITEM_PRICE}" placeholder="가격">
                    </div>
        </div>	 	 
		<div class="form-group row">
                    <label for="ITEM_DCP" class="col-sm-2 col-form-label">할인율</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="ITEM_DCP" name="ITEM_DCP" value="${map.ITEM_DCP}" placeholder="할인율">
                    </div>
        </div>
        <div class="form-group row">
                    <label for="ITEM_STOCK" class="col-sm-2 col-form-label">재고</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control"  id="ITEM_STOCK" name="ITEM_STOCK"  value="${map.ITEM_STOCK}" placeholder="재고">
                    </div>
        </div>
         <div class="form-group row">
                    <label for="ITEM_IMAGE1" class="col-sm-2 col-form-label">사진1</label>
                    <div class="input-group">
                      <div class="custom-file">
                        <input type="file" class="custom-file-input" id="ITEM_IMAGE1" name="ITEM_IMAGE1">
                        <label class="custom-file-label" for="ITEM_IMAGE1">Choose file</label>
                      </div>
                      
                    </div>
         </div>
         
         
         			
		<div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">사진 2</label>
                    <textarea class="form-control" rows="10" id="summernote" name="ITEM_IMAGE2">${map.ITEM_IMAGE2}</textarea>
                    
                    
                  </div>
        	
				
		</div>
			
		</form>
		</div>

	
	
	
	

	<table id="opt" style="width:100%;">
		<thead>
		<tr>
		<td align="center"><b>옵션 종류</b></td>
		<td align="center"><b>옵션 값</b></td>
		<td align="center"><b>옵션 가격</b></td>
		</tr>
		</thead>
		<tbody>
		
		</tbody>
		</table>
	<div class="btn-group">
	<input type="button"  class="btn btn-success" onclick="location.href='<c:url value="/adminItemList"/>'" value="목록으로">
	<button type="button"  class="btn btn-warning" id="add_opt">옵션 추가</button>
	<button type="button"  class="btn btn-primary" onclick="fsubmit();">상품 수정</button>
	</div>

	
		
	
	
</body>
</html>