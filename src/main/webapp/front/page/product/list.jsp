<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@page import="com.situ.crm.grant.model.UserCrmModel"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@ include file="/front/header.jsp"%>
		<title>小米手机列表</title>
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
						<input type="text" class="shuru" name="name"  placeholder="请输入关键词">
					</div>
					<div class="submit fl">
						<input type="submit" class="sousuo" value="搜索" onclick="refresh()"/>
					</div>
					<div class="clear"></div>
					<input type="hidden" name="pageIndex" value="1" />
					<input type="hidden" name="pageLimit" value="10" />
				</form>
				<div class="clear"></div>
			</div>
		</div>
<!-- end banner_x -->

	<!-- start banner_y -->
	<!-- end banner -->

	<!-- start danpin -->
		<div class="danpin center">
			
			<div class="biaoti center" >商品列表</div>
			<div id="tbody"></div>
<!-- 			<div class="main center"> -->
<!-- 				<div class="mingxing fl mb20" style="border:2px solid #fff;width:230px;cursor:pointer;" onmouseout="this.style.border='2px solid #fff'" onmousemove="this.style.border='2px solid red'"> -->
<!-- 					<div class="sub_mingxing"><a href="./xiangqing.html" target="_blank"><img src="./image/liebiao_xiaomi6.jpg" alt=""></a></div> -->
<!-- 					<div class="pinpai"><a href="./xiangqing.html" target="_blank">小米6</a></div> -->
<!-- 					<div class="youhui">5.16早10点开售</div> -->
<!-- 					<div class="jiage">2499.00元</div> -->
<!-- 				</div> -->
<!-- 				<div class="mingxing fl mb20" style="border:2px solid #fff;width:230px;cursor:pointer;" onmouseout="this.style.border='2px solid #fff'" onmousemove="this.style.border='2px solid red'"> -->
<!-- 					<div class="sub_mingxing"><a href=""><img src="./image/liebiao_xiaomi5c.jpg" alt=""></a></div> -->
<!-- 					<div class="pinpai"><a href="">小米手机5c</a></div> -->
<!-- 					<div class="youhui">搭载澎湃S1 八核高性能处理器</div> -->
<!-- 					<div class="jiage">1499.00元</div> -->
<!-- 				</div> -->
<!-- 				<div class="mingxing fl mb20" style="border:2px solid #fff;width:230px;cursor:pointer;" onmouseout="this.style.border='2px solid #fff'" onmousemove="this.style.border='2px solid red'"> -->
<!-- 					<div class="sub_mingxing"><a href=""><img src="./image/liebiao_xiaomint2.jpg" alt=""></a></div> -->
<!-- 					<div class="pinpai"><a href="">小米Note 2</a></div> -->
<!-- 					<div class="youhui">5月9日-20日 小米Note 2 享花呗12期分期免息</div> -->
<!-- 					<div class="jiage">2799.00元</div> -->
<!-- 				</div> -->
<!-- 				<div class="mingxing fl mb20" style="border:2px solid #fff;width:230px;cursor:pointer;" onmouseout="this.style.border='2px solid #fff'" onmousemove="this.style.border='2px solid red'"> -->
<!-- 					<div class="sub_mingxing"><a href=""><img src="./image/liebiao_xiaomimix.jpg" alt=""></a></div> -->
<!-- 					<div class="pinpai"><a href="">小米MIX</a></div> -->
<!-- 					<div class="youhui">5月9日-20日小米MIX 享花呗12期分期免息</div> -->
<!-- 					<div class="jiage">3499.00元</div> -->
<!-- 				</div> -->
<!-- 				<div class="mingxing fl mb20" style="border:2px solid #fff;width:230px;cursor:pointer;" onmouseout="this.style.border='2px solid #fff'" onmousemove="this.style.border='2px solid red'"> -->
<!-- 					<div class="sub_mingxing"><a href=""><img src="./image/liebiao_xiaomi5s.jpg" alt=""></a></div> -->
<!-- 					<div class="pinpai"><a href="">小米5s</a></div> -->
<!-- 					<div class="youhui">“暗夜之眼”超感光相机 / 无孔式超声波</div> -->
<!-- 					<div class="jiage">1999.00元</div> -->
<!-- 				</div> -->

<!-- 				<div class="clear"></div> -->
<!-- 			</div> -->
<!-- 			<div class="main center mb20"> -->
<!-- 				<div class="mingxing fl mb20" style="border:2px solid #fff;width:230px;cursor:pointer;" onmouseout="this.style.border='2px solid #fff'" onmousemove="this.style.border='2px solid red'"> -->
<!-- 					<div class="sub_mingxing"><a href=""><img src="./image/liebiao_xiaomi5.jpg" alt=""></a></div> -->
<!-- 					<div class="pinpai"><a href="">小米手机5</a></div> -->
<!-- 					<div class="youhui">骁龙820处理器 / UFS 2.0 闪存</div> -->
<!-- 					<div class="jiage">1799.00元</div> -->
<!-- 				</div> -->
<!-- 				<div class="mingxing fl mb20" style="border:2px solid #fff;width:230px;cursor:pointer;" onmouseout="this.style.border='2px solid #fff'" onmousemove="this.style.border='2px solid red'"> -->
<!-- 					<div class="sub_mingxing"><a href=""><img src="./image/liebiao_hongmin4.jpg" alt=""></a></div> -->
<!-- 					<div class="pinpai"><a href="">红米Note 4</a></div> -->
<!-- 					<div class="youhui">十核旗舰处理器 / 全金属一体化机身 </div> -->
<!-- 					<div class="jiage">1399.00元</div> -->
<!-- 				</div> -->
<!-- 				<div class="mingxing fl mb20" style="border:2px solid #fff;width:230px;cursor:pointer;" onmouseout="this.style.border='2px solid #fff'" onmousemove="this.style.border='2px solid red'"> -->
<!-- 					<div class="sub_mingxing"><a href=""><img src="./image/pinpai3.png" alt=""></a></div> -->
<!-- 					<div class="pinpai"><a href="">小米手机5 64GB</a></div> -->
<!-- 					<div class="youhui">5月9日-10日，下单立减100元</div> -->
<!-- 					<div class="jiage">1799元</div> -->
<!-- 				</div> -->
<!-- 				<div class="mingxing fl mb20" style="border:2px solid #fff;width:230px;cursor:pointer;" onmouseout="this.style.border='2px solid #fff'" onmousemove="this.style.border='2px solid red'"> -->
<!-- 					<div class="sub_mingxing"><a href=""><img src="./image/liebiao_hongmin42.jpg" alt=""></a></div> -->
<!-- 					<div class="pinpai"><a href="">红米4</a></div> -->
<!-- 					<div class="youhui">2.5D 玻璃，金属一体化机身</div> -->
<!-- 					<div class="jiage">999.00元</div> -->
<!-- 				</div> -->
<!-- 				<div class="mingxing fl mb20" style="border:2px solid #fff;width:230px;cursor:pointer;" onmouseout="this.style.border='2px solid #fff'" onmousemove="this.style.border='2px solid red'"> -->
<!-- 					<div class="sub_mingxing"><a href=""><img src="./image/liebiao_hongmin4x.jpg" alt=""></a></div> -->
<!-- 					<div class="pinpai"><a href="">红米Note 4X 全网通版</a></div> -->
<!-- 					<div class="youhui">多彩金属 / 4100mAh 超长续航</div> -->
<!-- 					<div class="jiage">1299.00元</div> -->
<!-- 				</div> -->
				
<!-- 				<div class="clear"></div> -->
<!-- 			</div> -->
		</div>
		<div id="pageInfoUser" style="text-align: right;padding-right: 30px"></div>

		<footer class="mt20 center">			
			<div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2014]0059-0009号</div> 
			<div>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>

		</footer>

	<!-- end danpin -->

	</body>
	<script type="text/javascript">
	refresh()
	function refresh() {
// 		var categoryCode;
	var searchParam={
			categoryCode:'<%=request.getParameter("code")==null?"":request.getParameter("code")%>',
			name:'<%=request.getParameter("name")==null?"":request.getParameter("name")%>',
			productType1:'<%=request.getParameter("type1")==null?"":request.getParameter("type1")%>',
			productType:'<%=request.getParameter("category")==null?"":request.getParameter("category")%>',
			pageIndex: $("input[name='pageIndex']").val(),
			pageLimit: $("input[name='pageLimit']").val()
	}
// 	console.log(categoryCode);
		ajax('/prod/list.do',searchParam ,'json', getList);
	}
	function getList(data) {
// 		console.log(data)
	    var curr = $("input[name='pageIndex']").val();
	    var limit = $("input[name='pageLimit']").val();
	    setPageInfo('pageInfoUser',data.count,curr,limit,function(obj, first){
	        $("input[name='pageIndex']").val(obj.curr);
	        $("input[name='pageLimit']").val(obj.limit);
	        if(!first){refresh();}//首次不执行
	    })
	    var html="";
	    $("#tbody").html(html);
	    var t='';
	    var l=1;
	    $.each(data.list,function(i,dom){
// 	    	console.log(dom.code)
	    	t+='<div class="mingxing fl mb20" style="border:2px solid #fff;width:230px;cursor:pointer;" onmouseout="this.style.border=\'2px solid #fff\'" onmousemove="this.style.border=\'2px solid red\'">';
	    	t+='<div class="sub_mingxing"><a href="javascript:xiangqing(\''+dom.code+'\')"><img src="/image/'+dom.url+'" /></a></div>';
	    	t+='<div class="pinpai"><a href="javascript:xiangqing(\''+dom.code+'\')">'+dom.name+'</a></div>';
// 	    	t+='<div class="youhui">'+dom.descr+'</div>';
	    	t+='<div class="jiage">'+dom.price+'</div></div>';
	    	l++;
	    	if(l%6==0){
	    		html='<div class="main center mb20">'+t+'</div>';
	    		$("#tbody").append(html);
	    		html='';
	    		t='';
	    	}
	    });
	    if(t!=''){
	    	$("#tbody").append('<div class="main center mb20">'+t+'</div>');
	    }
	}
	function xiangqing(code) {
		location.href='<%=request.getContextPath()%>/front/page/product/xiangqing.jsp?code='+code;
	}
	</script>
	<script type="text/javascript">
		function gouwuche() {
			location.href="<%=request.getContextPath()%>/front/page/cart/cart.jsp";
		}
		
		function dingdan() {
			location.href='<%=request.getContextPath() %>/front/page/user/dingdan.jsp';
		}
	</script>
</html>