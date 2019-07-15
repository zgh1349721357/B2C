<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/web/header.jsp"%>
<title>主页</title>
</head>
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">主界面</div>
			<ul class="layui-nav layui-layout-left"></ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item">
				    <a href="javascript:;"> 
				        <img src="<%=path%>/img/fei.png"
				        class="layui-nav-img"/>用户[${user.username}]
				    </a>
					<dl class="layui-nav-child">
						<dd>
							<a href="javascript:openUser()">基本资料</a>
						</dd>
						<dd>
							<a href="javascript:openPass()">修改密码</a>
						</dd>
						<dd>
							<a href="javascript:openPic()">修改头像</a>
						</dd>
					</dl>
				</li>
				<li class="layui-nav-item">
				    <a href="javascript:goLogout()">注销</a>
				</li>
			</ul>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree" >
					<li class="layui-nav-item layui-nav-itemed">
					    <a href="javascript:;">用户管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;" data-url="/web/page/user/userlist.jsp"
								class="site-demo-active">用户信息维护</a>								
							</dd>
<!-- 							<dd> -->
<!-- 								<a href="javascript:;" data-url="/web/page/user/address/addrlist.jsp" -->
<!-- 								class="site-demo-active">收货地址维护</a>								 -->
<!-- 							</dd> -->
						</dl>
					</li>
					<li class="layui-nav-item">
					    <a href="javascript:;">商品管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;" class="site-demo-active" data-url="/web/page/productdict/dictlist.jsp"
								class="site-demo-active">商品分类维护</a>
							</dd>
							<dd>
								<a href="javascript:;" class="site-demo-active" data-url="/web/page/productinfo/splist.jsp"
								class="site-demo-active">商品信息维护</a>
							</dd>
						</dl>
					</li>
					<li class="layui-nav-item">
					    <a href="javascript:;">订单管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;" class="site-demo-active" data-url="/web/page/order/orderlist.jsp"
								class="site-demo-active">订单信息维护</a>
							</dd>
						</dl>
					</li>
				</ul>
			</div>
		</div>
		<div class="layui-body"><!-- 内容主体区域 -->
			<iframe name="rightframe" width="99%" height="97%" src="/spring05/web/page/user/userlist.jsp"></iframe>
		</div>
		<div class="layui-footer">© JAVA.com - 底部固定区域</div>
	</div>
<script type="text/javascript" src="<%=path%>/layui/layui.all.js"></script>
<script>
	$('.site-demo-active').click(function() {
		window.open(con.app + $(this).data('url'), "rightframe");
	});
	function openURL(url){
		window.open(con.app + url, "rightframe");
	}
/* 	$('.site-demo-active:first').click(); */
	
	function openUser(){
		openLayer('/web/page/user/userupd.jsp?usercode=${user.usercode}'
			,function(){location.reload();})
	}
	function openPass(){
        openLayer('/web/page/user/userpass.jsp?usercode=${user.usercode}'
       		,function(){})
    }
    function openPic(){
        openLayer('/web/page/user/pic.jsp?usercode=${user.usercode}'
        		,function(){location.reload();})
    }
</script>
</body>
</html>