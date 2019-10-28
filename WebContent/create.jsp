<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBPKG.BoardDAO" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css.css?ver=1">
<script>
	function checkInfo(){
		alert("회원가입에 성공하였습니다.");
		document.create.action="createPro.jsp";
		document.create.method="post";
		document.create.submit();
	}
</script>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		BoardDAO dao = BoardDAO.getInstance();
	%>
	<header>
		<div>쇼핑몰 회원관리 ver 1.0</div>
	</header>

	<nav>
		<a href="create.jsp">회원등록</a>
		<a href="search.jsp">회원목록 조회/수정</a>
		<a href="searchSale.jsp">회원매출조회</a>
		<a href="index.jsp">홈으로</a>
	</nav>
	
	<section>
		<h2>홈쇼핑 회원등록</h2>
		<div class="content">
		<form name="create" method="post">
	    	<table border="1">
                <tr>
                    <td>회원번호(자동발생)</td>
                    <td align="left"><input type="text" name="no" value="<%= dao.count()%>"></td>
                </tr>
                <tr>
                    <td>회원성명</td>
                    <td align="left"><input type="text" name="name" id="name" value=""></td>
                </tr>
                <tr>
                    <td>회원전화</td>
                    <td align="left"><input type="text" size="23" width="150px" name="tel" id="phone" value=""></td>
                </tr>
                <tr>
                    <td>회원주소</td>
                    <td align="left"><input type="text" size="26" name="addr" id="addr" value=""></td>
                </tr>
                <tr>
                    <td>가입일자</td>
                    <td align="left"><input type="text" name="joinedDate" id="joinedDate" value="">&nbsp;ex)20191026</td>
                </tr>
                <tr>
                    <td>고객등급</td>
                    <td align="left"><input type="text" name="grade" id="grade" value=""></td>
                </tr>
                <tr>
                    <td>도시코드</td>
                    <td align="left"><input type="text" name="cityCode" id="cityCode" value=""></td>
                </tr>
                <tr>
                    <td colspan="2">
                    	<input type="button" onclick="checkInfo()" value="등록"/>
                    	<input type="reset" value="조회" onclick="location.href='search.jsp'">
                    </td>

                </tr>
            </table>
            </form>
           </div>
	</section>
	
	<footer>
		HRDKOREA Copyright&copy; 2016 All rights reserved. Human Resource Development Service Of Korea.
	</footer>
</body>
</html>