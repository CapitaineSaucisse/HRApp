<%-- 
    Document   : Edit
    Created on : 03-Mar-2016, 16:50:06
    Author     : keith
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <%@ page import="java.sql.ResultSet" %>
        <jsp:useBean id="empsbean" scope="session" class="hr.DataHandler" />
        <% ResultSet rset = empsbean.getJobs(); %>
        
        <h2 align="center">AnyCo Corporation: HR Application</h2>
        
        <h3 align="left">Insert Employee Record</h3>
                 
          <form action="insert_action.jsp">
        <input type="radio" name="useSP" value="false" checked="checked" />
        Use only JDBC to insert a new record <p/>
        <input type="radio" name="useSP" value="true" />
        Use stored procedure called via JDBC to insert a record
             
             <table border="1">
                     <%--            <thead>
                     <tr>
                         <th></th>
                         <th></th>
                     </tr>      
                 </thead>
      --%>
                 <tbody>
                     <tr>
                         <td>First Name</td>
                         <td><input type="text"   name="first_name"/></td>
                     </tr>
                     <tr>
                         <td>Last Name</td>
                         <td><input type="text" name="last_name"/></td>
                     </tr>
                     <tr>
                         <td>Email</td>
                         <td><input type="text" name="email"/></td>
                     </tr>
                     <tr>
                         <td>Phone</td>
                         <td><input type="text" name="phone_number"/></td>
                     </tr>
                     <tr>
                         <td>Job</td>
                         <td><select name="job_id">
                        <%--     <option value ="SA_REP">Sales Representative</option>
                                 <option value ="HR_REP" >HR Representative</option>
                                 <option value ="PR_REP">PR Representative</option>
                                 <option value ="MK_MAN">Marketing Manager</option>
                                 <option value ="SA_MAN" >Sales Manager</option>
                                 <option value ="FI_MGR">Finance Manager</option>
                                 <option value ="IT_PROG">Software Developer</option>
                                 <option value ="AD_VP">Vice President</option> --%>
                        <%    while (rset.next ()){
                                out.println("<option value=" + rset.getString("job_id") + ">" +
                                rset.getString("job_title") + "</option> ");
                            } %>
                             </select></td>
                     </tr>
                     <tr>
                         <td>Monthly Salary</td>
                         <td><input type="text" name="salary"/></td>
                     </tr>
                 </tbody>
             </table>
                     <input type="submit" value="Add Employee" />  
         </form>
    </body>
</html>
