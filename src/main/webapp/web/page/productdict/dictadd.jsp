<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>用户维护</title>
<%@ include file="/web/header.jsp"%>
</head>
<body>
	<fieldset class="layui-elem-field" style="margin: 20px; padding: 15px;">
		<legend>商品分类--添加信息</legend>
		
		<form class="layui-form" method="post">
			<div class="layui-form-item">
        		<label class="layui-form-label">所属分类</label>
            	<div class="layui-input-inline">
               		<select name="parentCode" layui-search></select>
           	 	</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">编码</label>
				<div class="layui-input-inline">
					<input type="text" name="code" class="layui-input"
						lay-verify="required" placeholder="请输入编码" required
						autocomplete="off">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">名称</label>
				<div class="layui-input-inline">
					<input type="text" name="name" class="layui-input"
						lay-verify="required" placeholder="请输入名称" required
						autocomplete="off">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">描述</label>
				<div class="layui-input-inline">
					<input type="text" name="descr" class="layui-input"
						lay-verify="required" placeholder="请输入描述" required
						autocomplete="off">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"></label>
				<div class="layui-input-inline">
					<input type="button" class="layui-btn" lay-submit
						lay-filter="add" value="确定" /> <input type="button"
						class="layui-btn" onclick="closeThis()" value="取消" />
				</div>
			</div>
		</form>
	</fieldset>
	<script type="text/javascript">
    formSubmit('/dict/add.do', 'submit(add)', 'text', function(data) {
    	if (data == 0) {
            layer.msg('添加成功');
            closeThis(3000);
        } else if (data == 1) {
            layer.msg('账号已存在');
        } else {
            layer.msg('添加失败');
        }
    });
    ajax('/dict/all.do', {action:'all'}, 'json', function(data){
    	var html='';
    	$.each(data,function(i,d){
    		html+=laytpl($('#opt').html()).render(d);
    	})
    	$("select[name='parentCode']").html(html);
    	form.render();
    })
    </script>
    <script type="text/javascript" id="opt">
    	<option value='{{d.code}}'>{{d.name}}</option>
    </script>
	<script type="text/javascript">
		layui.use("form", function() {
			var form = layui.form;
			form.render();
		})
	</script>
</body>
</html>