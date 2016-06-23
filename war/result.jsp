<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);
String username = null;
String userName = null;
if(session.getAttribute("username") != null || session.getAttribute("name") != null){
	username = (String) session.getAttribute("username");
	userName = (String) session.getAttribute("name");
}
else {
	response.sendRedirect("login.jsp");
	
	}
/* if(session.getAttribute("username") == null){
    response.sendRedirect("login.jsp");
}else username = (String) session.getAttribute("username"); */

String sessionID = null;
Cookie[] cookies = request.getCookies();
if(cookies !=null){
for(Cookie cookie : cookies){
    if(cookie.getName().equals("name")) 
    	userName = cookie.getValue();
    if(cookie.getName().equals("username"))
    	username = cookie.getValue();
    if(cookie.getName().equals("JSESSIONID")) sessionID = cookie.getValue();
}
}else{
    sessionID = session.getId();
}


String name = request.getParameter("name1");

out.println("Thank you "+" "+ name +" "+"for Donating Blood.");

%>

	<br><button type="submit" onclick="window.location.href='homepage.jsp'">Home</button>

</body>
</html>