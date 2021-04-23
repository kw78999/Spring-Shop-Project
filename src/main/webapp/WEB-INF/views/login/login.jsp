<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../Include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<Style>
body{min-width: 1024px;}
.login_form{
width: 600px;
margin: auto;
height: 350px;
font-size: 1.5rem;
font-weight: bold;
position: absolute;
top:100px;
left:20%;
border: 10px solid white;
border-radius: 10px;
color:white;


}
.login_form input{
margin-bottom: 20px;
}
.textfield{
width:95%;
height: 40px;
border: 5px solid white;
outline: 0;
padding-left: 20px;
font-size: 2rem;
}
.login_form_ul{
list-style-type: none;
}
.login_form_ul li{
float: left;	
}
.login_form_div{
width: 150px;
height: 150px;
background-color: red;
}
.login_btn{
width: 45%;
height: 50px;
font-size: 1.1rem;
background-color: white;
border:5px solid white;
border-radius: 15px;
outline: 0;
font-weight: bold;
color:#888;
}
.login_btn:hover{
cursor: pointer;
background-color: #8FBC8F;
color:white;
}
.login_form_submit{
margin-top:20px;
width: 100%;
text-align: center;
}
.loginimg{
width: 100%;
position: absolute;
top:0px;
left:0px;
}
.parentDiv{
margin-top:250px;
position: relative;
margin-bottom: 50%;

}
.none:hover{
color:brown;
cursor: pointer;
}
.snsLogin{
float: left;}
</Style>
<script>
var mql = window.matchMedia("screen and (max-width: 1024px)");

mql.addListener(function(e) {
    if(e.matches) {
	    	document.getElementById('login_form').style.top='10px';
	    	document.getElementById('parentDiv').style.marginBottom='70%';
    	
    } else {
	    	document.getElementById('login_form').style.top='100px';
	    	document.getElementById('parentDiv').style.marginBottom='50%'
    }
});

</script>
</head>
<body>
<div class="parentDiv" id="parentDiv">
	<div class="imgclass">
    <img src="resources/img/loginimg.png" class="loginimg">
    </div>
	<div class="login_form" id="login_form">
		<form action="newLogin" method="POST">
			<label for="id">ID</label><br>
			<input type="text" id="id" name="id"class="textfield" autocomplete="off"><br>
			<label for="pwd">Password</label><br>
			<input  type="password" id="pwd" name="pwd"class="textfield" autocomplete="off">
			<div class="login_form_submit">
				<input type="button" value="JOIN" class="login_btn" onclick="location.href='join'">
				<input type="submit" value="LOGIN" class="login_btn"><br>
				<!-- 네이버 로그인 창으로 이동 -->
				<div id="naver_id_login" class="snsLogin"><a href="${url}">
				네이버</a></div>
				<a class="snsLogin"href=" https://kauth.kakao.com/oauth/authorize?client_id=d8a2ad3890c6df24dde85de4b83f58d4&redirect_uri=http://localhost:8080/controller/kakaoTest&response_type=code">
				<img width="50" src="resources/img/ka.jpg" style="border-radius: 10px;"></a>
				<br><a  onclick="alert('구현되지 않았습니다.')" class="none">Forgot Password?</a>
				</div>
					
		</form>
</div>
</div>
<%@include file="../Include/footer.jsp" %>
</body>
</html>
<script>
var filter = "win16|win32|win64|mac";
if(navigator.platform){
	if(0 > filter.indexOf(navigator.platform.toLowerCase())){
		document.getElementById('login_form').style.top='10px';
		document.getElementById('parentDiv').style.marginBottom='70%';
    } else {
    	document.getElementById('login_form').style.top='100px';
    	document.getElementById('parentDiv').style.marginBottom='50%';
    }	
}
</script>






