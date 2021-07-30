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
	c = DriverManager.getConnection("");
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
        
        <link rel="stylesheet" href="../css/Login.css">

        <title>Add Patient</title>
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
                    <a class="navbar-item has-background-dark has-text-white" href="https://coepac-my.sharepoint.com/:f:/g/personal/puravud20_comp_coep_ac_in/EpLmq1zp01pLlEIS16GDz24BzOgGGDxZNHgILRx04mhrUA?e=f0PS7f" target="_blank">
                        Source Code
                    </a>
                </div>
            </div>
        </nav>
        <section class="hero mt-6 mb-0 pb-0 is-fullheight">
            <div class="hero-body">
                <div class="container">
                    <div class="columns is-centered">
                        <div class="column is-full-desktop">
                            <div class="box">
                                <p class="is-size-1 has-text-weight-semibold mt-0 p-0 has-text-info-dark">
                                    Add Patient
                                </p>
                                <form action="./AddPatientLogic.jsp" method="POST" class="mt-6">
                                    <div class="columns">
                                        <div class="column is-half">
                                            <label class="label">Name</label>
                                            <div class="field is-horizontal">
                                                <div class="field-body">
                                                    <div class="field is-expanded">
                                                        <div class="field">
                                                            <p class="control">
                                                                <input class="input" type="text" name="patient_name" placeholder="Kapil Joshi">
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <label class="label">Age</label>
                                            <div class="field">
                                                <div class="control">
                                                        <input class="input" type="number" min="1" max="100" name="patient_age" placeholder="30">
                                                </div>
                                            </div>
        
                                            <div class="columns mt-2">
                                                <div class="column is-one-third">
                                                    <label class="label">Gender</label>
                                                </div>
                                                <div class="column">
                                                    <div class="field is-horizontal">
                                                        <div class="field-body">
                                                            <div class="field is-narrow">
                                                                <div class="control">
                                                                    <label class="radio">
                                                                        <input type="radio" name="patient_gender" checked>
                                                                        Male
                                                                    </label>
                                                                    <label class="radio ml-6">
                                                                        <input type="radio" name="patient_gender">
                                                                        Female
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <label class="label">Contact Number</label>
                                            <div class="field is-horizontal">
                                                <div class="field-body">
                                                    <div class="field is-expanded">
                                                        <div class="field has-addons">
                                                            <p class="control">
                                                                <a class="button is-static">
                                                                    +91
                                                                </a>
                                                            </p>
                                                            <p class="control is-expanded">
                                                                <input class="input" type="tel" name="patient_contact_number" maxlength="10" placeholder="9876543210">
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <label class="label">Email Id</label>
                                            <div class="field">
                                                <p class="control">
                                                    <input class="input" type="email" name="patient_email_id" placeholder="email_name@domain.com">
                                                </p>
                                            </div>

                                        </div>
                                        <div class="column is-half">

                                            <label class="label">Patient Disease</label>
                                            <div class="field">
                                                <p class="control">
                                                    <input class="input" type="text" name="patient_disease" placeholder="Heart Attack">
                                                </p>
                                            </div>

                                            <label class="label">Patient WardNumber</label>
                                            <div class="field">
                                                <p class="control">
                                                    <input class="input" type="text" name="patient_ward_number" placeholder="WRD-A-12-21">
                                                </p>
                                            </div>

                                            <div class="columns mt-2">
                                                <div class="column is-one-third">
                                                    <label class="label">Covid Patient?</label>
                                                </div>
                                                <div class="column">
                                                    <div class="field is-horizontal">
                                                        <div class="field-body">
                                                            <div class="field is-narrow">
                                                                <div class="control">
                                                                    <label class="radio">
                                                                        <input type="radio" name="covid_patient_flag">
                                                                        Yes
                                                                    </label>
                                                                    <label class="radio ml-6">
                                                                        <input type="radio" name="covid_patient_flag" checked>
                                                                        No
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <label class="label">Doctor Assigned</label>
                                            <div class="field">
                                                <div class="select is-fullwidth">
                                                    <select name="doctor_assigned">
                                                    <%
                            							CallableStatement stmt = c.prepareCall("SELECT * FROM public.fn_select_all_doctor_name_id();");
                            							ResultSet rs = stmt.executeQuery();
                            							while(rs.next())
                            							{
                            						%>
                                                        <option value=<%=rs.getLong("doctor_id") %>>
                                                        	<%=rs.getString("doctor_name") %>
                                                    	</option>    
                                                    <%
                            							}  
                            							rs.close();
                            							stmt.close();
                                                    %>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="level mt-6 pt-6">
                                                <div class="level-left">
                                                    <div class="level-item">
                                                        <input type="button" class="button is-medium is-danger" value="Clear"/>
                                                    </div>
                                                 </div>
                                                <div class="level-right">
                                                    <div class="level-item">
                                                    	<input type="submit" class="button is-medium is-success" />
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
    <footer class="footer mt-2 has-background-dark has-text-white">
        <div class="content has-text-centered">
            Made with ❤️ . The source code is licensed <a href="https://opensource.org/licenses/mit-license.php">MIT</a>
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
