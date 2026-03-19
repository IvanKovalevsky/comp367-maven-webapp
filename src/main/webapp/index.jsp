<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.time.LocalTime" %>
<!DOCTYPE html>
<html>
<head>
  <title>COMP367</title>
</head>
<body>
<%
    LocalTime now = LocalTime.now();
    boolean isMorning = now.isBefore(LocalTime.NOON);
    String greetings = isMorning ? "Good morning, " : "Good afternoon, ";
%>
<h1><%= greetings%> Ivan Kovalevsky. Welcome to COMP367</h1>

</body>
</html>