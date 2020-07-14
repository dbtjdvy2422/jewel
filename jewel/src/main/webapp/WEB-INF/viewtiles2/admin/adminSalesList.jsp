<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css">
<script type="text/javascript">
var str='default';
function changeDate(val){
	str=val;
}
</script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.standalone.min.css">


<body>
<h2>���� ��Ȳ</h2>
<table>
<tr>
	<td colspan="2">
		<select name="selectBox" id="selectBox">
    		<option value="��ǰ��" selected>��ǰ��</option>
    		<option value="ī�װ���">ī�װ���</option>
 	 
		</select>
	</td>
</tr>
<tr>
<td>�Ϻ� ����</td><td>���� ����</td>
</tr>
<tr>
<td><input type="text" id="datePicker"></td><td><input type="text" id="monthPicker"></td>
</tr>

</table>

<br/>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.kr.min.js"></script>
<div class="container text=center"  style="width:100%; height:700px;overflow-x: scroll;">
<!-------------------------------------�׷���----------------------------------------->
<canvas id="myChart"></canvas>
<!-------------------------------------�׷���----------------------------------------->
</div>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" 
integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" 
crossorigin="anonymous">
</script>

<script type="text/javascript">
var select=$("#selectBox option:selected").val();
$(function(){
	$('#selectBox').change(function(){
		select=$("#selectBox option:selected").val();
		if($('#monthPicker').val()!="")
			month();
		else
			
			day();
		
	})
	
});





var chartlabels=[];
var chartData=[];
var bgcolor=['rgba(255,99,132,0.2)','rgba(54,162,235,0.2)',
	'rgba(255,206,86,0.2)',
	'rgba(75,192,192,0.2)',
	'rgba(153,102,255,0.2)',
	'rgba(255,159,64,0.2)',];
var dbordercolor=['rgba(255,99,132,1)',
	'rgba(54,162,235,1)',
	'rgba(255,206,86,1)',
	'rgba(75,192,192,1)',
	'rgba(153,102,255,1)',
	'rgba(255,159,64,1)',];
	
var cbgcolor=['rgba(255,99,132,1)','rgba(54,162,235,1)',
	'rgba(255,206,86,1)',
	'rgba(75,192,192,1)',
	'rgba(153,102,255,1)',
	'rgba(255,159,64,1)',];
var cbordercolor=[
	'rgba(255,255,255,1)',
	'rgba(255,255,255,1)',
	'rgba(255,255,255,1)',
	'rgba(255,255,255,1)',
	'rgba(255,255,255,1)',
	'rgba(255,255,255,1)',
];
var a=[];
var b=[];
var lineChartData;
var ctx = document.getElementById("myChart").getContext("2d");
var myChart=new Chart(ctx, {type:'bar',data:[],options:{
	
		scales : {
			yAxes : [{
				ticks :{
					beginAtZero : true,
					stepSize:1,
				}
			}]
		}
	}});



$('#datePicker').datepicker({
	format:"yyyy-mm-dd",
	language:"kr",
	todayHighlight:true,
	autoclose: true
	
}).on('change',function(){

	day();
	
     	
});


function createidChart(){
	
	
	
	
	
    myChart = new Chart(ctx,{
    	type: 'bar',
		data : lineChartData,
		options :{
			maintainAspectRatio: false,
			title:{
			display:true,
			text:'�ϰ� ��ǰ�� ������Ȳ'
			},
			scales : {xAxes: [{
                ticks: {
                    display: false //this will remove only the label
                }
            }],
				yAxes : [{
					ticks :{
						beginAtZero : true,
						stepSize:1,
					}
				}]
			}
		}
	})
}
function createcdChart(){
	
	
	
	
	
    myChart = new Chart(ctx,{
    	type: 'doughnut',
		data : lineChartData,
		options :{
			maintainAspectRatio: false,
			title:{
			display:true,
			text:'�ϰ� ī�װ��� ������Ȳ'
			},
			scales : {
				yAxes : [{display: false,
					ticks :{
						beginAtZero : true,
						stepSize:1,
					}
				}]
			}
		}
	})
}
</script>
<script type="text/javascript">
$('#monthPicker').datepicker({
	format:"yyyy-mm",
	language:"kr",
	viewMode: "months", 
    minViewMode: "months",
	autoclose: true
	
}).on('change',function(){
	
	month();
	
	        	
});
function createimChart(){
	
	
	
	
	
    myChart = new Chart(ctx,{
    	type: 'bar',
		data : lineChartData,
		options :{
			maintainAspectRatio: false,
			title:{
			display:true,
			text:'���� ��ǰ�� ������Ȳ'
			},
			scales : {
				xAxes: [{
	                ticks: {
	                    display: false //this will remove only the label
	                }
	            }],
				yAxes : [{
					ticks :{
						beginAtZero : true,
						stepSize:1,
					}
				}]
			}
		}
	})
}
function day(){
	
	myChart.destroy();
changeDate($('#datePicker').val());
$('#monthPicker').val("");


if(select=='��ǰ��'){
	
	$.ajax({
	      type : "POST",
	      url : '<c:url value="/adminItemDaySaleList"/>',
	      data : "OR_DATE="+$('#datePicker').val(), 
	      success : function(data){
	    	  if(Object.keys(data.list).length==0){
	    		  myChart=new Chart(ctx, {type:'bar',data:[],options:{
	    			  maintainAspectRatio: false,
	    				scales : {
	    					yAxes : [{
	    						ticks :{
	    							beginAtZero : true,
	    							stepSize:1,
	    						}
	    					}]
	    				}
	    			}});
	    		  alert("�����Ͱ� �������� �ʽ��ϴ�.");
	    		 
	    		  return false;
	    	  }
	    	  chartlabels=[];
	    	  chartData=[];
	         $.each(data.list,function(index,items){
	        	 chartlabels.push(items.ITEM_NAME);
	        	 chartData.push(items.CNT);
	        	 
	        	  
	         })
	
	      var j=0;
	       a=[];
	       b=[];
	      for(var i=0;i<chartData.length;i++){
	    	  if(j==6){
	    		  j=0;
	    	  }
	    	  a.push(bgcolor[j]);
	    	  b.push(dbordercolor[j]);
	    	  j++;
	    	  
	    	
	      }
	    
	      lineChartData = {
		labels : chartlabels,
		datasets : [{
				label : "����",
				data : chartData,
				backgroundColor:a,
				
				borderColor:b,
				
				borderWidth:1,

				
				}

			]
	
}
	      	
	         createidChart();
	         
	      }
	      
	   })   
}
else{
	$.ajax({
	      type : "POST",
	      url : '<c:url value="/adminCateDaySaleList"/>',
	      data : "OR_DATE="+$('#datePicker').val(), 
	      success : function(data){
	    	  if(Object.keys(data.list).length==0){
	    		  
	    		  myChart=new Chart(ctx, {type:'doughnut',data:[],options:{
	    			  maintainAspectRatio: false,
	    				scales : {
	    					yAxes : [{display: false,
	    						ticks :{
	    							beginAtZero : true,
	    							stepSize:1,
	    						}
	    					}]
	    				}
	    			}});
	    		  alert("�����Ͱ� �������� �ʽ��ϴ�.");
	    		 
	    		  return false;
	    	  }
	    	  chartlabels=[];
	    	  chartData=[];
	         $.each(data.list,function(index,items){
	        	 chartlabels.push(items.CATEGORY);
	        	 chartData.push(items.CNT);
	        	 
	        	  
	         })
	
	      var j=0;
	         a=[];
		       b=[];
	      for(var i=0;i<chartData.length;i++){
	    	  if(j==6){
	    		  j=0;
	    	  }
	    	  a.push(cbgcolor[j]);
	    	  b.push(cbordercolor[j]);
	    	  j++;
	    	  
	    	
	      }
	    
	      lineChartData = {
		labels : chartlabels,
		datasets : [{
				label : "����",
				data : chartData,
				backgroundColor:a,
				
				borderColor:b,
				
				borderWidth:1,

				
				}

			]
	
}
	      	
	         createcdChart();
	         
	      }
	      
	   })   
	
	
	
	
}

}
function createcmChart(){
	
	
	
	
	
    myChart = new Chart(ctx,{
    	type: 'doughnut',
		data : lineChartData,
		options :{
			maintainAspectRatio: false,
			title:{
			display:true,
			text:'���� ī�װ��� ������Ȳ'
			},
			scales : {
				maintainAspectRatio: false,
				yAxes : [{display: false,
					ticks :{
						beginAtZero : true,
						stepSize:1,
					}
				}]
			}
		}
	})
}

function month(){
	myChart.destroy();
	changeDate($('#monthPicker').val());
	$('#datePicker').val("");
	if(select=='��ǰ��'){
		$.ajax({
		      type : "POST",
		      url : '<c:url value="/adminItemMonthSaleList"/>',
		      data : "OR_DATE="+$('#monthPicker').val(), 
		      success : function(data){
		    	  if(Object.keys(data.list).length==0){
		    		  myChart=new Chart(ctx, {type:'bar',data:[],options:{
		    			  maintainAspectRatio: false,
		    				
		    				scales : {
		    					yAxes : [{
		    						ticks :{
		    							beginAtZero : true,
		    							stepSize:1,
		    						}
		    					}]
		    				}
		    			}});
		    		  alert("�����Ͱ� �������� �ʽ��ϴ�.");
		    		 
		    		  return false;
		    	  }
		    	  chartlabels=[];
		    	  chartData=[];
		         $.each(data.list,function(index,items){
		        	 chartlabels.push(items.ITEM_NAME);
		        	 chartData.push(items.CNT);
		        	 
		        	  
		         })
		    
		      var j=0;
		      a=[];
		      b=[];
		      for(var i=0;i<chartData.length;i++){
		    	  if(j==6){
		    		  j=0;
		    	  }
		    	  a.push(bgcolor[j]);
		    	  b.push(dbordercolor[j]);
		    	  j++;
		    	  
		    	
		      }
		    
		      lineChartData = {
			labels : chartlabels,
			datasets : [{
					label : "����",
					data : chartData,
					backgroundColor:a,
					
					borderColor:b,
					
					borderWidth:1,

					
					}

				]
		
	}
		      	
		         createimChart();
		         
		      }
		      
		   })
	}
	else{
		
		$.ajax({
	      type : "POST",
	      url : '<c:url value="/adminCateMonthSaleList"/>',
	      data : "OR_DATE="+$('#monthPicker').val(), 
	      success : function(data){
	    	  if(Object.keys(data.list).length==0){
	    		  
	    		  myChart=new Chart(ctx, {type:'doughnut',data:[],options:{
	    			  maintainAspectRatio: false,
	    				scales : {
	    					yAxes : [{display: false,
	    						ticks :{
	    							beginAtZero : true,
	    							stepSize:1,
	    						}
	    					}]
	    				}
	    			}});
	    		  alert("�����Ͱ� �������� �ʽ��ϴ�.");
	    		 
	    		  return false;
	    	  }
	    	  chartlabels=[];
	    	  chartData=[];
	         $.each(data.list,function(index,items){
	        	 chartlabels.push(items.CATEGORY);
	        	 chartData.push(items.CNT);
	        	 
	        	  
	         })
	
	      var j=0;
	         a=[];
		       b=[];
	      for(var i=0;i<chartData.length;i++){
	    	  if(j==6){
	    		  j=0;
	    	  }
	    	  a.push(cbgcolor[j]);
	    	  b.push(cbordercolor[j]);
	    	  j++;
	    	  
	    	
	      }
	    
	      lineChartData = {
		labels : chartlabels,
		datasets : [{
				label : "����",
				data : chartData,
				backgroundColor:a,
				
				borderColor:b,
				
				borderWidth:1,

				
				}

			]
	
}
	      	
	         createcmChart();
	         
	      }
	      
	   })   
	
	
	
	

		

	
}
	
	
}	
</script>


</body>
</html>