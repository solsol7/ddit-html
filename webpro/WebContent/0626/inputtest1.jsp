<!-- jsp에서 실행해도 나오기는 하는데 값을 안넣어줘서 다 null값이 나옴 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table{
	border : 1px solid blue;
}

td{
	width : 400px;
	height : 50px;
	text-align: center;
}

.title{
	background : lightgreen;
}

</style>
</head>
<body>
<h1>JSP : Java Server Page</h1>

<!-- 백엔드 -->
<%
	request.setCharacterEncoding("UTF-8");
	String idvalue = request.getParameter("id");
	// html의 name 속성에서 가지고 옴
	String passvalue = request.getParameter("pass");
	String gender = request.getParameter("gender");
	String file=request.getParameter("file");
	String frs[] = request.getParameterValues("fruits");
// 	String타입 => 그냥 문자열임.. 파일을 보내는게 아니라 글자를 보냄
	
	String fr = "";
	
	for(int i=0; i<frs.length; i++){
		fr += frs[i] + "&nbsp;&nbsp;&nbsp;";
// 		공백 여러개주려면 nbsp
	}
	
	//비지니스로직처리 || db의 crud처리 -> 결과값을 얻어옴
	
	//결과값을 출력

%>
<table border="1">
	<tr>
		<td class="title">아이디</td>
		<td><%= idvalue%></td>
	</tr>
	
	<tr>
		<td class="title">비밀번호</td>
		<td><%= passvalue%></td>
	</tr>
	
	<tr>
		<td class="title">성별</td>
		<td><%= gender%></td>
	</tr>
	
	<tr>
		<td class="title">좋아하는 과일</td>
		<td><%= fr%></td>
<!-- 		여기에다가 frs찍으면 배열이기때문에 주소찍힘 -->
	</tr>
	
	<tr>
		<td class="title">첨부파일</td>
		<td><%= file%></td>
	</tr>
</table>

</body>
</html>