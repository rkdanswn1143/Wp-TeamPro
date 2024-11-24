<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ page import="Board.BoardDO" %>
<%@ page import="Board.BoardDAO" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
    request.setCharacterEncoding("UTF-8");
    String searchField = "";
    String searchText = "";
    if (request.getParameter("searchCondition") != null && !request.getParameter("searchCondition").isEmpty() &&
        request.getParameter("searchKeyword") != null && !request.getParameter("searchKeyword").isEmpty()) {
        searchField = request.getParameter("searchCondition");
        searchText = request.getParameter("searchKeyword");
    }

    BoardDAO boardDAO = new BoardDAO();
    List<BoardDO> boardList = boardDAO.getBoardList(searchField, searchText);

    request.setAttribute("boardList", boardList);
    request.setAttribute("totalList", boardList.size());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<style>
    #div_box {
        position: absolute;
        top: 10%;
        left: 20%;
    }
</style>
</head>
<body>
    <div id="div_box">
        <h1>전체 게시글 목록 보기</h1>
        <h3>${sessionScope.IdKey}님 환영합니다.&nbsp;&nbsp;&nbsp;<a href="logout_proc.jsp">로그아웃</a></h3>
        <form name="boardListForm" method="POST" action="boardList.jsp">
            <p>총 게시글: ${totalList} 건 </p>
            <table border="1" cellpadding="0" cellspacing="0" width="700">
                <tr>
                    <td align="right">
                        <select name="searchCondition">
                            <option value="TITLE">제목</option>
                            <option value="WRITER">작성자</option>
                            <input name="searchKeyword" type="text" />
                            <input type="submit" value="검색" />
                        </select>
                    </td>
                </tr>
            </table>
        </form>
        <table border="1" cellpadding="0" cellspacing="0" width="700">
            <tr>
                <th bgcolor="skyblue" width="100">번호</th>
                <th bgcolor="skyblue" width="200">제목</th>
                <th bgcolor="skyblue" width="150">작성자</th>
                <th bgcolor="skyblue" width="150">등록일</th>
                <th bgcolor="skyblue" width="100">조회수</th>
            </tr>   
            <c:forEach var="board" items="${boardList}">
                <tr>
                    <td align="center">${board.seq}</td>
                    <td align="left"><a href="boardView.jsp?seq=${board.seq}">${board.title}</a></td>
                    <td align="center">${board.writer}</td>
                    <td align="center">${board.regdate}</td>
                    <td align="center">${board.cnt}</td>
                </tr>      
            </c:forEach>
        </table>
        <br>
        <a href="boardInsertForm.jsp">새 게시글 등록</a>
        <a href="boardList.jsp">전체 게시물 목록 보기</a>&nbsp;&nbsp;&nbsp;
    </div>
</body>
</html>
