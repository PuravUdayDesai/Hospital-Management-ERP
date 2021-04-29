import javax.swing.*; 
import java.sql.*;   
import javax.swing.table.DefaultTableModel;
import java.awt.*;

public class DisplayPatientsFrame extends javax.swing.JFrame{
    JPanel f;
    JTable table;
    String columns[];
    Connection con=null;
    ResultSet rs2;
    ResultSetMetaData md;
    CallableStatement pst3;
    
    public DisplayPatientsFrame() {
        initComponents();
       try{
           
           DBConnect dbc=new DBConnect();
      con=dbc.Connect();
      System.out.println("DB Connected");

 String get_p_sql2="SELECT * FROM public.fn_select_all_patients();";
 pst3 = con.prepareCall(get_p_sql2);
                      
             rs2 = pst3.executeQuery();

DefaultTableModel model = new DefaultTableModel();
String cols[]={"ID", "NAME", "AGE", "GENDER","CONTACT DETAILS","EMAIL_ID","DISEASE_DESCRIPTION","WARD_NUMBER","DOCTOR_ID","DOCTOR_NAME","DOCTOR_CONTACT_NUMBER","COVID_DETAILS"};
        model.setColumnIdentifiers(cols);
        System.out.println("Model built");

        table = new JTable();
      
         table.setModel(model);

        table.setAutoResizeMode(JTable.AUTO_RESIZE_ALL_COLUMNS);

        table.setFillsViewportHeight(true);
   
        JScrollPane scroll = new JScrollPane(table);

        scroll.setHorizontalScrollBarPolicy(

                JScrollPane.HORIZONTAL_SCROLLBAR_AS_NEEDED);

        scroll.setVerticalScrollBarPolicy(

                JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED);

	  long patient_id; 
	  String name = ""; 
	  int age;
	  boolean gendercheck=false;
          String gender;
	  String phone_no="";
	  String email = "";
          String problem = "";
          String ward_no = "";
          long d_id;
          String d_name="";
          String d_no="";
          boolean covidcheck=false;
          String covid;

          
	  
	  while(rs2.next())
	  {
	  
	  	patient_id=rs2.getLong("patient_id");
	  	name=rs2.getString("patient_name");
		age=rs2.getInt("patient_age");
                if(gendercheck == true)
                {
                    gender="Female";
                }
                else
                {
                    gender="Male";
                }
		phone_no=rs2.getString("patient_contact_number");
                email=rs2.getString("patient_email_id");
                problem = rs2.getString("patient_disease");
		ward_no=rs2.getString("patient_ward_number");
                d_id=rs2.getLong("doctor_id");
                d_name=rs2.getString("doctor_name");
                d_no=rs2.getString("doctor_contact_number");
                covidcheck=rs2.getBoolean("covid_patient_flag");
               
                if(covidcheck == true)
                {
                    covid="Covid Patient";
                }
                else
                {
                    covid="Non-Covid Patient";
                }
                
		 model.addRow(new Object[]{patient_id,name,age,gender,phone_no,email,problem,ward_no,d_id,d_name,d_no,covid});
	  }	
          
   jPanel1.add(scroll).setBounds(50, 50, 900, 200);
   
}
catch(Exception e){
System.out.println(e.getMessage());
}
	    
}

   
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        BackButton = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jPanel1.setBackground(new java.awt.Color(255, 255, 204));

        jLabel1.setBackground(new java.awt.Color(0, 0, 0));
        jLabel1.setFont(new java.awt.Font("Arial", 1, 18)); // NOI18N
        jLabel1.setText("Patients ");

        BackButton.setBackground(new java.awt.Color(255, 255, 255));
        BackButton.setFont(new java.awt.Font("Arial", 1, 18)); // NOI18N
        BackButton.setText("Back");
        BackButton.setBorder(null);
        BackButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BackButtonActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(111, 111, 111)
                .addComponent(BackButton, javax.swing.GroupLayout.PREFERRED_SIZE, 70, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(230, 230, 230)
                .addComponent(jLabel1)
                .addContainerGap(275, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(22, 22, 22)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(BackButton, javax.swing.GroupLayout.PREFERRED_SIZE, 23, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(447, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void BackButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BackButtonActionPerformed
        this.setVisible(false);
        HospitalManagement hospitalManagement = new  HospitalManagement();
        hospitalManagement.setVisible(true);
        hospitalManagement.setLocationRelativeTo(null);// GUI comes in center
        hospitalManagement.setTitle("MediLife Hospital - Home");
        hospitalManagement.setSize(762,500);
    }//GEN-LAST:event_BackButtonActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
      
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new DisplayPatientsFrame();
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton BackButton;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JPanel jPanel1;
    // End of variables declaration//GEN-END:variables
}
