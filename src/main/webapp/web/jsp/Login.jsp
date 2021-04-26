<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Validation</title>
</head>
<%!
Connection c;
%>
<%!
public void jspInit()
{
	try
	{
	Class.forName("org.postgresql.Driver");
	c=DriverManager.getConnection("");
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	
}
%>
<body>
<%
	CallableStatement stmt=c.prepareCall("SELECT * FROM public.fn_login_user(?,?);");
	stmt.setString(1,request.getParameter("username"));
	stmt.setString(2,request.getParameter("password"));
	ResultSet rs=stmt.executeQuery();
	if(rs.next())
	{

		rs.close();
		stmt.close();
		c.close();
		
		response.sendRedirect("../jsp/Dashboard.jsp");
	}
	else
	{
		response.sendRedirect("../html/Login.html");
	}
	


%>
</body>
<%!
public void jspDestroy()
{
	try
	{
		c.close();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
}
%>
</html>