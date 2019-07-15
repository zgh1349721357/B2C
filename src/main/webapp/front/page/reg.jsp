<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<%@ include file="/front/header.jsp"%>
<title>注册</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />

<link rel="stylesheet"
	href="/spring05/front/AmazeUI-2.4.2/assets/css/amazeui.min.css" />
<link href="/spring05/front/css/dlstyle.css" rel="stylesheet"
	type="text/css">
<script src="/spring05/front/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
<script src="/spring05/front/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>

</head>

<body>

	<div class="login-boxtitle">
		<a href="/spring05/front/page/home/main.jsp"><img alt=""
			src="/spring05/front/images/logobig.png" /></a>
	</div>

	<div class="res-banner">
		<div class="res-main">
			<div class="login-banner-bg">
				<span></span><img src="/spring05/front/images/big.jpg" />
			</div>
			<div class="login-box">
			
				<h3 class="title">用户注册</h3>

				<div class="clear"></div>
				
				<form class="layui-form layui-form-pane" method="post">
					<div class="layui-form-item">
						<label class="layui-form-label">账号</label>
						<div class="layui-input-inline">
							<input type="text" name="usercode" class="layui-input"
								lay-verify="required" placeholder="请输入账号" required
								autocomplete="off">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">密码</label>
						<div class="layui-input-inline">
							<input type="password" name="password" class="layui-input"
								lay-verify="required" placeholder="请输入密码" required
								autocomplete="off">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">用户名</label>
						<div class="layui-input-inline">
							<input type="text" name="username" class="layui-input"
								lay-verify="required" placeholder="请输入用户名" required
								autocomplete="off">
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
						<input value="注册" type="button" class="layui-btn" lay-submit lay-filter="reg" /> 
					</div>
					<div class="layui-form-item">
						<input value="重置"  type="reset"  class="layui-btn layui-btn-primary" />
					</div>
					<div class="layui-form-item">
						<input value="返回登陆" type="button" class="layui-btn" onclick="goLogin()" />
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
	function goLogin() {
		location.href = "/spring05/front/page/login.jsp";
	}

	formSubmit('/crm/userReg.do', 'submit(reg)', 'text', function(data) {
		if (data == 0) {
			layer.msg('注册成功');
			$("input[type='reset']").click();
		} else if (data == 1) {
			layer.msg('账号已存在');
		} else if (data == 2) {
			layer.msg('注册失败');
		} else {
			layer.msg('验证码错误');
		}
	});
</script>
<script type="text/javascript">
	layui.use("form", function() {
		var form = layui.form;
		form.render();
	})
</script>
</html>