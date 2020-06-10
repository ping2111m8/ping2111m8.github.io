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
	if(s1!=null && !s1.equals ("") && s2!=null && !s2.equals ("") && s3!=null && !s3.equals("") )	
		mdecide = true; 	  
		return mdecide;
	} // 判斷string 是否為 null or ""
%>
<%
	String message;
	String email  = request.getParameter("email");
	String cname = request.getParameter("cname");
	String cps = request.getParameter("cps");
	String rps = request.getParameter("rps");
	//加載驅動程序
	String driverName="com.mysql.jdbc.Driver";
	//數據庫信息
	String userName="root";
	//密碼
	String userPasswd="root";
	//數據庫名
	String dbName="baker";
	//表名
	String tableName="customers";
	//將數據庫信息字符串連接成為一個完整的url（也可以直接寫成url，分開寫是明了可維護性強）
	String url="jdbc:mysql://localhost:3306/baker?serverTimezone=UTC";
	try{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
	}
	catch (ClassNotFoundException err) {
		out.println("class錯誤" + err.toString());
	}    
	try{
		Connection conn=DriverManager.getConnection(url,userName,userPasswd);
		Statement stmt = conn.createStatement();
		String sql="SELECT * FROM `customers` WHERE `cname`='" +request.getParameter("cname") + "'"  ;
		ResultSet rs = stmt.executeQuery(sql);
		Boolean d = decide(email,cname,cps);
		if(d== true){
			if(cps.equals(rps)){
				if(rs.next()){
					out.println("<SCRIPT LANGUAGE='JavaScript'>");
					message ="重複註冊";
					out.println("alert('"+message+"')");
					out.println("</SCRIPT>");	
				}//if(檢查rg有無重複)  
				else {
					sql="insert customers (cname,ps,cemail) ";
					sql+="value ('" + cname  + "', ";
					sql+="' " + cps  +  "', ";
					sql+= "' " +  email +"')";
					stmt.execute(sql);
					out.println("<SCRIPT LANGUAGE='JavaScript'>");
					message ="註冊成功";
					out.println("alert('"+message+"')");
					out.println("</SCRIPT>");	
				}//else
			}//if(確認密碼相符)
			else{
				out.println("<SCRIPT LANGUAGE='JavaScript'>");
				message ="確認密碼不符";
				out.println("alert('"+message+"')");
				out.println("</SCRIPT>");	
			}//else
		}//if(表單有填)
		else{response.sendRedirect("..\\pages\\register.html");}
		conn.close();
		stmt.close();
		rs.close();
	} //try
	catch (SQLException sExec) {
		out.println(sExec);
	}
%>
</body>
</html>