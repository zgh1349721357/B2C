<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/web/header.jsp"%>
<title>订单维护</title>
</head>
<body>
<div class="layui-collapse">
  <div class="layui-colla-item">
    <h2 class="layui-colla-title">订单信息-查询条件</h2>
    <div class="layui-colla-content layui-show">
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 0px; padding: 5px">
		<legend>订单信息-查询条件</legend>
		<form class="layui-form">
			<div class="layui-form-item">
				<label class="layui-form-label">订单编号</label>
				<div class="layui-input-inline">
					<input type="text" name="code" placeholder="请输入订单编号" autocomplete="off" class="layui-input">
				</div>
				<label class="layui-form-label">用户编号</label>
				<div class="layui-input-inline">
					<input type="text" name="name" placeholder="请输入编号" autocomplete="off" class="layui-input">
				</div>
				<label class="layui-form-label"></label> 
				<span> 
				<input type="button" class="layui-btn" lay-submit lay-filter="order_search" value="查询" /> 
				<input type="reset" class="layui-btn" value="重置" /> 
				<input type="button" class="layui-btn" value="添加" onclick="openOrderAdd()" />
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
				<col width="5%"><col width="15%">
				<col width="10%"><col width="15%"><col>
			</colgroup>
			<thead>
				<tr>
					<th>序号</th><th>订单编号</th>
					<th>用户编号</th><th>时间</th>
					<th>收获地址</th><th>状态</th><th>操作</th>
				</tr>
			</thead>
			<tbody id="order_tbody"></tbody>
		</table>
		<div id="pageInfoUser" style="text-align: right;padding-right: 30px"></div>
	</div>
<script type="text/javascript" src="<%=path%>/layui/layui.all.js"></script>
<script type="text/javascript">
formSubmit('/order/list.do','submit(order_search)','json',function(data) {
	console.log("11")
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
        var userCode = dom.userCode?dom.userCode:'';
        var time = dom.time?dom.time:'';
        var addrId = dom.addrId?dom.addrId:'';
        var status = dom.status?dom.status:'';
        var d={
        		i:(i+1+(curr-1)*limit),
        		code:code,
        		userCode:userCode,
        		time:time,
        		addrId:addrId,
        		status:status
        		};
        html += getlaytpl('#tradd',d);
    });
    $("#order_tbody").html(html);
});
refresh();
function refresh(){
    $("input[value='查询']").click();
}
function openOrderAdd(code){
	openLayer('/web/page/order/orderadd.jsp?code='+code,refresh)
}
function openOrderUpd(code){
	openLayer('/web/page/order/orderupd.jsp?code='+code,refresh)
}
function openSpInfo(code){
	openLayer('/web/page/order/spinfo.jsp?code='+code,refresh)
}
function delOrder(code){
	openConfirm(function(index){
		ajax('/order/del.do', {code:code}, 'text', function(data){
	        if (data == 0) {
	        	layer.msg('删除失败');
	        }else if (data == 1){
	        	layer.msg('删除成功');
	            $("input[name='pageIndex']").val(1);
	            refresh();
	        }else if (data == 2){
                layer.msg('删除失败--当前账号不允许删除');
            }
	    })
	})
}
</script>
<script id="tradd" type="text/html">
<tr>
<td>{{ d.i }}</td><td>{{ d.code }}</td>
<td>{{ d.userCode }}</td><td>{{ d.time }}</td>
<td>{{ d.addrId }}</td><td>{{ d.status }}</td>
<td>
    <input type='button' value='修改' class='layui-btn' 
           onclick='openOrderUpd("{{ d.code }}")'/>&nbsp;
    <a href="javascript:delOrder('{{ d.code }}')" 
       class="layui-btn layui-btn-xs layui-btn-danger">
        <i class="layui-icon layui-icon-delete"></i></a>&nbsp;
	<input type='button' value='商品信息' class='layui-btn' 
           onclick='openSpInfo("{{ d.code }}")'/>
</td>
</tr>
</script>
</body>
</html>