<%@page import="lprod.vo.LprodVO"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="java.util.List"%>
<%@page import="mybatis.config.MybatisUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//요청시 전송데이타 받 얘)id,pass

//db처리 - sqlssion
SqlSession sql = MybatisUtil.getSqlSession();

//mapper실행 - 결과값(list)
List<LprodVO> list = sql.selectList("lprod.selectAll");

//결과값 list를 가지고 json데이타를 생성
%>

[

<%
	for(int i=0; i<list.size(); i++){
		LprodVO vo = list.get(i);
		if(i>0) out.print(",");
%>
	{
		"lprod_id" : "<%=vo.getLprod_id() %>",
		"lprod_gu" : "<%=vo.getLprod_gu() %>",
		"lprod_nm" : "<%=vo.getLprod_nm() %>"
	}
		

<% 		
	}
%>

]

