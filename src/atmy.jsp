<%@ page language="java" contentType="text/html"
    pageEncoding="GB2312"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*"%>
<html>
<head>
<title>关注我的人</title>
</head>
<body>
<link rel="stylesheet" type="text/css"
href="./css/frame.css" />
<%
Connection conn=null;
ResultSet rs=null;
String url="jdbc:mysql://localhost:3306/web1";
String user="root";
String passwd="root";
Statement stmt=null;
try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	conn=DriverManager.getConnection(url,user,passwd);
}catch(Exception e){e.printStackTrace();out.println("数据库驱动加载错误");}
stmt=conn.createStatement();
%>
<h2 >关注我的人</h2>
<%
String name=(String)request.getSession().getAttribute("userinfo");
rs=stmt.executeQuery("SELECT*from attention where anname='"+name+"'");
while(rs.next())
{
	out.println("<br />"+rs.getString("username")+"<br /><br />");
	}
conn.close();
%>

</body>
</html>
