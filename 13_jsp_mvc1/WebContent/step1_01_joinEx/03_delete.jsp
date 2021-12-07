<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete</title>
</head>
<body>
	<form action="04_deletePro.jsp" method='post'>
		<fieldset>
			<legend>회원삭제</legend>
			<p>id : <input type="text" name="id"/></p>
			<p>pw : <input type="password" name="pw"/></p>
			<p><input type="submit" value="삭제"/></p>
		</fieldset>
	</form>
</body>
</html>