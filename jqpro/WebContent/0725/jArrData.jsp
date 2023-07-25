<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userId = request.getParameter("id");
	String userPass= request.getParameter("pass");
	
	//db처리 후 결과값을 얻는다 - 응답 데이터를 생성 - json배열 데이터
%>
["홍길동","이도령","성춘향","진달래","수선화","라일락"]