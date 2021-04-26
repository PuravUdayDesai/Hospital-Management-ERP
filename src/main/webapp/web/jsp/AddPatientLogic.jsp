<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<%!
Connection c=null;
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
	CallableStatement stmt=c.prepareCall("SELECT * FROM public.fn_add_patient(?,?,?,?,?,?,?,?,?);");
	stmt.setString(1,request.getParameter("patient_name"));
	stmt.setInt(2,Integer.parseInt(request.getParameter("patient_age")));
	stmt.setBoolean(3,request.getParameter("patient_gender").equals("on")?true:false);
	stmt.setString(4,request.getParameter("patient_contact_number"));
	stmt.setString(5,request.getParameter("patient_email_id"));
	stmt.setString(6,request.getParameter("patient_disease"));
	stmt.setString(7,request.getParameter("patient_ward_number"));
	stmt.setLong(8,Long.parseLong(request.getParameter("doctor_assigned")));
	stmt.setBoolean(9,request.getParameter("covid_patient_flag").equals("on")?true:false);
	
	ResultSet rs = stmt.executeQuery();
	
	if(rs.next())
	{
		rs.close();
		stmt.close();
		
		Cookie totalPatients = new Cookie("patient_insert", "true");
		response.addCookie(totalPatients);
		response.sendRedirect("../jsp/Dashboard.jsp");
	}
	else
	{
		rs.close();
		stmt.close();
		
		Cookie totalPatients = new Cookie("patient_insert", "false");
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