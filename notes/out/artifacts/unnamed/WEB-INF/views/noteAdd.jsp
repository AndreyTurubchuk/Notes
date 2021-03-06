<%--
  Форма добавления заметки
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- Bootstrap 4 alpha CSS -->
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
      integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">


<head>
    <title>Новый заголовок</title>
</head>
<body>

<div class="container">
    <style>
        body {
            padding-top: 1em;
        }
    </style>

    <div class="container-fluid">
        <sf:form method="post" id="noteForm" action="/add">
            <div class="form-group">
                <label for="inputReading" class="control-label col-sm-3">Название заголовка</label>
                <input name="reading" id="inputReading" class="form-control" placeholder="Название заголовка" required
                       autofocus/>
            </div>
            <div class="form-group">
                <label for="inputText" class="control-label col-sm-3">Текст заголовка</label>
                <input name="text" id="inputText" class="form-control" placeholder="Текст заголовка" required
                       autofocus/>
            </div>
            <div class="form-group">
                <div class="control-label col-sm-3"></div>
                <a href="#" onclick="document.forms['noteForm'].submit();" class="btn-save pull-left">СОХРАНИТЬ</a>
                <a href="/"
                   class="btn-close pull-right">ЗАКРЫТЬ</a>
            </div>
        </sf:form>
    </div>
</div>
</body>
</html>


