<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.situ.crm.grant.model.UserCrmModel"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>小米商城-个人中心</title>
		<link rel="stylesheet" type="text/css" href="/spring05/front/css/style.css">
	</head>
	<body>
	<!-- start header -->
		<header>
			<div class="top center">
				<div class="right fr">
					<div class="gouwuche fr"><a href="/spring05/front/page/user/dingdan.jsp">我的订单</a></div>
					<div class="fr">
						<ul>
						<%
							Object obj = session.getAttribute("userCrm");
							if(obj==null){
						%>
						<li><a href="/spring05/front/page/login.jsp">登录</a></li>
						<li><a href="/spring05/front/page/reg.jsp">注册</a></li>
						<%}else{UserCrmModel userCrm = (UserCrmModel)obj; %>
						<li><a href="javascript:dingdan();">我的订单[<%=userCrm.getUsername() %>]</a></li>
						<li>|</li>
						<li><a href="javascript:goLogout();">注销</a></li>
						<%} %>
						</ul>
					</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
		</header>
	<!--end header -->
	<!-- start banner_x -->
		<div class="banner_x center">
			<a href="./index.html" target="_blank"><div class="logo fl"></div></a>
			<a href=""><div class="ad_top fl"></div></a>
			<div class="nav fl">
				<ul>
						<li><a href="/spring05/front/page/home/main.jsp">商城首页</a></li>
						<li><a href="#">巧克力</a></li>
						<li><a href="#">坚果</a></li>
						<li><a href="#">糖果</a></li>
						<li><a href="#">服务</a></li>
						<li><a href="#">社区</a></li>
				</ul>
			</div>
			<div class="search fr">
				<form action="<%=request.getContextPath()%>/front/page/product/list.jsp" method="post">
					<div class="text fl">
						<input type="text" class="shuru" name="name" placeholder="请输入关键字">
					</div>
					<div class="submit fl">
						<input type="submit" class="sousuo" value="搜索"/>
					</div>
					<div class="clear"></div>
				</form>
				<div class="clear"></div>
			</div>
		</div>
<!-- end banner_x -->
<!-- self_info -->
	<div class="grzxbj">
		<div class="selfinfo center">
		<div class="lfnav fl">
			<div class="ddzx">订单中心</div>
			<div class="subddzx">
				<ul>
					<li><a href="/spring05/front/page/user/dingdan.jsp" >我的订单</a></li>
					<li><a href="">意外保</a></li>
					<li><a href="">团购订单</a></li>
					<li><a href="">评价晒单</a></li>
				</ul>
			</div>
			<div class="ddzx">个人中心</div>
			<div class="subddzx">
				<ul>
					<li><a href="/spring05/front/page/user/self_info.jsp" style="color:#ff6700;font-weight:bold;">我的个人中心</a></li>
					<li><a href="">消息通知</a></li>
					<li><a href="">优惠券</a></li>
					<li><a href="">收货地址</a></li>
				</ul>
			</div>
		</div>
		<div class="rtcont fr">
			<div class="grzlbt ml40">我的资料</div>
			<div class="subgrzl ml40"><span>用户名</span><span>啦啦维吉尔</span><span><a href="">编辑</a></span></div>
			<div class="subgrzl ml40"><span>帐号</span><span>15669097417</span><span><a href="">编辑</a></span></div>
			<div class="subgrzl ml40"><span>密码</span><span>************</span><span><a href="">编辑</a></span></div>
<!-- 			<div class="subgrzl ml40"><span>个性签名</span><span>一支穿云箭，千军万马来相见！</span><span><a href="">编辑</a></span></div> -->
<!-- 			<div class="subgrzl ml40"><span>我的爱好</span><span>游戏，音乐，旅游，健身</span><span><a href="">编辑</a></span></div> -->
<!-- 			<div class="subgrzl ml40"><span>收货地址</span><span>浙江省杭州市江干区19号大街571号</span><span><a href="">编辑</a></span></div> -->
			
		</div>
		<div class="clear"></div>
		</div>
	</div>
<!-- self_info -->
		
		<footer class="mt20 center">			
			<div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2014]0059-0009号</div> 
			<div>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>
		</footer>
	</body>
	<script type="text/javascript">
		function init() {
			var code='<%=request.getParameter("userCode") %>';
			$.ajax({
	        	url:con.app+'/crm/search.do',
	       	 	data : {userCode:code},
	        	dataType : 'json',
	        	type : 'post',
	       		success : function(data){
	       			
	       		}
			})
		}
	</script>
</html>