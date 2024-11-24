<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
</head>
<body>
    <h2>회원가입</h2>
    <form action="register" method="post">
        <label for="id">ID:</label>
        <input type="text" id="id" name="id" required><br>
        
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br>
        
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required><br>
        
        <label for="role">Role:</label>
        <input type="text" id="role" name="role" required><br>
        
        <input type="submit" value="회원가입">
    </form>
</body>
</html>
	