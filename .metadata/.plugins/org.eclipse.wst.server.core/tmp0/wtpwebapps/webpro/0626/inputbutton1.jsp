<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>JSP : Java Server Page</h1>
<%
	request.setCharacterEncoding("UTF-8");
	// 이거 안하면 한글 깨짐
	
	String userId=request.getParameter("id");
	String userName = request.getParameter("name");
	
	//db연결 - crud처리 - 결과값을 생성
	
	//결과값을 출력
	
%>

<table border="1">
	<tr>
		<th>아이디</th>
		<th>이름</th>
	</tr>
	
	<tr>
		<td><%= userId %></td>
<!-- 		처리한 결과값을 찍어야하는데 우리는 지금 결과값 없으니까 userId를 가져옴 -->
		<td><%= userName %></td>
	</tr>
</table>

</body>
</html>