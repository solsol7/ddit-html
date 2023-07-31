<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.7.0.min.js"></script>
<script>
$(function(){
	
	//lprod를 실행
	$.ajax({
		url : "<%=request.getContextPath()%>/lProdList.do",
		type : 'get',
		dataType : 'json',
		success : function(res){
			code = "";
			$.each(res, function(i, v){
				
				code += `<option value="${v.lprod_gu}">${v.lprod_nm}</option>`
			})
			
			$('#Lprod').html(code);
			
		},
		error : function(xhr){
			alert("상태 : "+ xhr.status);
		}
	})
	
	//lprod_gu를 서버로 보내서 prod_lgu와 값이 같은 조건으로 prod의 id, name을 select
	$('#lprod').on('change', function(){
		
// 		$('#lprod option:selected').val()
		guvalue = $('option:selected',this).val()
		
		$.ajax({
			url : '<%=request.getContextPath()%>/',
			data : 'gu=' + guvalue,
			dataType : 'json',
			success : function(res){
				
			},
			error : function(xhr){
				alert("상태 : " + xhr.status)
			}
		})
	})
	
	//prod id를 기준으로 prod detail을 수행
})
</script>
</head>
<body>

<select id="Lprod"></select>
<select id="prod"></select>

<br>
<br>
<div id="result"></div>
</body>
</html>