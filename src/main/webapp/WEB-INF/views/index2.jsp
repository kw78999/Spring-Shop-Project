<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ShopingMall Index</title>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css" />
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />

<style>
.main_Image{ 
width: 100%;
}
.New_Product{
width: 100%;
margin:auto;
align-content: center;
}
.New_Product h1{
font-size: 4rem;
margin-bottom: 80px;
text-align: center;
}
.product_Ul{
list-style-type: none;
margin: auto;
display: table; 
}
.product_Ul li{
float: left;
margin-right: 20px;
}
.product{
width:320px;
height:540px;
}
.product_img_div{
width: 320px;
height:500px;
overflow: hidden;   
}
.product_img{
width: 320px;
height:500px;
transform:scale(1.0);       
transition: transform .5s; 
}
.product_img:hover{
opacity: 0.85;
cursor:pointer; 
transform:scale(1.2);   
transition: transform .5s; 	
}
.swiper-container {
  width: 100%;
  height: 700px;
}
</style>
<script>
window.addEventListener('load',function(){
	//모든 상품이미지 가져오기
	var imgArray =document.getElementsByClassName('product_img');
	
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
	

</script>





</head>
<body>
<%@include file="Include/header.jsp" %>
<img src="resources/img/indeximg.jpg" class="main_Image">

<div class="New_Product">
<h1>New Product</h1>
	<!-- Slider main container -->
<div class="swiper-container">
  <!-- Additional required wrapper -->
  <div class="swiper-wrapper">
  
  
				<c:forEach items="${list}" var="product" begin="0" end="${fn:length(list)-1}" step="1">
    <!-- Slides -->
    <div class="swiper-slide">
	    <ul class="product_Ul">
						<li>
							<div class="product">
								<div class="product_img_div">
									<img src="resources/editor/upload/${fn:split(product.thumbnail,',')[0]}"  class="product_img"
											onclick="location.href='productDetails?pNum=${product.PNum}'">
									<input type="hidden" value=${product.thumbnail }>
								</div>
									<a>${product.category} > ${product.categorySub }</a><br><a>${product.PName}</a><br><a><b>${product.price}</b></a>
							</div>
						</li>
		</ul>
	</div>
    
				</c:forEach>
	</div>
	
  <!-- If we need navigation buttons -->
  <div class="swiper-button-prev"></div>
  <div class="swiper-button-next"></div>


</div><!-- New_Product -->
<script>
const swiper = new Swiper('.swiper-container', {
	  // Optional parameters
	  direction: 'horizontal',
	 // loop: true,
	  slidesPerView : 4, // 한 슬라이드에 보여줄 갯수
	  spaceBetween : 20, // 슬라이드 사이 여백
	  breakpoints:{
		    1:{slidesPerView:1,
	  			},
		  	768:{slidesPerView:1,
		  		},
		  	900:{slidesPerView:2,
			  	},
			1024:{slidesPerView:3,
				},
			1424:{slidesPerView:4,
				},
			  	
	  },
	  autoplay : {  // 자동 슬라이드 설정 , 비 활성화 시 false
	    	  delay : 3000,   // 시간 설정
	    	  disableOnInteraction : false,  // false로 설정하면 스와이프 후 자동 재생이 비활성화 되지 않음
	    	},
	  
	  // Navigation arrows
	  navigation: {
	    nextEl: '.swiper-button-next',
	    prevEl: '.swiper-button-prev',
	  },
	  
	});
	

</script>








<%@include file="Include/footer.jsp" %>
</body>
</html>