<%@ page language="java" contentType="text/html"
    pageEncoding="GB2312"%>
<%@page import="java.util.*"%>
<html>
<link rel="stylesheet" type="text/css"
href="./css/frame.css" />
<head>
<title>welcome</title>
</head>
<body>
<%
String name=(String)request.getSession().getAttribute("userinfo");
%>
<h1 style="text-align:center">ª∂”≠
<%=name%>
ªÿ¿¥
</h1>
</body>
</html>