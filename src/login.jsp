<%@page import="java.sql.*" %>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html"
    pageEncoding="GB2312"%>
<%
Connection conn=null;
Statement stmt=null;
String url="jdbc:mysql://localhost:3306/web1";
String user="root";
String passwd="root";
ResultSet rs=null;
try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();}catch(Exception ee){ee.printStackTrace();out.println("!!");}
	try{
		conn=DriverManager.getConnection(url,user,passwd);
	stmt=conn.createStatement();
String name=(String)request.getParameter("username");
name=new String(name.getBytes("ISO8859-1"),"gb2312");
String pwtemp=(String)request.getParameter("passwd");
 rs=stmt.executeQuery("SELECT passwd FROM user WHERE name='"+name+"'");
if(!rs.next()) {
	response.setContentType("text/html; charset=gb2312");
	out.println("<html><head><meta http-equiv=\"refresh\" content=\"3; url=./Login.html\"></head>");
	out.println("<body><h2>该用户不存在</h2>");
	out.println("<a href=\"./Login.html\">3秒后自动跳回，没有跳转点此跳转</a>");
	out.println("</body></html>");
}
//out.println(rs.getString("name")));
String s=rs.getString("passwd");
s=new String(s.getBytes("ISO8859-1"),"gb2312");
if(rs!=null&&s.equals(pwtemp))
	{
	session.setAttribute("userinfo", name);
	//out.println("name"+name+" passwd"+pwtemp);
	response.setContentType("text/html; charset=gb2312");
	response.sendRedirect("./mainpage.html");
	conn.close();
	return;
	}
else
	{
	response.setContentType("text/html; charset=gb2312");
	out.println("<html><head><meta http-equiv=\"refresh\" content=\"3; url=./Login.html\"></head>");
	out.println("<body><h2>用户或密码错误</h2>");
	out.println("<a href=\"./Login.html\">3秒后自动跳回，没有跳转点此跳转</a>");
	out.println("</body></html>");
	}
	}catch(Exception e){e.printStackTrace();}
%>

