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
        <legend>用户维护--修改密码</legend>
    
    <form class="layui-form" method="post">
        <div class="layui-form-item">
            <label class="layui-form-label">账号</label>
            <div class="layui-input-inline">
                <input type="text" name="usercode" readonly lay-verify="required" placeholder="请输入账号" autocomplete="off"
                    class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-inline">
                <input type="password" name="password" lay-verify="required" placeholder="请输入新密码" autocomplete="off"
                    class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"></label>
            <div class="layui-input-inline">
                <input type="button" class="layui-btn" lay-submit lay-filter="pasUser" value="确定" />
                <input type="button" class="layui-btn" onclick="closeThis()" value="取消" />
            </div>
        </div>
    </form>
    </fieldset>
    <script type="text/javascript">
    $("input[name='usercode']").val('<%=request.getParameter("usercode")%>');
    formSubmit('/user/pasUser.do', 'submit(pasUser)', 'text', function(data) {
    	if (data == 1) {
            layer.msg('修改成功');
            closeThis(3000);
        } else {
            layer.msg('修改失败');
        }
    });
    </script>
</body>
</html>