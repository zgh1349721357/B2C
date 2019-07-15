<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/web/header.jsp"%>
<title>员工维护</title>
</head>
<body>
<div class="layui-collapse">
  <div class="layui-colla-item">
    <h2 class="layui-colla-title">商品信息-查询条件</h2>
    <div class="layui-colla-content layui-show">
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 0px; padding: 5px">
		<legend>商品信息-查询条件</legend>
		<form class="layui-form">
			<div class="layui-form-item">
				<label class="layui-form-label">编号</label>
				<div class="layui-input-inline">
					<input type="text" name="code" placeholder="请输入编号" autocomplete="off" class="layui-input">
				</div>
				<label class="layui-form-label">名称</label>
				<div class="layui-input-inline">
					<input type="text" name="name" placeholder="请输入名称" autocomplete="off" class="layui-input">
				</div>
				<label class="layui-form-label"></label> 
				<span> 
				<input type="button" class="layui-btn" lay-submit lay-filter="sp_search" value="查询" /> 
				<input type="reset" class="layui-btn" value="重置" /> 
				<input type="button" class="layui-btn" value="添加" onclick="openSpAdd()" />
				</span>
			</div>
			<input type="hidden" name="pageIndex" value="1" />
			<input type="hidden" name="pageLimit" value="10" />
		</form>
	</fieldset>
	</div></div></div>
	<div class="layui-form">
		<table class="layui-table">
			<colgroup>
				<col width="5%"><col width="10%">
				<col width="10%"><col width="10%">
				<col width="10%"><col width="10%">
                <col width="10%"><col width="10%"><col>
			</colgroup>
			<thead>
				<tr>
					<th>序号</th><th>编号</th><th>名称</th>
					<th>单价</th><th>描述</th>
					<th>库存</th><th>状态</th>
					<th>所属分类</th><th>操作</th>
				</tr>
			</thead>
			<tbody id="sp_tbody"></tbody>
		</table>
		<div id="pageInfoUser" style="text-align: right;padding-right: 30px"></div>
	</div>
<script type="text/javascript" src="<%=path%>/layui/layui.all.js"></script>
<script type="text/javascript">
formSubmit('/prod/list.do','submit(sp_search)','json',function(data) {
    var curr = $("input[name='pageIndex']").val();
    var limit = $("input[name='pageLimit']").val();
    setPageInfo('pageInfoUser',data.count,curr,limit
    		,function(obj, first){
        $("input[name='pageIndex']").val(obj.curr);
        $("input[name='pageLimit']").val(obj.limit);
        if(!first){refresh();}//首次不执行
    })
    var html = "" ;//加载表格中数据
    $.each(data.list,function(i, dom) {
    	var code = dom.code?dom.code:'';
        var name = dom.name?dom.name:'';
        var price = dom.price?dom.price:'';
        var descr = dom.descr?dom.descr:'';
        var count = dom.count?dom.count:'';
        var status = dom.status?dom.status:'';
        var categoryCode = dom.categoryCode?dom.categoryCode:'';
        var d={
        		i:(i+1+(curr-1)*limit),
        		code:code,
        		name:name,
        		price:price,
        		descr:descr,
        		count:count,
        		status:status,
        		categoryCode:categoryCode
        		};
        html += getlaytpl('#tradd',d);
    });
    $("#sp_tbody").html(html);
});
refresh();
function refresh(){
    $("input[value='查询']").click();
}
function openSpAdd(){
	openLayer('/web/page/productinfo/spadd.jsp',refresh)
}
function openSpUpd(code){
	openLayer('/web/page/productinfo/spupd.jsp?code='+code,refresh)
}
function openSpPic(code){
	openLayer('/web/page/productinfo/sppic.jsp?code='+code,refresh)
}
function delSp(code){
	openConfirm(function(index){
		ajax('/prod/del.do', {code:code}, 'text', function(data){
	        if (data == 1) {
	            layer.msg('删除成功');
	            $("input[name='pageIndex']").val(1);
	            refresh();
	        } else if (data == 2){
	            layer.msg('删除失败--账号已被使用');
	        } else if (data == 3){
                layer.msg('删除失败--当前账号不允许删除');
            }
	    })
	})
}
</script>
<script id="tradd" type="text/html">
<tr>
<td>{{ d.i }}</td><td>{{ d.code }}</td><td>{{ d.name }}</td>
<td>{{ d.price }}</td><td>{{ d.descr }}</td>
<td>{{ d.count }}</td><td>{{ d.status }}</td><td>{{ d.categoryCode }}</td>
<td>
    <input type='button' value='修改' class='layui-btn' 
           onclick='openSpUpd("{{ d.code }}")'/>&nbsp;
    <a href="javascript:delSp('{{ d.code }}')" 
       class="layui-btn layui-btn-xs layui-btn-danger">
        <i class="layui-icon layui-icon-delete"></i></a>&nbsp;
	 <input type='button' value='图片维护' class='layui-btn' 
           onclick='openSpPic("{{ d.code }}")'/>
</td>
</tr>
</script>
</body>
</html>