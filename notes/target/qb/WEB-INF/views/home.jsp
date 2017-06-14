<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>Spring MVC - Ajax</title>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <style>
        body {
            background-color: #eee;
        }

        #container {
            width: 500px;
            background-color: #fff;
            margin: 30px auto;
            padding: 30px;
            border-radius: 5px;
            box-shadow: 5px;
        }

        .green {
            font-weight: bold;
            color: green;
        }

        .message {
            margin-bottom: 10px;
        }

        label {
            width: 70px;
            display: inline-block;
        }

        .hide {
            display: none;
        }

        .error {
            color: red;
            font-size: 0.8em;
        }
    </style>
</head>


<body>
<c:url var="myUrl" value="/${pageContext.request.contextPath}/api/person/random}"/>
<div id="container">
    <h1>Note Page</h1>
    <h2>Note info</h2>
    <input type="submit" id="myNote" value="Get Note"/><br/><br/>
    <div id="noteResponse"></div>
    <hr/>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        // AJAX Request
        $('#myNote').click(function () {
            $.getJSON(${myUrl}, function(myNote2) {
                $('#noteResponse').text(myNote2.age);
            });
        });
    });


    /*    $('#randomPerson').click(function() {
     $.getJSON('http://localhost:8080/first4', function(person) {
     $('#personResponse').text(person.name + ', age ' + person.age);
     });
     });*/


</script>

</body>
</html>