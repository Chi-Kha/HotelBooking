
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>${action}</h1>
        
        <mvc:form action="${pageContext.request.contextPath}/admin/${action}" modelAttribute="users" method="post">
            <table>
                <mvc:input path="id" type="hidden"/> 
                <tr>
                    <td>Enter Name: (*)</td>
                    <td><mvc:input path="userName" type="text" required="true"/></td>
                </tr>
                <tr>
                    <td>Email : </td>
                    <td><mvc:input path="password" type="text" required="true"/></td>
                </tr>
                <tr>
                    <td>Address: (*) </td>
                    <td><mvc:select path="users.userRole" >
                            <mvc:option value="ROLE_ADMIN" label="Role admin"/>
                            <mvc:option value="ROLE_USER" label="Role User"/>
                        </mvc:select>></td>
                </tr>
                <tr>
                    <td>Phone (*) </td>
                    <td><mvc:input path="phone" type="text" required="true"/></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="submit" />
                    </td>
                </tr>
            </table>
        </mvc:form>
    </body>
</html>
