<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<style>
.dnu{
border: none;
background: none;
}
</style>

<div  style=" margin: 60px auto; height:50px; font-size: 20px;text-align: center;">
			<span style="font-size: 20px;color:#BDBDBD; font-weight: bold;">
			<span style="font-size: 19px; color: #1abc9c; " class="glyphicon glyphicon-pencil">
			</span>&nbsp;&nbsp;&nbsp;WOOLTARI&nbsp;&nbsp;&nbsp;</span>W R I T E . . .</div>
<table cellpadding="0" cellspacing="0" id="read_table" class="board_table" style="width: 900px; margin: -45px auto 0;">

	<thead>
		<tr>
			<th class="informations">
				제목입니다...
				<span class="inforArea">
					<strong>작성일</strong> [datetime]
					<span class="__dotted"></span>
					<strong>작성자</strong> [writer]
					<span class="__dotted"></span>
					<strong>조회수</strong> [hit]
				</span>
			</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td class="read_contArea">
				<div id="board_memo_area">
					
				</div>
		
				<form name="read_likeAreaForm" class="_read_likesArea" ajaxAction="modules/board/read.likes.submit.php" ajaxType="html">
					<input type="hidden" name="board_id" value="[board_id_value]" />
					<input type="hidden" name="read_idno" value="[read_value]" />
					<input type="hidden" name="mode" value="" />
					<ul class="_read_likesArea" style="border-bottom: 1px solid #eee;">
						<li class="_likes_btn">
							<a href="#" title="">
								13<br/>
								<span class="__count" style="color: #1abc9c;">추천</span>
							</a>
						</li>
						
					</ul>
				</form>
<!-- 				<tr> -->
<!-- 				<td> 이전글</td> -->
<!-- 				</tr> -->
				
<!-- 				<tr> -->
<!-- 				<td>다음글</td> -->
<!-- 				</tr> -->
				<ul>
					
					<li>
						<strong>이전글 :</strong>
					</li>
		
					
					
				</ul>
				<ul>
					
					<li>
						<strong>다음글 :</strong>
					</li>
		
					
					
				</ul>
				
				<ul class="fileBox">
					
					<li>
						<strong>첨부파일</strong>[file1]
					</li>
		
					
					
				</ul>
				
		
				<div class="commentBox">
					<div class="_CALLING_COMMENT"><strong style="font-size: 18px;">
					<span style="font-size: 16px; color: #1abc9c; " class="glyphicon glyphicon-pencil"></span>&nbsp;&nbsp;리플입니다...</strong>
					</div>
					<div class="_CALLING_COMMENT">
					<span class="inforArea">
					<strong>작성일</strong> [datetime]
					<span class="__dotted"></span>
					<strong>작성자</strong> [writer]
					<span class="__dotted"></span>
					<strong>조회수</strong> [hit]
					</span>
					<div style="float: right;">
					<input class="dnu" type="button" value="삭제">
					<input class="dnu" type="button" value="수정">
					</div>
					</div>
					
				</div> 
			</td>
		</tr>
	</tbody>
</table>	
<div class="read_btnArea">

</div>
