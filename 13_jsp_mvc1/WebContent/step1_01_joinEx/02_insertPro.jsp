<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertPro</title>
</head>
<body>

	<%-- 
	
		# 데이터 베이스 연동 방법 
		
		1) mysql_connector.jar파일을 WEB-INF안 폴더의 lib에 넣는다. ( 처음셋팅할때 1번만 )
		2) Class.forName("com.mysql.cj.jdbc.Driver"); 을 작성한다. ( 외울필요x , 인터넷에서 복붙o )
		3) DriverManager의 getConnection(db연결정보,연결id,연결password) 메소드를 통하여서 Connection 객체를 생성한다.
		4) 쿼리문을 작성하여 선처리문 객체를 생성한다.
		5) 선처리문 객체를사용하여 쿼리를 웹에서 실행한다.
		
		
		
		# 쉽게 요약한 연동 방법
		
		1) mysql_connector.jar 파일을 lib폴더에 넣는다.
		2) Class.forName 작성
		3) Connection 객체를 작성
		4) Connection 객체로 PrepareStatement 객체를 생성한 후 쿼리문을 실행
		
	--%>

	<% 
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("passwd");
		String nm = request.getParameter("name");
		
		//database connector
		Connection conn = null;
		//query starter
		PreparedStatement pstmt = null;
		
		try{
			
			//forname
			Class.forName("com.mysql.cj.jdbc.Driver");
			// DB 연결 정보 > "jdbc:mysql://연결DB서버주소:프로토콜번호/DB명/시간동기화"
			String url = "jdbc:mysql://localhost:3306/login_ex?serverTimezone=UTC";
			// DB 연결 계정
			String user = "root";
			// DB 연결 비밀번호
			String password = "root";
			// db연동
			conn = DriverManager.getConnection(url,user,password);
			
			//"+id+","+pw+","+nm+"
			//선처리문 쿼리
			String sql = "INSERT INTO MEMBER VALUES(?,?,?,NOW())"; //세미콜론(;) 사용 안함
			
			//선처리문 쿼리 완성
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, nm);
			
			//쿼리문 실행
			pstmt.executeUpdate();
			//executeUpdate() insert, update, delete
			//executeQuery() select
		%>
			<script>
				alert("reg");
				location.href = "00_main.jsp";
			</script>
		<%
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			//db 연동종료
			pstmt.close();
			conn.close();
			
			
		}
		
	%>

</body>
</html>