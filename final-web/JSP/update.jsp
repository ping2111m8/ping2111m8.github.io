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
<%!
	boolean decide( String s1 , String s2 ,String s3){
	boolean mdecide = false;
	if(s1!=null && !s1.equals ("")&& s2!=null && !s2.equals ("")  && s3!=null && !s3.equals("") )	
		mdecide = true; 	 
		return mdecide;
	} // 判斷string 是否為 null or ""
%>
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
	String message;
	String pname =request.getParameter("pname");
	String upname = request.getParameter("upname") ;
	String unum = request.getParameter("unum") ;
	String ucash = request.getParameter("ucash") ;
	try{Class.forName("com.mysql.jdbc.Driver").newInstance();}//try1
	catch (ClassNotFoundException err) {out.println("class錯誤" + err.toString());}//catch1
	try{
		PreparedStatement ps=null;
		Connection conn=DriverManager.getConnection(url,userName,userPasswd);
		Statement stmt = conn.createStatement();
		String sql;
		Boolean d = decide(upname,unum,ucash);
		if(d== true){
			ps	=conn.prepareStatement("UPDATE products SET pname=?, num=? , cash=? where pname =? "); 
			ps.setString(1,upname);
			ps.setString(2,unum);
			ps.setString(3,ucash);
			ps.setString(4,pname);
			int check = ps.executeUpdate();
			if(check > 0 ){
				out.println("修改成功");
			}//if(修改成功)
			else{
				out.println("修改失敗");
			}//else(修改失敗)
		}//if(表單完整)
		else{
			response.sendRedirect("..\\pages\\after.html");				
		}//else		
		conn.close();
		stmt.close();
		ps.close();	
	}//try2
	catch (SQLException sExec) {
		out.println(sExec+"<br>");
	}//catch2
%>
</body>
</html>