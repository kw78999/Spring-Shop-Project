
var frm = document.joinfrm;


function idCheck(){
	id = frm.id.value;
	var idc = document.getElementById("idc");
	var idcc=/^[0-9a-zA-Z]{8,12}$/;
	
	if(id.length<8||id.length>12){
		idc.style.color="red";
		idc.innerHTML="아이디 길이는 8~12자로 해주세요.";
		return false;
	}else if(!idcc.test(id)){
			idc.style.color="red";
			idc.innerHTML="아이디는 영문과 숫자로만 조합하세요.";
			return false;
		}else{
			return true;
		}
	}


	
	function pwCheck() {
		pwd=frm.pwd.value;
		var idcc=/^[0-9a-zA-Z]{8,12}$/;
		
		var pw1 = document.getElementById("pw1");
		
		if(pwd.length<8||pwd.length>12){
			pw1.style.color="red";
			pw1.innerHTML="비밀번호 길이는 8~12자로 해주세요.";
			return false;
		}else{
			if(idcc.test(pwd)){
				pw1.style.color="#40c700";
				pw1.innerHTML="사용가능";
				return true;
			}else{
				pw1.style.color="red";
				pw1.innerHTML="비밀번호는 영문과 숫자로만 조합하세요.";
				return false;
			}
				
		}
		
	}
	function pwCheck2() {
		pwd2=frm.pwd2.value;
		pwd=frm.pwd.value;
		
		var pw2 = document.getElementById("pw2");
		if(pwd!=pwd2){
			pw2.style.color="red";
			pw2.innerHTML="비밀번호가 다릅니다.";	
			return false;
		}else{
			pw2.style.color="#40c700";
			pw2.innerHTML="비밀번호 일치합니다.";	
			return true;
		}
	}
	
	function nameCheck() {
		var ndiv=document.getElementById("ndiv");
		var name=frm.name.value;
		var ncheck = /^[가-힝]{2,}$/;
		
		if(ncheck.test(name)){
			ndiv.style.color="#40c700";
			ndiv.innerHTML="확인";
			return true;
		}else{
			ndiv.style.color="red";
			ndiv.innerHTML="이름을 확인하세요.";
			return false;
		}
		
	}
	
	function yyyyCheck() {
		var bdiv=document.getElementById("bdiv");
		yyyy=frm.birth1.value;
		var ycheck = /^([1-2]{1})-?([0|9]{1})-?([0-9]{2})$/;
		
		if(ycheck.test(yyyy)){
			bdiv.innerHTML="";
			return true;
		}else{
			bdiv.style.color="red";
			bdiv.innerHTML="년도를 확인하세요"
				return false;
		}
	}
	
	
	function mmCheck() {
		var bdiv=document.getElementById("bdiv");
		mm=frm.birth2.value;
		
		if(mm=='월'){
			bdiv.style.color="red"
			bdiv.innerHTML="월을 확인하세요"
				return false;
		}else{
			bdiv.innerHTML=""
			return true;
		}
		
	}
	
	
	function ddCheck(){
		var bdiv=document.getElementById("bdiv");
		dd=frm.birth3.value;
		var dcheck1 = /^([1-9]{1})$/;  //한자리수 날짜
		var dcheck2 = /^([1-2]{1})-?([0-9]{1})$/;  //두자리수 1,2 로 시작하는 날짜
		var dcheck3 = /^([3]{1})-?([0-1]{1})$/;  //두자리수 3으로 시작하는 날짜
		
		if(dd.length==1){
			if(dcheck1.test(dd)){
				bdiv.style.color="#40c700"
				bdiv.innerHTML="확인"
					return true;
			}else{
				bdiv.style.color="red"
				bdiv.innerHTML="날짜를 확인하세요"
					return false;
			}
		}else if(dd.length==2){
				if(dd.substring(0,1)==3){
					if(dcheck3.test(dd)){
						bdiv.style.color="#40c700"
						bdiv.innerHTML="확인"
							return true;
					}else{
						bdiv.style.color="red"
						bdiv.innerHTML="날짜를 확인하세요"
							return false;
					}
				}else{
						if(dcheck2.test(dd)){
							bdiv.style.color="#40c700"
							bdiv.innerHTML="확인"
								return true;
						}else{
							bdiv.style.color="red"
							bdiv.innerHTML="날짜를 확인하세요"
								return false;
						}
				}
		}else{
			bdiv.style.color="red"
			bdiv.innerHTML="날짜를 확인하세요"
				return false;
		}
	}
	
	function zipCheck() {
		var zdiv=document.getElementById("zdiv");
		var zip1 = frm.zip1.value;
		var zip3 = frm.zip3.value;
		
		if(zip1.length==0){
			zdiv.style.color="red"
		 	zdiv.innerHTML="주소를 입력 하세요"
		 	return false;
		}else if(zip3.length==0){
			zdiv.style.color="red"
			zdiv.innerHTML="상세 주소를 입력 하세요"
				return false;
		}else{
			zdiv.style.color="#40c700"
			zdiv.innerHTML="확인"
				return true;
		}
	}
	function emailCheck() {
		var ediv=document.getElementById("ediv");
		e=frm.email.value;
		
		var echeck = /^([a-zA-Z0-9]{5,15})$/;
		
		if(echeck.test(e)){
			ediv.style.color="#40c700"
				ediv.innerHTML="확인"
				return true;
		}else{
			
			ediv.style.color="red"
				ediv.innerHTML="이메일을 확인해주세요"
				return false;
		}
		
	}
	
	function phoneCheck() {
		var pndiv=document.getElementById("pndiv");
		p=frm.phone1.value;
		
		var pcheck = /^([0-9]{4})$/;
		
		if(pcheck.test(p)){
			pndiv.style.color="#40c700"
			pndiv.innerHTML="확인"
				return true;
		}else{
			pndiv.style.color="red"
			pndiv.innerHTML="핸드폰 번호를 확인하세요"
				return false;
		}
		
	}
	function phoneCheck2() {
		var pndiv=document.getElementById("pndiv");
		p=frm.phone2.value;
		
		var pcheck = /^([0-9]{4})$/;
		
		if(pcheck.test(p)){
			pndiv.style.color="#40c700"
			pndiv.innerHTML="확인"
				return true;
		}else{
			pndiv.style.color="red"
			pndiv.innerHTML="핸드폰 번호를 확인하세요"
				return false;
		}
		
	}
	
	function check(){
		flag = true;
		msg="가입성공";
		id = frm.id.value;
		pwd = frm.pwd.value;
		pwd2 = frm.pwd2.value;
		name = frm.name.value;
		birth1 = frm.birth1.value;
		birth2 = frm.birth2.value;
		birth3 = frm.birth3.value;
		phone1 = frm.phone1.value;
		phone2 = frm.phone2.value;
		
		if(id.replace(/(^\s*)|(\s*$)/, "").trim()=="") {
			msg="아이디를 입력해주세요";
			frm.id.focus();
			flag = false;
		} else if(id.length < 8 || id.length > 12) {
			msg="아이디는 8 ~ 12자 이내로 입력해주세요"; 
			frm.id.focus(); 
			flag = false;
		} else if(pwd=="") {
			msg="비밀번호를 입력하세요";
			frm.pwd.focus();
			flag = false;
		} else if(pwd.length < 8 || pwd.length > 12) {
			msg="비밀번호는 8 ~ 12자 이내로 입력해주세요";
			frm.pwd.focus();
			flag = false;
		} else if(pwd!=pwd2) {
			msg="비밀번호를 확인해주세요";
			frm.pwd2.focus();
			flag = false;
		} else if(name.replace(/(^\s*)|(\s*$)/, "").trim()==""){
			msg="이름을 입력하세요";
			frm.name.focus();
			flag = false;
		} else if(birth1.trim()==""||birth2.trim()==""||birth3.trim()==""){
			msg="생년월일을 입력하세요";
			frm.birth1.focus();
			flag = false;
		} else if(phone1.trim()==""){
			msg="휴대전화를 입력하세요";
			frm.phone1.focus();
			flag = false;
		}else if(phone2.trim()==""){
			msg="휴대전화를 입력하세요";
			frm.phone2.focus();
			flag = false;
		}else if(!idCheck()){
			msg="아이디를 확인하세요123";
			frm.id.focus();
			flag = false;
		}else if(!pwCheck()){
			msg="비밀번호를 확인하세요";
			frm.pwd.focus();
			flag = false;
		}else if(!pwCheck2()){
			msg="비밀번호를 확인하세요";
			frm.pwd2.focus();
			flag = false;
		}else if(!nameCheck()){
			msg="이름을 확인하세요";
			frm.name.focus();
			flag = false;
		}else if(!yyyyCheck()){
			msg="년도를 확인하세요";
			flag = false;
		}else if(!mmCheck()){
			msg="월을 확인하세요";
			flag = false;
		}else if(!ddCheck()){
			msg="날짜를 확인하세요";
			flag = false;
		}else if(!zipCheck()){
			msg="주소를 확인하세요";
			flag = false;
		}else if(!emailCheck()){
			msg="이메일을 확인하세요";
			flag = false;
		}else if(!phoneCheck()){
			msg="핸드폰 번호를 확인하세요";
			frm.phone1.focus();
			flag = false;
		}else if(!phoneCheck2()){
			msg="핸드폰 번호를 확인하세요";
			frm.phone2.focus();
			flag = false;
		}
		alert(msg);
		if(flag==true)
			frm.submit();
	}
var idPass;
var idRegex = /^[a-zA-Z0-9]{8,12}$/;
var idc = document.getElementById("idc");

$(document).ready(function(){
	//아이디 중복체크
	$('input[name=id]').blur(function(){
		var idCheck=$('input[name=id]').val();
		if(idRegex.test(idCheck)){
			$.ajax({
				url:'idCheck?id='+idCheck,
				type:'get',
				success:function(data){
					if(data>0){
						idc.style.color="red";
						idc.innerHTML="사용 불가능한 아이디입니다.";
					}else{
						idc.style.color="#40c700";
						idc.innerHTML="사용 가능 합니다.";
					}
				}
			})	
		}else{
			idc.style.color="red";
			idc.innerHTML="영문과 숫자 8~12자로 해주세요.";
		}
	}); 
})

function execPostcode() {
	new daum.Postcode({
		oncomplete: function(data) {
			var addr = '';
			var extraAddr = '';
			if (data.userSelectedType === 'R') {
				addr = data.roadAddress;
			} else {
				addr = data.jibunAddress;
			}
			if(data.userSelectedType === 'R'){
				if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
					extraAddr += data.bname;
				}
				if(data.buildingName !== '' && data.apartment === 'Y'){
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				if(extraAddr !== ''){
					extraAddr = ' (' + extraAddr + ')';
				}
			} else {
			}
			document.getElementById('zip1').value = data.zonecode;
			document.getElementById("zip2").value = addr;
			document.getElementById("zip3").focus();
		}
	}).open();
}
