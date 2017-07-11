<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
   String cp=request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/fullcalendar/fullcalendar.min.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/fullcalendar/fullcalendar.print.min.css" media='print' type="text/css">

<script type="text/javascript" src="<%=cp%>/resource/fullcalendar/lib/moment.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/fullcalendar/fullcalendar.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/fullcalendar/locale-all.js"></script>

<script>


$(document).ready(function() {
	var date=new Date();
	var d=date.getDate();
	var m=date.getMonth();
	var y=date.getFullYear();
	
	$('#calendar').fullCalendar({
	    locale:'ko',
	    	
	    header: {
	     	/* left: 'prev,next today myCustomButton', */
	     	left:"",
	        center: 'title'
	        /*,right: 'month,agendaWeek,agendaDay' */
	        
	    },
	    editable:true,
	    allDaySlot:false,
	    selectable: true,  //사용자가 클릭 및 드래그하여 선택을 할 수 있도록
	    selectHelper: true,//사용자가 드래그되는 동안 "자리"이벤트를 그릴 것인지 여부를 지정할 수 있습니다.
	    select: function(start, end, allDay) {
	    	// start, end : moment 객체
			// 일정하나를 선택하는 경우 종일일정인경우 end는 start 보다 1일이 크다.
			//  캘런더에 start<=일정날짜또는시간<end 까지 표시함
			
			// 달력의 빈공간을 클릭하거나 선택할 경우 입력 화면
			
	    	//var endDate=end.format("YYYY-MM-DD");//yyyy-mm-dd 안됨
	    	var startDate=start.format();
			var endDate=end.add("-1","days").format();
	    	
	        createdForm(startDate,endDate);
	    },
	    
	    eventClick: function(calEvent, jsEvent, view){
	    	articleForm(calEvent);
	    },
	    

	    events:[
	    	{
	    		title:"all",
	    		start:new Date(y,m,1)
	    	},
	    	{
	    		title:"gogo",
	    		start:new Date(y,m,d+1)
	    	}
	    ]
	    
	    
	});
});

function createdForm(startDate,endDate){
	var url="<%=cp%>/cal/created";
	var s_num=${s_num};

	var query="startDate="+startDate+"&endDate="+endDate+"&s_num="+s_num;
	
	var userId="${sessionScope.member.userId}";
	if(! userId){
		alert("로그인하세요");
		$("#myModal").modal("hide");
		return;
	} 
	
	
	$.ajax({
		type:"GET"
		,url:url
		,data:query
		//,dataType:"json"  html던질거면 json사용하면 안됨
		,success:function(data){
			$("#myModalBody").html(data);//주소일때는 load/ html일때는 html
	    	$("#myModal").modal("show");
		}
		,error:function(e){
			console.log(e.responseText);
		}		
	});
		
    	
}

function insertBoard(){
	var f=document.calForm;
	
	f.action="<%=cp%>/cal/created";
	f.submit();
}
</script>


<style>

	body {
	    margin-bottom: 40px;
		margin-top: 40px;
		text-align: center;
		font-size: 14px;
		font-family: 'Roboto', sans-serif;
		}
		
	#wrap {
		width: 1100px;
		margin: 0 auto;
		}
		
	#external-events {
		float: left;
		width: 150px;
		padding: 0 10px;
		text-align: left;
		}
		
	#external-events h4 {
		font-size: 16px;
		margin-top: 0;
		padding-top: 1em;
		}
		
	.external-event { /* try to mimick the look of a real event */
		margin: 10px 0;
		padding: 2px 4px;
		background: #3366CC;
		color: #fff;
		font-size: .85em;
		cursor: pointer;
		}
		
	#external-events p {
		margin: 1.5em 0;
		font-size: 11px;
		color: #666;
		}
		
	#external-events p input {
		margin: 0;
		vertical-align: middle;
		}

	#calendar {
/* 		float: right; */
    /*     margin: 0 auto; */
		width: 900px;
		background-color: #FFFFFF;
		  border-radius: 6px;
        box-shadow: 0 1px 2px #C3C3C3;
		-webkit-box-shadow: 0px 0px 21px 2px rgba(0,0,0,0.18);
-moz-box-shadow: 0px 0px 21px 2px rgba(0,0,0,0.18);
box-shadow: 0px 0px 21px 2px rgba(0,0,0,0.18);
		}

</style>


<div id='calendar' style=" width:90%; display: inline-block;"></div> 

<div id='list'></div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
  <div class="modal-dialog">
    <div class="modal-content">
      <div id="myModalBody" class="modal-body" style="height: 300px; "></div>
      <div class="modal-footer" style="margin-top: -5px; height: 45px;">
      	   <button type="button" class="btn btn-default" data-dismiss="modal" style="width: 65px; height: 25px; background: #1abc9c; padding-top: 3px; margin-top: -11px;" onclick="insertBoard();">등록</button>
	       <button type="button" class="btn btn-default" data-dismiss="modal" style="width: 65px; height: 25px; background: #1abc9c; padding-top: 3px; margin-top: -11px;">취소</button>
         
      </div>
    </div>
  </div>
</div>


