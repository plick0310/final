<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<!-- 
	<style>
		 tr.notice a.subject{ color:#df223d; }
		 a.subject{ font-size:15px; font-weight:bold; color:#373737; }
		 .info{ display:block; padding-top:7px; }
		 .info *{ font-size:12px; color:#666; }
		 .likes{ line-height:23px; position:absolute; top:-8px; right:10px; background:#fff; padding:9px 5px 5px 5px; display:block; width:45px; height:41px; text-align:center; font-size:16px; letter-spacing:-1px; color:#666666; font-weight:bold; }
		 .likes .num{ font-size:18px; color:#1abc9c; font-weight:bold; font-family:tahoma; } 
		 .comment{ display:inline-block; *display:inline; *zoom:1;  padding:5px 7px 7px 7px; margin-left:15px;  color:#1abc9c; font-weight:bold; font-size:15px; line-height:8px; vertical-align:middle; }
		 .settingArea{ position:relative; text-align:right; }
		 .btnArea{ position:relative; text-align:right !important; padding-top:10px;}
		 .btnArea #array_controll_btn{ position:absolute; bottom:0; left:0; }
		
		 .scArea{  margin:0 auto; margin-top:30px; text-align:center; font-size: 0; }
		 .scArea *{ vertical-align:top; margin:0; }
		 .scArea .where{ width:100px; height:36px; background:#595757; border:none; color:#fff; font-size: 15px; }
		 .scArea .where option{ color:#fff; }
		 .scArea .keyword{ padding:3px; width:120px; height:36px; border:1px solid #595757; border-right:none; border-left:none; background:#fff;font-size: 15px; }
		 .scArea .submit,
		 .scArea .cancel{ width:50px; height:36px; border:1px solid #595757; border-left:none; background:#fff; font-weight:bold; }
		 .scArea .submit{ width:40px; background:#fff url(../images/search_btn.jpg) no-repeat center center; font-size:0; cursor:pointer; border-right-color:#595757; }
		 .not_loop_span{ display:block; border-bottom:1px solid #eee; text-align:center; padding:10px; color:#666; }
		 .category{ color:#900; font-weight:bold; }
	</style>
-->

<style>
	.btn {
		background-color: white;
	    border-style: solid;
	    padding: 5px 20px;
	    margin-right: 10px;
	    border: 1px solid #EAEAEA;
	}

</style>
	
	

<script type="text/javascript">
	function searchList() {
		var f=document.searchForm;
		f.action="<%=cp%>/bbs/list";
		f.submit();
	}
</script>

<div class="body-container" style="width: 900px; height: 100%; margin: 60px auto;">
	<div style="height: 50px; font-size: 20px; text-align: center;">
		<span style="font-size: 20px; color: #BDBDBD; font-weight: bold;">
			<span style="font-size: 19px; color: #1abc9c;"
			class="glyphicon glyphicon-list-alt"> </span>&nbsp;&nbsp;&nbsp;WOOLTARI&nbsp;&nbsp;&nbsp;
		</span>Liberty Square
	</div>
    
    <div>
<%-- 		<table style="width: 100%; margin: 0px auto 0px; border-spacing: 0px;">
		   <tr height="35">
		      <td align="left" width="50%">
		          ${dataCount }개(${page}/${total_page } 페이지)
		      </td>
		      <td align="right">
		          &nbsp; <!-- 5개, 10개씩 보기 쿼리 -->
		      </td>
		   </tr> 
		</table> --%>
		
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse; border-top: 1px solid #cccccc;">
<!-- 		  <tr align="center" bgcolor="#eeeeee" height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
		      <th width="60" style="color: #787878; text-align: center;">번호</th>
		      <th style="color: #787878; text-align: center;">제목</th>
		      <th width="100" style="color: #787878; text-align: center;">작성자</th>
		      <th width="80" style="color: #787878; text-align: center;">작성일</th>
		      <th width="60" style="color: #787878; text-align: center;">조회수</th>
		      <th width="50" style="color: #787878; text-align: center; ">추천</th>
		  </tr> --> 
		
		<div>  
			<strong style="font-size: 20px;">
				<span style="color: rgba(183, 183, 183, 0.65); font-size: 20px;"> 
				<i class="glyphicon glyphicon-align-left"
					style="color: #1abc9c; margin-bottom: 20px;"></i>&nbsp;&nbsp;
				</span>자유롭게 작성할 수 있는 공간입니다.
			</strong>
			<span style="float: right; line-height: 40px;">
				${dataCount }개(${page}/${total_page } 페이지)
			</span>
		 </div>
		 
		 <c:forEach var="dto" items="${list }">
		  <tr align="center" bgcolor="#ffffff" height="35"> 
		      <td>${dto.listNum }</td>
		      <td align="left" style="padding-left: 10px; text-align: center; width: 60%">
		           <a href="${articleUrl }&num=${dto.num}">${dto.subject }&nbsp;<span style="color: red;">[${dto.replyCount}]</span></a>
		      </td>
		      <td>${dto.userName }</td>
		      <td>${dto.created }</td>
		      <td>
		      	<span class="glyphicon glyphicon-eye-open"> ${dto.hitCount }</span>
		      </td>
		      <td>
		      	<span class="glyphicon glyphicon-heart-empty"> ${dto.likeCount }</span>
		      </td>
		  </tr>
		</c:forEach>
		</table>
		 
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		   <tr height="35">
			<td align="center">
		        ${paging }
			</td>
		   </tr>
		</table>
		
		<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
		   <tr height="40">
		      <td align="left" width="100">
		          <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/bbs/list';">새로고침</button>
		      </td>
		      <td align="center">
		          <form name="searchForm" action="" method="post">
		            <select name="searchKey" class="selectField" style="padding: 1px 0px 4px;">
		                  <option value="subject">제목</option>
		                  <option value="userName">작성자</option>
		                  <option value="content">내용</option>
		                  <option value="created">등록일</option>
		            </select>
		            <input type="text" name="searchValue" class="boxTF">
		            <button type="button" class="btn" onclick="searchList()">검색</button>
		        </form>
		      </td>
		      <td align="right" width="100">
		          <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/bbs/created';">글올리기</button>
		      </td>
		   </tr>
		</table>
    </div>
</div>