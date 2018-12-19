layui.use(['form','layer','jquery'],function(){
    var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : top.layer
        $ = layui.jquery;

    $(".loginBody .seraph").click(function(){
    	layer.alert('企业内部系统能用第三方登录？老老实实去注册吧', 
    			  {icon:6,title:'想啥呢o((⊙﹏⊙))o!',offset:'rb',shade:0,anim: 5,time:5000,btn:['去注册']},
        function(){
            window.location.href = "index.jsp#contact";
        });
    })

    //登录按钮
    /*form.on("submit(login)",function(data){
        $(this).text("登录中...").attr("disabled","disabled").addClass("layui-disabled");
        setTimeout(function(){
        },1000);
    })*/

    //表单输入效果
    $(".loginBody .input-item").click(function(e){
        e.stopPropagation();
        $(this).addClass("layui-input-focus").find(".layui-input").focus();
    })
    $(".loginBody .layui-form-item .layui-input").focus(function(){
        $(this).parent().addClass("layui-input-focus");
    })
    $(".loginBody .layui-form-item .layui-input").blur(function(){
        $(this).parent().removeClass("layui-input-focus");
        if($(this).val() != ''){
            $(this).parent().addClass("layui-input-active");
        }else{
            $(this).parent().removeClass("layui-input-active");
        }
    })
})
