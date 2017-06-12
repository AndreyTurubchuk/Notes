<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title>Заголовки</title>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
</head>
<body>

<script type="text/javascript">

    function loadData(searchStr) {
        $.getJSON('${pageContext.request.contextPath}/list?findText=' + searchStr, function (note) {
            $('#notes').empty();
            for (var i = 0; i < note.length; i++) {
                $('#notes').append(
                    '<tr>' +
                    '<td>' + note[i].noteId + '</td>' +
                    '<td> <a href="/edit?noteId=' + note[i].noteId + '">' + note[i].reading + '</a>' + '</td>' +
                    '<td>' + note[i].text + '</td>' +
                    '<td>' + new Date(note[i].createdDate) + '</td>' +
                    '<td>' + new Date(note[i].updatedDate) + '</td>' +
                    '<td> <a href="/delete?noteId=' + note[i].noteId + '">' +
                    '<img src="/img/del.png"> </a>' +
                    '</td>' +
                    '</tr>'
                );
            }
        });


    }

    function onSearchClick() {
        var searchStr = $("#idSearch").val();
        loadData(searchStr);
    }


    $(function () {
        loadData('');
    });
</script>

<script type="text/javascript">


</script>

<!-- Bootstrap 4 alpha CSS -->
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
      integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">

<style>
    body {
        padding-top: 1em;
    }
</style>

<div class="container-fluid">
    <div class="table">
        <a href="/add" class="create-btn btn-danger">НОВЫЙ</a>
        <div style="display: inline-block; width: 300px; float: right; margin-top: -5px;">
            <div class="input-group">
                <input type="text" class="form-control" id="idSearch" placeholder="Поиск">
                <div class="input-group-btn">
                    <a class="btn btn-default" title="Поиск"
                       href="#" onclick="onSearchClick(); return false;" role="button">
                        <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                        <i class="glyphicon glyphicon-search"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>


    <table class="table">
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
        <tbody id="notes">
        </tbody>
    </table>
</div>
</body>


</html>
