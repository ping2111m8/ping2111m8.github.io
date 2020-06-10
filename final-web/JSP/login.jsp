<%@ page import = "java.io.*"%>
<%@ page contentType="text/html"%>
<%@ page pageEncoding="utf-8"%>
<%@ page language="java" %>
<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="java.sql.*" %>
<html>
	<meta charset="utf-8">
<head>
	<title></title>
</head>
<body>
<%
	String driverName="com.mysql.jdbc.Driver";//加載驅動程序
	String userName="root";//數據庫信息
	String userPasswd="root";//密碼
	String dbName="baker";//數據庫名
	String tableName="customers";//表名
	String url="jdbc:mysql://localhost:3306/baker?serverTimezone=UTC";//將數據庫信息字符串連接成為一個完整的url（也可以直接寫成url，分開寫是明了可維護性強）
	String user = request.getParameter("user");
	String ups  =  request.getParameter("pwd");
	Connection conn;
	Statement stmt;
	ResultSet rs;
	try{Class.forName("com.mysql.jdbc.Driver").newInstance();}//try1
	catch (ClassNotFoundException err) {out.println("class錯誤" + err.toString());}//catch1
	conn=DriverManager.getConnection(url,userName,userPasswd);
	stmt= conn.createStatement();    
	rs = stmt.executeQuery("select * from customers where cname ='"+user+"' and ps='"+ ups +"'"); 
	try{
		if(request.getParameter("user").equals("1")&& request.getParameter("pwd").equals("1") ) {
			response.sendRedirect("..\\pages\\after.html");
		}
		else{
			if(rs.next()){
				out.println("登入成功");
			}
			//if(rs.next())
			else{
				out.println("登入失敗" +"<br>"+user +"<br>"+ ups);
			}
		}//else(not spuser)
	}//try2
	catch (SQLException sExec) {
		out.println(sExec+"<br>");
	}//catch2
%>
</body>
</html>



