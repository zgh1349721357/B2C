<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/web/header.jsp"%>
<title>订单商品</title>
</head>
<body>
	<fieldset class="layui-elem-field layui-field-title"
		style="margin: 10px; padding: 15px;">
		<legend>订单商品信息</legend>
		<form class="layui-form">
			<div class="layui-form-item">
				<label class="layui-form-label">订单编号</label>
				<div class="layui-input-inline">
					<input type="text" name="orderCode" placeholder="请输入订单编号"
						autocomplete="off" class="layui-input">
				</div>
				<input type="button" class="layui-btn" lay-submit
					lay-filter="order_search" value="查询" />
			</div>
			<input type="hidden" name="pageIndex" value="1" /> <input
				type="hidden" name="pageLimit" value="10" />
		</form>
		<table class="layui-table">
			<thead>
				<tr>
					<th>序号</th>
					<th>订单编号</th>
					<th>商品名称</th>
					<th>数量</th>
					<th>单价</th>
				</tr>
			</thead>
			<tbody id="order_tbody"></tbody>
		</table>
		<div id="pageInfoUser" style="text-align: right; padding-right: 30px"></div>
	</fieldset>

	<script type="text/javascript">
	refresh()
	function refresh() {
	var searchParam={
			orderCode:'<%=request.getParameter("code") == null ? "" : request.getParameter("code")%>',
			pageIndex: $("input[name='pageIndex']").val(),
			pageLimit: $("input[name='pageLimit']").val()
	}
		ajax('/orderprod/list.do',searchParam ,'json', getList);
	}	
	function getList(data) {
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
	    	var orderCode = dom.orderCode?dom.orderCode:'';
	        var spname = dom.spname?dom.spname:'';
	        var count = dom.count?dom.count:'';
	        var price = dom.price?dom.price:'';
	        var d={
	        		i:(i+1+(curr-1)*limit),
	        		orderCode:orderCode,
	        		spname:spname,
	        		count:count,
	        		price:price
	        		};
	        html += getlaytpl('#tradd',d);
	    });
	    $("#order_tbody").html(html);
	}
	init();
	function init(){
	    $("input[value='查询']").click();
	}
	</script>
	<script id="tradd" type="text/html">
	<tr>
	<td>{{ d.i }}</td><td>{{ d.orderCode }}</td>
	<td>{{ d.spname }}</td><td>{{ d.count }}</td>
	<td>{{ d.price }}</td>
	</tr>
	</script>
</body>
</html>