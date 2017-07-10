<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
   String cp=request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/fullcalendar.css">
<%-- <link rel="stylesheet" href="<%=cp%>/resource/css/fullcalendar.print.css"> --%>
<%-- <script src="<%=cp%>/resource/js/jquery.js"></script> --%>
<script src="<%=cp%>/resource/js/moment.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/js/fullcalendar.js"></script>
<script src="<%=cp%>/resource/js/lang-all.js"></script>


<script>
$(document).ready(function() {
	
	$('#calendar').fullCalendar({
	    lang:'ko',
	
	    	
		customButtons: {
	        myCustomButton: {
	            text: 'custom!',
	            click: function() {
	                alert('clicked the custom button!');
	            },
	     icon: 'right-single-arrow'
	        }
	    },
	    header: {
	        left: 'prev,next today myCustomButton',
	        center: 'title',
	        right: 'month,agendaWeek,agendaDay'
	    }
	    
	    ,
	    buttonIcons: {
	        prev: 'left-single-arrow',
	        next: 'right-single-arrow',
	        prevYear: 'left-double-arrow',
	        nextYear: 'right-double-arrow'
	    }
	    ,
	    dayClick: function(date, jsEvent, view) {

	        alert('Clicked on: ' + date.format());

	        alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);

	        alert('Current view: ' + view.name);

	        // change the day's background color just for fun
	        $(this).css('background-color', 'red');

	    }
	    
	     
	    
	});
});
</script>

<div id='calendar' style="width: 50%; display: inline-block;"></div> 
