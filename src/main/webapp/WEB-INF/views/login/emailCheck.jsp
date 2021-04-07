<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../Include/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Email 인증</title>
<style type="text/css">
.emailCheck{
width: 1000px;
height: 400px;
text-align: center;
position:absolute;
top: 500px;
left:300px;
border: 50px solid white;
border-radius: 500px;
font-size: 2rem;

}
.CheckText{
width: 300px;
height: 50px;
}
.joinCode_btn{
width: 100px;
height: 50px;
}
.video{
width: 100%;
margin: auto;
border-radius:100px; 
}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>

	
var flag=1;

function test() {

	var code=$('input[name=code]').val();
	//시간 타이머가 남아있다면 ajax 접근
	if(flag==1){
		$.ajax({
			url:'emailJoin?code='+code,
			type:'get',
			success:function(data){
				if(data==0){
					alert("시간초과");  //세션이 소멸되어 시간초과
				}else if(data==1){
					alert("승인");
					location.href="emailCertify?id=${memberId}";
				}else{
					alert("코드가 틀립니다.");
				}
			}
		})
		//타이머 끝난다면 자바스크립트 레벨에서 차단
	}else{
		alert("시간초과");
		
	}
		 
		
		
} 
 

var SetTime = 300;      // 최초 설정 시간(기본 : 초)
function msg_time() {   // 1초씩 카운트      
    m = Math.floor(SetTime / 60) + " : " + (SetTime % 60) + ""; // 남은 시간 계산         
    var msg = "<font color='brwon'>" + m + "</font> ";  
    document.all.ViewTimer.innerHTML = msg;     // div 영역에 보여줌                  
    SetTime--;                  // 1초씩 감소
    if (SetTime < 0) {          // 시간이 종료 되었으면..  
        clearInterval(tid);     // 타이머 해제
    	flag=0;
    }        
} 
window.onload = function TimerStart(){ tid=setInterval('msg_time()',1000) };
</script>
</head>
<body>
<video src="resources/img/lo.mp4" autoplay loop muted class="video">
</video>
<div class="emailCheck">
<h2>${memberId}님 가입을 축하합니다.</h2>
<h4>${email} 로 인증번호가 전송되었습니다.</h4>
<div class="container">
    <h2>
        <div id="ViewTimer"></div>
    </h2>
</div>
인증번호 : <input type="text" class="joinCode_text" id="joinCode_text" maxlength="4" name="code">
<button class="joinCode_btn"  onclick="test()" name="joinCode_btn">인증</button>
${sessionScope.joinCode }


</div>

<%@include file="../Include/footer.jsp" %>
</body>
</html>