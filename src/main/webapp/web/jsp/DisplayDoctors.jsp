<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
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
<!DOCTYPE html>
<html>
    <head>    
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    
        <link rel="shortcut icon" href="https://www.coep.org.in/sites/default/files/coep_logo_0.jpg" type="image/jpeg">
    
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.1/css/bulma.min.css">
        
        <link rel="stylesheet" href="../css/DisplayDoctors.css">

        <title>Display Doctors</title>
    </head>

    <body>
        <nav class="navbar is-fixed-top has-shadow" role="navigation" aria-label="Main Navigation">
            <div class="navbar-brand">
                <a href="#" class="navbar-item">
                    <img src="../media/HospitalManagementLogo.png" style="max-width: max-content; max-height: max-content;" alt="Hospital Management">
                </a>
                <a role="button" class="navbar-burger" aria-label="menu" aria-expanded="false" data-target="PageContentLinks" id="BurgerMenu">
                    <span aria-hidden="true"></span>
                    <span aria-hidden="true"></span>
                    <span aria-hidden="true"></span>
                </a>
            </div>

            <div id="PageContentLinks" class="navbar-menu">
                <div class="navbar-end">
                	<div class="navbar-item">
						<div class="field has-addons">
  							<div class="control">
    							<input class="input" type="text" placeholder="Find a repository">
  							</div>
  							<div class="control">
    							<a class="button is-info">
      								Search
    							</a>
 							</div>
						</div>
                	</div>
                    <a class="navbar-item has-background-dark has-text-white" href="https://coepac-my.sharepoint.com/:f:/g/personal/puravud20_comp_coep_ac_in/EpLmq1zp01pLlEIS16GDz24BzOgGGDxZNHgILRx04mhrUA?e=f0PS7f" target="_blank">
                        Source Code
                    </a>
                </div>
            </div>
            
        </nav>
        <section class="hero mt-6 mb-0 pb-0 is-fullheight">
            <div class="container mt-6">
                <div class="table-container">
                    <table class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth">
                        <thead>
                            <tr>
                                <th class="doctor_id">Doctor Id</th>
                                <th class="patient_name">Name</th>
                                <th class="patient_age">Age</th>
                                <th class="patient_gender">Gender</th>
                                <th class="doctor_specialization">Specialization</th>
                                <th class="doctor_experience">Experience</th>
                                <th class="doctor_contact_number">Contact Number</th>
                            </tr>
                        </thead>
                        <tbody id="">
                           <%
                            	CallableStatement stmt = c.prepareCall("SELECT * FROM public.fn_select_all_doctors();");
                            	ResultSet rs = stmt.executeQuery();
                            	while(rs.next())
                            	{
                            %>
                            <tr>
                                <td class="doctor_id"><%=rs.getLong("doctor_id")%></td>
                                <td class="doctor_name"><%=rs.getString("doctor_name")%></td>
                                <td class="doctor_age"><%=rs.getInt("doctor_age")%></td>
                                <td class="doctor_gender"><%=rs.getBoolean("doctor_gender")?"Female":"Male"%></td>
                                <td class="doctor_specialization"><%=rs.getString("doctor_specialization")%></td>
                                <td class="doctor_experience"><%=rs.getString("doctor_experience")%></td>
                                <td class="doctor_contact_number"><%=rs.getString("doctor_contact_number")%></td>
                            </tr>
                            <%
                            	}
                        		rs.close();
                        		stmt.close();
                            %>
                        </tbody>
    
                    </table>
                </div>
            </div>
        </section>
    </body>
    <footer class="footer mt-2 has-background-dark has-text-white is-fixed-bottom">
        <div class="content has-text-centered">
            Made with ❤️. The source code is licensed <a href="https://opensource.org/licenses/mit-license.php">MIT</a>
        </div>
        <div class="content has-text-centered">
            <a href="https://bulma.io">
            	<img
              	src="https://bulma.io/images/made-with-bulma.png"
              	alt="Made with Bulma"
              	width="128"
             	height="24">
          	</a>
        </div>
    </footer>
</html>
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