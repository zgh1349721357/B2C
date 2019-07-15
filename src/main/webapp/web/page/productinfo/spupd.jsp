<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/web/header.jsp"%>
<title>商品维护</title>
</head>
<body>
    <fieldset class="layui-elem-field" style="margin: 20px;padding:15px;">
        <legend>商品维护--修改信息</legend>
    <form class="layui-form" lay-filter="updsp" method="post">
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
                <input type="text" name="code" readonly="readonly" placeholder="请输入编号" autocomplete="off"
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
                <input type="button" class="layui-btn" lay-submit lay-filter="upd" value="确定" />
                <input type="button" class="layui-btn" onclick="closeThis()" value="取消" />
            </div>
        </div>
    </form>
    </fieldset>
<script type="text/javascript">
getSelect('parentCode','type1');

function getSelect(selectid,parentCode){
	if(parentCode==''){
		$("select[name$=Code]").empty();
		form.render('select');
		return
	}
	ajax('/dict/all.do', {parentCode:parentCode}, 'json', function(data) {		
		var html = '';
		$.each(data, function(i, dom) {
			html += "<option value='"+dom.code+"'>"+dom.name+"</option>";
		})
		$("select[name='"+selectid+"']").html(html);
		
		form.render('select');//刷新select选择框渲染
		init()
	})
}
form.on('select(parentCode1)',function(data){
	getSelect('categoryCode',data.value);
});

function init(){
    var code = '<%=request.getParameter("code")%>';
	$.ajax({
        url:con.app+'/prod/search.do',
        data : {code:code},
        dataType : 'json',
        type : 'post',
        success : function(data) {
        	ajax('/dict/all.do', {parentCode:data.code1}, 'json', function(data11) {		
        		var html = '';
        		$.each(data11, function(i, dom) {
        			html += "<option value='"+dom.code+"'>"+dom.name+"</option>";
        		})
        		$("select[name='categoryCode']").html(html);
        		form.render('select');//刷新select选择框渲染
        	form.val("updsp", 
        		{code: data.code,name: data.name,price: data.price,descr: data.descr,count:data.count,status: data.status,categoryCode: data.categoryCode,parentCode:data.code1})
        	})
        }
    })
}
formSubmit('/prod/upd.do', 'submit(upd)', 'text', function(data) {
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
		layui.use("form", function() {
			var form = layui.form;
			form.render();
		})
	</script>
	 <script type="text/html" id="opt">
    	<option value='{{d.code}}'>{{d.name}}</option>
    </script>
</body>
</html>