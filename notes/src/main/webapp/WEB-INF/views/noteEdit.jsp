<%--
  Created by IntelliJ IDEA.
  User: AnTur
  Date: 06.06.2017
  Time: 20:42
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- Bootstrap 4 alpha CSS -->
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
      integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">


<head>
    <title>Редатирование заголовка</title>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
</head>
<body>

<script type="text/javascript">
    $(function () {
        $.getJSON('${pageContext.request.contextPath}/getEditJSON?noteId=${note.noteId}', function (note) {
            $('#noteId').val(note.noteId);
            $('#noteId2').text(note.noteId);
            $('#inputReading').val(note.reading);
            $('#inputText').val(note.text);
            $('#createdDate').text(new Date(note.createdDate));
            $('#updatedDate').text(new Date(note.updatedDate));
        });

    });
</script>


<div class="container">
    <style>
        body {
            padding-top: 1em;
        }
    </style>

    <div class="container-fluid">
        <sf:form method="post" id="noteForm" action="/edit">
            <input type="hidden" name="noteId" value="" id="noteId">
            <div class="form-group">
                <label class="control-label col-sm-3">Номер заголовка</label>
                <div class="col-sm-4">
                    <p class="form-control-static" id="noteId2"></p>
                </div>
            </div>

            <div class="form-group">
                <label for="inputReading" class="control-label col-sm-3">Название заголовка</label>
                <input name="reading" id="inputReading" class="form-control" placeholder="Название заголовка"
                       value="" required autofocus/>
            </div>

            <div class="form-group">
                <label for="inputText" class="control-label col-sm-3">Текст заголовка</label>
                <input name="text" id="inputText" class="form-control" placeholder="Текст заголовка"
                       value="" required autofocus/>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-3">Дата создания</label>
                <div class="col-sm-4">
                    <p class="form-control-static" id="createdDate"></p>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-3">Дата редактирования</label>
                <div class="col-sm-4">
                    <p class="form-control-static" id="updatedDate"></p>
                </div>
            </div>

            <div class="form-group">
                <div class="control-label col-sm-3"></div>
                <a href="#" onclick="document.forms['noteForm'].submit();" class="btn-save pull-left">СОХРАНИТЬ</a>
                <a href="/" class="btn-close pull-right">ЗАКРЫТЬ</a>
            </div>
        </sf:form>
    </div>
</div>
</body>
</html>

