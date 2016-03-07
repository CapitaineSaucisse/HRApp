/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hr;
import java.sql.CallableStatement;
import oracle.jdbc.OracleTypes;
/**
 *
 * @author keith
 */


import java.sql.Connection;
import java.sql.SQLException;
import oracle.jdbc.pool.OracleDataSource;
import java.sql.Statement;
import java.sql.ResultSet;
import javax.servlet.http.HttpSession;


public class DataHandler implements java.io.Serializable {
public DataHandler() {
}
private String jdbcUrl = null;
private String userid = null;
private String password = null;
private Connection conn;
private Statement stmt;
private ResultSet rset;
private String query;
private String sqlString;

public void getDBConnection() throws SQLException{
OracleDataSource ds;
ds = new OracleDataSource();
/*jdbcUrl = "jdbc:oracle:thin:@localhost:1521:XE";
userid = "hr";
password = "hr";
jdbcUrl = "jdbc:oracle:thin:@localhost:1521:XE";*/

/*userid = null;
password = null;
jdbcUrl = null; */

ds.setURL(jdbcUrl);
conn=ds.getConnection(userid,password);
}
public ResultSet getAllEmployees() throws SQLException{
getDBConnection();
stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
ResultSet.CONCUR_READ_ONLY);
query = "SELECT * FROM Employees ORDER BY employee_id";
System.out.println("\nExecuting query: " + query);
rset = stmt.executeQuery(query);
return rset;
}

public ResultSet getEmployeesByName(String name) throws SQLException {

    name = name.toUpperCase();

    getDBConnection();
    stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
    ResultSet.CONCUR_READ_ONLY);
query =
"SELECT * FROM Employees WHERE UPPER(first_name) LIKE \'%" + name + "%\'" +
" OR UPPER(last_name) LIKE \'%" + name + "%\' ORDER BY employee_id";

    System.out.println("\nExecuting query: " + query);

// Run the query and return a result set as before:
    rset = stmt.executeQuery(query);
    return rset;
}

public boolean authenticateUser(String jdbcUrl, String userid, String password,
HttpSession session) throws SQLException {
    
this.jdbcUrl= jdbcUrl;
this.userid = userid;
this.password = password;

try {
OracleDataSource ds;
ds = new OracleDataSource();
ds.setURL(jdbcUrl);
conn = ds.getConnection(userid, password);
return true;}
catch ( SQLException ex ) {
System.out.println("Invalid user credentials");
session.setAttribute("loginerrormsg", "Invalid Login. Try Again...");
this.jdbcUrl = null;
this.userid = null;
this.password = null;
return false;
}
}

public Employee findEmployeeById(int id) throws SQLException {

Employee selectedEmp = new Employee();

try{
getDBConnection();
stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
ResultSet.CONCUR_READ_ONLY);
query = "SELECT * FROM Employees WHERE employee_id = " + id;

System.out.println("\nExecuting: " + query);

rset = stmt.executeQuery(query);

while (rset.next()) {
selectedEmp.setEmployeeId(new Integer(rset.getInt("employee_id")));
selectedEmp.setFirstName(rset.getString("first_name"));
selectedEmp.setLastName(rset.getString("last_name"));
selectedEmp.setEmail(rset.getString("email"));
selectedEmp.setPhoneNumber(rset.getString("phone_number"));
selectedEmp.setHireDate(rset.getDate("hire_date"));
selectedEmp.setSalary(new Double(rset.getDouble("salary")));
selectedEmp.setJobId(rset.getString("job_id"));
}
return selectedEmp;}
catch ( SQLException ex ){
logException(ex);
return null;}       
finally {
closeAll();
}
}


public String updateEmployee(int employee_id, String first_name,
String last_name, String email,
String phone_number, String salary,
String job_id) {
try{
Employee oldEmployee = findEmployeeById(employee_id);
getDBConnection();
stmt =
conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
ResultSet.CONCUR_READ_ONLY);

StringBuffer columns = new StringBuffer( 255 );

if ( first_name != null &&
!first_name.equals( oldEmployee.getFirstName() ) )
{
columns.append( "first_name = '" + first_name + "'" );
}
if ( last_name != null &&
!last_name.equals( oldEmployee.getLastName() ) ) {
if ( columns.length() > 0 ) {
columns.append( ", " );
}
columns.append( "last_name = '" + last_name + "'" );
}
if ( email != null &&
!email.equals( oldEmployee.getEmail() ) ) {
if ( columns.length() > 0 ) {
columns.append( ", " );
}
columns.append( "email = '" + email + "'" );
}
if ( phone_number != null &&
!phone_number.equals( oldEmployee.getPhoneNumber() ) ) {
if ( columns.length() > 0 ) {
columns.append( ", " );
}
columns.append( "phone_number = '" + phone_number + "'" );
}
if ( salary != null &&
!salary.equals( oldEmployee.getSalary().toString() ) ) {
if ( columns.length() > 0 ) {
columns.append( ", " );
}
columns.append( "salary = '" + salary + "'" );
}
if ( job_id != null &&
!job_id.equals( oldEmployee.getJobId() ) ) {
if ( columns.length() > 0 ) {
columns.append( ", " );
}
columns.append( "job_id = '" + job_id + "'" );
}
if ( columns.length() > 0 )
{
sqlString =
"UPDATE Employees SET " + columns.toString() +
" WHERE employee_id = " + employee_id;
System.out.println("\nExecuting: " + sqlString);
stmt.execute(sqlString);
}
else
{
System.out.println( "Nothing to do to update Employee Id: " +
employee_id);
}
return "success";}
catch ( SQLException ex ){
logException( ex );
return "failure";}
finally {
closeAll();
}
}


public String addEmployee(String first_name,
String last_name, String email,
String phone_number, String job_id, int salary)  {
try{
    stmt =
conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
ResultSet.CONCUR_READ_ONLY);
sqlString =
"INSERT INTO Employees VALUES (EMPLOYEES_SEQ.nextval, '" +
first_name + "','" +
last_name + "','" +
email + "','" +
phone_number + "'," +
"SYSDATE, '" +
job_id + "', " +
salary + ",.30,100,80)";

System.out.println("\nInserting: " + sqlString);

stmt.execute(sqlString);
return "success";}
catch ( SQLException ex ){
logException( ex );
return "failure";}
finally {
closeAll();
}
}

public String deleteEmployeeById(int id) {

try{
getDBConnection();    
stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
ResultSet.CONCUR_READ_ONLY);
sqlString = "DELETE FROM Employees WHERE employee_id = " + id;
System.out.println("\nExecuting: " + sqlString);
stmt.execute(sqlString);
return "success";}
catch ( SQLException ex ){
logException( ex );
return "failure";
}
finally {
closeAll();
}
}

public void logException( SQLException ex )
{
      int count = 1;
      while (ex != null) {
        System.out.println("SQLException " + count);
        System.out.println("Code: " + ex.getErrorCode());
        System.out.println("SqlState: " + ex.getSQLState());
        System.out.println("Error Message: " + ex.getMessage());
        ex = ex.getNextException();
        count++;
      }
}

public String addEmployeeSP(String first_name, String last_name,
String email, String phone_number, String job_id,
int salary) throws SQLException {
try {
getDBConnection();
sqlString = "begin hr.insert_employee(?,?,?,?,?,?); end;";
CallableStatement callstmt = conn.prepareCall(sqlString);
callstmt.setString(1, first_name);
callstmt.setString(2, last_name);
callstmt.setString(3, email);
callstmt.setString(4, phone_number);
callstmt.setString(5, job_id);
callstmt.setInt(6, salary);
System.out.println("\nInserting with stored procedure: " +
sqlString);
callstmt.execute();
return "success";
}
catch ( SQLException ex ) {
logException( ex );
return "failure";
}
}
public ResultSet getJobs() throws SQLException {
try {
getDBConnection();
String jobquery = "begin ? := get_jobs; end;";
CallableStatement callStmt = conn.prepareCall(jobquery);
callStmt.registerOutParameter(1, OracleTypes.CURSOR);
callStmt.execute();
rset = (ResultSet)callStmt.getObject(1);
} catch ( SQLException ex ) {
logException( ex );
}
return rset;
}
public void closeAll() {
if ( rset != null ) {
try { rset.close();
}
catch ( Exception ex ) {}
rset = null;
}
if ( stmt != null ) {
try {
stmt.close();
}
catch ( Exception ex ) {}
stmt = null;
}
if ( conn != null ) {
try {
conn.close();
}
catch ( Exception ex ) {}
conn = null;
}
}
}

