import java.awt.Color;
import java.awt.Image;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartFrame;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;

import java.sql.*;   
import javax.swing.ImageIcon;


public class HospitalManagement extends javax.swing.JFrame {
   
    Connection con=null;
    ResultSet rs=null;
    Statement stmt=null;
    ResultSetMetaData md;  
    public HospitalManagement() {
        initComponents();
        this.setSize(762,488); 
        scaleImg();
        setResizable(false);
        setLocationRelativeTo(null); 
    }

    public void scaleImg()
    {
    ImageIcon icon = new ImageIcon("<Image Path>");
    Image img = icon.getImage();
    Image imgScale= img.getScaledInstance(jLabel2.getWidth(), jLabel2.getHeight(),Image.SCALE_SMOOTH);
    ImageIcon scaledIcon= new ImageIcon(imgScale);
    jLabel2.setIcon(scaledIcon);
    }
    
    
   
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jLabel2 = new javax.swing.JLabel();
        jMenuBar1 = new javax.swing.JMenuBar();
        jMenu1 = new javax.swing.JMenu();
        AddPatientMenu = new javax.swing.JMenuItem();
        SearchPatientMenu = new javax.swing.JMenuItem();
        DispslayPatientMenu = new javax.swing.JMenuItem();
        jMenu2 = new javax.swing.JMenu();
        AddDoctorMenu = new javax.swing.JMenuItem();
        SearchDoctorMenu = new javax.swing.JMenuItem();
        DisplayDoctorsMenu = new javax.swing.JMenuItem();
        AnalysisMenu = new javax.swing.JMenu();
        PatientAnalysisButton = new javax.swing.JMenuItem();
        Covid_Data = new javax.swing.JMenu();
        Covid_Patients_Data = new javax.swing.JMenuItem();
        LogoutMenuButton = new javax.swing.JMenu();
        LogoutButton = new javax.swing.JMenuItem();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jPanel1.setBackground(new java.awt.Color(204, 204, 204));

        jLabel2.setBackground(new java.awt.Color(51, 153, 255));

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 577, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(239, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(22, 22, 22)
                .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 478, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(452, Short.MAX_VALUE))
        );

        jMenu1.setText("Patients");
        jMenu1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenu1ActionPerformed(evt);
            }
        });

        AddPatientMenu.setText("Add Patient");
        AddPatientMenu.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                AddPatientMenuActionPerformed(evt);
            }
        });
        jMenu1.add(AddPatientMenu);

        SearchPatientMenu.setText("SearchPatient");
        SearchPatientMenu.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                SearchPatientMenuActionPerformed(evt);
            }
        });
        jMenu1.add(SearchPatientMenu);

        DispslayPatientMenu.setText("Display Patients");
        DispslayPatientMenu.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                DispslayPatientMenuActionPerformed(evt);
            }
        });
        jMenu1.add(DispslayPatientMenu);

        jMenuBar1.add(jMenu1);

        jMenu2.setText("Doctors");
        jMenu2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenu2ActionPerformed(evt);
            }
        });

        AddDoctorMenu.setText("Add Doctor");
        AddDoctorMenu.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                AddDoctorMenuActionPerformed(evt);
            }
        });
        jMenu2.add(AddDoctorMenu);

        SearchDoctorMenu.setText("Search Doctor");
        SearchDoctorMenu.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                SearchDoctorMenuActionPerformed(evt);
            }
        });
        jMenu2.add(SearchDoctorMenu);

        DisplayDoctorsMenu.setText("Display Doctors");
        DisplayDoctorsMenu.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                DisplayDoctorsMenuActionPerformed(evt);
            }
        });
        jMenu2.add(DisplayDoctorsMenu);

        jMenuBar1.add(jMenu2);

        AnalysisMenu.setText("Analysis");
        AnalysisMenu.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                AnalysisMenuActionPerformed(evt);
            }
        });

        PatientAnalysisButton.setText("Patient Analysis");
        PatientAnalysisButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                PatientAnalysisButtonActionPerformed(evt);
            }
        });
        AnalysisMenu.add(PatientAnalysisButton);

        jMenuBar1.add(AnalysisMenu);

        Covid_Data.setText("Global Covid Data");

        Covid_Patients_Data.setText("Covid Patients Worldwide");
        Covid_Patients_Data.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                Covid_Patients_DataActionPerformed(evt);
            }
        });
        Covid_Data.add(Covid_Patients_Data);

        jMenuBar1.add(Covid_Data);

        LogoutMenuButton.setText("Logout");
        LogoutMenuButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                LogoutMenuButtonActionPerformed(evt);
            }
        });

        LogoutButton.setText("Logout");
        LogoutButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                LogoutButtonActionPerformed(evt);
            }
        });
        LogoutMenuButton.add(LogoutButton);

        jMenuBar1.add(LogoutMenuButton);

        setJMenuBar(jMenuBar1);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGap(31, 31, 31))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents
    
    private void jMenu1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenu1ActionPerformed
        
    }//GEN-LAST:event_jMenu1ActionPerformed

    private void AddPatientMenuActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_AddPatientMenuActionPerformed
        this.setVisible(false);
        AddPatientFrame addPatient = new AddPatientFrame();
        addPatient.setVisible(true);
        addPatient.setLocationRelativeTo(null);// GUI comes in center
        addPatient.setTitle("Add Patient");
        addPatient.setSize(762,500);
    }//GEN-LAST:event_AddPatientMenuActionPerformed

    private void SearchPatientMenuActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_SearchPatientMenuActionPerformed
        this.setVisible(false);
        SearchPatientFrame searchPatient = new SearchPatientFrame();
        searchPatient.setVisible(true);
        searchPatient.setLocationRelativeTo(null);// GUI comes in center
        searchPatient.setTitle("Search Patient");
        searchPatient.setSize(762,500);
    }//GEN-LAST:event_SearchPatientMenuActionPerformed

    private void DispslayPatientMenuActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_DispslayPatientMenuActionPerformed
        this.setVisible(false);
        DisplayPatientsFrame displayPatient = new DisplayPatientsFrame();
        displayPatient.setVisible(true);
        displayPatient.setLocationRelativeTo(null);// GUI comes in center
        displayPatient.setTitle("Patients");
        displayPatient.setSize(1000,500);
    }//GEN-LAST:event_DispslayPatientMenuActionPerformed

    private void jMenu2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenu2ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jMenu2ActionPerformed

    private void AddDoctorMenuActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_AddDoctorMenuActionPerformed
        this.setVisible(false);
        AddDoctorFrame addDoctor = new AddDoctorFrame();
        addDoctor.setVisible(true);
        addDoctor.setLocationRelativeTo(null);// GUI comes in center
        addDoctor.setTitle("Add Doctor");
        addDoctor.setSize(762,500);
    }//GEN-LAST:event_AddDoctorMenuActionPerformed

    private void SearchDoctorMenuActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_SearchDoctorMenuActionPerformed
        this.setVisible(false);
        SearchDoctorFrame searchDoctor = new SearchDoctorFrame();
        searchDoctor.setVisible(true);
        searchDoctor.setLocationRelativeTo(null);// GUI comes in center
        searchDoctor.setTitle("Search Doctor");
        searchDoctor.setSize(762,500);
    }//GEN-LAST:event_SearchDoctorMenuActionPerformed

    private void DisplayDoctorsMenuActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_DisplayDoctorsMenuActionPerformed
        this.setVisible(false);
        DisplayDoctorsFrame displayDoctors = new DisplayDoctorsFrame();
        displayDoctors.setVisible(true);
        displayDoctors.setLocationRelativeTo(null);// GUI comes in center
        displayDoctors.setTitle("Doctors");
        displayDoctors.setSize(1000,500);
    }//GEN-LAST:event_DisplayDoctorsMenuActionPerformed

    private void AnalysisMenuActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_AnalysisMenuActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_AnalysisMenuActionPerformed

    private void LogoutMenuButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_LogoutMenuButtonActionPerformed
             
    }//GEN-LAST:event_LogoutMenuButtonActionPerformed

    private void LogoutButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_LogoutButtonActionPerformed
        this.setVisible(false);
        LogoutFrame logout = new LogoutFrame();
        logout.setVisible(true);
        logout.setLocationRelativeTo(null);// GUI comes in center
        logout.setTitle("MediLife Hospital - Log Out");
        logout.setSize(762,500); 
    }//GEN-LAST:event_LogoutButtonActionPerformed

    private void PatientAnalysisButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_PatientAnalysisButtonActionPerformed
       
       int age0to20=0,age21to40=0,age41to60=0,age61to80=0,age81to100=0;
      
       try{
Class.forName("org.postgresql.Driver");
String url="";
con=DriverManager.getConnection(url);
stmt=con.createStatement();
String qs= "SELECT * FROM public.fn_select_all_patients()";
System.out.println("inside query");
rs = stmt.executeQuery(qs);
DefaultCategoryDataset dataset = new  DefaultCategoryDataset();

	  
	  String name = ""; 
	  String age = "";

	  while(rs.next())
	  {
  	        name=rs.getString("patient_name");
		age=rs.getString("patient_age");
                int storeAge = Integer.parseInt(age);
                if(storeAge <= 20)
                {
                    age0to20++;
                }
                else if(storeAge>20 && storeAge <=40)
                {
                     age21to40++;
                }
                 else if(storeAge>40 && storeAge <=60)
                {
                     age41to60++;
                }
                 else if(storeAge>60 && storeAge <=80)
                {
                     age61to80++;
                }
                else
                 {
                     age81to100++;
                 }
           
                dataset.setValue(age0to20,"Age", "0 to 20 years");
                dataset.setValue(age21to40,"Age", "21 to 40 years");
                dataset.setValue(age41to60,"Age", "41 to 60 years");
                dataset.setValue(age61to80,"Age", "61 to 80 years");
                dataset.setValue(age81to100,"Age", "81 to 100 years");
                 
	  }
        JFreeChart chart = ChartFactory.createBarChart("Patient Age Group Analysis", "Patient Age Group"," Number Of Patients",dataset, PlotOrientation.VERTICAL,false,true,false);
        CategoryPlot p = chart.getCategoryPlot();
        p.setRangeGridlinePaint(Color.black);
        ChartFrame frame = new ChartFrame("Patient Age Group Anaylsis ",chart);
        frame.setVisible(true);
        frame.setSize(700,562);

}
catch(Exception e){
System.out.println(e.getMessage());
}
    }//GEN-LAST:event_PatientAnalysisButtonActionPerformed

    private void Covid_Patients_DataActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_Covid_Patients_DataActionPerformed
        this.setVisible(false);
        CovidData covid = new CovidData();
        covid.setVisible(true);
        covid.setLocationRelativeTo(null);// GUI comes in center
        covid.setTitle("MediLife Hospital - Log Out");
        covid.setSize(762,500); 
    }//GEN-LAST:event_Covid_Patients_DataActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
       
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new HospitalManagement().setVisible(true);
                
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JMenuItem AddDoctorMenu;
    private javax.swing.JMenuItem AddPatientMenu;
    private javax.swing.JMenu AnalysisMenu;
    private javax.swing.JMenu Covid_Data;
    private javax.swing.JMenuItem Covid_Patients_Data;
    private javax.swing.JMenuItem DisplayDoctorsMenu;
    private javax.swing.JMenuItem DispslayPatientMenu;
    private javax.swing.JMenuItem LogoutButton;
    private javax.swing.JMenu LogoutMenuButton;
    private javax.swing.JMenuItem PatientAnalysisButton;
    private javax.swing.JMenuItem SearchDoctorMenu;
    private javax.swing.JMenuItem SearchPatientMenu;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JMenu jMenu1;
    private javax.swing.JMenu jMenu2;
    private javax.swing.JMenuBar jMenuBar1;
    private javax.swing.JPanel jPanel1;
    // End of variables declaration//GEN-END:variables
}
