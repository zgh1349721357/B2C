<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/web/header.jsp"%>
<title>订单维护</title>
</head>
<body>
    <fieldset class="layui-elem-field" style="margin: 20px;padding:15px;">
        <legend>订单--修改信息</legend>
    <form class="layui-form" lay-filter="updorder" method="post">
			<div class="layui-form-item">
				<label class="layui-form-label">订单编号</label>
				<div class="layui-input-inline">
					<input type="text" name="code" class="layui-input"
						lay-verify="required" placeholder="请输入订单编号" required readonly="readonly"
						autocomplete="off">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">用户编号</label>
				<div class="layui-input-inline">
					<input type="text" name="userCode" class="layui-input"
						lay-verify="required" placeholder="请输入用户编号" required
						autocomplete="off">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">时间</label>
				<div class="layui-input-inline">
					<input type="text" name="time" class="layui-input" id="time"
						lay-verify="required" placeholder="请输入描述" required
						autocomplete="off">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">收获地址</label>
				<div class="layui-input-inline">
					<input type="text" name="addrId" class="layui-input"
						lay-verify="required" placeholder="请输入用户编号" required
						autocomplete="off">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">状态</label>
				<div class="layui-input-inline">
					<select name="status">
						<option value="已发货">已发货</option>
						<option value="未发货">未发货</option>
					</select>
				</div>
			</div>
        <div class="layui-form-item">
            <label class="layui-form-label"></label>
            <div class="layui-input-inline">
                <input type="button" class="layui-btn" lay-submit lay-filter="upd" value="确定" />
                <input type="button" class="layui-btn" onclick="closeThis()" value="取消" />
            </div>
        </div>
    </form>
    </fieldset>
<script type="text/javascript">
init()
function init(){
    var code = '<%=request.getParameter("code")%>';
	$.ajax({
        url:con.app+'/order/search.do',
        data : {code:code},
        dataType : 'json',
        type : 'post',
        success : function(data) {
        	form.val("updorder", 
        		{code: data.code,userCode: data.userCode,time: data.time,addrId: data.addrId,status: data.status})
        }
    })
}
formSubmit('/order/upd.do', 'submit(upd)', 'text', function(data) {
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
  	 		elem:'#time',
  	 		type:'date'
  	 	})
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