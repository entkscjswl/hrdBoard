<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBPKG.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	String no = request.getParameter("no");
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	String addr = request.getParameter("addr");
	String joinDate = request.getParameter("joinDate");
	String grade = request.getParameter("grade");
	String cityCode = request.getParameter("cityCode");
	
	BoardDAO dao = BoardDAO.getInstance();
	BoardDTO vo = new BoardDTO();
	vo.setAddress(addr);
	vo.setCity(cityCode);
	vo.setCustname(name);
	vo.setCustno(no);
	vo.setGrade(grade);
	vo.setJoindate(joinDate);
	vo.setPhone(tel);
	dao.update(vo);
	%>
<script>
location.href="search.jsp";
</script>
</body>
</html>