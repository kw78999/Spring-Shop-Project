function tableCheck(obj) {
	obj.querySelector("input").checked='true';
	var radio = document.getElementsByClassName('radioBtn');
	for (var i=0; i<radio.length; i++) {
		if(radio[i].checked){
			radio[i].parentNode.style.border = '5px solid #D873F1';
		}else{
			radio[i].parentNode.style.border = '5px solid silver';
		}
		
	}	
}
$(document).ready(function(){
    // 라디오버튼 클릭시 이벤트 발생
    $("input:radio").click(function(){
    	
    	var radio = document.getElementsByClassName('radioBtn');
    	for (var i=0; i<radio.length; i++) {
    		if(radio[i].checked){
    			radio[i].parentNode.style.border = '5px solid #D873F1';
    		}else{
    			radio[i].parentNode.style.border = '5px solid silver';
    		}
    		
    	}
    	
        
    });
});
//버튼 마우스 오버 아웃 이벤트
function openOver(obj) {
	obj.parentNode.style.border="5px solid #D873F1";
}
function delOver(obj) {
	obj.parentNode.style.border="5px solid brown";
}
function mouseOut(obj) {
	obj.parentNode.style.border="5px solid white";
}



//서브카테고리 모두 안보이게
function subCategoryView() {
	
	var subCategory = document.getElementsByClassName('subCategory');
	for (var i=0; i<subCategory.length; i++) {
		subCategory[i].style.display='none';
		subCategory[i].setAttribute("name","");
		}
	
}
//메인 카테고리 바뀔때마다 서브카테고리 변경
function category_change(obj) {
	document.getElementById('select').disabled = 'disabled';
	var subCategory = document.getElementsByClassName('subCategory');
	
	
	if(obj.value=="Outer"){
		subCategoryView();
		document.getElementById("outer").style.display = 'block';
		document.getElementById("outer").setAttribute("name","categorySub");
	}else if(obj.value=="Top"){
		subCategoryView();
		document.getElementById("top").style.display = 'block';
		document.getElementById("top").setAttribute("name","categorySub");
	}else if(obj.value=="Bottom"){
		subCategoryView();
		document.getElementById("bottom").style.display = 'block';
		document.getElementById("bottom").setAttribute("name","categorySub");
	}else if(obj.value=="Set"){
		subCategoryView();
		document.getElementById("set").style.display = 'block';
		document.getElementById("set").setAttribute("name","categorySub");
	}else if(obj.value=="Acc"){
		subCategoryView();
		document.getElementById("acc").style.display = 'block';
		document.getElementById("acc").setAttribute("name","categorySub");
	}else if(obj.value=="One Piace"){
		subCategoryView();
		document.getElementById("onepiace").style.display = 'block';
		document.getElementById("onepiace").setAttribute("name","categorySub");
	}
	
	
	
}
var srcArray=[3];
var playThumbnail = null;

function StopInterval() {
    if(playThumbnail != null) {
        clearInterval(playThumbnail);
    }
}

//썸네일 미리보기
function thumbnail_img(index,src) {
	
	//인덱스값과 소스받아서 적용
	srcArray[index] = src;
	var idx=0;
	var thumbnail_img = document.getElementById("thumbnail_img");
	
	//사진을 추가할떄마다 인터벌 메소드가 실행되기떄문에
	//기존 인터벌 정지하고 다시실행 
	StopInterval();
	playThumbnail = setInterval(function() {
		
		if(typeof srcArray[2]=="undefined" || srcArray[2] == null){
			if(idx==2)idx=0;//3번쨰 이미지 없으면 1과 2만 반복
		}else{
			if(idx==3)idx=0;//배열길이가 3 이기때문에 무한반복
		}
		
		//배열요소(이미지 데이터)가 존재한다면 적용하고 인터벌
		if(typeof srcArray[idx] == "undefined" || srcArray[idx] == null){
			
		}else{
			thumbnail_img.setAttribute("src",srcArray[idx]);
			
		}
		
		idx++;
	}, 1000);
	
}


function setThumbnail(event) {
	 
	var reader = new FileReader();
	reader.onload = function(event) {
		
		var view = document.getElementById("image_container");
		view.style.display="block";
		
		var img = document.getElementById("thumbnail_imgtest");
		img.setAttribute("src", event.target.result);
		
		thumbnail_img(0,event.target.result);
		
		};
		reader.readAsDataURL(event.target.files[0]);
	}
		
//이미지가 아니면 이미지없애기
function setNone() {
		var view = document.getElementById("image_container");
		view.style.display="none";
}

//파일 체인지를 기다리는 이벤트 1
$(document).ready(function(){
	var fileTarget = $('.mfile .upload-hidden');
	fileTarget.on('change', function(){ // 값이 변경되면
		if(window.FileReader){ // modern browser
			var filename = $(this)[0].files[0].name;
		} else { // old IE
			var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
		}

	var fileType=filename.substring(filename.length-3,filename.length); //파일확장자 추출
	
	//파일명 히든타입에 밸류로 넣기
	document.getElementById('thumbnail').value=filename;
	
if(fileType=='jpg'||fileType=='png'||fileType=='gif'){   //파일확장자 검사하여 미리보기 끄고 켜기
	setThumbnail(event);
}else{
	setNone();
	}

// 추출한 파일명 삽입
		$(this).siblings('.upload-name').val(filename);
		document.getElementById('mfile2').style.display='block';
	});
});


//파일 체인지를 기다리는 이벤트 2
$(document).ready(function(){
	var fileTarget = $('.mfile2 .upload-hidden2');
	fileTarget.on('change', function(){ // 값이 변경되면
		if(window.FileReader){ // modern browser
			var filename = $(this)[0].files[0].name;
		} else { // old IE
			var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
		}

	var fileType=filename.substring(filename.length-3,filename.length); //파일확장자 추출
	
	//파일명 히든타입에 밸류로 넣기
	document.getElementById('thumbnail2').value=filename;
	
if(fileType=='jpg'||fileType=='png'||fileType=='gif'){   //파일확장자 검사하여 미리보기 끄고 켜기
	setThumbnail2(event);
}else{
	setNone2();
	}

// 추출한 파일명 삽입
		$(this).siblings('.upload-name2').val(filename);
		document.getElementById('mfile3').style.display='block';
	});
});
//썸네일 2
function setThumbnail2(event) {
	 
	var reader = new FileReader();
	reader.onload = function(event) {
		
		var view = document.getElementById("image_container2");
		view.style.display="block";
		
		var img = document.getElementById("thumbnail_imgtest2");
		img.setAttribute("src", event.target.result);
		
		thumbnail_img(1, event.target.result);
		
		};
		reader.readAsDataURL(event.target.files[0]);
	}
		
//이미지가 아니면 이미지없애기2
function setNone2() {
		var view = document.getElementById("image_container2");
		view.style.display="none";
}

//파일 체인지를 기다리는 이벤트 3
$(document).ready(function(){
	var fileTarget = $('.mfile3 .upload-hidden3');
	fileTarget.on('change', function(){ // 값이 변경되면
		if(window.FileReader){ // modern browser
			var filename = $(this)[0].files[0].name;
		} else { // old IE
			var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
		}

	var fileType=filename.substring(filename.length-3,filename.length); //파일확장자 추출
	
	//파일명 히든타입에 밸류로 넣기
	document.getElementById('thumbnail3').value=filename;
	
if(fileType=='jpg'||fileType=='png'||fileType=='gif'){   //파일확장자 검사하여 미리보기 끄고 켜기
	setThumbnail3(event);
}else{
	setNone3();
	}

// 추출한 파일명 삽입
		$(this).siblings('.upload-name3').val(filename);
	});
});
//썸네일 2
function setThumbnail3(event) {
	 
	var reader = new FileReader();
	reader.onload = function(event) {
		
		var view = document.getElementById("image_container3");
		view.style.display="block";
		
		var img = document.getElementById("thumbnail_imgtest3");
		img.setAttribute("src", event.target.result);
		
		thumbnail_img(2, event.target.result);
		
		};
		reader.readAsDataURL(event.target.files[0]);
	}
		
//이미지가 아니면 이미지없애기3
function setNone3() {
		var view = document.getElementById("image_container3");
		view.style.display="none";
}


//버튼의 부모의 부모인 li 삭제
function delthis(obj) {
	$(obj).parent().parent().remove();
}

//옵션 상품 펼치고 접는 버튼
function openThis(obj) {
	
	//접기
	if(obj.parentNode.style.height=='350px'){
		obj.parentNode.style.height = '30px';
		obj.nextSibling.nextSibling.style.display='none';
		obj.parentNode.lastChild.style.display='none';
		obj.parentNode.firstChild.style.display='block';
		obj.innerHTML="펼치기";
		obj.style.color="#D873F1";
		
		//input value를 optionDiv로 이동시키기 
		var inp = obj.parentNode.getElementsByTagName('input');//4개
		var optionDiv = obj.parentNode.getElementsByTagName('div');//5개
		
		optionDiv.item(1).innerHTML="Color : "+inp.item(0).value;
		optionDiv.item(2).innerHTML="Size : "+inp.item(1).value;
		optionDiv.item(3).innerHTML="Stock : "+inp.item(2).value;
		optionDiv.item(4).innerHTML="Price : "+inp.item(3).value;
		
	//펼치기
	}else{
		obj.parentNode.style.height = '350px';
		obj.parentNode.lastChild.style.display='table';
		obj.nextSibling.nextSibling.style.display='block';
		obj.parentNode.firstChild.style.display='none';
		obj.innerHTML="접기";
		obj.style.color="red";
	}
}


//메인 상품 펼치고 접는 버튼
function mainOpenThis(obj) {
	 detailDiv=obj.parentNode.firstChild.nextSibling;
	
	 color = document.getElementById('detail_color');
	 size = document.getElementById('detail_size');
	 stock = document.getElementById('detail_stock');
	 price = document.getElementById('detail_price');
	 
	 size_table = document.getElementById('size_table');
	 
	var pDiv= document.getElementById('product_detail_div');
	
	//접기
	if(obj.parentNode.style.height=='350px'){
		
		obj.parentNode.style.height = '30px';
		obj.nextSibling.nextSibling.style.display='none';
		size_table.style.display='none';
		pDiv.style.display='block';
		obj.innerHTML="펼치기";
		obj.style.color="#D873F1";
		
		//div 속 div노드를 찾아 속성값 적용
		var divs =detailDiv.getElementsByTagName("div");
		divs.item(0).innerHTML = "Color : "+color.value;
		divs.item(1).innerHTML = "Size : "+size.value;
		divs.item(2).innerHTML = "Stock : "+stock.value;
		divs.item(3).innerHTML = "Price : "+price.value;
		
		
	//펼치기
	}else{
		
		obj.parentNode.style.height = '350px';
		obj.nextSibling.nextSibling.style.display='block';
		size_table.style.display='table';
		pDiv.style.display='none';
		obj.innerHTML="접기";
		obj.style.color="red";
	}
}

var optionIndex = 0;
//옵션추가시 div생성
function createDiv() {
	var parent_div = document.getElementById("product_parent_div");
	var parent_ul = document.getElementById("product_parent_ul");
   	
   	   //ul에 붙힐 li생성
       var parent_li = document.createElement("li");
       parent_li.setAttribute("class","product_parent_li");
       
       //li에 붙힐 div 생성  
	   mainDiv=document.createElement("div");
	   mainDiv.setAttribute("class","product_Main");
	   
	   
		
	   //미리보기 div 4개 만들기
	   optionDiv=document.createElement("div");
	   optionDiv.setAttribute("class","product_detail_div_option");
	   optionDiv.innerHTML="Color : ";
	   optionDiv2=document.createElement("div");
	   optionDiv2.setAttribute("class","product_detail_div_option");
	   optionDiv2.innerHTML="Size : ";
	   optionDiv3=document.createElement("div");
	   optionDiv3.setAttribute("class","product_detail_div_option");
	   optionDiv3.innerHTML="Stock : ";
	   optionDiv4=document.createElement("div");
	   optionDiv4.setAttribute("class","product_detail_div_option");
	   optionDiv4.innerHTML="Price : ";
	   
	   //미리보기 div4개 붙이기
	   detailDiv=document.createElement("div");
	   detailDiv.setAttribute("class","product_detail_div");
	   detailDiv.setAttribute("id","product_detail_div");
	   detailDiv.appendChild(optionDiv);
	   detailDiv.appendChild(optionDiv2);
	   detailDiv.appendChild(optionDiv3);
	   detailDiv.appendChild(optionDiv4);
	   
	   
	   //div에 붙힐 삭제 버튼 생성
       dbtn=document.createElement("button");
       dbtn.setAttribute("type","button");
       dbtn.setAttribute("class","deleteBtn");
       dbtn.setAttribute("onclick","delthis(this);");
       dbtn.setAttribute("onmouseover","delOver(this);");
       dbtn.setAttribute("onmouseout","mouseOut(this);");
       dbtn.innerHTML="삭제";
       
     //div에 붙힐 열고 닫는 버튼 생성
       obtn=document.createElement("button");
       obtn.setAttribute("type","button");
       obtn.setAttribute("class","openBtn");
       obtn.setAttribute("onclick","openThis(this)");
       obtn.setAttribute("onmouseover","openOver(this)");
       obtn.setAttribute("onmouseout","mouseOut(this)");
       obtn.innerHTML="펼치기";
       
       //세부정보 입력받는 테이블 생성
       otionTable=document.createElement('table');
       otionTable.setAttribute("class","product_table");
       
       var ftr=document.createElement('tr');
       var ftd=document.createElement('td');
       var ftd2=document.createElement('td');
       
       var str=document.createElement('tr');
       var std=document.createElement('td');
       var std2=document.createElement('td');
        
       ftd.innerHTML="Color <input type='text' class='inputText' name='list["+optionIndex+"].oColor' autocomplete='off'>";
       ftd2.innerHTML="Size <input type='text' class='inputText' name='list["+optionIndex+"].oSize' autocomplete='off'>";
       std.innerHTML="Stock <input type='text' class='inputText' name='list["+optionIndex+"].oStock' autocomplete='off'>";
       std2.innerHTML="Price <input type='text' class='inputText' name='list["+optionIndex+"].oPrice' autocomplete='off'>";
       
       otionTable.appendChild(ftr);
       otionTable.appendChild(str);
       ftr.appendChild(ftd);
       ftr.appendChild(ftd2);
       str.appendChild(std);
       str.appendChild(std2);
       
       //세부 사이즈 입력받는 테이블 생성
       sizeTable=document.createElement('table');
       sizeTable.setAttribute("class","size_table");
       sizeTable.setAttribute("id","size_table");
       
       //첫번째 tr과 td연결 
       ftr=document.createElement('tr');
       ftd1=document.createElement('td');
       ftd2=document.createElement('td');
       ftd3=document.createElement('td');
       ftd4=document.createElement('td');
       ftd5=document.createElement('td');
       ftd6=document.createElement('td');
       
       ftd1.innerHTML="어깨";
       ftd2.innerHTML="가슴";
       ftd3.innerHTML="팔길이";
       ftd4.innerHTML="암홀";
       ftd5.innerHTML="밑단";
       ftd6.innerHTML="총길이";
       
       ftr.appendChild(ftd1);
       ftr.appendChild(ftd2);
       ftr.appendChild(ftd3);
       ftr.appendChild(ftd4);
       ftr.appendChild(ftd5);
       ftr.appendChild(ftd6);
       sizeTable.appendChild(ftr);
       
       //두번째 tr과 td연결
       str=document.createElement('tr');
       std1=document.createElement('td');
       std2=document.createElement('td');
       std3=document.createElement('td');
       std4=document.createElement('td');
       std5=document.createElement('td');
       std6=document.createElement('td');
       
       std1.innerHTML='<input type="text" class="size_text" maxlength="5" name="list['+optionIndex+'].oDetailSize" autocomplete="off">';
       std2.innerHTML='<input type="text" class="size_text" maxlength="5" name="list['+optionIndex+'].oDetailSize" autocomplete="off">';
       std3.innerHTML='<input type="text" class="size_text" maxlength="5" name="list['+optionIndex+'].oDetailSize" autocomplete="off">';
       std4.innerHTML='<input type="text" class="size_text" maxlength="5" name="list['+optionIndex+'].oDetailSize" autocomplete="off">';
       std5.innerHTML='<input type="text" class="size_text" maxlength="5" name="list['+optionIndex+'].oDetailSize" autocomplete="off">';
       std6.innerHTML='<input type="text" class="size_text" maxlength="5" name="list['+optionIndex+'].oDetailSize" autocomplete="off">';
       
       str.appendChild(std1);
       str.appendChild(std2);
       str.appendChild(std3);
       str.appendChild(std4);
       str.appendChild(std5);
       str.appendChild(std6);
       sizeTable.appendChild(str);
       
       
       
       
       
       
       
       parent_ul.appendChild(parent_li);        //ul에 li부착
       parent_li.appendChild(mainDiv);   	 //li에 div 부착
       mainDiv.appendChild(detailDiv);    //div에 미리보기 div부착
       mainDiv.appendChild(obtn);    //div에 버튼 부착
       mainDiv.appendChild(dbtn);    //div에 버튼 부착
       mainDiv.appendChild(otionTable);
       mainDiv.appendChild(sizeTable);
       
       //index 하나 증가
       optionIndex++;
}

var color=0;
var color2=254;
var color3=2;

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





