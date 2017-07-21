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


dl > dt:FIRST-OF-TYPE {
	color: #1abc9c;
	border-bottom: 1px solid #1abc9c;
}

dl  a{
	color:#1abc9c;
}

</style>


<script type="text/javascript">

function readBoard(num){
	var url="<%=cp%>/keyword/review/article?num="+num;
	$("#myModalBody").load(url);
	$("#myModal").modal("show");
	
};


</script>



<div style="margin: auto; width: 900px;">
	<div style="padding-top: 50px; font-size: 17px; ">
		<table class="tab_menu" style="width:100%; float: left; display: block; text-align: left;  border-bottom: 1px solid #e2e2e2; margin-bottom: 50px; ">
			<tr>
				<td style="height:50px; line-height:50px; border-bottom:2px solid #1abc9c;float: left; position: relative; list-style-type: none; font-family: 'BareunDotum',gulim,helvetica,sans-serif;" data-tab="exam" ><a style="cursor: pointer; color: #1abc9c;"  onclick="location.href='<%=cp%>/keyword/search?keyword=${keyword }'">���հ˻�</a></td>
				<td style="height:50px; line-height:50px; margin-left:30px; float: left; position: relative; list-style-type: none; font-family: 'BareunDotum',gulim,helvetica,sans-serif"><a style="cursor: pointer;" onclick="location.href='<%=cp%>/keyword/studySearch?keyword=${keyword }'">���͵�</a></td>
				<td style="height:50px; line-height:50px; margin-left:30px; float: left; position: relative; list-style-type: none; font-family: 'BareunDotum',gulim,helvetica,sans-serif"><a style="cursor: pointer;" onclick="location.href='<%=cp%>/keyword/promoteSearch?keyword=${keyword }'">ȫ��</a></td>
				<td style="height:50px; line-height:50px; margin-left:30px; float: left; position: relative; list-style-type: none; font-family: 'BareunDotum',gulim,helvetica,sans-serif"><a style="cursor: pointer;" onclick="location.href='<%=cp%>/keyword/reviewSearch?keyword=${keyword }'">����</a></td>
				<td style="height:50px; line-height:50px; margin-left:30px; float: left; position: relative; list-style-type: none; font-family: 'BareunDotum',gulim,helvetica,sans-serif"><a style="cursor: pointer;" onclick="location.href='<%=cp%>/keyword/marketSearch?keyword=${keyword }'">���͵���</a></td>
				<td style="height:50px; line-height:50px; margin-left:30px; float: left; position: relative; list-style-type: none; font-family: 'BareunDotum',gulim,helvetica,sans-serif"><a style="cursor: pointer;" onclick="location.href='<%=cp%>/keyword/whereSearch?keyword=${keyword }'">�������</a></td>
				<td style="height:50px; line-height:50px; margin-left:30px; float: left; position: relative; list-style-type: none; font-family: 'BareunDotum',gulim,helvetica,sans-serif"><a style="cursor: pointer;" onclick="location.href='<%=cp%>/keyword/downloadSearch?keyword=${keyword }'">�ٿ�ε�</a></td>
				<td style="height:50px; line-height:50px; margin-left:30px; float: right; position: relative; width:306px; text-align:right; list-style-type: none; font-family: 'BareunDotum',gulim,helvetica,sans-serif"><a href="#">����</a></td>
			</tr>
		</table>
		
	</div>
	
			<!-- ���͵� -->
			<c:if test="${studyCount!='0' }">
				<div style="clear: both; font-size: 16px; font-family:'BareunDotum'; font-weight: bolder; color: black; margin-bottom: 20px; margin-top: 79px;">���͵�</div>
				<div style="padding-left: 15px; text-overflow: ellipsis;">
				<c:forEach var="dto" items="${list }">
					<ul>
						<li style="clear: both;">
						<c:if test="${dto.imageFileName != null }">
							<div class="thumb" >
							<c:if test="${dto.imageFileName!='' }"><img src="<%=cp%>/uploads/member/userImg/${dto.imageFileName}" style="width: 82px; height: 82px;" onerror="this.src='<%=cp%>/resource/images/reviewPhoto/noImage.png'"></c:if>
							</div>
						</c:if>	
							<dl style="padding-top: 3px; overflow: hidden; line-height: 19px; display: block;">
								<c:if test="${dto.range=='0' }"><dt style="display: inline; clear: both; margin-right: 5px; "><a onclick="location.href='<%=cp%>/study/myStudy/home/${dto.s_num}'" style="cursor: pointer; color: #1abc9c; font-size: 15px; white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">${dto.studyName }</a></dt>&nbsp;&nbsp;</c:if>
								<c:if test="${dto.range=='1' }"><dt style="display: inline; clear: both; margin-right: 5px; "><a style="cursor: pointer; color: #1abc9c; font-size: 15px; white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">${dto.studyName }</a></dt>&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
								<dd class="txt_inline" style="clear: both; margin: 2px 0 1px; font-size: 12px; line-height: 18px; display: inline;">������|${dto.created }</dd>
								<c:if test="${dto.range=='0'}"><dt style="font-size:11px; margin-top: 8px;">[��ü����][${dto.gender }][${dto.recruit }��]</dt></c:if>
								<c:if test="${dto.range=='1'}"><dt style="font-size:11px; margin-top: 8px;">[�����][${dto.gender }][${dto.recruit }��]</dt></c:if>
								<dd style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">&nbsp;&nbsp;&nbsp;${dto.study_Info }</dd>
													
								
							</dl>
						</li>
					</ul>		
				</c:forEach>
				</div>
				<%-- <c:if test="${studyCount>=4 }"> --%>
				<div class="section_more"><a onclick="location.href='<%=cp %>/keyword/studySearch?keyword=${keyword }';" style="cursor: pointer;">������</a></div>
			<%-- 	</c:if> --%>
				
				<hr style="width: 100%; height: 1px; background:#e2e2e2; margin: 0px;">
				
			</c:if>	
			
			
			<!--ȫ���Խ���  -->
			<c:if test="${promoteCount!='0' }">
				<div style="clear: both; font-size: 16px; font-family:'BareunDotum'; font-weight: bolder; color: black; margin-bottom: 20px; margin-top: 35px;">���͵�ȫ��</div>
				<div style="padding-left: 15px;">
				<c:forEach var="dto" items="${promoteList }">
					<ul>
						<li style="clear: both;">
						<c:if test="${dto.imageFileName != null }">
							<div class="thumb" >
								<img src="<%=cp%>/uploads/photo/${dto.imageFileName}" style="width: 82px; height: 82px;" onerror="this.src='<%=cp%>/resource/images/reviewPhoto/noImage.png'">
							</div>
						</c:if>
							<dl style="padding-top: 3px; overflow: hidden; line-height: 19px; display: block;">
								<dt style="display: inline; clear: both; margin-right: 5px; "><a onclick="location.href='<%=cp%>/keyword/promote/article?num=${dto.num }'" style="cursor: pointer; color: #1abc9c; font-size: 15px; white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">${dto.subject }</a>&nbsp;&nbsp;</dt>
								<dd class="txt_inline" style="clear: both; margin: 2px 0 1px; font-size: 12px; line-height: 18px; display: inline;">�ۼ���|${dto.created }</dd>
							<dt style="font-size:11px; margin-top: 8px; white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">[���͵��:${dto.studyName }][��ȸ��&nbsp;&nbsp;${dto.hitCount }]</dt>								
								<dd style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">&nbsp;&nbsp;&nbsp;${dto.content }</dd>																											
							</dl>
						</li>
					</ul>
				</c:forEach>
				</div>
				<%-- <c:if test="${studyCount>=4 }"> --%>
				<div class="section_more"><a onclick="location.href='<%=cp %>/keyword/promoteSearch?keyword=${keyword }';" style="cursor: pointer;">������</a></div>
			<%-- 	</c:if> --%>
				
					<hr style="width: 100%; height: 1px; background:#e2e2e2; margin: 0px;">
				
			</c:if>	
			
			<!--����Խ���  -->
			<c:if test="${reviewCount!='0' }">
				<div style="clear: both; font-size: 16px; font-family:'BareunDotum'; font-weight: bolder; color: black; margin-bottom: 20px; margin-top: 35px;">���͵𸮺�</div>
				<div style="padding-left: 15px;">
				<c:forEach var="dto" items="${reviewList }">
					<ul>
						<li style="clear: both;">
						<c:if test="${dto.imageFileName != null }">
							<div class="thumb" >
								<img src="<%=cp%>/uploads/review/${dto.imageFileName}" style="width: 82px; height: 82px;" onerror="this.src='<%=cp%>/resource/images/reviewPhoto/noImage.png'">
							</div>
						</c:if>	
							<dl style="padding-top: 3px; overflow: hidden; line-height: 19px; display: block;">
								<c:if test="${dto.range=='0'}"><dt style="display: inline; clear: both; margin-right: 5px; "><a onclick="readBoard(${dto.num})" style="cursor: pointer; color: #1abc9c; font-size: 15px; white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">����:&nbsp;${dto.subject }</a></dt></c:if>
								<c:if test="${dto.range=='1'}"><dt style="display: inline; clear: both; margin-right: 5px; "><a onclick="" style="cursor: pointer; color: blue; white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">${dto.subject }</a></dt></c:if>
								<dd class="txt_inline" style="clear: both; margin: 2px 0 1px; font-size: 12px; line-height: 18px; display: inline;">&nbsp;&nbsp;�ۼ���|${dto.created }</dd>
								<c:if test="${dto.range=='0'}"><dt style="font-size:11px; margin-top: 8px;">[��ü����][��ȸ��&nbsp;&nbsp;${dto.hitCount }]</dt></c:if>
								<c:if test="${dto.range=='1'}"><dt style="font-size:11px; margin-top: 8px;">[�����][��ȸ��&nbsp;&nbsp;${dto.hitCount }]</dt></c:if>

								<dd style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">&nbsp;&nbsp;&nbsp;${dto.content }</dd>																															
							</dl>
						</li>
					</ul>
				</c:forEach>
				</div>
				<%-- <c:if test="${studyCount>=4 }"> --%>
				<div class="section_more"><a onclick="location.href='<%=cp %>/keyword/reviewSearch?keyword=${keyword }';" style="cursor: pointer;">������</a></div>
			<%-- 	</c:if> --%>
				
					<hr style="width: 100%; height: 1px; background:#e2e2e2; margin: 0px;">
				
			</c:if>	
			
			
			<!--���͵���  -->
			<c:if test="${studyMarketCount!='0' }">
				<div style="clear: both; font-size: 16px; font-family:'BareunDotum'; font-weight: bolder; color: black; margin-bottom: 20px; margin-top: 35px;">���͵���</div>
				<div style="padding-left: 15px;">
				<c:forEach var="dto" items="${marketList }">
					<ul>
						<li style="clear: both;">
						<c:if test="${dto.urlContent != null }">
							<div class="thumb" >
								<%-- <img style="width: 82px; height: 82px; background-image:url('http://img.youtube.com/vi/${dto.urlContent}/hqdefault.jpg'); background-size: contain;" onerror="this.src='<%=cp%>/resource/images/reviewPhoto/noImage.png'"> --%>
								<img src="http://img.youtube.com/vi/${dto.urlContent}/hqdefault.jpg" style="width: 82px; height: 82px;" onerror="this.src='<%=cp%>/resource/images/reviewPhoto/noImage.png'">
							</div>
						</c:if>	
							<dl style="padding-top: 3px; overflow: hidden; line-height: 19px; display: block;">
								<dt style="display: inline; clear: both; margin-right: 5px; "><a onclick="location.href='<%=cp %>/keyword/studyMarketBoard/article?num=${dto.num }'" style="cursor: pointer; color: #1abc9c; font-size: 15px; white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">${dto.subject }</a></dt>
								<dd class="txt_inline" style="clear: both; margin: 2px 0 1px; font-size: 12px; line-height: 18px; display: inline;">&nbsp;&nbsp;�ۼ���|${dto.created }</dd>
								<dt style="font-size:11px; margin-top: 8px;">[�����:${dto.userId }][��ȸ��&nbsp;&nbsp;${dto.hitCount }]</dt>

								<dd style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">&nbsp;&nbsp;&nbsp;${dto.content }</dd>										
							</dl>
						</li>
					</ul>
				</c:forEach>
				</div>
				<%-- <c:if test="${studyCount>=4 }"> --%>
				<div class="section_more"><a onclick="location.href='<%=cp %>/keyword/marketSearch?keyword=${keyword }';" style="cursor: pointer;">������</a></div>
			<%-- 	</c:if> --%>
				
					<hr style="width: 100%; height: 1px; background:#e2e2e2; margin: 0px;">
				
			</c:if>	
			
			<!--�������  -->
			<c:if test="${studyWhereCount!='0' }">
				<div style="clear: both; font-size: 16px; font-family:'BareunDotum'; font-weight: bolder; color: black; margin-bottom: 20px; margin-top: 35px;">�������</div>
				<div style="padding-left: 15px;">
				<c:forEach var="dto" items="${whereList }">
					<ul>
						<li style="clear: both;">			
							<div class="thumb" >
								<img src="${dto.content }" style="width: 82px; height: 82px;" onerror="this.src='<%=cp%>/resource/images/reviewPhoto/noImage.png'">
							</div>
							<dl style="padding-top: 3px; overflow: hidden; line-height: 19px; display: block;">
								<dt style="display: inline; clear: both; margin-right: 5px; "><a onclick="location.href='<%=cp%>/keyword/studywhere/article?num=${dto.num }'" style="cursor: pointer; color: #1abc9c; font-size: 15px; white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">${dto.subject }</a></dt>
								<dd class="txt_inline" style="clear: both; margin: 2px 0 1px; font-size: 12px; line-height: 18px; display: inline;">&nbsp;&nbsp;�ۼ���|${dto.created }</dd>
								<dt style="font-size:11px; margin-top: 8px;">[�����:${dto.placename }][����:${dto.region }][�����ð�:${dto.ocTime }]</dt>
								<dt style="font-size:11px; margin-top: 8px;">[�ּ�:${dto.address }][��ȭ��ȣ:${dto.tel }]</dt>
								<%-- <dd>&nbsp;&nbsp;&nbsp;${dto.content }</dd> --%>
							</dl>
						</li>
					</ul>
				</c:forEach>
				</div>
				<%-- <c:if test="${studyCount>=4 }"> --%>
				<div class="section_more"><a onclick="location.href='<%=cp %>/keyword/whereSearch?keyword=${keyword }';" style="cursor: pointer;">������</a></div>
			<%-- 	</c:if> --%>
				
					<hr style="width: 100%; height: 1px; background:#e2e2e2; margin: 0px;">
				
			</c:if>	
			
			
			<!--�ٿ�ε�Խ���  -->
			<c:if test="${downloadCount!='0' }">
				<div style="clear: both; font-size: 16px; font-family:'BareunDotum'; font-weight: bolder; color: black; margin-bottom: 20px; margin-top: 35px;">�ٿ�ε�Խ���</div>
				<div style="padding-left: 15px;">
				<c:forEach var="dto" items="${downloadList }">
					<ul>
						<li style="clear: both;">
	
							<dl style="padding-top: 3px; overflow: hidden; line-height: 19px; display: block;">
								<dt style="display: inline; clear: both; margin-right: 5px; "><a onclick="location.href='<%=cp %>/keyword/downloadBoard/article?num=${dto.num }'" style="cursor: pointer; color: #1abc9c; font-size: 15px; white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">${dto.subject }</a></dt>
								<dd class="txt_inline" style="clear: both; margin: 2px 0 1px; font-size: 12px; line-height: 18px; display: inline;">&nbsp;&nbsp;�ۼ���|${dto.created }</dd>


								<dd style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">&nbsp;&nbsp;&nbsp;${dto.content }</dd>
							</dl>
						</li>
					</ul>
				</c:forEach>
				</div>
				<%-- <c:if test="${studyCount>=4 }"> --%>
				<div class="section_more"><a onclick="location.href='<%=cp %>/keyword/downloadSearch?keyword=${keyword }';" style="cursor: pointer;">������</a></div>
			<%-- 	</c:if> --%>
				
					<hr style="width: 100%; height: 1px; background:#e2e2e2; margin: 0px;">
				
			</c:if>	
</div>

<!-- Modal --> 
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
  <div class="modal-dialog">
    <div class="modal-content" style="padding: 15px;">
      <div id="myModalBody" class="modal-body" style="height: 500px; "></div>
      <div class="modal-footer" style="margin-top: -5px;">
      		
         <button type="button" class="btn btn-default" style="width: 65px; height: 30px; background: #1abc9c; padding-top: 3px; padding-left: 13px;" onclick="deleteBoard();">����</button>
       
         <button type="button" class="btn btn-default" data-dismiss="modal" style="width: 65px; height: 30px; background: #1abc9c; padding-top: 3px; padding-left: 7px;">����Ʈ</button>
         <button type="button" class="btn btn-default" style="width: 65px; height: 30px; background: #1abc9c; padding-top: 3px; padding-left: 13px;" onclick="insertStar();">��</button>
      </div>
    </div>
  </div>
</div>
