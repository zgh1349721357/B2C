<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>地址维护</title>
<%@ include file="/web/header.jsp"%>
</head>
<body>
    <fieldset class="layui-elem-field" style="margin: 20px;padding:15px;">
        <legend>收货地址--添加信息</legend>
    
    <form class="layui-form" method="post">
        <div class="layui-form-item">
            <label class="layui-form-label">用户编号</label>
            <div class="layui-input-inline">
                <input type="text" name="userCode" lay-verify="required" placeholder="请输入用户编号" autocomplete="off"
                    class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">收件人</label>
            <div class="layui-input-inline">
                <input type="text" name="name" lay-verify="required" placeholder="请输入收件人" autocomplete="off"
                    class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">电话</label>
            <div class="layui-input-inline">
                <input type="text" name="tel" lay-verify="required" placeholder="请输入电话" autocomplete="off"
                    class="layui-input">
            </div>
        </div>
                <div class="layui-form-item">
            <label class="layui-form-label">省份</label>
            <div class="layui-input-inline">
                <input type="text" name="province" lay-verify="required" placeholder="请输入省份" autocomplete="off"
                    class="layui-input">
            </div>
        </div>
                <div class="layui-form-item">
            <label class="layui-form-label">市</label>
            <div class="layui-input-inline">
                <input type="text" name="city" lay-verify="required" placeholder="请输入市" autocomplete="off"
                    class="layui-input">
            </div>
        </div>
        
        <div class="layui-form-item">
            <label class="layui-form-label">区</label>
            <div class="layui-input-inline">
                <input type="text" name="district" placeholder="请输入区" autocomplete="off"
                    class="layui-input">
            </div>
        </div>
		<div class="layui-form-item">
            <label class="layui-form-label">详细地址</label>
            <div class="layui-input-inline">
                <input type="text" name="address" placeholder="请输入详细地址" autocomplete="off"
                    class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"></label>
            <div class="layui-input-inline">
                <input type="button" class="layui-btn" lay-submit lay-filter="add" value="确定" />
                <input type="button" class="layui-btn" onclick="closeThis()" value="取消" />
            </div>
        </div>
    </form>
    </fieldset>
    <script type="text/javascript">
    formSubmit('/addr/add.do', 'submit(add)', 'text', function(data) {
    	if (data == 0) {
            layer.msg('添加成功');
            closeThis(3000);
        } else if (data == 1) {
            layer.msg('编码已存在');
        } else {
            layer.msg('添加失败');
        }
    });
    </script>
    <script type="text/javascript">
		layui.use("form", function() {
			var form = layui.form;
			form.render();
		})
	</script>
</body>
</html>