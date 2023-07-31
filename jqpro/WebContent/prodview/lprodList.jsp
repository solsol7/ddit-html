<%@page import="com.google.gson.Gson"%>
<%@page import="lprod.vo.LprodVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//서블릿에서 저장된 결과값 가져오기
List<LprodVO> list = (List<LprodVO>)request.getAttribute("lprodList");

response.setContentType("application/json; charset=utf-8");

Gson gson = new Gson();

String result = gson.toJson(list);

out.print(result);

%>