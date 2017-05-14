<%@ page language="java" contentType="text/html"
    pageEncoding="GB2312"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
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
String author=(String)request.getParameter("name");
author=new String(author.getBytes("ISO8859-1"),"gb2312");
rs=stmt.executeQuery("select * from user where name='"+author+"'");
if(!rs.next())
{
	response.setContentType("text/html; charset=gb2312");
	out.println("<html><head><meta http-equiv=\"refresh\" content=\"3; url=./atuser.html\"></head>");
	out.println("<body><h2>没有这个用户，请检查后再关注</h2>");
	out.println("<a href=\"./atuser.html\">3秒后自动跳回添加关注，没有跳转点此跳转</a>");
	out.println("</body></html>");
}
else
{	
String ownname=(String)request.getSession().getAttribute("userinfo");
rs=stmt.executeQuery("select * from attention where username='"+ownname+"'and anname='"+author+"'");
if(rs.next())
{
	response.setContentType("text/html; charset=gb2312");
	out.println("<html><head><meta http-equiv=\"refresh\" content=\"3; url=./atuser.html\"></head>");
	out.println("<body><h2>已关注过该用户</h2>");
	out.println("<a href=\"./atuser.html\">3秒后自动跳回添加关注，没有跳转点此跳转</a>");
	out.println("</body></html>");
}
else
{
int num=0;
num=stmt.executeUpdate("INSERT INTO attention(username,anname) values('"+ownname+"','"+author+"')");
if(num>0)
{
	response.setContentType("text/html; charset=gb2312");
	out.println("<html><head><meta http-equiv=\"refresh\" content=\"3; url=./myat.jsp\"></head>");
	out.println("<body><h2>关注成功</h2>");
	out.println("<a href=\"./myat.jsp\">3秒后自动跳转我关注的人列表，没有跳转点此跳转</a>");
	out.println("</body></html>");
}
else 
{
	response.setContentType("text/html; charset=gb2312");
	out.println("<html><head><meta http-equiv=\"refresh\" content=\"3; url=./atuser.jsp\"></head>");
	out.println("<body><h2>由于未知原因，请检查用户名后再关注</h2>");
	out.println("<a href=\"./atuser.html\">3秒后自动跳回添加关注，没有跳转点此跳转</a>");
	out.println("</body></html>");
}
}
}
conn.close();
%>