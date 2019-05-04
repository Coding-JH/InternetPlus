<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title></title>
    <meta charset="utf-8">
    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<div class="uplodeFront">
    <button class="frontBtn">上传身份证正反照</button>
    <form enctype="multipart/form-data">
        <input type="file" class="front" name="file"/>
    </form>

    <form name="asd" action='http://192.168.1.185:8080/upload/uploadimg'  method="post" enctype ="multipart/form-data">
        <input type="file" name="qwer">
        <input type="submit" value="提交">
    </form>
    <script>
        //上传正面照身份证
        $('.front').on('change', function() {
//            var fileUp = $('#front-form');
//            console.log(fileUp);
//            var sendForm = new FormData(fileUp);
//            console.log(sendForm)
            var foemd = new FormData();
            foemd.append("file",$(".front")[0].files[0]);
            console.log(foemd);
            $.ajax({
                url:'http://192.168.1.185:8080/upload/uploadimg',
                type:'POST',
                data:foemd,
                processData:false,
                contentType:false,
                success:function(response){
                    alert(111)
                },
                xhrFields: {
                    withCredentials: true
                },
                crossDomain: true,
                error: function (obj) {
                    // alert('服务器请求失败');
                }
            })

        });
    </script>
</div>
</body>
</html>