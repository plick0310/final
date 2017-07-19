<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   request.setCharacterEncoding("utf-8");
   String cp=request.getContextPath();
%>

<style>
.thumb {
    float: left;
    left: 0;
    top: 0;
    z-index: 2;
    margin: 0 16px 0 0;
    position: relative;
    width: 82px;
    height: 82px;
}

.section_more {
    position: relative;
    overflow: hidden;
    clear: both;
    padding: 14px 0 0 0;
    font-size: 12px;
    text-align: right;
    zoom: 1;
}

.txt_inline {
    display: inline;
}


</style>

<script type="text/javascript">
$(function(){

	$('.tab_menu li').on('click', 'a', function(){
	        $('.tab_menu li').each(function(index){
	            $(this).removeClass("active").css("background-color", "#eeeeee");
	             $(".tab_menu a").removeClass("active").css("color", "black");
	        });
	            
	            $(this).addClass("active").css("color", "#1abc9c");
	            //$(".tab_cont").hide();
	            var activeTab = $(this).attr("data-tab");
	            $("#" + activeTab).fadeIn();
	            
	             $(this).parent().addClass("active").css("background-color","white");
	        
	            $tab = $(".tab_menu .active");
	            tab = $tab.attr("data-tab");     
	});

});
</script>

<div style="margin-left: 400px; margin-right: 600px;">
	<div>
		<ul class="tab_menu" style="float: left; display: block; text-align: left;">
			<li class="active" style="float: left; position: relative; list-style-type: none; font-family: '굴림',gulim,helvetica,sans-serif;" data-tab="exam" ><a href="#">통합검색</a></li>
			<li style="float: left; position: relative; list-style-type: none; font-family: '굴림',gulim,helvetica,sans-serif"><a href="">스터디</a></li>
			<li style="float: left; position: relative; list-style-type: none; font-family: '굴림',gulim,helvetica,sans-serif"><a href="">홍보</a></li>
		</ul>
	</div>
	
	
			<c:if test="${studyCount!='0' }">
				<div style="clear: both;">스터디</div>
				<c:forEach var="dto" items="${list }">
					<ul>
						<li style="clear: both;">
							<div class="thumb" >
								<img src="<%=cp%>/uploads/member/userImg/${dto.imageFileName}" style="width: 82px; height: 82px;" onerror="this.src='<%=cp%>/resource/images/reviewPhoto/noImage.png'">
							</div>
							<dl style="padding-top: 3px; overflow: hidden; line-height: 19px; display: block;">
								<dt style="display: inline; clear: both; margin-right: 5px; ">스터디명:&nbsp;&nbsp;&nbsp;${dto.studyName }</dt>&nbsp;&nbsp;&nbsp;&nbsp;
								<dd class="txt_inline" style="clear: both; margin: 2px 0 1px; font-size: 12px; line-height: 18px; display: inline;">생성일|${dto.created }</dd>
								<c:if test="${dto.range=='0'}"><dt>[전체공개][${dto.gender }][${dto.recruit }명]</dt></c:if>
								<c:if test="${dto.range=='1'}"><dt>[비공개][${dto.gender }][${dto.recruit }명]</dt></c:if>
								<dd>&nbsp;&nbsp;&nbsp;${dto.study_Info }</dd>
													
								<c:if test="${dto.range=='0' }"><dd><a onclick="location.href='<%=cp%>/study/myStudy/home/${dto.s_num}'">스터디 구경하기</a></dd></c:if>
							</dl>
						</li>
					</ul>
				</c:forEach>
				
				<c:if test="${studyCount>=4 }">
				<div class="section_more"><a onclick="location.href='<%=cp %>/keyword/studySearch?keyword=${keyword }';">더보기</a></div>
				</c:if>
				
				<hr style="width: 100%; background: gray; height: 1px;">
				
			</c:if>	
			
			
			<c:if test="${promoteCount!='0' }">
				<div style="clear: both;">스터디홍보</div>
				<c:forEach var="dto" items="${promoteList }">
					<ul>
						<li style="clear: both;">
							<div class="thumb" >
								<img src="<%=cp%>/uploads/photo/${dto.imageFileName}" style="width: 82px; height: 82px;" onerror="this.src='<%=cp%>/resource/images/reviewPhoto/noImage.png'">
							</div>
							<dl style="padding-top: 3px; overflow: hidden; line-height: 19px; display: block;">
								<dt style="display: inline; clear: both; margin-right: 5px; ">제목:&nbsp;&nbsp;&nbsp;${dto.subject }</dt>&nbsp;&nbsp;&nbsp;&nbsp;
								<dd class="txt_inline" style="clear: both; margin: 2px 0 1px; font-size: 12px; line-height: 18px; display: inline;">작성일|${dto.created }</dd>
								<c:if test="${dto.range=='0'}"><dt>[전체공개][조회수&nbsp;&nbsp;${dto.hitCount }]</dt></c:if>
								<c:if test="${dto.range=='1'}"><dt>[비공개][조회수&nbsp;&nbsp;${dto.hitCount }]</dt></c:if>

								<dd>&nbsp;&nbsp;&nbsp;${dto.subject }</dd>
								
								<c:if test="${dto.range=='0' }"><dd><a onclick="location.href='<%=cp%>/keyword/promote/article?num=${dto.num }'">글 보기</a></dd></c:if>							
								
							</dl>
						</li>
					</ul>
				</c:forEach>
				
				<c:if test="${promoteCount>=4 }">
				<div class="section_more"><a onclick="location.href='<%=cp %>/keyword/promoteSearch?keyword=${keyword }';">더보기</a></div>
				</c:if>
				
				<hr style="width: 100%; background: gray; height: 1px;">
				
			</c:if>	
</div>

