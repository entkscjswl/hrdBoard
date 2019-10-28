<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBPKG.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css.css">
<script>
	function checkInfo(){
		alert("수정 완료되었습니다.");
		document.update.action="updatePro.jsp";
		document.update.method="post";
		document.update.submit();
	}
</script>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	BoardDAO dao = BoardDAO.getInstance();
	String upd = request.getParameter("upd");
	BoardDTO vo = dao.readOne(upd); 
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
			<form name="update" method="post">
				<table border="1">
					<tr>
						<td>회원번호</td>
						<td align="left"><input type="text" name="no" id="no" value="<%=vo.getCustno() %>"></td>
					</tr>
					<tr>
                    	<td>회원성명</td>
                    	<td align="left"><input type="text" name="name" id="name" value="<%=vo.getCustname()%>"></td>
	                </tr>
	                <tr>
	                    <td>회원전화</td>
	                    <td align="left"><input type="text" size="23" name="tel" id="phone" value="<%=vo.getPhone()%>"></td>
	                </tr>
	                <tr>
	                    <td>회원주소</td>
	                    <td align="left"><input type="text" size="26" name="addr" id="addr" value="<%=vo.getAddress()%>"></td>
	                </tr>
	                <tr>
	                    <td>가입일자</td>
	                    <td align="left"><input type="text" name="joinDate" id="joinDate" value="<%=vo.getJoindate()%>">&nbsp;ex)20191026</td>
	                </tr>
	                <tr>
	                    <td>고객등급</td>
	                    <td align="left"><input type="text" name="grade" id="grade" value="<%=vo.getGrade()%>"></td>
	                </tr>
	                <tr>
	                    <td>도시코드</td>
	                    <td align="left"><input type="text" name="cityCode" id="cityCode" value="<%=vo.getCity()%>"></td>
	                </tr>
	                <tr>
                    	<td colspan="2">
                        	<input type="button" onclick="checkInfo()" value="수정"/>
                    		<input type="reset" value="조회" onclick="location.href='search.jsp'">
                    	</td>
                	</tr>
				</table>
			</form>
		</div>
	</section>
	<footer>
		RDKOREA Copyright&copy; 2016 All rights reserved. Human Resource Development Service Of Korea.
	</footer>
</body>
</html>