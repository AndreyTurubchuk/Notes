<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  Created by IntelliJ IDEA.
  User: AnTur
  Date: 04.06.2017
  Time: 22:44
  To change this template use File | Settings | File Templates.
--%>

<html>
<head>
    <title>Заголовки</title>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
</head>
<body>

<script type="text/javascript">
    function onSearchClick() {
        var searchStr = $("#idSearch").val();
        document.location.href = "/noteList/list?findText=" + searchStr;
    }
</script>

<script type="text/javascript">
    function confirmDeletion(id, name) {
        if (confirm("Вы действительно хотите удалить " + name + " № " + id + " ?")) {
            return true;
        } else {
            return false;
        }
    }
</script>

<!-- Bootstrap 4 alpha CSS -->
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
      integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">

<style>
    body {
        padding-top: 1em;
    }
</style>

<c:url var="root_url" value="/"/>

<div class="container-fluid">
    <div class="table">
        <a href="${root_url}noteList/add" class="create-btn btn-danger">НОВЫЙ</a>
        <%--<input type="submit" id="myNote" value="ОБНОВИТЬ"/><br/><br/>--%>


        <div style="display: inline-block; width: 300px; float: right; margin-top: -5px;">
            <div class="input-group">
                <input type="text" class="form-control" id="idSearch" placeholder="Поиск">
                <div class="input-group-btn">
                    <a class="btn btn-default" title="Поиск"
                       href="#" onclick="onSearchClick(); return false;" role="button">
                        <i class="glyphicon glyphicon-search"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <table class="table" id="notes">
        <thead>
        <tr>
            <th style="width: 5%">#</th>
            <th style="width: 20%"><a href="#"> ЗАГОЛОВОК</a></th>
            <th style="width: 25%"><a href="#">ТЕКСТ</a></th>
            <th style="width: 20%"><a href="#">ДАТА СОЗДАНИЯ</a></th>
            <th style="width: 20%"><a href="#">ДАТА МОДИФИКАЦИИ</a></th>
            <th style="width: 10%"><a href="#">УДАЛИТЬ</a></th>
        </tr>
        </thead>


                <%--<c:forEach items="${notes}" var="lists" step="1" varStatus="loopStatus">--%>
<%--                    <td>notes[1].noteId</td>
        <tr class="${loopStatus.index % 2 == 0 ? 'alt' : ''}">
                        <td><a href="#"                              >
                            <img src="/WEB-INF/views/img/del.png" width="25" height="22"> </a></td>
                    </tr>--%>
                <%--</c:forEach>--%>

        <%--
                    <tr class="${loopStatus.index % 2 == 0 ? 'alt' : ''}">
                        <td><c:out value="${lists.noteId}"/></td>
                        <td>
                            <a title="Редактирование запроса"
                               href="/noteList/edit?noteId=${lists.noteId}">
                                <c:out value="${lists.reading}"/>
                            </a>
                        </td>
                        <td><c:out value="${lists.text}"/></td>
                        <td><c:out value="${lists.createdDate}"/></td>
                        <td><c:out value="${lists.updatedDate}"/></td>
                        <td><a href="/noteList/delete?noteId=${lists.noteId}"
                               onclick="return confirmDeletion(${lists.noteId}, 'заголовок')">
                            <img src="/WEB-INF/views/img/del.png" width="25" height="22"> </a></td>
                    </tr>--%>


    </table>
</div>
</body>

<script type="text/javascript">
    $(function () {
        $.getJSON('${pageContext.request.contextPath}/noteList/list', function (note) {
            for (var i = 0; i < note.length; i++) {
                $('#notes').append(
                    '<tr>' +
                    '<td>' + note[i].noteId + '</td>' +
                    '<td>' + note[i].reading + '</td>' +
                    '<td>' + note[i].text + '</td>' +
                    '<td>' + new Date(note[i].createdDate) + '</td>' +
                    '<td>' + new Date(note[i].updatedDate) + '</td>' +
                    '<td>' +

                    '<td> <a href="/noteList/delete?noteId=' + note[i].noteId + '">' +
                                    '<img src="/img/del.png" width="25" height="22"> </a></td>' +
                '</tr>'
                );
            }
        });
    });
</script>
</html>
