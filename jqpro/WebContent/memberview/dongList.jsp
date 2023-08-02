<%@page import="com.google.gson.Gson"%>
<%@page import="member.vo.ZipVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	List<ZipVO> list = (List<ZipVO>)request.getAttribute("selectByDong");
	
	Gson gson = new Gson();
	
	String jsonData = gson.toJson(list);
	response.setContentType("application/json; charset=utf-8");
	
	out.print(jsonData);

%>