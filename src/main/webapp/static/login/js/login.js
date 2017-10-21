$(document).keypress(function (e) {
    // 兼容FF和IE和Opera
    var theEvent = e || window.event;
    var code = theEvent.keyCode || theEvent.which || theEvent.charCode;
    if (code == 13) {
        $('input[type="button"]').click();
    }
});

$('input[name="pwd"]').focus(function () {
    $(this).attr('type', 'password');
});
$('input[type="text"]').focus(function () {
    $(this).prev().animate({ 'opacity': '1' }, 200);
});
$('input[type="text"],input[type="password"]').blur(function () {
    $(this).prev().animate({ 'opacity': '.5' }, 200);
});
$('input[name="login"],input[name="pwd"]').keyup(function () {
    var Len = $(this).val().length;
    if (!$(this).val() == '' && Len >= 5) {
        $(this).next().animate({
            'opacity': '1',
            'right': '30'
        }, 200);
    } else {
        $(this).next().animate({
            'opacity': '0',
            'right': '20'
        }, 200);
    }
});
var open = 0;
layui.use('layer', function () {
    //非空验证
    $('input[type="button"]').click(function () {
        var login = $('input[name="login"]').val();
        var pwd = $('input[name="pwd"]').val();
        if (login == '') {
            $('input[name="login"]').focus();
            layer.msg('请输入您的账号');
        } else if (pwd == '') {
            $('input[name="pwd"]').focus();
            layer.msg('请输入密码');
        } else {
            //认证中..
            $('.login').addClass('test'); //倾斜特效
            setTimeout(function () {
                $('.login').addClass('testtwo'); //平移特效
            }, 300);
            setTimeout(function () {
                $('.authent').show().animate({ right: -320 }, {
                    easing: 'easeOutQuint',
                    duration: 600,
                    queue: false
                });
                $('.authent').animate({ opacity: 1 }, {
                    duration: 200,
                    queue: false
                }).addClass('visible');
            }, 500);


            $.ajax({
                url : basePath+"/loginSubmit.html",
                type : "post",
                dataType : "json",
                data : {
                    'loginname' : login,
                    'password' : DES3.encrypt(DES_SECRET_KEY,pwd)
                },
                success : function(data) {
                    setTimeout(function () {
                        $('.authent').show().animate({ right: 90 }, {
                            easing: 'easeOutQuint',
                            duration: 600,
                            queue: false
                        });
                        $('.authent').animate({ opacity: 0 }, {
                            duration: 200,
                            queue: false
                        }).addClass('visible');
                        $('.login').removeClass('testtwo'); //平移特效
                    }, 2000);
                    setTimeout(function () {
                        $('.authent').hide();
                        $('.login').removeClass('test');
                        if (data.success) {
                            //登录成功
//                                   $('.login div').fadeOut(100);
//                                   $('.success').fadeIn(1000);
//                                   $('.success').html("恭喜，登录成功");
                            //跳转操作
                            window.location.href = basePath+'/index.html';
                        } else {
                            switch(data.message){
                                case "account_error":
                                    layer.msg("用户名或密码错误");
                                    break;
                                case "account_lock":
                                    layer.msg("登录失败，账户冻结");
                                    break;
                                case "account_invalid":
                                    layer.msg("登录失败，账户失效");
                                    break;
                                case "no_permission":
                                    layer.msg("登录失败，无权限");
                                    break;
                                default:
                                    layer.msg("登录失败，未知错误");
                                    break;
                            }

                        }
                    }, 2400);
                }
            });
        }
    })
})