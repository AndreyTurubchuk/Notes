<%--
 Главная табличная форма
 Новая заметка - нажатие "НОВЫй"
 Редактирование - нажатие на заголовке заметки
 Удаление - нажатие на значке "корзина"
 Поиск заметки - внести значение поиска и нажать на кнопку "Поиск"
--%>

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

    // Ajax
    // фукнкция заполнения табличных данных на форме noteList
    // парсинг данных, данные приходят в формате JSON
    // получаем от сервера список из БД по поисковому значению searchStr
    // если searchStr пусто - выводим всю таблицу, иначе фильтр по searchStr
        function loadData(searchStr) {
        $.getJSON('${pageContext.request.contextPath}/list?findText=' + searchStr, function (note) {
            $('#notes').empty();
            for (var i = 0; i < note.length; i++) {
                $('#notes').append(
                    '<tr>' +
                    '<td>' + note[i].noteId + '</td>' +
                    '<td> <a title="Редактирование заметки" href="/edit?noteId=' + note[i].noteId + '">' + note[i].reading + '</a>' + '</td>' +
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

    //функция поиска, стартует при нажатии кнопки "поиск" на форме noteList
    //idSearch - значение переменной поиска
    function onSearchClick() {
        var searchStr = $("#idSearch").val();
        loadData(searchStr);
    }

    //функция заполнения данных формы noteList, стартует автоматически при загрузке
    $(function () {
        loadData('');
    });
</script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<style>
    body {
        padding-top: 1em;
    }
</style>


<%--// форма добавления заметки и поиска данных по значению --%>
<div class="container-fluid">
    <div class="table">
        <a href="/add" class="create-btn btn-danger">НОВЫЙ</a>
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


    <%--главная таблица--%>
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
