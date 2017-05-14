<%@ page language="java" contentType="text/html"
    pageEncoding="GB2312"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<html>
<head>
<link rel="stylesheet" type="text/css"
href="./css/atuser.css" />
<title>故事</title>
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
<h2 style="text-align:center">别人的故事</h2>
<%
java.sql.Date date=new java.sql.Date(new java.util.Date().getTime());
SimpleDateFormat DF = new SimpleDateFormat("yyyy-MM-dd"); 
String storydate=DF.format(date);
String name=(String)request.getSession().getAttribute("userinfo");
rs=stmt.executeQuery("SELECT*from story where Author not in ('"+name +"')");
out.println("<h2>今日："+storydate+"</h2>");
while(rs.next())
{
	out.println("故事名："+rs.getString("storyname")+"  故事地点："+rs.getString("location")
	+"  故事时间："+rs.getString("happentime"));
	out.println("<br />故事内容：");
	out.println("<br />"+rs.getString("storytext"));
	out.println("<br />作者：" +rs.getString("Author")+"<br /><br /><br />");
	}
%>

</body>
</html>