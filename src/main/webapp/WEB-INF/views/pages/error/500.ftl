<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>小票-500</title>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <link href="${request.contextPath}/static/error/css/base.css" rel="stylesheet">
    <link rel="stylesheet" href="${request.contextPath}/static/error/css/error-page.css">
</head>
<body class="page-500">

<div class="mc-error">
    <img src="${request.contextPath}/static/error/images/img-500-page.png" class="img-error" alt="">
    <div class="msg">
        <p class="text">提示：您可能输错了网址，或该网页已删除或不存在，系统将 <em>5</em> 秒后返回首页</p>
        <a href="${request.contextPath}/index.html" class="btn-link"><i></i>返回首页</a>
    </div>
</div>

<script src="${request.contextPath}/static/assets/js/jquery-2.1.4.min.js"></script>
<script>


    jQuery(document).ready(function($) {

        // 倒计时方法
        function countDown(obj){
            var i = 5;
            var $this = $(obj);

            $this.text('5');

            var timer = setInterval(function(){
                if(i > 1){
                    i -= 1;
                    $this.text(i);
                }else{
                    window.location.href = '${request.contextPath}/index.html';
                }
            }, 1000);
        }
        // 调用倒计时
        countDown($('.text').children('em'));

    });



</script>

</body>
</html>