<%@page import="member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="mybatis.config.MybatisUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//요청시 전송데이타 받기

	//DB처리 - 결과값 얻기
	//SqlSession 얻어오기
	SqlSession sql = MybatisUtil.getSqlSession();
	

	//db의 member테이블에서 select를 수행
	List<MemberVO> list = sql.selectList("member.getAllMember");
%>	
	
	[
	<%
	 for(int i=0; i<list.size(); i++){
		 MemberVO vo = list.get(i);
		 if(i>0) out.print(",");
	 %>	 
		 {
			 "name" : "<%=vo.getMem_name() %>",
			 "id"	: "<%=vo.getMem_id() %>",
			 "pass" : "<%=vo.getMem_pass() %>",
			 "mail" : "<%=vo.getMem_mail() %>",
			 "hp"	: "<%=vo.getMem_hp() %>"
		 }
	<% 
	 }
	%>
	 
	 
	 ]
			
			
