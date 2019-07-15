<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@page import="com.situ.crm.grant.model.UserCrmModel"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@ include file="/front/header.jsp"%>
		<title>个人中心</title>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/front/css/style.css">
	</head>
	<body>
	<!-- start header -->
		<input type="hidden" name="userCode" value="${userCrm.usercode}">
		<header>
			<div class="top center">
				<div class="right fr">
					<div class="gouwuche fr"><a href="javascript:gowuche();">购物车</a></div>
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
			<a href="/spring05/front/page/home/main.jsp" target="_blank"><div class="logo fl"></div></a>
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
					<input type="hidden" name="pageIndex" value="1" /> 
					<input type="hidden" name="pageLimit" value="10" />
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
					<li><a href="" style="color:#ff6700;font-weight:bold;">我的订单</a></li>
					<li><a href="">意外保</a></li>
					<li><a href="">团购订单</a></li>
					<li><a href="">评价晒单</a></li>
				</ul>
			</div>
			<div class="ddzx">个人中心</div>
			<div class="subddzx">
				<ul>
					<li><a href="/spring05/front/page/user/self_info.jsp">我的个人中心</a></li>
					<li><a href="">消息通知</a></li>
					<li><a href="">优惠券</a></li>
					<li><a href="">收货地址</a></li>
				</ul>
			</div>
		</div>
		<div class="rtcont fr">
			<div class="ddzxbt">交易订单</div>
			<div class="ddxq">
				<div id="tbody"></div>
				<div class="clear"></div>
			</div>
		</div>
		<div class="clear"></div>
		</div>
	</div>
	
<!-- self_info -->
<!-- 	<div id="pageInfoUser" style="text-align: right; padding-right: 100px"></div> -->
		
		<footer class="mt20 center">			
			<div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2014]0059-0009号</div> 
			<div>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>
		</footer>
	</body>
	<script type="text/javascript">
		init()
<%-- 	var orderCode='<%=request.getParameter("orderCode")==null?"":request.getParameter("orderCode") %>'; --%>
		function init() {
			var userCode=$("input[name='userCode']").val();
// 			var pageIndex=$("input[name='pageIndex']").val();
// 			var pageLimit=$("input[name='pageLimit']").val();
			ajax('/order/getList.do',{userCode:userCode},'json',function(data){
				if(data==2){
					layer.msg("请登录");
					location.href="<%=request.getContextPath() %>/front/page/login.jsp";
					return;
				}
// 				var curr = $("input[name='pageIndex']").val();
// 			    var limit = $("input[name='pageLimit']").val();
// 			    setPageInfo('pageInfoUser',data.count,curr,limit,function(obj, first){
// 			        $("input[name='pageIndex']").val(obj.curr);
// 			        $("input[name='pageLimit']").val(obj.limit);
// 			        if(!first){init();}//首次不执行
// 			    })
// 			    var html="";
// 			    $("#tbody").html(html);
				var t='';
				$.each(data.list, function(i,dom){
					console.log(dom.code);
					
// 					t+='<div class="ddspt fl">'+'</div>';
					t+='<div class="ddbh fl">'+'订单号：'+dom.code+'</div>';
					t+='<div class="ztxx fr">'+'<ul>';
					t+='<li>'+dom.status+'</li>'+'<li>账号：'+dom.userCode+'</li>'+'<li>'+dom.time+'</li>';
					t+='<li><a href="javascript:dingdanxiangqing(\''+dom.code+'\');">'+'订单详情'+'</a></li>';
					t+='<div class="clear"></div>';
					t+='</ul></div><div class="clear"></div>';
				});
				$("#tbody").html(t);
			})
		}
	</script>
	<script type="text/javascript">
	function gowuche() {
		location.href='<%=request.getContextPath() %>/front/page/cart/cart.jsp';
	}
	
	function dingdanxiangqing(code) {
		location.href="/spring05/front/page/user/dingdanxiangqing.jsp?code="+code+"";
	}
	</script>
</html>