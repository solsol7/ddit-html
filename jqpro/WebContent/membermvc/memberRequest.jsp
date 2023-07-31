<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.7.0.min.js"></script>
<script>
$(function(){
	$('#member').on('click',function(){
		
		$.ajax({
			url : '/jqpro/memberList.bms',
			type : 'get',
			dataType : 'json',
			error : function(xhr){
				alert("상태 : " +xhr.status)
			},
			success : function(res){
				code = "<table border='1'>";
				code += "<tr><td>아이디</td>";
				code += "<td>이름</td>";
				code += "<td>전화번호</td>";
				code += "<td>이메일</td></tr>";
				
				$.each(res, function(i, v){
					code += "<tr><td>" +v.mem_id +"</td>";
					code += "<td>" +res[i].mem_name +"</td>";
					code += "<td>" +this.mem_hp +"</td>";
					code += "<td>" +res[i].mem_mail +"</td></tr>";
					
				})
				
				code += "</table>";
				
				$('#result1').html(code);
			}
		})
	})
	
})
</script>
</head>
<body>
<input type="button" value="memberList" id="member">
<br>
<br>

<div id="result1"></div> 
</body>
</html>
