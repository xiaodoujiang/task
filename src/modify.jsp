<%@page import="java.sql.*" %>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html"
    pageEncoding="GB2312"%>
<%
Connection conn=null;
int num=0;
String url="jdbc:mysql://localhost:3306/web1";
String user="root";
String passwd="root";
try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	conn=DriverManager.getConnection(url,user,passwd);
}catch(Exception e){e.printStackTrace();out.println("数据库驱动加载错误");}
Statement stmt=conn.createStatement();
String name=(String)request.getSession().getAttribute("userinfo");
//name=new String(name.getBytes("ISO8859-1"),"gb2312");
String pw=(String)request.getParameter("passwd");
String remark=null,nickname=null;
int age=0,dormitory=0;
if(request.getParameter("inage")!=null&&request.getParameter("inage")!="")
	age=Integer.parseInt((String)request.getParameter("inage"));
	nickname=(String)request.getParameter("nick");
	nickname=new String(nickname.getBytes("ISO8859-1"),"gb2312");
if(request.getParameter("usernum")!=null&&request.getParameter("usernum")!="")
	dormitory=Integer.parseInt((String)request.getParameter("usernum"));
if(request.getParameter("inremark")!=null&&request.getParameter("inremark")!="")
{
	remark=(String)request.getParameter("inremark");
	remark=new String(remark.getBytes("ISO8859-1"),"gb2312");
}
num=stmt.executeUpdate("UPDATE user SET passwd='"+pw+"',age="+age+",nickname='"+nickname+"',dormitory='"
+dormitory+"',remark='"+remark+"' WHERE name='"+name+"'");
if(num>0)
{
	response.setContentType("text/html; charset=gb2312");
	out.println("<html><head><meta http-equiv=\"refresh\" content=\"5; url=./userinfo.jsp\"></head>");
	out.println("<body><h2>个人信息修改成功</h2>");
	out.println("<a href=\"./userinfo.jsp\">5秒后刷新页面，没有刷新点此刷新</a>");
	out.println("</body></html>");
}
conn.close();

%>