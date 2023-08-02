<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String res = (String)request.getAttribute("selectById");
	
	if(res==null){
		//사용가능
%>		
	{
		"sw" : "사용가능한 아이디"
	}
	
<%	
	}else{
		//사용불가능
%>
	{
		"sw" : "사용불가능한 아이디"
	}
<%		
	}

%>