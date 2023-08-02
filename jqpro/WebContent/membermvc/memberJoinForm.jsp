<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="../js/jquery-3.7.0.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>

proc1 = () => {
	//입력한 동을 가져오기
	dongValue = $('#dong').val().trim();
	
	//입력확인
	if(dongValue.length < 1){
		alert("동이름 입력 ");
		return;
	}
	
	$.ajax({
		url : "/jqpro/selectByDong.do",
		type : 'post',
		data : {"dong" : dongValue},	//객체타입 키:밸류
		dataType : 'json',
		success : function(res){
			
			code = "<table border='1'><tr><th>우편번호</th>";
			code += "<th>주소</th><th>번지</th></tr>"
			$.each(res, function(i, v){
				
				bunji = v.bunji;
				if(typeof bunji == "undefined") bunji ="";
				
				code += `<tr class="ziptr"><td>${v.zipcode}</td>
						<td>${v.sido} ${v.gugun} ${v.dong}</td>
						<td>${bunji}</td></tr>
						`;
			});
			code += `</table>`;
			
			$('#result1').html(code);
			
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		}
		
	});//ajax끝
	
}//function끝

$(function(){
	
	//주소결과창에서 하나를 선택하면
	$(document).on('click','.ziptr', function(){
		zipvalue = $('td',this).eq(0).text();
		addrvalue = $('td',this).eq(1).text();
		
		$('#zip').val(zipvalue);
		$('#add1').val(addrvalue);
		
		//모달창 닫기
		$('#myModal').modal('hide');
	});
	
	//아이디 중복검사 이벤트
	$('#checkid').on('click', function(){
		//입력한 id값을 가져온다.
		var inputId = $('#id').val().trim();
		
		//입력 했는지 안했는지 비교
		if(inputId.length <1){
			alert("아이디를 입력하세요.");
			return;
		}
		
		//규칙문자 만들기
		idreg = /^[a-zA-Z][a-zA-Z0-9]{3,9}$/
		
		//규칙과 입력문자가 맞지 않았다면...
		if(!(idreg.test(inputId))){
			alert("id형식오류입니다")
			return;
		}
		
		$.ajax({
			url : "<%=request.getContextPath()%>/selectById.do",
			type : 'get',
			data : { "id" : inputId },
			
			dataType : 'json',
			success : function(res){
				$('#spanid').html(res.sw).css('color', 'red');
			},
			error : function(xhr){
				alert("상태 : " + xhr.status)
			}
			
		});	//ajax 끝
		
	});	//click function 끝
	
	$('#zipbtn').on('click',function(){
		window.open("zipsearch.html", "우편번호찾기","width=500 height=400");
	});
	
});
</script>
<style>
.form-control{
  width : 200px;
  height : 30px;
}
#add1, #add2{
  width : 400px;
}
input[type=button]{
  margin-bottom: 2px;
}
.ziptr:hover{
  background : crimson;
}
</style>
</head>
<body>
<div class="container mt-3">
  <h2>회원가입</h2>
  <form action="">  
    <div class="mb-3 mt-3">
      <label for="id">아이디:</label>
      <input type="button" id="checkid" class="btn btn-outline-primary btn-sm" value="중복검사">
      <span id="spanid"></span>
      <input type="text" class="form-control" id="id" name="mem_id">
    </div>
    <div class="mb-3 mt-3">
      <label for="name">이름:</label>
      <input type="text" class="form-control" id="name" name="mem_name">
    </div>
    <div class="mb-3 mt-3">
      <label for="email">Email:</label>
      <input type="text" class="form-control" id="email" name="mem_mail">
    </div>
    <div class="mb-3">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" name="mem_pass">
    </div>
    <div class="mb-3">
      <label for="hp">전화번호:</label>
      <input type="text" class="form-control" id="hp" name="mem_hp">
    </div>
    <div class="mb-3">
      <label for="bir">생일:</label>
      <input type="date" class="form-control" id="bir" name="mem_bir">
    </div>
    <div class="mb-3">
      <label for="zip">우편번호:</label>
      <input type="button" id="zipbtn" value="번호검색" class="btn btn-outline-primary btn-sm">
      
      <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal">
   		 우편번호 검색
 	 </button>
  
      <input type="text" class="form-control" id="zip" name="mem_zip">
      
    </div>
    <div class="mb-3">
      <label for="add1">주소:</label>
      <input type="text" class="form-control" id="add1" name="mem_add1">
    </div>
    <div class="mb-3">
      <label for="add2">상세주소:</label>
      <input type="text" class="form-control" id="add2" name="mem_add2">
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
    <span id="joinspan"></span>
  </form>
</div>


<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">우편번호찾기</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
       	<p>찾는 동 이름을 입력하세요</p>
		<input type="text" id="dong">
		<input type="button" value="확인" onclick="proc1()">
		<br>
		<div class="ddres" id="result1"></div>
		<br>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>


</body>
</html>