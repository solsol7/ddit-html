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
	$('#lprod').on('click', function(){
		$.ajax({
			url : "/jqpro/0726/lprodJson.jsp",
			type : 'get',
			success : function(res){
				code = "<table border='1'>";
				code += "<tr><th>LPROD_ID</th>";
				code += "<th>LPROD_GU</th>";
				code += "<th>LPROD_NM</th></tr>";
				
				$.each(res, function(i, v){
					code += "<tr><td>"+res[i].lprod_id+"</td>";
					code += "<td>"+res[i].lprod_gu+"</td>";
					code += "<td>"+res[i].lprod_nm+"</td></tr>";					
				})
					
				code+="</table>"
				
				$('#result1').html(code);
			},
			error : function(xhr){
				alert("상태 : " + xhr.status)
			},
			dataType : 'json'
			
		})//ajax
	})//click
})//$(function(){})
</script>
</head>
<body>
<input type="button" value="lprod" id="lprod"><br>
<br>
<div id="result1"></div>
</body>
</html>