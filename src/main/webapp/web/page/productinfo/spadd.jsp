<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>商品维护</title>
<%@ include file="/web/header.jsp"%>
</head>
<body>
    <fieldset class="layui-elem-field" style="margin: 20px;padding:15px;">
        <legend>商品维护--添加信息</legend>
    
    <form class="layui-form" method="post">
			<div class="layui-form-item">
				<label class="layui-form-label">一级分类</label>
				<div class="layui-input-inline">
					<select name="parentCode" lay-filter="parentCode1"></select>
				</div>
				<label class="layui-form-label">二级分类</label>
				<div class="layui-input-inline">
					<select name="categoryCode" lay-filter="parentCode2"></select>
				</div>
			</div>
        <div class="layui-form-item">
            <label class="layui-form-label">编号</label>
            <div class="layui-input-inline">
                <input type="text" name="code" lay-verify="required" placeholder="请输入编号" autocomplete="off"
                    class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">名称</label>
            <div class="layui-input-inline">
                <input type="text" name="name" lay-verify="required" placeholder="请输入名称" autocomplete="off"
                    class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">单价</label>
            <div class="layui-input-inline">
                <input type="text" name="price" placeholder="请输入单价" autocomplete="off"
                    class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">库存</label>
            <div class="layui-input-inline">
                <input type="text" name="count" placeholder="请输入库存" autocomplete="off"
                    class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
        	<label class="layui-form-label">状态</label>
            <div class="layui-input-inline">
               	<select name="status" layui-search>
               		<option selected value="已上架">已上架</option>
               		<option value="未上架">未上架</option>
               	</select>
           	</div>
		</div>
		<div class="layui-form-item">
            <label class="layui-form-label">描述</label>
            <div class="layui-input-inline">
                <input type="text" name="descr" placeholder="请输入描述" autocomplete="off"
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
    formSubmit('/prod/add.do', 'submit(add)', 'text', function(data) {
    	if (data == 0) {
            layer.msg('添加成功');
            closeThis(3000);
        } else if (data == 1) {
            layer.msg('编码已存在');
        } else {
            layer.msg('添加失败');
        }
    });
    getSelect('parentCode','type1');
	
	function getSelect(selectid,parentCode){
		if(parentCode==''){
			$("select[name='categoryCode']").empty();
			form.render('select');
			return
		}
		ajax('/dict/all.do', {parentCode:parentCode}, 'json', function(data) {
			console.log(data)
			var html = "<option value=''>请选择</option>";
			$.each(data, function(i, dom) {
				html += "<option value='"+dom.code+"'>"+dom.name+"</option>";
			})
			$("select[name='"+selectid+"']").html(html);
			form.render('select');//刷新select选择框渲染
		})
	}
	form.on('select(parentCode1)',function(data){
		getSelect('categoryCode',data.value);
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