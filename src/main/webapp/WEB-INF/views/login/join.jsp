<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../Include/header.jsp" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<meta charset="UTF-8">
<title>Join</title>	
<style>


.join{
width: 100%;
text-align: center;
}
.join ul{
list-style-type: none;
}
.joinTable{
box-shadow: 10px 10px 10px 10px gray;
width: 850px;
height: 100%;
margin: auto;
border: 2px solid black;
border-radius: 20px;
}
td{
border-spacing: 0px;
}
.signInput{
height: 60px;
}
.joinName{
text-align: left;
padding-left: 30px;
width: 250px;
}
.signInput{
width: 300px;
height: 40px;
font-size: 2rem;
}
.signInput_3{
width: 120px;
height: 40px;
font-size: 2rem;
}
.signInput_select{
width: 80px;
height: 47px;
margin-left: 5px;
margin-right: 10px;
font-size: 2rem;
}
.join_single_form{
text-align: left;
padding: 30px;
}
.signInput_email{
width: 190px;
height: 40px;
font-size: 2rem;
}
.signInput_email_select{
width:200px;
height: 40px;
font-size: 2rem;
}
.zipCode{
width: 420px;
height: 40px;
font-size: 2rem;
}
.zipbtn{
width: 150px;
height: 40px;
font-size: 1.7rem;
background-color: white;
border: 3px solid #5F9EA0;

}
.zipbtn:hover{
background-color: #5F9EA0;
color:white;
cursor: pointer;
}
.divtr td{
height: 50px;
border-bottom: 5px solid #5F9EA0;
}
.submit{
border-radius: 100px;
background-color:white;
color:silver;
width: 300px;
height: 80px;
border:10px solid #5F9EA0;
font-size: 2rem;
outline: 0;
}
.submit:hover{
color:#5F9EA0;
font-weight: bold;
cursor: pointer;
}
input[type=text]{
border: 2px solid black;
}

input[type=password]{
border: 2px solid black;
}
</style>
</head>
<body>
<hr style="width: 80%;margin-bottom: 100px;">
<div class="join">
<form action="newJoin" method="post" name="joinfrm">
	
	<table class="joinTable" id="joinTable">
		<tr>
		<td class="joinName"><span>아이디</span></td>
		<td class="join_single_form"><input type="text" name="id" class="signInput" autocomplete="off">
		</tr>
		<tr class="divtr">
		<td colspan="2">
		<div id="idc" class="cdiv"></div></td>
		</tr>
		<tr>
		<td class="joinName">비밀번호</td>
		<td class="join_single_form"><input type="password" name="pwd" class="signInput" onblur="pwCheck()">
		</tr>
		<tr class="divtr">
		<td colspan="2">
		<div id="pw1" class="cdiv"></div></td>
		</tr>
		<tr>
		<td class="joinName">비밀번호 확인</td>
		<td class="join_single_form"><input type="password" name="pwd2" class="signInput" onblur="pwCheck2()">
		</tr>
		<tr class="divtr">
		<td colspan="2">
		<div id="pw2" class="cdiv"></div></td>
		</tr>
		<tr>
		<td class="joinName">이름</td>
		<td class="join_single_form"><input type="text" name="name" class="signInput" autocomplete="off" onblur="nameCheck()">
		</tr>
		<tr class="divtr">
		<td colspan="2">
		<div id="ndiv" class="cdiv"></div>
		</td>
		</tr>
		<tr>
		<td class="joinName">생년월일</td>
		<td class="join_single_form"><input type="text" name="birth1" class="signInput_3" placeholder="년" autocomplete="off" onblur="yyyyCheck()" maxlength="4">
		<select name="birth2" class="signInput_select" onblur="mmCheck()">
		<option value="1">1월<option value="2">2월<option value="3">3월<option value="4">4월<option value="5">5월<option value="6">6월
		<option value="7">7월<option value="8">8월<option value="9">9월<option value="10">10월<option value="11">11월<option value="12">12월
		</select><input type="text" name="birth3" class="signInput_3" placeholder="일" autocomplete="off" onblur="ddCheck()" maxlength="2">
		</tr>
		<tr class="divtr">
		<td colspan="2">
		<div id="bdiv" class="cdiv"></div>
		</td>
		</tr>
		<tr>
		<td class="joinName">주소</td>
		<td class="join_single_form">
		<input type="text"  placeholder="우편번호" id="zip1" class="zipCode" name="zip1">
		<button type="button" onclick="execPostcode()" class="zipbtn">주소 찾기</button><br>
		<input type="text"  placeholder="주소" id="zip2" class="zipCode" name="zip2"><br>
		<input type="text" placeholder="상세 주소" id="zip3" class="zipCode" onblur="zipCheck()" name="zip3">
		</tr>
		<tr class="divtr">
		<td colspan="2">
		<div id="zdiv" class="cdiv"></div>
		</td>	
		</tr>
		<tr>
		<td class="joinName">이메일</td>
		<td class="join_single_form"><input type="text" id="email" name="email"class="signInput_email"  autocomplete="off" onblur="emailCheck()" maxlength="15">
		@ <select name="emailSelect" class="signInput_email_select">
		 <option value="gmail.com">gmail.com
		 <option value="naver.com">naver.com
		 <option value="daum.com">daum.com
		 </select>
		</tr>
		<tr class="divtr">
		<td colspan="2">
		 <div id="ediv" class="cdiv"></div>
		</td>
		</tr>
		<tr>
		<td class="joinName">핸드폰</td>
		<td class="join_single_form"><input type="text" class="signInput_3" value="010" disabled="disabled"> -
		<input type="text" class="signInput_3" onblur="phoneCheck()" name="phone1" maxlength="4"> - 
		<input type="text" class="signInput_3" onblur="phoneCheck2()" name="phone2" maxlength="4">
		</tr>
		<tr class="divtr">
		<td colspan="2">
		<div id="pndiv" class="cdiv"></div>
		</td>
		</tr>
		<tr>
		<td colspan="2" height="100px">
		<input type="button" value="회원가입" onclick="check()" class="submit">
		
		</td>
		</tr>
		
	</table>
</form>

<script type="text/javascript" src="resources/js/loginCheck.js" charset="utf-8"></script>
</div>
<%@include file="../Include/footer.jsp" %>


</body>
</html>
<script>
var filter = "win16|win32|win64|mac";
if(navigator.platform){
	if(0 > filter.indexOf(navigator.platform.toLowerCase())){
		var joinName = document.getElementsByClassName('joinName');
		
		for (var i = 0; i < joinName.length; i++) {
			joinName[i].style.fontSize='2.5rem';
		}
			document.getElementById('joinTable').style.width='90%';
    } else {
		var joinName = document.getElementsByClassName('joinName');
		
		for (var i = 0; i < joinName.length; i++) {
			joinName[i].style.fontSize='1.7rem';
		}
		document.getElementById('joinTable').style.width='850px';
    }	
}
</script>