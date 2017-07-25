<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<script type="text/javascript" src="<%=cp%>/resource/se/js/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">
    function sendOk() {
        var f = document.write_form;

    	var str = f.subject.value;
        if(!str) {
            alert("제목을 입력하세요. ");
            f.subject.focus();
            return;
        }

    	str = f.content.value;
        if(!str) {
            alert("내용을 입력하세요. ");
            f.content.focus();
            return;
        }

    	f.action="<%=cp%>/bbs/${mode}";
    		
        f.submit();
    }
    
    function themeList() {
        var bigCategory=$("#bigCategory").val();
        if(bigCategory=="") {
           $("#smallCategory option").each(function() {
              $("#smallCategory option:eq(0)").remove();
           });

           $("#smallCategory").append("<option value=''>:: 중분류 ::</option>");
           return false;
        }
        
        var url="<%=cp%>/community/usedshop/getCategory";
          var query = "parent=" + bigCategory;
          //alert(query);
          $
                .ajax({
                   type : "post",
                   url : url,
                   data : query,
                   dataType : "json",
                   success : function(data) {
                      $("#smallCategory option").each(function() {
                         $("#smallCategory option:eq(0)").remove();
                      });

                      $("#smallCategory").append(
                            "<option value=''>:: 중분류 ::</option>");

                      var cn = "${dto.categoryNum}";
                      var s;
                      for (var idx = 0; idx < data.listSmallCategory.length; idx++) {
                         s = "";
                         if (cn == data.listSmallCategory[idx].categoryNum)
                            s = " selected='selected'";
                         $("#smallCategory")
                               .append(
                                     "<option value='"+data.listSmallCategory[idx].categoryNum+"' " + s +">"
                                           + data.listSmallCategory[idx].catetitle
                                           + "</option>");
                      }
                   },
                   error : function(e) {
                      alert(e.responseText);
                   }
                });
       }
    
    $(document).ready(function() {
		//최상단 체크박스 클릭

		$("#delchk").click(function() {
			//클릭되었으면
			if ($("#delchk").prop("checked")) {
				//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
				$("input[name=del]").val('');
				$("input[name=del]").attr("disabled", true);
				//클릭이 안되있으면
			} else {
				//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
				$("input[name=del]").prop("disabled", false);
			}
		});

	});
    
    $(document).ready(function(){
        $('[data-toggle="tooltip"]').tooltip();   
    });
      
  
 
</script>


<style>
input {
	height: 30px;
	border-radius: 5px; 
	border-style: solid;	
	border: 1px solid #EAEAEA;  
}
textarea {
	border: none;
	border-radius: 5px;
	border: 1px solid #EAEAEA; 
	
}
.clickbtn{
background-color: white;
border-style: solid;
padding: 5px 20px;

margin-right: 10px;
border: 1px solid #EAEAEA;  

}

</style>

<form  name="write_form" id="write_form" enctype="multipart/form-data" onsubmit="return submitContents(this);" method="post" style="margin: 60px auto; width: 900px;">
<div  style="height:50px; font-size: 20px;text-align: center; border-bottom: 1px solid #eee;">
			<span style="font-size: 20px;color:#BDBDBD; font-weight: bold;">
			<span style="font-size: 19px; color: #1abc9c; " class="glyphicon glyphicon-pencil">
			</span>&nbsp;&nbsp;&nbsp;WOOLTARI&nbsp;&nbsp;&nbsp;</span>W R I T E . . .</div>
	<table cellpadding="0" cellspacing="0" id="read_table"
		style="background-color:#F5F5F5; color: #353535; border-top: none;
		box-shadow: 60px 0px 100px -90px #000000, -60px 0px 100px -90px #000000;"class="board_table">
	
		<tbody>
			<tr>
				<th style="width: 100px; ">제목</th>
				<td><input type="text" name="subject" value="${dto.subject }"
					class="subject" maxlength="100" style="width: 450px;" />
				
					
					</td> 
			</tr>
		 
			
			<tr style="border-top: 3px solid #eee">
				<th>카테고리</th>
				<td>
					<select id="bigCategory" class="selectField" onchange="themeList();">
						<option value="">:: 대분류 ::</option>
                           <c:forEach var="vo" items="${listBigCategory}">
                              <option value="${vo.categoryNum}">${vo.subject}</option>
                           </c:forEach>
					</select>
					
						<select  id="smallCategory" class="selectField" name="smcate" style=" margin: 10px 0 0;width: 265px;" >
                           <option value="">:: 중분류 ::</option>
                        </select>
					
					<%-- <small>장소이름&nbsp;&nbsp;</small><input type="text" name="placename" maxlength="13" value="${dto.placename }" 
					style="width: 200px;" />
					<small>영엽시간&nbsp;&nbsp;</small><input type="text" name="ocTime" maxlength="13" value="${dto.ocTime }" 
					style="width: 200px;" />
					<small>&nbsp;&nbsp;&nbsp;&nbsp;지역&nbsp;&nbsp;</small><input type="text" name="region" value="${dto.region }" 
					style="width: 172px;" /> --%>
					
				</td>
			</tr>
			<tr>
				<th><small>가격</small></th>
				<td><input type="text" name="price" value="${dto.address }"
					style="    width: 507px;" />
					
					
					</td>
			</tr>
			
			<tr>
				<th><small>포인트로 판매</small> <input type="checkbox" name="pointchk" value="1"></th>
	 <td> <button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="right" title="포인트판매란?현금과동시에 포인트로도 판매할수있게하여 판매시 포인드를 획득하여 홈페이지에 다양한 서비스를 이용할 수 있습니다.">Tooltip on right</button>
</td>
			</tr> 
			
			<tr>
				<th><small>배송비</small></th>
				<td><input type="text" name="del" value="${dto.address }"
					style="    width: 507px;" />
				
					무료배송<input name="delchk" value="1" id="delchk" type="checkbox">
					</td>
			</tr>
		

			<tr> 
				<td colspan="2">
				<textarea name="content" id="content" style="width:95%; height: 270px;">${dto.content}</textarea>
				</td>
			</tr>

			<tr style="display: none;">
				<th>첨부파일</th>
				<td><input type="file" name="upload" id="file1" style="border: none;">
				</td>
			</tr>

			

		


		</tbody>
	</table>
	
	<div class="read_btnArea">
		<button type="submit" class="clickbtn"">${mode=='update'?'수정완료':'등록하기'}</button>
		<button type="button" onclick="javascript:location.href='<%=cp%>/studyboard/studywhere/list';" class="clickbtn">돌아가기</button>
		  <c:if test="${mode=='update'}">
         	 <input type="hidden" name="num" value="${dto.num}">
        	 <input type="hidden" name="page" value="${page}">
        </c:if>
	</div>
</form>
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "content",
	sSkinURI: "<%=cp%>/resource/se/SmartEditor2Skin.html",	
	htParams : {bUseToolbar : true,
		fOnBeforeUnload : function(){
			//alert("아싸!");
		}
	}, //boolean
	fOnAppLoad : function(){
		//예제 코드
		//oEditors.getById["content"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
	},
	fCreator: "createSEditor2"
});

function pasteHTML() {
	var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
	oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
}

function showHTML() {
	var sHTML = oEditors.getById["content"].getIR();
	alert(sHTML);
}
	
function submitContents(elClickedObj) {
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	
	// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("content").value를 이용해서 처리하면 됩니다.
	
	try {
		// elClickedObj.form.submit();
		return check();
	} catch(e) {}
}

function setDefaultFont() {
	var sDefaultFont = '돋움';
	var nFontSize = 24;
	oEditors.getById["content"].setDefaultFont(sDefaultFont, nFontSize);
}
</script> 