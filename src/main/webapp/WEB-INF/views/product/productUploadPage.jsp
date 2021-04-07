<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/productUpload.css?v23" />
<script type="text/javascript" src="resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="resources/editor/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"></script>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>


<script>


</script>
</head>
<body>
<%@include file="../Include/header.jsp" %>

<div class="main">
	<h1>상품 등록</h1>
</div>

<hr class =" hrClass">
<form name="w_form" method="post" action="productUpload" enctype="multipart/form-data">
<div class="product_name">
		<a>상품 이름</a>
		<input type="text" name="pName" class="pName">
</div>


<div class="product_details">
	<h3>상세 정보</h3>
	<table class="details_table">
	<tr>
	<td colspan="2">카테고리</td>
	</tr>
	<tr>
		<td width="400px">
			<select id="product_category" class="product_category" onchange="category_change(this)" name="category">
			 <option id="select">선택</option>
			 <option value="Outer">Outer</option>
			 <option value="Top">Top</option>
			 <option value="Bottom">Bottom</option>
			 <option value="Acc">Acc</option>
			 <option value="One Piace">One Piace</option>
			</select>
		</td>
		<td width="400px" align="center">
		<select id="outer" class="subCategory" name="categorySub"> 
		<option value="JACKET">JACKET</option>
		<option value="JUMPER">JUMPER</option>
		<option value="CARDIGAN">CARDIGAN</option>
		<option value="COAT">COAT</option>
		<option value="VEST">VEST</option>	
		</select>
		<select id="top" class="subCategory" name="categorySub"> 
		<option value="TEE">TEE</option>
		<option value="KNIT">KNIT</option>
		<option value="SLEEVELESS">SLEEVELESS</option>
		<option value="BLOUSE">BLOUSE</option>
		<option value="HOOD">HOOD</option>	
		<option value="BASIC">BASIC</option>	
		</select>
		<select id="bottom" class="subCategory" name="categorySub"> 
		<option value="MISS BUMBUM">MISS BUMBUM</option>
		<option value="PANTS">PANTS</option>
		<option value="LEGGINGS">LEGGINGS</option>
		<option value="JEANS">JEANS</option>
		<option value="SHORTS">SHORTS</option>	
		<option value="SKIRT">SKIRT</option>	
		</select>
		<select id="onepiace" class="subCategory" name="categorySub"> 
		<option value="DRESS">DRESS</option>
		<option value="JUMP-SUIT">JUMP-SUIT</option>
		</select>
		<select id="acc" class="subCategory" name="categorySub"> 
		<option value="JEWERLY">JEWERLY</option>
		<option value="LINGERIE">LINGERIE</option>
		<option value="HAT">HAT</option>
		</select>
		</td>
	</tr>
	
	<tr>
		<td colspan="2">상품 정보</td>
	</tr>
	<tr>
	<td colspan="2"><textarea class="detail_area" placeholder="간단한 상품 정보" name="character1" ></textarea></td>
	</tr>
	</table>
	
	
</div>

<table class="textureTable">
	<tr>
		<td class="textureTable_ftd">촉감</td>
		<td class="textureTable_std" onclick="tableCheck(this)">
			<input type="radio" value="rough" id="t1" name="touch" class="radioBtn">
			<label for="t1"><a class="radioLabel">까슬함</a></label>
		</td>
		<td class="textureTable_std" onclick="tableCheck(this)">
			<input type="radio" value="middle" id="t2" name="touch" class="radioBtn">
			<label for="t2"><a class="radioLabel">적당함</a></label>
		</td>
		<td class="textureTable_std" onclick="tableCheck(this)">
			<input type="radio" value="soft" id="t3" name="touch" class="radioBtn">
			<label for="t3"><a class="radioLabel">부드러움</a></label>
		</td>
	</tr>
	<tr class="none_tr"></tr>
	<tr>
		<td class="textureTable_ftd">신축성</td>
		<td class="textureTable_std" onclick="tableCheck(this)">
			<input type="radio" value="high" id="t4" name="stretch" class="radioBtn">
			<label for="t4"><a class="radioLabel">좋음</a></label>
		</td>
		<td class="textureTable_std" onclick="tableCheck(this)">
			<input type="radio" value="middle" id="t5" name="stretch" class="radioBtn">
			<label for="t5"><a class="radioLabel">약간</a></label>
		</td>
		<td class="textureTable_std" onclick="tableCheck(this)">
			<input type="radio" value="none" id="t6" name="stretch" class="radioBtn">
			<label for="t6"><a class="radioLabel">없음</a></label>
		</td>
	</tr>
	<tr class="none_tr"></tr>
	<tr>
		<td class="textureTable_ftd">비침</td>
		<td class="textureTable_std" onclick="tableCheck(this)">
			<input type="radio" value="high" id="t7" name="transparent" class="radioBtn">
			<label for="t7"><a class="radioLabel">많이 비침</a></label>
		</td>
		<td class="textureTable_std" onclick="tableCheck(this)">
			<input type="radio" value="middle" id="t8" name="transparent" class="radioBtn">
			<label for="t8"><a class="radioLabel">약간 비침</a></label>
		</td>
		<td class="textureTable_std" onclick="tableCheck(this)">
			<input type="radio" value="none" id="t9" name="transparent" class="radioBtn">
			<label for="t9"><a class="radioLabel">비침 없음</a></label>
		</td>
	</tr>
	<tr class="none_tr"></tr>
	<tr>
		<td class="textureTable_ftd">광택감</td>
		<td class="textureTable_std" onclick="tableCheck(this)">
			<input type="radio" value="high" id="t10" name="gloss" class="radioBtn">
			<label for="t10"><a class="radioLabel">광택 있음</a></label>
		</td>
		<td class="textureTable_std" onclick="tableCheck(this)">
			<input type="radio" value="middle" id="t11" name="gloss" class="radioBtn">
			<label for="t11"><a class="radioLabel">약간 있음</a></label>
		</td>
		<td class="textureTable_std" onclick="tableCheck(this)">
			<input type="radio" value="none" id="t12" name="gloss" class="radioBtn">
			<label for="t12"><a class="radioLabel">광택 없음</a></label>
		</td>
	</tr>
	<tr class="none_tr"></tr>
	<tr>
		<td class="textureTable_ftd">두께감</td>
		<td class="textureTable_std" onclick="tableCheck(this)">
			<input type="radio" value="high" id="t13" name="thickness" class="radioBtn">
			<label for="t13"><a class="radioLabel">두꺼움</a></label>
		</td>
		<td class="textureTable_std" onclick="tableCheck(this)">
			<input type="radio" value="middle" id="t14" name="thickness" class="radioBtn">
			<label for="t14"><a class="radioLabel">적당함</a></label>
		</td>
		<td class="textureTable_std" onclick="tableCheck(this)">
			<input type="radio" value="none" id="t15" name="thickness" class="radioBtn">
			<label for="t15"><a class="radioLabel">얇음</a></label>
		</td>
	</tr>
	<tr class="none_tr"></tr>
	<tr>
		<td class="textureTable_ftd">안감</td>
		<td class="textureTable_std" onclick="tableCheck(this)">
			<input type="radio" value="high" id="t16" name="lining" class="radioBtn">
			<label for="t16"><a class="radioLabel">전체안감</a></label>
		</td>
		<td class="textureTable_std" onclick="tableCheck(this)">
			<input type="radio" value="middle" id="t17" name="lining" class="radioBtn">
			<label for="t17"><a class="radioLabel">부분안감</a></label>
		</td>
		<td class="textureTable_std" onclick="tableCheck(this)">
			<input type="radio" value="none" id="t18" name="lining" class="radioBtn">
			<label for="t18"><a class="radioLabel">안감없음</a></label>
		</td>
	</tr>
</table>




<!--상품등록 div  -->
<div class="product_parent_div" id="product_parent_div">
<h1>세부 옵션</h1>
	<ul class="product_parent_ul" id="product_parent_ul">
		<li class="product_parent_li" id="product_parent_li">
		<!-- 대표상품 -->
			<div class="product_Main">
			
				<div id="product_detail_div"class="product_detail_div">
					<div class="product_detail_div_option">Color : </div>
					<div class="product_detail_div_option">Size : </div>
					<div class="product_detail_div_option">Stock : </div>
					<div class="product_detail_div_option">Price : </div>
				</div>
				<button type="button"onclick="mainOpenThis(this)" class="openBtn" id="openBtn" 
				onmouseover="openOver(this)" onmouseout="mouseOut(this)">펼치기</button>
				<table class="product_table" id="product_table">
					<tr>
						<td class="tdMargin">Color <input type="text" class="inputText" id="detail_color" name="color" autocomplete="off"></td>
						<td>Size  <input type="text" class="inputText" id="detail_size" name="size" autocomplete="off"></td>
					</tr> 
					<tr>
						<td class="tdMargin">Stock <input type="text" class="inputText" id="detail_stock" name="stock" autocomplete="off"></td>
						<td>Price <input type="text" class="inputText" id="detail_price" name="price" autocomplete="off"></td>
					</tr>
				</table>
				
				<table class="size_table" id="size_table">
					<tr class="size_table_first_tr">
						<td>어깨</td>
						<td>가슴</td>
						<td>팔길이</td>
						<td>암홀</td>
						<td>밑단</td>
						<td>총길이</td>
					</tr>
					<tr>
						<td><input type="text" class="size_text" maxlength="5" name="detailSize" autocomplete="off"></td>
						<td><input type="text" class="size_text" maxlength="5" name="detailSize" autocomplete="off"></td>
						<td><input type="text" class="size_text" maxlength="5" name="detailSize" autocomplete="off"></td>
						<td><input type="text" class="size_text" maxlength="5" name="detailSize" autocomplete="off"></td>
						<td><input type="text" class="size_text" maxlength="5" name="detailSize" autocomplete="off"></td>
						<td><input type="text" class="size_text" maxlength="5" name="detailSize" autocomplete="off"></td>
					</tr>
				</table>
				
			</div>
		</li>
	</ul>
</div>

<div class="createBtn_parent">
	<button type="button"class="createBtn" onclick="createDiv()">Option +</button>
</div>



	
	
	
<div class="thumbnail_upload">
<h5>대표사진 업로드</h5>


	<div class="mfile" id="mfile">
		<input type="text" class="upload-name" value="파일명" disabled="disabled" id="disnone">
		<input type="hidden"  id="thumbnail" name="thumbnail">
		
		<label for="ex_filename">업로드</label> 
		<input type="file" id="ex_filename" class="upload-hidden" name="uploadFile">
		<div id="image_container" class="image_container">
			<img   id="thumbnail_imgtest" class="thumbnail_imgtest">
		</div>
	</div>
	
	
	<div class="mfile2" id="mfile2">
		<input type="text" class="upload-name2" value="파일명" disabled="disabled" id="disnone2">
		<input type="hidden"  id="thumbnail2" name="thumbnail">
		
		<label for="ex_filename2">업로드</label> 
		<input type="file" id="ex_filename2" class="upload-hidden2" name="uploadFile">
		<div id="image_container2" class="image_container2">
			<img   id="thumbnail_imgtest2" class="thumbnail_imgtest2">
		</div>
	</div>
	
	
	<div class="mfile3" id="mfile3">
		<input type="text" class="upload-name3" value="파일명" disabled="disabled" id="disnone3">
		<input type="hidden"  id="thumbnail3" name="thumbnail">
		
		<label for="ex_filename3">업로드</label> 
		<input type="file" id="ex_filename3" class="upload-hidden3" name="uploadFile">
		<div id="image_container3" class="image_container3">
			<img   id="thumbnail_imgtest3" class="thumbnail_imgtest3">
		</div>
	</div>
</div>



<div class="thumbnail">
	<h2>대표사진 미리보기</h2>
			<img   id="thumbnail_img" class="thumbnail_img">
</div>


	


<div class="container">
		
		<input type="hidden" name="filepath" value="/editor/upload/" /> 
		<textarea name="content" id="textAreaContent" style="width: 100%" rows="15" cols="80"></textarea>
		<button id="sumbitBtn"class="form-control foode-btn" 
		type="button" onclick="submitContents(this)" onmouseover="startColor(this)">Upload</button>
</div>
</form>
		
		
		
		
		
		
<!-- Naver Smart Editor 2 -->
<script>
  var form = document.w_form;
  var oEditors = [];
  nhn.husky.EZCreator.createInIFrame({
      oAppRef: oEditors,
      elPlaceHolder: "textAreaContent",
      sSkinURI: "resources/editor/SmartEditor2Skin.html",
      fCreator: "createSEditor2"
  });
   
  // submit
  function submitContents(elClickedObj) {
      // 에디터의 내용이 textarea에 적용된다.
      oEditors.getById["textAreaContent"].exec("UPDATE_CONTENTS_FIELD", [ ]);
      var con = document.w_form.content;
      con.value = document.getElementById("textAreaContent").value;
      try {
          elClickedObj.form.submit();
      } catch(e) {
       
      } 
  }
   
  // textArea에 이미지 첨부
  function pasteHTML(filepath){
      var sHTML = '<img src="<%=request.getContextPath()%>/resources/editor/upload/'+ filepath + '">';
	  oEditors.getById["textAreaContent"].exec("PASTE_HTML", [ sHTML ]);
  }
</script>
<!-- Naver Smart Editor 2 END-->

<%@include file="../Include/footer.jsp" %>
<!-- 스마트 에디터 크기를 쉽게늘리기위한 빈공간 -->
<div style="height: 100px;"></div>
<script type="text/javascript" src="resources/js/productUpload.js?ver=14" charset="utf-8"></script>
</body>
</html>