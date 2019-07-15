<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<%@ include file="/front/header.jsp"%>
<title>登录</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />

<link rel="stylesheet"
	href="/spring05/front/AmazeUI-2.4.2/assets/css/amazeui.css" />
<link href="/spring05/front/css/dlstyle.css" rel="stylesheet"
	type="text/css">
</head>

<body>

	<div class="login-boxtitle">
		<a href="/spring05/front/page/home/main.jsp"><img alt="logo"
			src="/spring05/front/images/logobig.png" /></a>
	</div>

	<div class="login-banner">
		<div class="login-main">
			<div class="login-banner-bg">
				<span></span><img src="/spring05/front/images/big.jpg" />
			</div>
			<div class="login-box">

				<h3 class="title">登录商城</h3>

				<div class="clear"></div>

				<form class="layui-form layui-form-pane" method="post">
					<div class="layui-form-item">
						<label class="layui-form-label">账号：</label>
						<div class="layui-input-inline">
							<input type="text" name="usercode" required lay-verify="required"
								placeholder="请输入账号" autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">密码：</label>
						<div class="layui-input-inline">
							<input type="password" name="password" required
								lay-verify="required" placeholder="请输入密码" autocomplete="off"
								class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label"> 
						<img src="<%=request.getContextPath()%>/authController/auth.do"
							onclick="this.src='<%=request.getContextPath()%>/authController/auth.do?'+Math.random();" />
						</label>
						<div class="layui-input-inline">
							<input type="text" name="authCode" lay-verify="required"
								placeholder="请输入验证码" autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<input type="button" class="layui-btn" value="登录" lay-submit
							lay-filter="login" />

					</div>
					<div class="layui-form-item">
						<input type="reset" class="layui-btn layui-btn-primary" value="重置" />
					</div>
					<div class="layui-form-item">
						<input type="button" class="layui-btn" value="注册"
							onclick="goReg()" />
					</div>
				</form>
			</div>
		</div>
	</div>


	<div class="footer ">
		<div class="footer-hd ">
			<p>
				<a href="# ">恒望科技</a> <b>|</b> <a href="# ">商城首页</a> <b>|</b> <a
					href="# ">支付宝</a> <b>|</b> <a href="# ">物流</a>
			</p>
		</div>
		<div class="footer-bd ">
			<p>
				<a href="# ">关于恒望</a> <a href="# ">合作伙伴</a> <a href="# ">联系我们</a> <a
					href="# ">网站地图</a> <em>© 2015-2025 Hengwang.com 版权所有</em>
			</p>
		</div>
	</div>
</body>
<script type="text/javascript">
	formSubmit('/crm/login.do', 'submit(login)', 'text', function(data) {
		if (data == 0) {
			location.href = con.app + "/front/page/home/main.jsp";
		} else if (data == 1) {
			layer.msg('账号不存在');
		} else if (data == 2){
			layer.msg('密码错误');
		} else {
			layer.msg('验证码错误')
		}
	});
</script>
<script type="text/javascript">
	function goReg() {
		location.href = "/spring05/front/page/reg.jsp";
	}
</script>
</html>