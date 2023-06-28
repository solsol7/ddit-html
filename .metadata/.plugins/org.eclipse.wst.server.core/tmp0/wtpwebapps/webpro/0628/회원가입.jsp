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
  String userName = request.getParameter("name");
  String userAddr = request.getParameter("addr");
  String userMail = request.getParameter("email");
  String userGender = request.getParameter("gender");
  String userCont = request.getParameter("text");
  String cont=userCont.replaceAll("\r\n", "<br>");
%>

이름 : <%=userName %><br>
주소 : <%=userAddr%><br>
이메일 : <%=userMail %><br>
성별 : <%=userGender %><br>
내용 : <%=cont %>
</body>
</html>