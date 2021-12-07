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
		String nm = request.getParameter("nm");

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet result = null;

		try {
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
				pstmt = conn.prepareStatement("UPDATE MEMBER SET NAME=? WHERE ID=?");
				pstmt.setString(1, nm);
				pstmt.setString(2, id);
				pstmt.executeUpdate();
	%>
	<script>
		alert("수정완료");
		location.href = "07_list.jsp";
	</script>
	<%
		} else {
	%>
	<script>
		alert("아이디와 비밀번호를 확인하세요.");
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