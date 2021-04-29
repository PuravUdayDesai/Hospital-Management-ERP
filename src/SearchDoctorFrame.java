import javax.swing.*; 
import java.sql.*;   
import javax.swing.table.DefaultTableModel;
import java.awt.*;

public class SearchDoctorFrame extends javax.swing.JFrame {
    JFrame f;
    JTable table;
    String columns[];
    Connection con=null;
    ResultSet rs=null;
    Statement stmt=null;
    ResultSetMetaData md;
    CallableStatement pst;
    boolean status = true;
  
    public SearchDoctorFrame() {
        initComponents();
        this.setSize(762,500);
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        SearchDoctorBackground = new javax.swing.JPanel();
        SearchDoctorTitle = new javax.swing.JLabel();
        SearchDoctorTitle1 = new javax.swing.JLabel();
        BackButton = new javax.swing.JButton();
        DoctorNameSearchField = new javax.swing.JTextField();
        searchButton = new javax.swing.JButton();
        ClearButton = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        SearchDoctorBackground.setBackground(new java.awt.Color(0, 153, 255));

        SearchDoctorTitle.setBackground(new java.awt.Color(0, 0, 0));
        SearchDoctorTitle.setFont(new java.awt.Font("Arial", 1, 14)); // NOI18N
        SearchDoctorTitle.setText("Enter the Name of the Doctor : ");

        SearchDoctorTitle1.setBackground(new java.awt.Color(0, 0, 0));
        SearchDoctorTitle1.setFont(new java.awt.Font("Arial", 1, 18)); // NOI18N
        SearchDoctorTitle1.setText("Search Doctor");

        BackButton.setBackground(new java.awt.Color(255, 255, 255));
        BackButton.setFont(new java.awt.Font("Arial", 1, 18)); // NOI18N
        BackButton.setText("Back");
        BackButton.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));
        BackButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BackButtonActionPerformed(evt);
            }
        });

        DoctorNameSearchField.setFont(new java.awt.Font("Arial", 1, 14)); // NOI18N
        DoctorNameSearchField.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0), 2));

        searchButton.setBackground(new java.awt.Color(255, 255, 255));
        searchButton.setFont(new java.awt.Font("Arial", 1, 14)); // NOI18N
        searchButton.setText("Search");
        searchButton.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0), 2));
        searchButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                searchButtonActionPerformed(evt);
            }
        });

        ClearButton.setFont(new java.awt.Font("Arial", 1, 14)); // NOI18N
        ClearButton.setText("Clear");
        ClearButton.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0), 2));
        ClearButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                ClearButtonActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout SearchDoctorBackgroundLayout = new javax.swing.GroupLayout(SearchDoctorBackground);
        SearchDoctorBackground.setLayout(SearchDoctorBackgroundLayout);
        SearchDoctorBackgroundLayout.setHorizontalGroup(
            SearchDoctorBackgroundLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(SearchDoctorBackgroundLayout.createSequentialGroup()
                .addGroup(SearchDoctorBackgroundLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                    .addGroup(SearchDoctorBackgroundLayout.createSequentialGroup()
                        .addGap(134, 134, 134)
                        .addGroup(SearchDoctorBackgroundLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(SearchDoctorTitle)
                            .addComponent(ClearButton, javax.swing.GroupLayout.PREFERRED_SIZE, 203, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(18, 18, 18)
                        .addGroup(SearchDoctorBackgroundLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(searchButton, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(DoctorNameSearchField, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 203, Short.MAX_VALUE)))
                    .addGroup(SearchDoctorBackgroundLayout.createSequentialGroup()
                        .addGap(24, 24, 24)
                        .addComponent(BackButton, javax.swing.GroupLayout.PREFERRED_SIZE, 78, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(SearchDoctorTitle1)
                        .addGap(141, 141, 141)))
                .addContainerGap(193, Short.MAX_VALUE))
        );
        SearchDoctorBackgroundLayout.setVerticalGroup(
            SearchDoctorBackgroundLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(SearchDoctorBackgroundLayout.createSequentialGroup()
                .addGap(23, 23, 23)
                .addGroup(SearchDoctorBackgroundLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(SearchDoctorTitle1)
                    .addComponent(BackButton, javax.swing.GroupLayout.PREFERRED_SIZE, 33, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(107, 107, 107)
                .addGroup(SearchDoctorBackgroundLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(DoctorNameSearchField, javax.swing.GroupLayout.PREFERRED_SIZE, 28, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(SearchDoctorTitle))
                .addGap(84, 84, 84)
                .addGroup(SearchDoctorBackgroundLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(searchButton, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(ClearButton, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(220, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(SearchDoctorBackground, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 454, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(SearchDoctorBackground, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 108, Short.MAX_VALUE))
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

    private void searchButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_searchButtonActionPerformed
          String searchedName = DoctorNameSearchField.getText();  
           if(searchedName.equals(""))
        {
            status =false;
            JOptionPane.showMessageDialog(this, "Dear User Please enter the Name to be Searched",
                "Validation Error", JOptionPane.ERROR_MESSAGE);
        }
           try{
               
Class.forName("org.postgresql.Driver");

String url="";
con=DriverManager.getConnection(url);  
                
                pst = (CallableStatement) con.prepareCall("SELECT * FROM public.fn_search_doctor(?);");
                
                pst.setString(1,searchedName);
           
             rs = pst.executeQuery();

DefaultTableModel model = new DefaultTableModel();
String cols[]={"Doctor_id", "doctor_name", "doctor_age", "doctor_gender","doctor_specialization","doctor_experience","doctor_contact_number"};
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

	  String doctor_id = ""; 
	  String name = ""; 
	  String age = "";
	  Boolean gender=false;
	  String specialization="";
	  Integer experience ;
          String d_phone_no = "";
       
	  
	  while(rs.next())
	  {
	  	
	  	doctor_id=rs.getString("doctor_id");
	  	name=rs.getString("doctor_name");
		age=rs.getString("doctor_age");
		gender=rs.getBoolean("doctor_gender");
		specialization=rs.getString("doctor_specialization");
                experience=rs.getInt("doctor_experience");
                d_phone_no = rs.getString("doctor_contact_number");
                System.out.println("Record Found");
                
               
		 model.addRow(new Object[]{doctor_id,name,age,gender,specialization,experience,d_phone_no});
	  }	

	 
   if(status == true)
        {
        f=new JFrame(); 
        f.setLayout(new BorderLayout());   
        f.add(scroll);   
        f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        f.setBackground(Color.blue);
         f.setSize(762,500);    
         f.setVisible(true); 
        }
        else
        {
            f.setVisible(false); 
        } 

}
catch(Exception e){
System.out.println(e.getMessage());
}
                
    }//GEN-LAST:event_searchButtonActionPerformed

    private void ClearButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_ClearButtonActionPerformed
         DoctorNameSearchField.setText("");
    }//GEN-LAST:event_ClearButtonActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(SearchDoctorFrame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(SearchDoctorFrame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(SearchDoctorFrame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(SearchDoctorFrame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new SearchDoctorFrame().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton BackButton;
    private javax.swing.JButton ClearButton;
    private javax.swing.JTextField DoctorNameSearchField;
    private javax.swing.JPanel SearchDoctorBackground;
    private javax.swing.JLabel SearchDoctorTitle;
    private javax.swing.JLabel SearchDoctorTitle1;
    private javax.swing.JButton searchButton;
    // End of variables declaration//GEN-END:variables
}
