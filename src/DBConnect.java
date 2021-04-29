import java.sql.*;

public class DBConnect {
    
Connection Connect()
{        
    Connection con=null;
    try
       {
           
       String URL="";

       con = (Connection) DriverManager.getConnection(URL);   
       
       System.out.println("Database connection successful");
           
       }
    catch(Exception e) {System.out.println("PostgreSQL Server is not RUNNING:"+e);}

    return con;
}

}
