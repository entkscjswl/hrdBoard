<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBPKG.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css.css?ver=1">

</head>

<body>
<%
	BoardDAO dao= BoardDAO.getInstance();
	ArrayList<BoardDTO> members = dao.memberList();
%>
	<header>
		쇼핑몰 회원관리 ver 1.0
	</header>
		
	
	<nav>
		<a href="create.jsp">회원등록</a>
		<a href="search.jsp">회원목록 조회/수정</a>
		<a href="searchSale.jsp">회원매출조회</a>
		<a href="index.jsp">홈으로.</a>
	</nav>
	
	<section>
		<h2>홈쇼핑 회원등록</h2>
		<div class="content">
	    	<table border="1">
                <tr>
					<th>회원번호</th>
					<th>회원성명</th>
					<th>전화번호</th>
					<th>주소</th>
					<th>가입일자</th>
					<th>고객등급</th>
					<th>거주지역</th>
				</tr>
			<%for(BoardDTO m: members) {%>
				<tr>
					<td><a href="update.jsp?upd=<%=m.getCustno() %>"><%=m.getCustno() %></a></td>
					<td><%=m.getCustname()%></td>
					<td><%=m.getPhone()%></td>
					<td><%=m.getAddress()%></td>
					<td><%=m.getJoindate()%></td>
					<td>
					<%
					if(m.getGrade().equals("A")){
						out.print("VIP");
					}else if(m.getGrade().equals("B")){
						out.print("일반");
					}else if(m.getGrade().equals("C")){
						out.print("직원");
					}
					
					%>
					</td>
					<td><%=m.getCity()%></td>
				</tr>
			<%} %>
            </table>
           </div>
	</section>
	
	<footer>
		HRDKOREA Copyright&copy; 2016 All rights reserved. Human Resource Development Service Of Korea.
	</footer>
</body>
</html>