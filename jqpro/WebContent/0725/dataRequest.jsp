<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.7.0.min.js"></script>
<script>
var xhr = new XMLHttpRequest();

function textPro(){
	//요청
	xhr.open('get', 'testData.jsp?id=aaaa', true);
	xhr.send();
	
	//응답
	xhr.onreadystatechange = function(){
		if(this.readyState ==4 && this.status == 200){
			res = this.responseText;
			//res = 홍길동/개나리/진달래/무궁화/삼천리/금수강산

			names = res.split("/");
			console.log(names);
			
			code="<ul>";
			for(i=0; i<names.length; i++){
				code += "<li>" + names[i] + "</li>"
			}
			
			code +="</ul>";
			document.getElementById('result1').innerHTML = code;
			
		}
	}
}

function jsonArrPro(){
	//요청
	data = "id=aaaa&pass=1234"
	xhr.open('post','jArrData.jsp',true);
	
	xhr.setRequestHeader('Content-type','application/x-www-form-urlencoded')
	xhr.send(data);
	//응답
	
	xhr.onreadystatechange = function(){
		if(this.readyState==4 && this.status ==200){
			res = this.responseText
			
			jpres = JSON.parse(res);
			
			code = "<ol>"
			
			//$(jpres).each(function(i, v){})
			$.each(jpres, function(i, v){
				code +="<li>" + this + "</li>"
			})
			code +="</ol>";
			$('#result2').html(code);
		}
	}
	
}

function jsonObjPro(){
	//요청
	xhr.open('get','jObjData.jsp', true);
	xhr.send()
	
	//응답
	xhr.onreadystatechange = function(){
		if(this.readyState==4 && this.status == 200){
			res = this.responseText;
			
			pares = JSON.parse(res)
			
			code = "이름 : " + pares.name + "<br>";
			code += "아이디 : " + pares.id + "<br>";
			code += "주소 : " + pares.addr + "<br>";
			code += "전화번호 : " + pares.tel + "<br>";
	
			$('#result3').html(code);
		}
	}
}

function joarrPro(){
	//요청
	xhr.open("get", "joArrData.jsp",true);
	xhr.send();
	
	//응답
	xhr.onreadystatechange = function(){
		if(this.readyState==4 && this.status==200){
			res = this.responseText;
			
			pares = JSON.parse(res);
			
			code = "";
			
			$.each(pares,function(i, v){
				//pares[i].name //v.name this.name
				//pares[i].id	//v.id this.id
				
				code += (i+1) + "번째 고객 정보 ****<br>"
				code += "이름 : " + v.name + "<br>";
				code += "아이디 : " + v.id + "<br>";
				code += "주소 : " + v.addr + "<br>";
				code += "전화번호 : " + v.tel + "<br><br>";
			})
			
			$('#result4').html(code);
			
		}
	}
	
}
</script>
<style>
#content{
  display : flex;
  flex-direction: row;
}
.out{
  flex : 25%;
  border : 1px dotted orange;
  padding : 15px;
  margin : 1px;
}
</style>
</head>
<body>
  <input type="button" value="text" onclick="textPro()">
  <input type="button" value="json배열" onclick="jsonArrPro()">
  <input type="button" value="json객체" onclick="jsonObjPro()">
  <input type="button" value="json객체배열" onclick="joarrPro()">
  
  <br><br>
  
  <div id="content">
	  <div class="out" id="result1"></div>
	  <div class="out" id="result2"></div>
	  <div class="out" id="result3"></div>
	  <div class="out" id="result4"></div>
  </div>
</body>
</html>