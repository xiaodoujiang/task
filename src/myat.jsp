<<<<<<< HEAD
<%@ page language="java" contentType="text/html"
    pageEncoding="GB2312"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*"%>
<html>
<link rel="stylesheet" type="text/css"
href="./css/frame.css" />
<head>
<title>我关注的人</title>
</head>
<body>
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
<h2 >我关注的人</h2>
<%
String name=(String)request.getSession().getAttribute("userinfo");
rs=stmt.executeQuery("SELECT*from attention where username='"+name+"'");
while(rs.next())
{
	out.println("<br />"+rs.getString("anname")+"<br />");
	}
conn.close();
%>

</body>
</html>
=======
<%@ page language="java" contentType="text/html"
    pageEncoding="GB2312"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*"%>
<html>
<link rel="stylesheet" type="text/css"
href="./css/frame.css" />
<head>
<title>我关注的人</title>
</head>
<body>
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
<h2 >我关注的人</h2>
<%
String name=(String)request.getSession().getAttribute("userinfo");
rs=stmt.executeQuery("SELECT*from attention where username='"+name+"'");
while(rs.next())
{
	out.println("<br />"+rs.getString("anname")+"<br />");
	}
conn.close();
%>

</body>
</html>
>>>>>>> origin
