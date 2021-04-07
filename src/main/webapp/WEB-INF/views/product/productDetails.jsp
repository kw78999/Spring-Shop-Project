<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@include file="../Include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 정보</title>
<link rel="stylesheet" media="screen and (max-width: 1024px)" href="resources/css/product_mobile.css?v5" />
<link rel="stylesheet" media="screen and (min-width: 1025px)" href="resources/css/product_desk.css?v11" /></head>
<body onload="init()">
<script>


var sellPrice;
var amount;

function optionChange(obj) {
	money=obj.value.split('$');
	document.getElementById('sellPrice').value = money[1];
	document.getElementById('amount').value=1;
	init();
}
function init () {
	sellPrice = document.getElementById('sellPrice').value;
	amount = document.getElementById('amount').value;
	document.getElementById('sum').value = sellPrice;
	change();
}

function productAdd () {
	hm = document.getElementById('amount');
	sum =document.getElementById('sum');
	hm.value ++ ;

	sum.value = parseInt(hm.value) * sellPrice;
}

function del () {
	hm = document.getElementById('amount');
	sum = document.getElementById('sum');
		if (hm.value > 1) {
			hm.value -- ;
			sum.value = parseInt(hm.value) * sellPrice;
		}
}

function change () {
	hm = document.getElementById('amount');
	sum = document.getElementById('sum');

		if (hm.value < 0) {
			hm.value = 0;
		}
	sum.value = parseInt(hm.value) * sellPrice;
}  




window.addEventListener('load',function(){
	//모든 상품이미지 가져오기
	var imgArray =document.getElementsByClassName('img');
	
	for(var i=0; i<imgArray.length; i++) {
		//상품이미지마다 온로드 시 이벤트
		imgArray[i].onload = function (obj,str) {
			//이미지 소스 스플릿
			var imgSrc = str.split(',');
		    //3번째 이미지 있는지 검사
		    if(imgSrc[2]=="" || imgSrc[2] == null){
		    	if(imgSrc[1]=="" || imgSrc[1] == null){
		    		//이미지 1개만있음 
		    		obj.src='resources/editor/upload/'+imgSrc[0];
		    		
		    	}else{
		    		//이미지가 2개있기때문에 2개만 반복
		    		var idx2 = 0;
		    		
		    		playThumbnail = setInterval(function() {
		    			if(idx2==2){
		    				idx2=0;
		    			}
		    			obj.src = 'resources/editor/upload/'+imgSrc[idx2];
		    			
		    			idx2++;
		    		}, 1500);
		    		
		    	}
			}else{
				//이미지 3개다 있음 3개 반복
				var idx = 0;
				
				playThumbnail = setInterval(function() {
					if(idx==3){
						idx=0;
					}
						console.log(imgSrc[idx]);
						obj.src = 'resources/editor/upload/'+imgSrc[idx];
						
					
					idx++;
				}, 1500);
			}
			//매개변수 이미지 객체,이미지 속성값(hidden으로 가져옴 )
		}(imgArray[i],imgArray[i].nextSibling.nextSibling.value);
		
		
	}
	
});
	
var color=0;
var color2=254;
var color3=2;
//버튼 컬러이벤트 시작
function startColor(obj) {
	if(color==0&&color2==254&&color3==2){
		startInterval = setInterval(function() {
			color++;
			if(color<256){
				var a=255-color/2;
				var b=255-color;
				var c=100+color;
				
				obj.style.color="rgb("+c+","+c+","+c+")";
				obj.style.background="linear-gradient(to right, white, rgba("+a+","+b+",255,0.4))";
			}
			if(color==255){
				clearInterval(startInterval);
				color=0;
				stopColor(obj);
			}
			
			
		}, 1);
	}else{
	}
	
};


//버튼컬러 이벤트 종료
function stopColor(obj) {
	stopInterval = setInterval(function() {
		color2--;
		color3++;
		if(color2!=0){
			var a2=139+color3;
			var c2=250+color3;
			obj.style.color="rgb(216,115,254)";
			obj.style.background="linear-gradient(to right, white, rgba("+a2+","+color3+","+c2+",0.3))";
		}
		if(color2==0){
			clearInterval(stopInterval);
			color3=2;
			color2=254;
		}
	},1);
}

//구매목록에 추가버튼
function addProduct() {
	//옵션 수량등을 가져와서 선택물품에 대입하기
	var option = document.getElementById('optionSelecter');
	var amount = document.getElementById('amount');
	var sum = document.getElementById('sum');
	var optionArr = option.value.split('/');
	var cartDiv = document.createElement("div");
	var delBtn = document.createElement("Button");
	var cartDiv_parent = document.getElementById('cartdiv_parent')
	
	//만약 물품목록에 하나도 없다면 총합계 가격 생성
	if(cartDiv_parent.firstChild==null){
		var sumPrice = document.createElement("div");
		sumPrice.setAttribute('class','sumPrice');
		sumPrice.innerHTML="총 금액 : "+sum.value;
		
		var sdiv = document.getElementById('sumPrice_parent');
		sdiv.appendChild(sumPrice);
	}else{
		//현재 상품목록 불러와서 추가하려는 상품과 비교
		var cartCheck = document.getElementsByClassName('cartDiv');
		var colorSize = optionArr[0]+optionArr[1];
		//만약 컬러와 사이즈가 같다면 동일상품 
		for (var i = 0; i < cartCheck.length; i++) {
			if(cartCheck[i].id==colorSize){
				alert('동일제품 있습니다');
				return;
			}
		}
	}
	
	
	cartDiv.setAttribute("class","cartDiv");
	cartDiv.innerHTML="색상 : "+optionArr[0] +
						"  &nbsp;&nbsp;&nbsp; 사이즈 : "+ optionArr[1] +
						"  &nbsp;&nbsp;&nbsp;&nbsp; 수량 : "+amount.value +"<br>"+
						" 금액 : "+sum.value;
	//색상과 사이즈 id값에 대입한다 (나중에 비교를 위해)
	colorSize = optionArr[0]+optionArr[1];
	cartDiv.setAttribute("id",colorSize);					
						
	delBtn.setAttribute("class","delBtn");
	delBtn.setAttribute("onclick","deleteBtn(this)");
	delBtn.innerHTML="X";
	
	//선택물품 div에 부착
	cartDiv_parent.appendChild(cartDiv);
	cartDiv.appendChild(delBtn);
	 
}



//선택물품 삭제
function deleteBtn(obj) {
	$(obj).parent().remove();
	if(document.getElementById('cartdiv_parent').firstChild==null){
		document.getElementById('sumPrice_parent').firstChild.remove();
	}
}
</script>
<body>
					<!--   	${product }
							${productTexture }
							${oList }-->
<div class ="category_menu">카테고리 > ${product.category} > ${product.categorySub}</div>

<div class="details_main">
	<ul class="details_ul">
	
		<li class="img_li">
			<img  src="resources/editor/upload/${fn:split(product.thumbnail,',')[2]}" class="img">
			<input type="hidden" value=${product.thumbnail }>
		</li>
		<li class="product_li">
			<div class="product_li_div">
				<h3>${product.PName}</h3>
				$  ${product.price} <br>
				<hr class="product_hr"><br>
				적립금  2000  ( 1% )<br><br>
				
				옵션 <select id="optionSelecter"class="optionSelecter" onchange="optionChange(this)">
				<option>${product.color } / ${product.size} / ${product.stock }ea / $${product.price}</option>
				
				<c:forEach items="${oList}" var="option" begin="0" end="${fn:length(oList)}" step="1">
						<option>${option.OColor } / ${option.OSize } / ${option.OStock }ea / $${option.OPrice } </option>
				</c:forEach>
				
				</select><br>
				<hr class="product_hr"><br>
				
				수량 : <input type=hidden name="sellPrice" value="${product.price}" id="sellPrice">
				<input type="text" name="amount" value="1" size="3" onchange="change();" id="amount" class="amount">
				<input type="button" value=" + " onclick="productAdd(this);" class="plusProduct">
				<input type="button" value=" - " onclick="del();" class="minusProduct">
				<br>

				금액 : <input type="text" name="sum" size="11"id="sum" class="sum" value="${product.price }"readonly>원
				<br>
				<button type="button" class="product_btn" 
				onmouseover="startColor(this)" onclick="addProduct()">ADD To Cart</button>
				
				<div id="cartdiv_parent"></div>
				<div id="sumPrice_parent"></div>
				
				<button type="button" class="product_btn" onmouseover="startColor(this)">BUY NOW</button>
			</div>
		</li>
		
	</ul>
</div>
	
	<table class="review_table">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>회원등급</th>
				<th>평점</th>
			</tr>
		</thead>
		<!-- JSTL 반복문 -->
		<tr>
			<td>1</td>		
			<td>테스트 제목입니다. 테스트</td>		
			<td>일반</td>		
			<td>%%%%%%</td>	
		</tr>
		<tr>
			<td>1</td>		
			<td>테스트 제목입니다. 테스트</td>		
			<td>일반</td>		
			<td>%%%%%%</td>	
		</tr>
		<tr>
			<td>1</td>		
			<td>테스트 제목입니다. 테스트</td>		
			<td>일반</td>		
			<td>%%%%%%</td>	
		</tr>
		<tr>
			<td>1</td>		
			<td>테스트 제목입니다. 테스트</td>		
			<td>일반</td>		
			<td>%%%%%%</td>	
		</tr>
	</table>
		<div class="mainContent">
			${product.content}
		
		</div>
	<div class="size">
		<h2>size (cm)</h2>
		<table class="size_table">
			<tr class="size_table_first_tr">
				<td>사이즈</td>
				<td>어깨</td>
				<td>가슴</td>
				<td>팔길이</td>
				<td>암홀</td>
				<td>밑단</td>
				<td>총길이</td>
			</tr>
			<tr>
				<td>Free(100~105)</td>
				<td>55</td>
				<td>67</td>
				<td>60</td>
				<td>20</td>
				<td>43</td>
				<td>66</td>
			</tr>
		</table>
	</div>
					<div class="product_text">
					${product.character1 }
				</div>
	<table class="review_table">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>회원등급</th>
				<th>평점</th>
			</tr>
		</thead>
		<!-- JSTL 반복문 -->
		<tr>
			<td>1</td>		
			<td>테스트 제목입니다. 테스트</td>		
			<td>일반</td>		
			<td>%%%%%%</td>	
		</tr>
		<tr>
			<td>1</td>		
			<td>테스트 제목입니다. 테스트</td>		
			<td>일반</td>		
			<td>%%%%%%</td>	
		</tr>
		<tr>
			<td>1</td>		
			<td>테스트 제목입니다. 테스트</td>		
			<td>일반</td>		
			<td>%%%%%%</td>	
		</tr>
		<tr>
			<td>1</td>		
			<td>테스트 제목입니다. 테스트</td>		
			<td>일반</td>		
			<td>%%%%%%</td>	
		</tr>
	</table>
	<div class="QA">
		Q&A
	</div>




<%@include file="../Include/footer.jsp" %>
</body>
</html>