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
    <h2 class="layui-colla-title">用户信息-查询条件</h2>
    <div class="layui-colla-content layui-show">
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 0px; padding: 5px">
		<legend>用户信息-查询条件</legend>
		<form class="layui-form">
			<div class="layui-form-item">
				<label class="layui-form-label">账号</label>
				<div class="layui-input-inline">
					<input type="text" name="usercode" placeholder="请输入账号" autocomplete="off" class="layui-input">
				</div>
				<label class="layui-form-label">姓名</label>
				<div class="layui-input-inline">
					<input type="text" name="username" placeholder="请输入姓名" autocomplete="off" class="layui-input">
				</div>
				<label class="layui-form-label"></label> 
				<span> 
				<input type="button" class="layui-btn" lay-submit lay-filter="user_search" value="查询" /> 
				<input type="reset" class="layui-btn" value="重置" /> 
				<input type="button" class="layui-btn" value="添加" onclick="openUserAdd()" />
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
					<th>序号</th><th>账号</th>
					<th>姓名</th><th>是否为管理员</th><th>操作</th>
				</tr>
			</thead>
			<tbody id="user_tbody"></tbody>
		</table>
		<div id="pageInfoUser" style="text-align: right;padding-right: 30px"></div>
	</div>
<script type="text/javascript" src="<%=path%>/layui/layui.all.js"></script>
<script type="text/javascript">
formSubmit('/user/list.do','submit(user_search)','json',function(data) {
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
    	var usercode = dom.usercode?dom.usercode:'';
        var username = dom.username?dom.username:'';
        var isAdmin = dom.isAdmin?dom.isAdmin:'';
        var d={
        		i:(i+1+(curr-1)*limit),
        		usercode:usercode,
        		username:username,
        		isAdmin:isAdmin
        		};
        html += getlaytpl('#tradd',d);
    });
    $("#user_tbody").html(html);
});
refresh();
function refresh(){
    $("input[value='查询']").click();
}
function openUserAdd(){
	openLayer('/web/page/user/add.jsp',refresh)
}
function openUserUpd(usercode){
	openLayer('/web/page/user/userupd.jsp?usercode='+usercode,refresh)
}
function openUserPas(usercode){
    openLayer('/web/page/user/userpass.jsp?usercode='+usercode,refresh)
}
function openPic(usercode){
	openLayer('/web/page/user/pic.jsp?usercode='+usercode,refresh)
}
function delUser(usercode){
	openConfirm(function(index){
		ajax('/user/del.do', {usercode:usercode}, 'text', function(data){
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
<td>{{ d.i }}</td><td>{{ d.usercode }}</td>
<td>{{ d.username }}</td><td>{{ d.isAdmin }}</td>
<td>
    <input type='button' value='修改' class='layui-btn' 
           onclick='openUserUpd("{{ d.usercode }}")'/>&nbsp;
    <a href="javascript:delUser('{{ d.usercode }}')" 
       class="layui-btn layui-btn-xs layui-btn-danger">
        <i class="layui-icon layui-icon-delete"></i></a>&nbsp;
    <input type='button' class='layui-btn' value='重置密码' 
           onclick='openUserPas("{{ d.usercode }}")'/>
</td>
</tr>
</script>
</body>
</html>