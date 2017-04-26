
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <h1>Login Page</h1>
        <form action="j_spring_security_check" method="post">
            <label>User Name :</label>
            <input type="text" name="userName" ><br>
            
            
            <label>Password :</label>
            <input type="password" name="password" ><br>
            
            <label>&nbsp;</label>
            <input type="submit" value="Login">
            
        </form>
        <c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
            <p style="color: red">
                Your login attempt was not successful due to : 
                <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/>
            </p>
        </c:if>
    </body>
</html>
