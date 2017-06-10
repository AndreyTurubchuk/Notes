<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="container">
     <c:out value="${user}">guest</c:out>
    <c:out value="${headerTitle}">head</c:out>

    <a href="#"
       class="${user}">СТАТУС</a>
</div>