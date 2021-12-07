<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet result = null;

		try {
			// j = java, db = database, c = connect
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/login_ex?serverTimezone=UTC";
			String user = "root";
			String password = "root";

			conn = DriverManager.getConnection(url, user, password);
			pstmt = conn.prepareStatement("SELECT * FROM MEMBER WHERE ID=? AND PASSWD=?");
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			result = pstmt.executeQuery();

			if (result.next()) {
				pstmt = conn.prepareStatement("DELETE FROM MEMBER WHERE ID = ?");
				pstmt.setString(1, id);
				pstmt.executeUpdate();
	%>
	<script>
		alert("탈퇴완료");
		location.href = "00_main.jsp";
	</script>
	<%
		} else {
	%>
	<script>
		alert("아이디와 비밀번호를 확인하세요.");
		/* 
		
			# 한페이지 이전으로 이동하는 자바스크립트 메서드
			history.back();
			history.go(-1);
		
			+@)
			history.forward(); 한 페이지 앞으로 이동
			history.go(-2);	   두 페이지 이전으로 이동
			history.go(-3);    세 페이지 이전으로 이동
		 */
		history.go(-1);
	</script>
	<%
		}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
			pstmt.close();
			result.close();
		}
	%>
</body>
</html>