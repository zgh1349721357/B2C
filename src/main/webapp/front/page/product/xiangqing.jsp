<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.situ.crm.grant.model.UserCrmModel"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@ include file="/front/header.jsp"%>
		<title>商品详情</title>
		<link rel="stylesheet" type="text/css" href="/spring05/front/css/style.css">
	</head>
	<body>
	<!-- start header -->
		<header>
			<div class="top center">
				<div class="right fr">
					<div class="gouwuche fr"><a href="javascript:gouwuche();">购物车</a></div>
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
			<a href="<%=request.getContextPath()%>/front/page/home/main.jsp" target="_blank"><div class="logo fl"></div></a>
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
				<form action="<%=request.getContextPath()%>/front/page/product/list.jsp" method="get">
					<div class="text fl">
						<input type="text" class="shuru"  placeholder="请输入关键字" />
					</div>
					<div class="submit fl">
						<button class="sousuo" name="name">搜索</button>
					</div>
					<div class="clear"></div>
				</form>
				<div class="clear"></div>
			</div>
		</div>
<!-- end banner_x -->

	
	<!-- xiangqing -->
	<form action="post" method="">
	<div class="xiangqing">
		<div class="neirong w">
			<div class="xiaomi6 fl">商品详情</div>
<!-- 			<nav class="fr"> -->
<!-- 				<li><a href="">概述</a></li> -->
<!-- 				<li>|</li> -->
<!-- 				<li><a href="">变焦双摄</a></li> -->
<!-- 				<li>|</li> -->
<!-- 				<li><a href="">设计</a></li> -->
<!-- 				<li>|</li> -->
<!-- 				<li><a href="">参数</a></li> -->
<!-- 				<li>|</li> -->
<!-- 				<li><a href="">F码通道</a></li> -->
<!-- 				<li>|</li> -->
<!-- 				<li><a href="">用户评价</a></li> -->
<!-- 				<div class="clear"></div> -->
<!-- 			</nav> -->
			<div class="clear"></div>
		</div>	
	</div>
	
	<div class="jieshao mt20 w" id="spinfo">
<!-- 		<div class="left fl"><img src="./image/liebiao_xiaomi6.jpg"></div> -->
<!-- 		<div class="right fr"> -->
<!-- 			<div class="h3 ml20 mt20">小米6</div> -->
<!-- 			<div class="jianjie mr40 ml20 mt10">变焦双摄，4 轴防抖 / 骁龙835 旗舰处理器，6GB 大内存，最大可选128GB 闪存 / 5.15" 护眼屏 / 四曲面玻璃/陶瓷机身</div> -->
<!-- 			<div class="jiage ml20 mt10">2499.00元</div> -->
<!-- 			<div class="ft20 ml20 mt20">选择版本</div> -->
<!-- 			<div class="xzbb ml20 mt10"> -->
<!-- 				<div class="banben fl"> -->
<!-- 					<a> -->
<!-- 						<span>全网通版 6GB+64GB </span> -->
<!-- 						<span>2499元</span> -->
<!-- 					</a> -->
<!-- 				</div> -->
<!-- 				<div class="banben fr"> -->
<!-- 					<a> -->
<!-- 						<span>全网通版 6GB+128GB</span> -->
<!-- 						<span>2899元</span> -->
<!-- 					</a> -->
<!-- 				</div> -->
<!-- 				<div class="clear"></div> -->
<!-- 			</div> -->
<!-- 			<div class="ft20 ml20 mt20">选择颜色</div> -->
<!-- 			<div class="xzbb ml20 mt10"> -->
<!-- 				<div class="banben"> -->
<!-- 					<a> -->
<!-- 						<span class="yuandian"></span> -->
<!-- 						<span class="yanse">亮黑色</span> -->
<!-- 					</a> -->
<!-- 				</div> -->
				
<!-- 			</div> -->
<!-- 			<div class="xqxq mt20 ml20"> -->
<!-- 				<div class="top1 mt10"> -->
<!-- 					<div class="left1 fl">小米6 全网通版 6GB内存 64GB 亮黑色</div> -->
<!-- 					<div class="right1 fr">2499.00元</div> -->
<!-- 					<div class="clear"></div> -->
<!-- 				</div> -->
<!-- 				<div class="bot mt20 ft20 ftbc">总计：2499元</div> -->
<!-- 			</div> -->
<!-- 			<div class="xiadan ml20 mt20"> -->
<!-- 					<input class="jrgwc" type="button" name="jrgwc" value="加入购物车" /> -->
				
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="clear"></div> -->
	</div>
	</form>
	<!-- footer -->
	<footer class="mt20 center">
			
			<div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2014]0059-0009号</div> 
			<div>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>

		</footer>

	</body>
	<script type="text/javascript">
		function gouwuche() {
			location.href="<%=request.getContextPath()%>/front/page/cart/cart.jsp";
		}
	</script>
	<script type="text/javascript">
	init()
	function init() {
		var code='<%=request.getParameter("code") %>';
//  		console.log(code)
		$.ajax({
        	url:con.app+'/prod/search.do',
       	 	data : {code:code},
        	dataType : 'json',
        	type : 'post',
       		success : function(data){
       			var t='';
				t+='<div class="left fl">'+'<img style="width: 560px;height: 560px;" src="/image/'+data.url+'" />'+'</div>';
				t+='<div class="right fr">';
				t+='<div class="h3 ml20 mt20">'+data.name+'</div>';
				t+='<div class="jianjie mr40 ml20 mt10">'+data.descr+'</div>';
				t+='<div class="jiage ml20 mt10">'+data.price+'</div>';
				
				//	拼接静态标签，数据库没有
				t+='<div class="ft20 ml20 mt20">'+'选择版本'+'</div>';
				t+='<div class="xzbb ml20 mt10"><div class="banben fl">'+'<a><span>全网通版 6GB+64GB </span><span>2499元</span></a></div>'+'<div class="clear"></div></div>';
				t+='<div class="ft20 ml20 mt20">选择颜色</div>'+'<div class="xzbb ml20 mt10">'+'<div class="banben">'+'<a><span class="yuandian"></span><span class="yanse">亮黑色</span></a></div></div>';
				
				t+='<div class="xqxq mt20 ml20">'+'<div class="top1 mt10">';
				t+='<div class="left1 fl">库存量</div>'+'<div class="right1 fr">'+data.count+'</div>'+'<div class="clear"></div>'+'</div>';
				t+='<div class="bot mt20 ft20 ftbc">总计：'+data.price+'</div></div>';
				t+='<div class="xiadan ml20 mt20">'+'<input class="jrgwc" type="button" name="jrgwc" value="加入购物车"  onclick="aaa()" />'+'</div>'
				t+='</div>';
				t+='<div class="clear"></div>';
				
				$("#spinfo").html(t);
// 				$("input[name='jrgwc']").click(function(){
// 					console.log("666")
// 					ajax('/car/add.do', {spCode:code}, 'text', function(data){
// 						if(data==2){
// 							layer.msg('请登录');
<%-- 							location.href="<%=request.getContextPath() %>/front/page/login.jsp"; --%>
// 						}else if(data==1){
// 							layer.msg('添加成功');
// 						}else{
// 							layer.msg('添加失败');
// 						}
// 					})
// 				})
       		}
		})
	}

		function aaa() {
			var code='<%=request.getParameter("code") %>';
			ajax('/car/add.do', {spCode:code}, 'text', function(data){
				if(data==2){
					layer.msg('请登录');
					location.href="<%=request.getContextPath() %>/front/page/login.jsp";
				}else if(data==1){
					layer.msg('添加成功');
				}else{
					layer.msg('添加失败');
				}
			})
		}
	</script>
	<script type="text/javascript">
		function gouwuche() {
			location.href='<%=request.getContextPath() %>/front/page/cart/cart.jsp';
		}
		
		function dingdan() {
			location.href='<%=request.getContextPath() %>/front/page/user/dingdan.jsp';
		}
	</script>
	
</html>