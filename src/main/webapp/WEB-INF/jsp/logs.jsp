<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en" class="h-100">
<head>
    <title>Logs</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.auth0.com/js/auth0-samples-theme/1.0/css/auth0-theme.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.css"/>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.15.8/styles/monokai-sublime.min.css"/>
    <style>
        .wrap-table100 {
            margin-right: 164px;
            margin-left: 164px;
        }

        td.details-control {
            background-image: url("https://img.icons8.com/pastel-glyph/2x/plus.png");
            background-position: center;
            background-size: 28px 28px;
            background-repeat: no-repeat;
            cursor: pointer;
        }

        tr.shown td.details-control {
            background-image: url("https://img.icons8.com/pastel-glyph/2x/minus.png");
            background-size: 28px 28px;
            background-repeat: no-repeat;
            background-position: center;
        }
    </style>
</head>

<body>
<div class="h-100 d-flex flex-column">
    <%@include file="fragments/navbar.jspf" %>
    <div id="page">
        <div class="container">
            <div class="row mt-5">
                <div class="col">
                    <h2>Administration Panel</h2>
                    <h3>API Requests Logs</h3>
                    <table id="log_api" class="display" style="width:100%">
                        <thead>
                        <tr>
                            <th>User ID</th>
                            <th>Role</th>
                            <th>Timestamp</th>
                            <th>Method</th>
                            <th>URI</th>
                        </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.15.8/highlight.min.js"></script>
<script>hljs.initHighlightingOnLoad();</script>
<script charset="utf8" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>
<script type="text/javascript">


    function format(d) {
        // `d` is the original data object for the row
        return '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">' +
            '<tr>' +
            '<td>Log:</td>' +
            '<td>' + d + '</td>' +
            '</tr>' +
            '</table>';
    }

    $(document).ready(function () {
        $.ajax({
            type: 'GET',
            url: '${pageContext.request.contextPath}/api/seats/?trainId='+result['trainId'],
            success: function(seats) {

            });
        
        var table = $('#log_api').DataTable({
            "destroy": true,
            "ajax": {
                "url": 'api/logs/api',
                dataSrc: ''
            },
            "columns": [
                { "data" : "userId"},
                { "data" : "role"},
                { "data" : "timestamp"},
                { "data" : "method" },
                { "data" : "uri"
                }],

            "order": [[1, 'asc']]
        });
    });
</script>


</body>
</html>