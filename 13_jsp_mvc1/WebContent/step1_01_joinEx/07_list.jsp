<%@page import="java.util.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원리스트</h2>
	<table border='1'>
		<tr>
			<th>id</th>
			<th>password</th>
			<th>name</th>
			<th>join date</th>
		</tr>
		<%
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet result = null;
			
			try{
				// j = java, db = database, c = connect
				Class.forName("com.mysql.cj.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/login_ex?serverTimezone=UTC";
				String user = "root";
				String password = "root";
				
				conn = DriverManager.getConnection(url,user,password);
				pstmt = conn.prepareStatement("SELECT * FROM MEMBER");
				result = pstmt.executeQuery();
				
				
				/*
				
				# db의 컬럼명을 가져 오는 2가지 방법
			
				1) rs.get자료형메서드("컬럼명");
				  
					ex) 
						rs.getString("PRODUCT_CD"); 
						rs.getInt("PRODUCT_PRICE");
						rs.getDate("REG_DATE");
				
						
				2) rs.get자료형메서드(index);
					
					ex) 
						rs.getString(1);
						rs.getInt(2);
						rs.getDate(3);
				
					- 유지보수 및 가독성 향상을 위해서 컬럼명지정 방식을 권장한다.
					- index가 1부터 시작되는 점을 유의해야 한다.
			
				*/
			
				
				//select 결과물에 1row가 있으면
				while(result.next()){
					String id = result.getString("id"); //result.getString(1);
					String pw = result.getString("passwd"); //result.getString(2);
					String nm = result.getString("name"); //result.getString(3);
					Date date = result.getDate("join_date"); //result.getDate(4);
					
					%>
					<tr>
						<td><%=id %></td>
						<td><%=pw %></td>
						<td><%=nm %></td>
						<td><%=date %></td>
					</tr>
					<%
					
				}
				
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				conn.close();
				pstmt.close();
				result.close();
			}
		%>
	</table>

</body>
</html>