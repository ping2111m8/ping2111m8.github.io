<%@ page import = "java.io.*"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="utf-8"%>
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
		String pname = request.getParameter("pname") ;
		String num = request.getParameter("num") ;
		String cash = request.getParameter("cash") ;
		String message;
		try{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		}//try1
		catch (ClassNotFoundException err) {
			out.println("class錯誤" + err.toString());
		}//catch1    
		try{
			Connection conn=DriverManager.getConnection(url,userName,userPasswd);
			Statement stmt = conn.createStatement();
			String sql="SELECT * FROM `products` WHERE `pname`='" +request.getParameter("pname") + "'"  ;
			ResultSet rs = stmt.executeQuery(sql);
			Boolean d = decide(pname ,num ,cash);
			if(d== true){
				if(rs.next()){
					out.println("<SCRIPT LANGUAGE='JavaScript'>");
						message ="已有此商品";
						out.println("alert('"+message+"')");
						out.println("</SCRIPT>");
				}//if(有重複商品)
				else{
					sql="insert products (pname,num,cash) ";
					sql+="value ('" + pname  + "', ";
					sql+="' " + num  +  "', ";
					sql+= "' " +  cash +"')";
					stmt.execute(sql);
					out.println("<SCRIPT LANGUAGE='JavaScript'>");
					message ="新增成功";
					out.println("alert('"+message+"')");
					out.println("</SCRIPT>");
				}//else(insert)
			}//if(有填寫表單)	
			else{
				response.sendRedirect("..\\pages\\after.html");
			}
			conn.close();
			stmt.close();
			rs.close();
		}//try2
		catch (SQLException sExec) {
			out.println(sExec);
		}//catch2
	%>
	</body>
</html>