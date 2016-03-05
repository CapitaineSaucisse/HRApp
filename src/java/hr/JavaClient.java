/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hr;
import java.sql.ResultSet;
/**
 *
 * @author keith
 */
public class JavaClient {
 public static void main(String[] args) throws Exception{
    DataHandler datahandler = new DataHandler();
   // ResultSet rset = datahandler.getAllEmployees();
ResultSet rset = datahandler.getEmployeesByName("King");
System.out.println("\nResults from query: ");
while (rset.next()) {
System.out.println(rset.getInt(1) + " " +
rset.getString(2) + " " +
rset.getString(3) + " " +
rset.getString(4));
}

 }
 }   

