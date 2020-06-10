<%@ page import = "java.io.*"%>
<%@ page contentType="text/html"%>
<%@ page pageEncoding="utf-8"%>
<%@ page language="java" %>
<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="java.sql.*" %>
<html>
	<meta charset="utf-8">
<head></head>
<body>
<%
	request.setCharacterEncoding("UTF-8");//統一編碼 
	//加載驅動程序
	String driverName="com.mysql.jdbc.Driver";
	//數據庫信息
	String userName="root";
	//密碼
	String userPasswd="root";
	//數據庫名
	String dbName="baker";
	//表名
	String tableName="products";
	//將數據庫信息字符串連接成為一個完整的url（也可以直接寫成url，分開寫是明了可維護性強）
	String url="jdbc:mysql://localhost:3306/baker?serverTimezone=UTC";
	String dpname = request.getParameter("dpname") ;
	String sql;
	try{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
	}//try1
	catch (ClassNotFoundException err) {
		out.println("class錯誤" + err.toString());
	}//catch1

	try{
		Connection conn=DriverManager.getConnection(url,userName,userPasswd);
		Statement stmt = conn.createStatement();
		if(dpname!=null && !dpname.equals("")){
			sql = "delete FROM `products` WHERE `pname`='" +dpname + "'"  ;
			int check=stmt.executeUpdate(sql);
			if(check > 0){
				out.println("delete ok");
			}
			else{
				out.println("delete not ok");
			}
		}//if(有填表)
		else{
			response.sendRedirect("..\\pages\\after.html");
		}//else(no write)
		conn.close();
		stmt.close();	
	}//try2
	catch (SQLException sExec) {
		out.println(sExec);
	}//catch2
%>
</body>
</html>	