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
			<li class="active" style="float: left; position: relative; list-style-type: none; font-family: '����',gulim,helvetica,sans-serif;" data-tab="exam" ><a href="#">���հ˻�</a></li>
			<li style="float: left; position: relative; list-style-type: none; font-family: '����',gulim,helvetica,sans-serif"><a href="">���͵�</a></li>
			<li style="float: left; position: relative; list-style-type: none; font-family: '����',gulim,helvetica,sans-serif"><a href="">ȫ��</a></li>
		</ul>
	</div>
	
	
			<c:if test="${studyCount!='0' }">
				<div style="clear: both;">���͵�</div>
				<c:forEach var="dto" items="${list }">
					<ul>
						<li style="clear: both;">
							<div class="thumb" >
								<img src="<%=cp%>/uploads/member/userImg/${dto.imageFileName}" style="width: 82px; height: 82px;" onerror="this.src='<%=cp%>/resource/images/reviewPhoto/noImage.png'">
							</div>
							<dl style="padding-top: 3px; overflow: hidden; line-height: 19px; display: block;">
								<dt style="display: inline; clear: both; margin-right: 5px; ">���͵��:&nbsp;&nbsp;&nbsp;${dto.studyName }</dt>&nbsp;&nbsp;&nbsp;&nbsp;
								<dd class="txt_inline" style="clear: both; margin: 2px 0 1px; font-size: 12px; line-height: 18px; display: inline;">������|${dto.created }</dd>
								<c:if test="${dto.range=='0'}"><dt>[��ü����][${dto.gender }][${dto.recruit }��]</dt></c:if>
								<c:if test="${dto.range=='1'}"><dt>[�����][${dto.gender }][${dto.recruit }��]</dt></c:if>
								<dd>&nbsp;&nbsp;&nbsp;${dto.study_Info }</dd>
													
								<c:if test="${dto.range=='0' }"><dd><a onclick="location.href='<%=cp%>/study/myStudy/home/${dto.s_num}'">���͵� �����ϱ�</a></dd></c:if>
							</dl>
						</li>
					</ul>
				</c:forEach>
				
				<c:if test="${studyCount>=4 }">
				<div class="section_more"><a onclick="location.href='<%=cp %>/keyword/studySearch?keyword=${keyword }';">������</a></div>
				</c:if>
				
				<hr style="width: 100%; background: gray; height: 1px;">
				
			</c:if>	
			
			
			<c:if test="${promoteCount!='0' }">
				<div style="clear: both;">���͵�ȫ��</div>
				<c:forEach var="dto" items="${promoteList }">
					<ul>
						<li style="clear: both;">
							<div class="thumb" >
								<img src="<%=cp%>/uploads/photo/${dto.imageFileName}" style="width: 82px; height: 82px;" onerror="this.src='<%=cp%>/resource/images/reviewPhoto/noImage.png'">
							</div>
							<dl style="padding-top: 3px; overflow: hidden; line-height: 19px; display: block;">
								<dt style="display: inline; clear: both; margin-right: 5px; ">����:&nbsp;&nbsp;&nbsp;${dto.subject }</dt>&nbsp;&nbsp;&nbsp;&nbsp;
								<dd class="txt_inline" style="clear: both; margin: 2px 0 1px; font-size: 12px; line-height: 18px; display: inline;">�ۼ���|${dto.created }</dd>
								<c:if test="${dto.range=='0'}"><dt>[��ü����][��ȸ��&nbsp;&nbsp;${dto.hitCount }]</dt></c:if>
								<c:if test="${dto.range=='1'}"><dt>[�����][��ȸ��&nbsp;&nbsp;${dto.hitCount }]</dt></c:if>

								<dd>&nbsp;&nbsp;&nbsp;${dto.subject }</dd>
								
								<c:if test="${dto.range=='0' }"><dd><a onclick="location.href='<%=cp%>/keyword/promote/article?num=${dto.num }'">�� ����</a></dd></c:if>							
								
							</dl>
						</li>
					</ul>
				</c:forEach>
				
				<c:if test="${promoteCount>=4 }">
				<div class="section_more"><a onclick="location.href='<%=cp %>/keyword/promoteSearch?keyword=${keyword }';">������</a></div>
				</c:if>
				
				<hr style="width: 100%; background: gray; height: 1px;">
				
			</c:if>	
</div>

