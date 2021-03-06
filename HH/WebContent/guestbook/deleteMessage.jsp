<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page errorPage="errorView.jsp" %>
<%@ page import="service.*" %>

<%
	int messageId = Integer.parseInt(request.getParameter("messageId"));
	String password = request.getParameter("password");
	boolean invalidPassword = false;
	try {
		DeleteMessageService deleteService = DeleteMessageService.getInstance();
		deleteService.deleteMessage(messageId, password);
	} catch (InvalidMessagePasswordException e) {
		invalidPassword = true;
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>메시지 삭제</title>
</head>
<body>
<% 
	if (!invalidPassword) {
%>
메시지를 삭제하였습니다.
<%	
	} else {
%>
입력한 암호가 올바르지 않습니다. 암호를 확인해주세요.
<%
	}
%>
<a href="list.jsp">[목록보기]</a>
</body>
</html>