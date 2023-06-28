<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h1{
	color : #ff0609;
}
</style>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String userId=request.getParameter("id");
	String userName = request.getParameter("name");
	String userPass = request.getParameter("pass");
	String userMail = request.getParameter("email");
	String userTel = request.getParameter("tel");
	
%>
<%= userId %><br>
<%= userName %><br>
<%= userPass %><br>
<%= userMail %><br>
<%= userTel %><br>
<h1>JSP : Java Server Page</h1>
</body>
</html>