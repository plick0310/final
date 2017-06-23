<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<script type="text/javascript" src="HuskyEZCreator.js"></script>
<form name="write_form" id="write_form" enctype="multipart/form-data" method="post" style="margin: 60px auto; width: 900px;">

	<table cellpadding="0" cellspacing="0" id="read_table"
		class="board_table">
		<thead>
			<th colspan="2" style="font-size: 18px;text-align: center;">제목입니다</th>
		</thead>
		<tbody>
			<tr>
				<th style="width: 100px; ">제목</th>
				<td><input type="text" name="subject" title="�젣紐�"
					class="subject" maxlength="100" style="width: 450px;" /></td>
			</tr>
			<tr>
				<th>카테고리</th>
				<td><input type="checkbox" value="ww"> <input
					type="checkbox" value="ww"> <input type="checkbox"
					value="ww"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="writer" maxlength="8"
					style="width: 200px;" /></td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td><input type="password" name="password" maxlength="20"
					style="width: 200px;" /></td>
			</tr>

			<tr>
				<th>E-MAIL</th>
				<td><input type="text" name="email" style="width: 300px;" /></td>
			</tr>

			<tr>
				<td colspan="2"><textarea name="ment" id="ment" 
						style="width: 100%; height: 300px;" smarteditor></textarea></td>
			</tr>

			<tr>
				<th>첨부파일</th>
				<td><input type="file" name="file1" id="file1" ><span
					class="___table_sment"
					style="display: inline-block; *display: inline; *zoom: 1; padding-left: 10px; font-size: 11px;">[write_file_byte]</span>
				</td>
			</tr>

			<tr>
				<th>파일이름</th>
				<td>[file1_name] <input type="hidden" name="file1_ed"
					value="[file1_name]"> <input type="checkbox"
					name="file1_del" id="file1_del"><label for="file1_del"></label>
				</td>
			</tr>

		


		</tbody>
	</table>
	<script type="text/javascript">
		oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "ment",
			sSkinURI : "smartEditor/SmartEditor2Skin.html",
			fCreator : "createSEditor2",
			htParams : {
				fOnBeforeUnload : smartEditor_remove_image
			}
		});
	</script>
	<div class="read_btnArea">
		<button>등록하기</button>
		<button>돌아가기</button>
	</div>
</form>