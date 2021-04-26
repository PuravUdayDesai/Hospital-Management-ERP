<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.io.IOException, java.util.*, converter.Converter, request.sender.RequestSender, java.sql.*"%>
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
        
        <link rel="stylesheet" href="../css/Dashboard.css">

        <title>Dashboard</title>
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
                <div class="navbar-start">
                    <div class="navbar-item">
                        <a class="navbar-item" href="../html/AddDoctor.html">
                            Add Doctor
                        </a>

                    </div>
                    <div class="navbar-item">
                        <a class="navbar-item " href="../jsp/AddPatient.jsp">
                            Add Patient
                        </a>
                    </div>
                    <div class="navbar-item">
                        <a class="navbar-item" href="../jsp/DisplayDoctors.jsp" target="_blank">
                            Display Doctor
                        </a>
                    </div>
                    <div class="navbar-item">
                        <a class="navbar-item" href="../jsp/DisplayPatients.jsp" target="_blank">
                            Display Patient
                        </a>
                    </div>
                </div>
                <div class="navbar-end">
                    <div class="navbar-item">
                        <a class="button is-danger" href="../html/Login.html">
                            Logout
                        </a>
                    </div>
                    <a class="navbar-item has-background-dark has-text-white" href="https://coepac-my.sharepoint.com/:f:/g/personal/puravud20_comp_coep_ac_in/EpLmq1zp01pLlEIS16GDz24BzOgGGDxZNHgILRx04mhrUA?e=f0PS7f" target="_blank">
                        Source Code
                    </a>
                </div>
            </div>
            
        </nav>
        <section class="section mt-6 mb-0 pb-0">
        
        <article class="message is-hidden" id="MessageBox">
  			<div class="message-header" id="MessageHeader">
    			<p id="MessageHeaderData"></p>
   				 <button class="delete" aria-label="delete"></button>
  			</div>
  			<div class="message-body" id="MessageBody">
    			
  			</div>
		</article>
		
        <table class="table is-hidden">
        <thead>
        	<tr>
        		<th>Country</th>
        		<th>Total Cases</th>
        	</tr>
        </thead>
        <tbody class="GlobalCovidPatients">
			<%
				RequestSender requestSender = new RequestSender();
			
				String csvData = requestSender.fetchPatientData();

				Converter converter = new Converter();
			
				HashMap<String, Integer> data = new HashMap<String, Integer>();
				data = converter.convertCSVToDataObjectCountry(csvData);
			
				for(Map.Entry<String, Integer> record: data.entrySet())
				{
					out.println("<tr>");
					out.println("<td>"+record.getKey()+"</td>");
					out.println("<td>"+record.getValue()+"</td>");
					out.println("</tr>");
				}
			%>
			</tbody>
			</table>
	<table class="table is-hidden">
        <thead>
        	<tr>
        		<th>Age Group</th>
        		<th>Total Patients</th>
        	</tr>
        </thead>
        <tbody class="PatientsAnalysis">
			<%
			
			int age20		= 0;
			int age21to40	= 0;
			int age41to60	= 0;
			int age61to80	= 0;
			int age81		= 0;
			
        	CallableStatement stmt = c.prepareCall("SELECT * FROM public.fn_select_all_patients_analysis();");
        	ResultSet rs = stmt.executeQuery();
        	while(rs.next())
        	{		
        		int currentPatientAge = rs.getInt("patient_age");
        		if(currentPatientAge <= 20)
        		{
        			age20++;
        		}
        		else if(currentPatientAge > 20 && currentPatientAge <= 40)
        		{
        			age21to40++;
        		}
        		else if(currentPatientAge > 41 && currentPatientAge <= 60)
        		{
        			age41to60++;
        		}
        		else if(currentPatientAge > 61 && currentPatientAge <= 80)
        		{
        			age61to80++;
        		}
        		else if(currentPatientAge > 80)
        		{
        			age81++;
        		}
        	}
        	
        	out.println("<tr>");
        	out.println("<td><=20</td>");
        	out.println("<td>"+age20+"</td>");
        	out.println("</tr>");
        	
        	out.println("<tr>");
        	out.println("<td>>20 & <=40</td>");
        	out.println("<td>"+age21to40+"</td>");
        	out.println("</tr>");
        	
        	out.println("<tr>");
        	out.println("<td>>41 & <=60</td>");
        	out.println("<td>"+age41to60+"</td>");
        	out.println("</tr>");
        	
        	out.println("<tr>");
        	out.println("<td>>61 & <=80</td>");
        	out.println("<td>"+age61to80+"</td>");
        	out.println("</tr>");
        	
        	out.println("<tr>");
        	out.println("<td>>80</td>");
        	out.println("<td>"+age81+"</td>");
        	out.println("</tr>");
        	
        	rs.close();
        	stmt.close();
			%>
		</tbody>
	</table>
	
	<%
		stmt = c.prepareCall("SELECT * FROM public.fn_select_count_patients();");
    	rs = stmt.executeQuery();
    	if(rs.next())
    	{
    		Cookie totalPatients = new Cookie("total_patients", ""+rs.getLong("patient_count"));
    		response.addCookie(totalPatients);
    	}
    	
    	rs.close();
    	stmt.close();
    	
		stmt = c.prepareCall("SELECT * FROM public.fn_select_count_covid_patients();");
    	rs = stmt.executeQuery();
    	if(rs.next())
    	{
    		Cookie covidPatients = new Cookie("covid_patients", ""+rs.getLong("patient_count"));
    		response.addCookie(covidPatients);
    	}
    	
    	rs.close();
    	stmt.close();
	
	%>
	
			  <div class="container">
                    <div class="tile is-ancestor">
                        <div class="tile is-4 is-vertical is-parent">
                            <article class="tile is-child box">
                                <p class="title">Patient Analysis</p>
                                <div class="content" style="min-height: 29vh;" id="PatientAnalysis">

                                </div>
                            </article>
                            <article class="tile is-child box">
                                <p class="title">Covid Patient Analysis</p>
                                <div class="content" style="min-height: 29vh;" id="CovidPatientPercentage">
                                </div>
                            </article>
                        </div>
                        <div class="tile is-parent">
                            <div class="tile is-child box">
                            	<p class="title">Corona Patients</p>
                                <div class="content" id="CovidRegion">
                                
                                </div>
                            </div>
                        </div>
            	     </div>
        		</div>
			
        </section>
    </body>
    <footer class="footer mt-2 has-background-dark has-text-white">
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
    
    $(document).ready(function(){
        displayWorldCovidGraph();
        displayPatientAnalysisGraph();
        displayCovidPatienAnalysisGraph();
        
        $(".delete").click(function(){
        	var message_box = document.getElementById("MessageBox");
			message_box.classList.toggle("is-hidden");
        });
        
        
        var doctor_insert_flag = getCookie("doctor_insert");
        var patient_insert_flag = getCookie("patient_insert");
        
        if(doctor_insert_flag == "true")
        {
        	var message_box = document.getElementById("MessageBox");
			message_box.classList.toggle("is-hidden");

			message_box.classList.add("is-success");

			var message_header_body = document.getElementById("MessageHeaderData");
			message_header_body.innerHTML="Doctor Inserter";

			var message_body = document.getElementById("MessageBody");
			message_body.innerHTML="Doctor Inserter Successfully";
        	
        }
        if(doctor_insert_flag == "false")
        {
        	var message_box = document.getElementById("MessageBox");
			message_box.classList.toggle("is-hidden");

			message_box.classList.add("is-danger");

			var message_header_body = document.getElementById("MessageHeaderData");
			message_header_body.innerHTML="Doctor Not Inserted";

			var message_body = document.getElementById("MessageBody");
			message_body.innerHTML="Doctor Not Inserter, Please try again after some time!";
        }
        
        if(patient_insert_flag == "true")
        {
        	var message_box = document.getElementById("MessageBox");
			message_box.classList.toggle("is-hidden");

			message_box.classList.add("is-success");

			var message_header_body = document.getElementById("MessageHeaderData");
			message_header_body.innerHTML="Patient Inserter";

			var message_body = document.getElementById("MessageBody");
			message_body.innerHTML="Patient Inserter Successfully";
        }
        
        if(patient_insert_flag == "false")
        {
        	var message_box = document.getElementById("MessageBox");
			message_box.classList.toggle("is-hidden");

			message_box.classList.add("is-danger");

			var message_header_body = document.getElementById("MessageHeaderData");
			message_header_body.innerHTML="Patient Not Inserted";

			var message_body = document.getElementById("MessageBody");
			message_body.innerHTML="Patient Not Inserter, Please try again after some time!";
        }
        
        var d = new Date();
        d.setTime(d.getTime());
        document.cookie = "doctor_insert=; expires="+d.toUTCString()+"; path=/;";
        document.cookie = "patient_insert=; expires="+d.toUTCString()+"; path=/;";
        
        document.cookie = "doctor_insert=blank";
        document.cookie = "patient_insert=blank";
        
    });
    
    function getCookie(cname) {
    	  var name = cname + "=";
    	  var decodedCookie = decodeURIComponent(document.cookie);
    	  var ca = decodedCookie.split(';');
    	  for(var i = 0; i <ca.length; i++) {
    	    var c = ca[i];
    	    while (c.charAt(0) == ' ') {
    	      c = c.substring(1);
    	    }
    	    if (c.indexOf(name) == 0) {
    	      return c.substring(name.length, c.length);
    	    }
    	  }
    	  return "";
    }
    
    function displayCovidPatienAnalysisGraph()
    {
    	var total_patients = getCookie("total_patients");
    	var covid_patients = getCookie("covid_patients");
    	
    	google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(()=>{
        	
        	var data = google.visualization.arrayToDataTable([
                ['Patients', 'Number of Patients'],
                ['Covid Patients',     covid_patients*10],
                ['Regular Patients',   (total_patients - covid_patients)*10]
              ]);

              var options = {
                title: 'Patient Analysis',
                pieHole: 0.4
              };

              var chart = new google.visualization.PieChart(document.getElementById('CovidPatientPercentage'));

              chart.draw(data, options);
        	
        });
        
        
    	
    }
    
    
    function displayPatientAnalysisGraph()
    {
    	
    	var colors = ["#d9705b","#5ba2d9","#5bd96a","#ccd95b","#d95b6c"];
    	
    	google.charts.load("current", {packages:['corechart']});
        google.charts.setOnLoadCallback(()=>{
        	
        var dataArray = new Array();
       	dataArray.push(["Age Group", "Rate", { role: "style" }]);
        	
        var table = document.getElementsByClassName("PatientsAnalysis");
        console.log(table);
        
        var tableChildNodes = table[0].childNodes;
        var colorCounter = 0;
        for(var i = 0; i < tableChildNodes.length; i++)
        {
            if(tableChildNodes[i].nodeName=="TR")
            {
            	var trChildNodes = tableChildNodes[i].childNodes;
            	
            	var ageGroup = "";
            	var rate = 0;
            	
            	for(var j = 1; j < trChildNodes.length; j++)
            	{
                	if(trChildNodes[j].nodeName == "TD")
            		{
                		ageGroup = trChildNodes[j].innerText;
            		}
                	j+=2;
                	if(trChildNodes[j].nodeName == "TD")
            		{
                		rate = trChildNodes[j].innerText;
            		}
                	j++;
            	}
            	
            	dataArray.push([ageGroup, parseInt(rate), colors[colorCounter]]);
            	colorCounter++;
            }
        }
        	
        var data = google.visualization.arrayToDataTable(dataArray);

         var view = new google.visualization.DataView(data);
         view.setColumns([0, 1,
             { calc: "stringify",
             sourceColumn: 1,
             type: "string",
             role: "annotation" },
           2]);

         var options = {
                title: "Age Group of patients",
                width: 400,
                height: 230,
                bar: {groupWidth: "95%"},
                legend: { position: "none" },
         };
         var chart = new google.visualization.ColumnChart(document.getElementById("PatientAnalysis"));
         chart.draw(view, options);
        });
    }
    
    function displayWorldCovidGraph()
    {
    	google.charts.load('current', {
            'packages':['geochart'],
            'mapsApiKey': 'AIzaSyDZTCFs_qHT9n8836O81qofnM9i2_BJjmg'
          });
          google.charts.setOnLoadCallback(()=>{
            var dataArray = new Array();
            dataArray.push(["Country", "Covid Rate"]);
      
        	var table = document.getElementsByClassName("GlobalCovidPatients");
        	
            var tableChildNodes = table[0].childNodes;
            for(var i = 0; i < tableChildNodes.length; i++)
            {
                if(tableChildNodes[i].nodeName=="TR")
                {
                	var trChildNodes = tableChildNodes[i].childNodes;
                	
                	var country = "";
                	var covidRate = 0;
                	
                	for(var j = 1; j < trChildNodes.length; j++)
                	{
                    	if(trChildNodes[j].nodeName == "TD")
                		{
                    		country = trChildNodes[j].innerText;
                		}
                    	j+=2;
                    	if(trChildNodes[j].nodeName == "TD")
                		{
                    		covidRate = trChildNodes[j].innerText;
                		}
                    	j++;
                	}
                	
                	dataArray.push([country, covidRate]);
                }
            }
        	  
            var data = google.visualization.arrayToDataTable(dataArray);

            var options = {
           		 defaultColor: '#a10505'
            };

            var chart = new google.visualization.GeoChart(document.getElementById('CovidRegion'));

            chart.draw(data, options);
          });
    }
    
      
    </script>
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