<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>	
<meta charset="UTF-8">

<style>
 
body{min-width:530px; }

.index{
font-size: 5rem;
width: 100%;
height: 200px;
text-align: center;
margin-top: 30px;
margin-bottom: 120px;
}
.index_text{
text-decoration: none;
}
.nav{
width: 100%;
height: 60px;
font-size: 2rem;
text-align: right;	

}
.nav_ul{
list-style-type: none;
margin-top: 40px;

}
.nav_ul li{
float: left;
margin-left: 40px;
}
.category{
height: 100px;
float: left; 
width: 100%;
 margin: 0 auto; 
text-align: center;
font-size: 2rem;
}
.category_ul{
list-style-type: none;
display:table;
margin: auto; 
padding:0;
margin-bottom: 20px;
}
.category_ul li{
float: left;
margin-left:0px;
display:inline-block;
 text-align:center;
 width:150px;
}
.category_ul li:hover{
cursor: pointer;
}
.logo{
width:700px;

}
.indexText{
text-decoration: none;
font-weight:700;
color: #5F9EA0;
width: 100px;
}
.indexText:hover{
color:white;
background-color: #5F9EA0;
}
</style>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script>
function out(obj) {
	if(obj.innerHTML=='신제품'){
		obj.innerHTML="New";
	}else if(obj.innerHTML=='아우터'){
		obj.innerHTML="Outer";
	}else if(obj.innerHTML=='상의'){
		obj.innerHTML="Top";
	}else if(obj.innerHTML=='하의'){
		obj.innerHTML="Bottom";
	}else if(obj.innerHTML=='세트'){
		obj.innerHTML="Set";
	}else if(obj.innerHTML=='악세서리'){
		obj.innerHTML="Acc";
	}else if(obj.innerHTML=='원피스'){
		obj.innerHTML="One Piace";
	}
}
function hover(obj) {
	if(obj.innerHTML=='New'){
		obj.innerHTML="신제품";
	}else if(obj.innerHTML=='Outer'){
		obj.innerHTML="아우터";
	}else if(obj.innerHTML=='Top'){
		obj.innerHTML="상의";
	}else if(obj.innerHTML=='Bottom'){
		obj.innerHTML="하의";
	}else if(obj.innerHTML=='Set'){
		obj.innerHTML="세트";
	}else if(obj.innerHTML=='Acc'){
		obj.innerHTML="악세서리";
	}else if(obj.innerHTML=='One Piace'){
		obj.innerHTML="원피스";
	}
}	

</script>
</head>
<body>
<div class="nav">
	<ul class="nav_ul">
	
		<c:if test="${sessionScope.id!=null}">
			<li><a href="logout" class="indexText">로그아웃 </a></li>
		</c:if>
		<c:if test="${sessionScope.id==null}">
			<c:if test="${sessionScope.id!='admin' }">
				<li><a href="login" class="indexText">로그인 </a></li>
				<li><a href="join" class="indexText">회원가입 </a></li>
			</c:if>
		</c:if>
		<c:if test="${sessionScope.id=='admin' }">
			<li><a href="productUploadPage" class="indexText">상품 등록 </a></li>
			<li><a href="productUploadPage" class="indexText"> 관리 </a></li>
		</c:if>
		<c:if test="${sessionScope.id!=null}">
			<c:if test="${sessionScope.id!='admin' }">
				<li class="indexText">Cart</li>
				<li class="indexText">MyPage</li>
			</c:if>
		</c:if>
	</ul>
</div>
<div class="index">
	<a href="index" class="index_text">
	<img src="resources/img/logo.jpg"  class="logo"/>
	</a>
</div>

<div class="category">
		<ul class="category_ul">
			<li  onmouseout="out(this)" onmouseover="hover(this)"class="category_li">New</li>
			<li  onmouseout="out(this)" onmouseover="hover(this)" class="category_li">Outer</li>
			<li  onmouseout="out(this)" onmouseover="hover(this)" class="category_li">Top</li>
			<li  onmouseout="out(this)" onmouseover="hover(this)" class="category_li">Bottom</li>
			<li  onmouseout="out(this)" onmouseover="hover(this)" class="category_li">Acc</li>
			<li  onmouseout="out(this)" onmouseover="hover(this)" class="category_li">One Piace</li>
		</ul>
</div>



</body>
</html>