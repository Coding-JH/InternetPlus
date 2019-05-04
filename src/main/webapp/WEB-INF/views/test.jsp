<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        *{
            margin: 0;
            padding: 0;
        }
        div input{
            margin-left: 40px;

        }
        table{
            margin-top: 40px;
            border-collapse: collapse;
        }
        td{
            width: 150px;
            height: 40px;
            border: 1px solid #000;
            text-align: center;
        }

    </style>
    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
    <script>
        $(function () {
            $("#btn").click(function () {
                var a=$("div input").eq(0).val();
                var b=$("div input").eq(1).val();
                var c=$("div input").eq(2).val();
                var text="<tr><td><input type='checkbox' class='checkItem'></td><td>"+a+"</td>+<td>"+b+"</td>+<td>"+c+"</td><td><button class='sc'>删除</button></td></tr>"
                $("tbody").append(text);
                $(".sc").click(function () {
                    $(this).parents("tr").remove();
                });
            });
            $("#checkAll").click(function(){
                if($(this).is(":checked")){
                    $(".checkItem").prop("checked",true);
                }else{
                    $(".checkItem").prop("checked",false);
                }
            })
        })
    </script>
</head>
<body>
<div>
    <input type="text">姓名
    <input type="text">密码
    <input type="text">邮箱
    <button id="btn">添加</button>
</div>
<table>
    <thead><tr><td><input type="checkbox" id="checkAll"></td><td>姓名</td>
        <td>密码</td><td>邮箱</td><td>操作</td></tr>
    </thead>
    <tbody>

    </tbody>
</table>
</body>
</html>
