<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Board.BoardDO" %>
<%@ page import="Board.BoardDAO" %>

<%
    request.setCharacterEncoding("UTF-8");
    String writer = request.getParameter("writer");
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    BoardDO boardDO = new BoardDO();
    boardDO.setWriter(writer);
    boardDO.setTitle(title);
    boardDO.setContent(content);

    BoardDAO boardDAO = new BoardDAO();
    boardDAO.insertBoard(boardDO);

    response.sendRedirect("getBoardList.jsp");
%>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 등록 처리</title>
</head>
<body>
</body>
</html>
