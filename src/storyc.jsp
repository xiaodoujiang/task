<%@page import="java.sql.*" %>
<%@page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html"
    pageEncoding="GB2312"%>
<%
Connection conn=null;
int num=0;
String url="jdbc:mysql://localhost:3306/web1";
String user="root";
String passwd="root";
Statement stmt=null;
try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	conn=DriverManager.getConnection(url,user,passwd);
}catch(Exception e){e.printStackTrace();out.println("数据库驱动加载错误");}
stmt=conn.createStatement();
String location=request.getParameter("location");
location=new String(location.getBytes("ISO8859-1"),"gb2312");
String storyname=request.getParameter("storyname");
storyname=new String(storyname.getBytes("ISO8859-1"),"gb2312");
String storytext=request.getParameter("storytext");
String happentime=request.getParameter("year")+"-"+request.getParameter("month");
storytext=new String(storytext.getBytes("ISO8859-1"),"gb2312");
String author=(String)request.getSession().getAttribute("userinfo");
java.sql.Date date=new java.sql.Date(new java.util.Date().getTime());
SimpleDateFormat DF = new SimpleDateFormat("yyyy-MM-dd"); 
String storydate=DF.format(date);
num=stmt.executeUpdate("INSERT INTO story(Author,location,storyname,storytext,storydata,happentime) VALUES('"
+author+"','"+location+"','"+storyname+"','"+storytext+"','"+storydate+"','"+happentime+"')");
if(num>0)
{
	response.setContentType("text/html; charset=gb2312");
	out.println("<html><head><meta http-equiv=\"refresh\" content=\"5; url=./start.jsp\"></head>");
	out.println("<body><h2>故事创建成功</h2>");
	out.println("<a href=\"./start.jsp\">5秒后刷新页面，没有刷新点此刷新</a>");
	out.println("</body></html>");
}
conn.close();
%>