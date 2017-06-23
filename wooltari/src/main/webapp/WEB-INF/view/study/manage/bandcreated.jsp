<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("utf-8");
	String cp=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

    <!-- Link Swiper's CSS -->
    
    <link rel="stylesheet" href="<%=cp%>/resource/css/swiper.min.css">
    <!-- Demo styles -->
    <style>
    html, body {
        position: relative;
        height: 100%;
    }
    body {
        background: #eee;
        font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
        font-size: 14px;
        color:#000;
        margin: 0;
        padding: 0;
    }
    .swiper-container {
        width: 100%;
        height: 100%;
    }
    .swiper-slide {
        text-align: center;
        font-size: 18px;
        background: #fff;

        /* Center slide text vertically */
        display: -webkit-box;
        display: -ms-flexbox;
        display: -webkit-flex;
        display: flex;
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        -webkit-justify-content: center;
        justify-content: center;
        -webkit-box-align: center;
        -ms-flex-align: center;
        -webkit-align-items: center;
        align-items: center;
    }
    
 .fileBox {
	position: relative
}

.fileBox .study_img {
	display: inline-block;
	width: 190px;
	height: 25px;
}

.fileBox .btn_file {
	display: inline-block;
	width: 80px;
	height: 25px;
	margin-left: 5px;
	border: 1px solid #ccc;
	font-size: 12px;
	background: none;
	text-align: center;
	vertical-align: middle;
	line-height: 25px;
	cursor: pointer
}

.fileBox input[type='file'], .fileBox input[type='button'] {
	position: absolute; /*top:14px; left:202px;*/
	width: 1px;
	height: 1px;
	padding: 0;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0
}   
    
    </style>

</head>
<body>
    <!-- Swiper -->
    <form class="swiper-container"  method="post" enctype="multipart/form-data">
    
        <div class="swiper-wrapper">
            <div class="swiper-slide">
            <table style="width: 50%; margin: 0px auto ; border-spacing: 0px;">
				
				<tr>
					<td width="100" valign="top"
						style="text-align: right; padding-top: 5px;"><label
						style="font-weight: 900;">스터디명</label></td>
					<td style="padding: 0 0 15px 15px;">
						<p style="margin-bottom: 5px;">
							<input type="text" name="study_Name" id="study_Name" value=""
								onchange="study_NameCheck();" style="width: 95%;"
								${mode=="update" ? "readonly='readonly' ":""} maxlength="15"
								class="boxTF" placeholder="15자 이내로 입력해주세요.">
						</p>
						<p class="help-block"></p>
					</td>
				</tr>


				<tr>
					<td width="100" valign="top"
						style="text-align: right; padding-top: 5px;"><label
						style="font-weight: 900;">스터디사진</label></td>
					<td class="fileBox" style="padding: 0 0 15px 15px;">
						<p style="margin-bottom: 5px; border: 1px solid #ccc; width: 250px; height: 200px;">
							스터디이미지</p> <input class="study_img" type="text" name="study_img"
						readonly="readonly" value="${dto.study_img}"> <label
						for="file_upload" class="btn_file">찾아보기</label> <input
						id="file_upload" type="file" name="file_upload">
					</td>
				</tr>

				


				<tr>
					<td width="100" valign="top"
						style="text-align: right; padding-top: 5px;"><label
						style="font-weight: 900;">한줄소개</label></td>
					<td style="padding: 0 0 15px 15px;">
						<p style="margin-bottom: 5px;">
							<textarea rows="4" cols="50" name="study_Info" id="study_Info"
								placeholder="40자 이내로 입력해주세요." onchange="study_InfoCheck();"></textarea>

						</p>
					</td>
				</tr>


			</table>

		</div>
            <div class="swiper-slide">Slide 2</div>
            <div class="swiper-slide">Slide 3</div>
       
        </div>
        <!-- Add Pagination -->
        <div class="swiper-pagination"></div>
        <!-- Add Arrows -->
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
   
</form>



    <!-- Swiper JS -->
    <script src="<%=cp %>/resource/js/swiper.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
    var swiper = new Swiper('.swiper-container', {
        pagination: '.swiper-pagination',
        paginationClickable: true,
        nextButton: '.swiper-button-next',
        prevButton: '.swiper-button-prev',
        spaceBetween: 30
    });
    </script>

</body>
</html>