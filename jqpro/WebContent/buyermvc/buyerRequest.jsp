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
function proc1(){
	$.ajax({
		
		url : "<%=request.getContextPath()%>/buyerNames.do",
		type : 'get',
		dataType : 'json',
		success : function(res){
			code = "";
			$.each(res, function(){
// 				code += "<p class='"+this.id+"'>"+this.name+"</p>"
 				code += `<p class='${this.id}'>${this.name}</p>`;	
//  			jsp에 이미 $라는 기호가 있기 때문에 그냥 $쓰면 오류남 => 우리가 쓰는거 그거 아니야!라고 선언해줘야함
//				 ==>page isELIgnored="true"
			})
			
			$('#names').html(code);
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		}
	})
}//proc1 끝

$(function(){
	$(document).on('click','p', function(){
		vattr = $(this).attr('class');
 		alert(vattr);

		$.ajax({
			url : "<%=request.getContextPath()%>/buyerDetail.do",
			data : "id=" + vattr,
			type : 'get',
			dataType : 'json',
			success : function(res){
				
			},
			error : function(xhr){
				alert("상태 : " + xhr.status)
			}
		})
	})
	
})

</script>
<style>
p:hover{
  background : lime;
}
table{
  border : 1px solid blue;
}
td{
  width : 200px;
  height : auto;
  padding : 10px;
}
th{
  background : skyblue;
  height : 50px;

}
.info{
  width : 500px;
}
</style>
</head>
<body>
<!-- 동기방식 -->
<input type="button" value="buyer동기" onclick="location.href='/jqpro/buyerNames.do'">

<!-- 비동기방식 -->
<input type="button" value="buyer비동기" onclick="proc1()">
<br>
<br>
<div id="result1">
	<table border="1">
		<tr>
			<th>거래처이름</th>
			<th class="info">거래처 상세정보</th>
		</tr>
		
		<tr>
			<td id="names"></td>
			<td id="detail"></td>
		</tr>
	</table>
</div>
</body>
</html>