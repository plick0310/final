<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style type="text/css">
.bbs-article .table {
    margin-top: 15px;
}
.bbs-article .table thead tr, .bbs-article .table tbody tr {
    height: 30px;
}
.bbs-article .table thead tr th, .bbs-article .table tbody tr td {
    font-weight: normal;
    border-top: none;
    border-bottom: none;
}
.bbs-article .table thead tr {
    border-top: #d5d5d5 solid 1px;
    border-bottom: #dfdfdf solid 1px;
} 
.bbs-article .table tbody tr {
    border-bottom: #dfdfdf solid 1px;
}
.bbs-article .table i {
    background: #424951;
    display: inline-block;
    margin: 0 7px 0 7px;
    position: relative;
    top: 2px;
    width: 1px;
    height: 13px;    
}
</style>

<div class="bodyFrame2">
    <div class="body-title">
          <h3><span class="glyphicon glyphicon-book"></span> 게시판 </h3>
    </div>
    
    <div class="alert alert-info">
        <i class="glyphicon glyphicon-info-sign"></i> 회원과 자유로이 토론할 수 있는 공간입니다.
    </div>
    
    <div class="table-responsive" style="clear: both;">
        <div class="bbs-article">
            <table class="table">
                 <thead>
                     <tr>
                         <th colspan="2" style="text-align: center;">
                                 제목..
                         </th>
                     </tr>
                <thead>
                 <tbody>
                     <tr>
                         <td style="text-align: left;">
                             이름 : 홍길동
                         </td>
                         <td style="text-align: right;">
                          2015-02-02 10:10 <i></i>
                              조회 : 100
                         </td>
                     </tr>
                     <tr>
                         <td colspan="2" style="height: 230px;">
                              내용 ...
                         </td>
                     </tr>
                     <tr>
                         <td colspan="2">
                              <span style="display: inline-block; min-width: 45px;">이전글</span> :
                              작업중
                         </td>
                     </tr>
                     <tr>
                         <td colspan="2" style="border-bottom: #d5d5d5 solid 1px;">
                              <span style="display: inline-block; min-width: 45px;">다음글</span> :
                              작업중
                         </td>
                     </tr>                                          
                </tbody>
                <tfoot>
                	<tr>
                		<td>
                		    <button type="button" class="btn btn-default btn-sm wbtn">수정</button>
                		    <button type="button" class="btn btn-default btn-sm wbtn">삭제</button>
                		</td>
                		<td align="right">
                		    <button type="button" class="btn btn-default btn-sm wbtn"> 목록으로 </button>
                		</td>
                	</tr>
                </tfoot>
            </table>
       </div>
      
   </div>
</div>