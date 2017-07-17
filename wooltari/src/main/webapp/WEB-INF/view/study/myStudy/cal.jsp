<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
   String cp=request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/fullcalendar/fullcalendar.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/fullcalendar/fullcalendar.print.css" media='print' type="text/css">


<script type="text/javascript" src="<%=cp%>/resource/fullcalendar/lib/moment.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/fullcalendar/fullcalendar.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/fullcalendar/locale-all.js"></script>

<script>
	

	//리스트형식출력
	var month="";
	$(function(){
		listPage(1);
	});
	
	function listPage(page) {
		var url="<%=cp%>/study/myStudy/${s_num}/calender/list";

		if(month=="") {
			var date=new Date();
		    month=date.getMonth()+1;
			
			if (month < 10) {
			    month = "0" + month;
		    }
		}
		
		var query="month="+month+"&pageNo="+page;
			
			$.ajax({
				type:"post"
				,url:url
				,data:query
				,success:function(data){
		
					$("#listCalendar").html(data);
				}
				,error:function(e){
					console.log(e.responseText);
				}
			
				
			});
	}	


$(document).ready(function() {
		var date=new Date();
		var d=date.getDate();
		var m=date.getMonth();
		var y=date.getFullYear();
		
	$('#calendar').fullCalendar({
	    locale:'en',	//언어설정
	    height: 450,	
	//    header: {
	     	/* left: 'prev ,next today myCustomButton ',
	     	left:"", */
	  //      center: 'title',
	    //    left:'prev',
	      //  right:'next'
	        /*,right: 'month,agendaWeek,agendaDay' */
	        
	   // },
	    
	    header: {
	     	left: 'prev ,next today myCustomButton ',
	        center: 'title', 
	        right: 'month,agendaWeek,agendaDay'
	        
	    },
	    
	    editable:false,
	    allDaySlot:false,
	    selectable: true,  //사용자가 클릭 및 드래그하여 선택을 할 수 있도록
	    selectHelper: true,//사용자가 드래그되는 동안 "자리"이벤트를 그릴 것인지 여부를 지정할 수 있습니다.
	    select: function(start, end, allDay) {
	    	// start, end : moment 객체
			// 일정하나를 선택하는 경우 종일일정인경우 end는 start 보다 1일이 크다.
			//  캘런더에 start<=일정날짜또는시간<end 까지 표시함
			
			// 달력의 빈공간을 클릭하거나 선택할 경우 입력 화면
			
	    	//var endDate=end.format("YYYY-MM-DD");//yyyy-mm-dd 안됨
	    	var sdate=start.format();
			var edate=end.add("-1","days").format();
	    	
	        createdForm(sdate,edate);
	    }
	    /* events:[
	    	{
	    		title:"all",
	    		start:new Date(y,m,1)
	    	},
	    	{
	    		title:"gogo",
	    		start:new Date(y,m,d+1),
	    		end:new Date(y,m+1,d+3)
	    	}
	    ]  */
	    
	    ,events: function(start, end, timezone, callback){
			// 캘린더가 처음 실행되거나 월이 변경되면
			var startDay=start.format("YYYY-MM-DD");
			var endDay=end.add("-1","days").format("YYYY-MM-DD");
			
			
			var url="<%=cp%>/study/myStudy/${s_num}/calender/cal";
			var query="start="+startDay+"&end="+endDay;

			$.ajax({
			    url: url,
			    data:query,
			    dataType: 'json',
			    success: function(data, text, request) {
			    	var events = eval(data.list);
			        callback(events);
			    },
			    error:function(e){
			    	console.log(e.responseText);
			    }
			});
		}    
		});
	
	//이전 달 버튼 클릭
	 $("button.fc-prev-button").click(function() {
         var date = jQuery("#calendar").fullCalendar("getDate");
         convertDate(date);
  
     });

     // 오른쪽 버튼을 클릭하였을 경우
     $("button.fc-next-button").click(function() {
         var date = jQuery("#calendar").fullCalendar("getDate");
         convertDate(date);
     });
	
});

	// 받은 날짜값을 date 형태로 형변환 해주어야 한다.
    function convertDate(date) {
        var date = new Date(date);
        /* alert(date.yyyymmdd()); */
        month=date.yyyymmdd();
        
        listPage(1);
       
    }

    // 받은 날짜값을 YYYY-MM-DD 형태로 출력하기위한 함수.
    Date.prototype.yyyymmdd = function() {
        var yyyy = this.getFullYear().toString();
        var mm = (this.getMonth() + 1).toString();
        var dd = this.getDate().toString();
        /* return yyyy + "-" + (mm[1] ? mm : "0" + mm[0]) + "-" + (dd[1] ? dd : "0" + dd[0]); */
        return (mm[1] ? mm : "0" + mm[0]);// month만 출력
    }

    

	

function createdForm(sdate,edate){

	var url="<%=cp%>/study/myStudy/${s_num}/calender/created";

	var s_num=${s_num};

	var query="sdate="+sdate+"&edate="+edate+"&s_num="+s_num;
	
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
	var url="<%=cp%>/study/myStudy/${s_num}/calender/created";
	var formData=$("#calForm").serialize();	//serialize : form의 정보를 data1=? & data2=? 의 식으로 받아옴

	$.ajax({
		type:"post"
		,url:url
		,data:formData
		,dataType:"json"
		,success:function(data){
			var month=data.month;
			if(data.state=="true"){
				 $("#calendar").fullCalendar("refetchEvents");//새로고침
				listPage(1);
	
			}else{
				alert("일정등록에 실패하였습니다");
			}
		}
		,error:function(e){
			console.log(e.responseText);
		}
	});

}

function deleteBoard(num,page){
	
	if(!confirm("삭제하시겠습니까?")){
		return;
	}
	
	var query="num="+num+"&pageNo="+page;
	var url="<%=cp%>/study/myStudy/${s_num}/calender/delete";
	
	$.ajax({
		type:"post"
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data){
			if(data.state=="true"){
				listPage(data.page);
				  $("#calendar").fullCalendar("refetchEvents");//새로고침

			}else{
				alert("삭제에 실패하였습니다");
			}
		}
		,error:function(data){
			console.log(e.responseText);
		}
	});
}

</script>


<style>

	#listCalendar {
	    margin-bottom: 40px;
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
/* h2{
font-size: 20px;
padding-top: 15px;
color:#1abc9c;
} */


</style>


<div id='calendar' style=" width:95%; float: left; "></div> 

<div id='listCalendar' style="width:95%;"></div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"  >
  <div class="modal-dialog">
    <div class="modal-content" style="width: 500px; margin-top: 250px; margin-left: 40px;">
      <div id="myModalBody" class="modal-body" style="height: 400px; "></div>
      <div class="modal-footer" style="margin-top: -5px; height: 45px;">
      	   <button type="button" class="btn btn-default" data-dismiss="modal" style="width: 65px; height: 25px; background: #1abc9c; padding-top: 3px; margin-top: -11px;" onclick="insertBoard();">등록</button>
	       <button type="button" class="btn btn-default" data-dismiss="modal" style="width: 65px; height: 25px; background: #1abc9c; padding-top: 3px; margin-top: -11px;">취소</button>
         
      </div>
    </div>
  </div>
</div>


