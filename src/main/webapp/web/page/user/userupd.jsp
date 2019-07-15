<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/web/header.jsp"%>
<title>用户维护</title>
</head>
<body>
    <fieldset class="layui-elem-field" style="margin: 20px;padding:15px;">
        <legend>用户维护--修改信息</legend>
    <form class="layui-form" lay-filter="upduser" method="post">
        <div class="layui-form-item">
				<label class="layui-form-label">账号</label>
				<div class="layui-input-inline">
					<input type="text" name="usercode" class="layui-input"
						lay-verify="required" readonly="readonly" required
						autocomplete="off">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">密码</label>
				<div class="layui-input-inline">
					<input type="password" name="password" class="layui-input"
						lay-verify="required" placeholder="请输入密码" required
						autocomplete="off">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">用户名</label>
				<div class="layui-input-inline">
					<input type="text" name="username" class="layui-input"
						lay-verify="required" placeholder="请输入用户名" required
						autocomplete="off">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">管理员</label>
				<div class="layui-input-inline">
					<input type="text" name="isAdmin" class="layui-input"
						lay-verify="required" readonly="readonly"
						autocomplete="off">
				</div>
			</div>
        <div class="layui-form-item">
            <label class="layui-form-label"></label>
            <div class="layui-input-inline">
                <input type="button" class="layui-btn" lay-submit lay-filter="updUser" value="确定" />
                <input type="button" class="layui-btn" onclick="closeThis()" value="取消" />
            </div>
        </div>
    </form>
    </fieldset>
<script type="text/javascript">
init()
function init(){
    var usercode = '<%=request.getParameter("usercode")%>';
	$.ajax({
        url:con.app+'/user/searchUser.do',
        data : {usercode:usercode},
        dataType : 'json',
        type : 'post',
        success : function(data) {
        	form.val("upduser", 
        		{usercode: data.usercode,password: data.password,username: data.username,isAdmin: data.isAdmin})
        }
    })
}
formSubmit('/user/upd.do', 'submit(updUser)', 'text', function(data) {
	if (data == 1) {
        layer.msg('修改成功');
        closeThis(3000);
    } else {
        layer.msg('修改失败');
    }
});
layui.use('laydate', function(){
		var laydate = layui.laydate;
		laydate.render({
	 		elem:'#entryTime',
	 		type:'date'
	 	})
	})	
</script>
    <script type="text/javascript">
		layui.use("form", function() {
			var form = layui.form;
			form.render();
		})
	</script>
</body>
</html>