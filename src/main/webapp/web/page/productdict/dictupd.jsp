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
        <legend>商品分类--修改信息</legend>
    <form class="layui-form" lay-filter="upddic" method="post">
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
						lay-verify="required" placeholder="请输入编码" required readonly="readonly"
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
                <input type="button" class="layui-btn" lay-submit lay-filter="upd" value="确定" />
                <input type="button" class="layui-btn" onclick="closeThis()" value="取消" />
            </div>
        </div>
    </form>
    </fieldset>
<script type="text/javascript">
function init(){
    var code = '<%=request.getParameter("code")%>';
	$.ajax({
        url:con.app+'/dict/search.do',
        data : {code:code},
        dataType : 'json',
        type : 'post',
        success : function(data) {
        	console.log(data)
        	form.val("upddic", 
        		{code: data.code,name: data.name,parentCode: data.parentCode,descr: data.descr})
        }
    })
}
formSubmit('/dict/upd.do', 'submit(upd)', 'text', function(data) {
	if (data == 1) {
        layer.msg('修改成功');
        closeThis(3000);
    } else {
        layer.msg('修改失败');
    }
});
ajax('/dict/all.do', {action:'all'}, 'json', function(data){
	var html='';
	$.each(data,function(i,d){
		html+=laytpl($('#opt').html()).render(d);
	})
	$("select[name='parentCode']").html(html);
	form.render();
	init()
})
</script>
<script type="text/html" id="opt">
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