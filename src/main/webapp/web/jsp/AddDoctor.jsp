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
	CallableStatement stmt=c.prepareCall("SELECT * FROM public.fn_add_doctor(?,?,?,?,?,?);");
	stmt.setString(1,"Dr."+request.getParameter("doctor_name"));
	stmt.setInt(2,Integer.parseInt(request.getParameter("doctor_age")));
	stmt.setBoolean(3,request.getParameter("doctor_gender").equals("on")?true:false);
	stmt.setString(4,request.getParameter("doctor_specialization"));
	stmt.setInt(5,Integer.parseInt(request.getParameter("doctor_experience")));
	stmt.setString(6,request.getParameter("doctor_contact_number"));
	
	
	ResultSet rs=stmt.executeQuery();
	if(rs.next())
	{
		rs.close();
		stmt.close();
		
		Cookie totalPatients = new Cookie("doctor_insert", "true");
		response.addCookie(totalPatients);
		response.sendRedirect("../jsp/Dashboard.jsp");
	}
	else
	{
		rs.close();
		stmt.close();
		
		Cookie totalPatients = new Cookie("doctor_insert", "false");
		response.addCookie(totalPatients);
		response.sendRedirect("../jsp/Dashboard.jsp");
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