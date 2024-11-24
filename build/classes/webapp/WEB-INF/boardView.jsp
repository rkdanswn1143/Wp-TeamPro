<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Board.BoardDO" %>
<%@ page import="Board.BoardDAO" %>

<%
    request.setCharacterEncoding("UTF-8");
    int seq = Integer.parseInt(request.getParameter("seq"));

    BoardDAO boardDAO = new BoardDAO();
    BoardDO boardDO = new BoardDO();
    boardDO.setSeq(seq);
    BoardDO board = boardDAO.getBoard(boardDO);

    request.setAttribute("board", board);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 보기</title>
</head>
<body>
    <h1>게시글 보기</h1>
    <table border="1" cellpadding="0" cellspacing="0" width="700">
        <tr>
            <th bgcolor="skyblue" width="100">번호</th>
            <td align="center">${board.seq}</td>
        </tr>
        <tr>
            <th bgcolor="skyblue" width="200">제목</th>
            <td align="left">${board.title}</td>
        </tr>
        <tr>
            <th bgcolor="skyblue" width="150">작성자</th>
            <td align="center">${board.writer}</td>
        </tr>
        <tr>
            <th bgcolor="skyblue" width="150">내용</th>
            <td align="left">${board.content}</td>
        </tr>
        <tr>
            <th bgcolor="skyblue" width="150">등록일</th>
            <td align="center">${board.regdate}</td>
        </tr>
        <tr>
            <th bgcolor="skyblue" width="100">조회수</th>
            <td align="center">${board.cnt}</td>
        </tr>
    </table>
    <br>
    <a href="boardList.jsp">목록으로</a>
</body>
</html>
