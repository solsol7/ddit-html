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