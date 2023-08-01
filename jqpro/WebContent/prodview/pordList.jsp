<%@page import="com.google.gson.JsonElement"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="prod.vo.ProdVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

//서블릿에서 저장한 데이타 꺼내기

	List<ProdVO> list = (List<ProdVO>)request.getAttribute("selectBylgu");
	
	response.setContentType("application/json; charset=utf-8");
	Gson gson = new Gson();
	
	
	JsonObject obj = new JsonObject();
	
	
	//있을수도 있고 없을수도 있다
	if(list!=null && list.size()>0){
		//데이타 있는 경우
		obj.addProperty("sw", "ok");

		JsonElement ele = gson.toJsonTree(list);
	
		obj.add("datas", ele);
	}else{
		//데이타 없는 경우
		obj.addProperty("sw", "no");
	}
	
	out.print(obj);
	
	/*
	String jsonData = gson.toJson(list);
	out.print(jsonData);
	*/
	
%>