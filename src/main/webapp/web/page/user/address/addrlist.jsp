<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/web/header.jsp"%>
<title>地址维护</title>
</head>
<body>
<div class="layui-collapse">
  <div class="layui-colla-item">
    <h2 class="layui-colla-title">收货地址-查询条件</h2>
    <div class="layui-colla-content layui-show">
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 0px; padding: 5px">
		<legend>收货地址-查询条件</legend>
		<form class="layui-form">
			<div class="layui-form-item">
				<label class="layui-form-label">用户编号</label>
				<div class="layui-input-inline">
					<input type="text" name="userCode" placeholder="请输入用户编号" autocomplete="off" class="layui-input">
				</div>
				<label class="layui-form-label">姓名</label>
				<div class="layui-input-inline">
					<input type="text" name="name" placeholder="请输入姓名" autocomplete="off" class="layui-input">
				</div>
				<label class="layui-form-label"></label> 
				<span> 
				<input type="button" class="layui-btn" lay-submit lay-filter="addr_search" value="查询" /> 
				<input type="reset" class="layui-btn" value="重置" /> 
				<input type="button" class="layui-btn" value="添加" onclick="openAdd()" />
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
					<th>序号</th><th>用户编号</th><th>收件人</th>
					<th>电话</th><th>省份</th>
					<th>市</th><th>区</th>
					<th>详细地址</th><th>操作</th>
				</tr>
			</thead>
			<tbody id="sp_tbody"></tbody>
		</table>
		<div id="pageInfoUser" style="text-align: right;padding-right: 30px"></div>
	</div>
<script type="text/javascript" src="<%=path%>/layui/layui.all.js"></script>
<script type="text/javascript">
formSubmit('/addr/list.do','submit(addr_search)','json',function(data) {
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
    	var userCode = dom.userCode?dom.userCode:'';
        var name = dom.name?dom.name:'';
        var tel = dom.tel?dom.tel:'';
        var province = dom.province?dom.province:'';
        var city = dom.city?dom.city:'';
        var district = dom.district?dom.district:'';
        var address = dom.address?dom.address:'';
        var d={
        		id:dom.id,
        		i:(i+1+(curr-1)*limit),
        		userCode:userCode,
        		name:name,
        		tel:tel,
        		province:province,
        		city:city,
        		district:district,
        		address:address
        		};
        html += getlaytpl('#tradd',d);
    });
    $("#sp_tbody").html(html);
});
refresh();
function refresh(){
    $("input[value='查询']").click();
}
function openAdd(){
	openLayer('/web/page/user/address/add.jsp',refresh)
}
function openUpd(id){
	openLayer('/web/page/user/address/addrupd.jsp?id='+id,refresh)
}
function delAddr(id){
	openConfirm(function(index){
		ajax('/addr/del.do', {id:id}, 'text', function(data){
	        if (data == 1) {
	            layer.msg('删除成功');
	            $("input[name='pageIndex']").val(1);
	            refresh();
	        } else{
                layer.msg('删除失败');
            }
	    })
	})
}
</script>
<script id="tradd" type="text/html">
<tr>
<td>{{ d.i }}</td><td>{{ d.userCode }}</td><td>{{ d.name }}</td>
<td>{{ d.tel }}</td><td>{{ d.province }}</td>
<td>{{ d.city }}</td><td>{{ d.district }}</td><td>{{ d.address }}</td>
<td>
    <input type='button' value='修改' class='layui-btn' 
           onclick='openUpd("{{ d.id }}")'/>&nbsp;
    <a href="javascript:delAddr('{{ d.id }}')" 
       class="layui-btn layui-btn-xs layui-btn-danger">
        <i class="layui-icon layui-icon-delete"></i></a>&nbsp;
</td>
</tr>
</script>
</body>
</html>