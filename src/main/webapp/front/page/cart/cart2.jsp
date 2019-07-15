<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@page import="com.situ.crm.grant.model.UserCrmModel"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@ include file="/front/header.jsp"%>
		<title>确认订单</title>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/front/css/style.css">
	</head>
	<body>
	<!-- start header -->
	<!--end header -->

<!-- start banner_x -->
		 <input type="hidden" name="userCode" value="${userCrm.usercode}">
		<div class="banner_x center">
			<a href="<%=request.getContextPath() %>/front/page/home/main.jsp" target="_blank"><div class="logo fl"></div></a>
			
			<div class="wdgwc fl ml40">确认订单</div>
			<div class="wxts fl ml20">温馨提示：产品是否购买成功，以最终下单为准哦，请尽快结算</div>
			<div class="dlzc fr">
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
				
			</div>
			<div class="clear"></div>
		</div>
		<div class="xiantiao"></div>
		<div class="gwcxqbj">
			<div class="gwcxd center" id="main">
				<div class="top2 center">
					<div class="sub_top fl">商品序号</div>
					<div class="sub_top fl">商品名称</div>
					<div class="sub_top fl">单价（元）</div>
					<div class="sub_top fl">数量</div>
					<div class="sub_top fl">小计</div>
<!-- 					<div class="sub_top fr">操作</div> -->
					<div class="clear"></div>
				</div>
				<div  id="tbody"></div>
			</div>
			<div class="jiesuandan mt20 center">
				<span class="sub_content fl ft20 center mt20">收 货 地 址： </span>
				<input type="text" name="addrId" placeholder="请输入收货地址" class="shuru ft20  mt20 center">			
			</div>
			<div class="jiesuandan mt20 center">
				<div class="tishi fl ml20">
					<ul>
						<li><a href="<%=request.getContextPath() %>/front/page/product/list.jsp">继续购物</a></li>
						<div class="clear"></div>
					</ul>
				</div>
				<div class="jiesuan fr" >
<!-- 					<div id="money"></div> -->
					<div class="jiesuanjiage fl">合计（不含运费）：<span id="zonge">0</span><span>元</span></div>
					<div class="jsanniu fr"><input class="jsan" type="button" name="jiesuan"  value="确认下单" onclick="xiadan()"/></div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>		
		</div>
		<div class="clear"></div>
		
	<!-- footer -->
	<footer class="center">
			
			<div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2014]0059-0009号</div> 
			<div>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>
		</footer>

	</body>
	<script type="text/javascript">		
		var tt='<%=request.getParameter("ids")==null?"":request.getParameter("ids") %>';
		init()
		function init() {
			if(tt==''){
				layer.msg('请选择商品');
				location.href='<%=request.getContextPath() %>/front/page/product/list.jsp';
				return;
			}
			tt_=tt.split(',');
				ajax('/car/getList.do', {ids:tt},'json', function(data){
					
					if(data==2){
						layer.msg("请登录");
						location.href="<%=request.getContextPath() %>/front/page/login.jsp";
						return;
					}
					var t='';
// 					var h='';
					var sum=0.0;
// 					console.log(data.list.length)
					$.each(data.list, function(i,dom){
						var id=dom.id;
						t+='<div class="content2 center">';
						t+='<div class="sub_content fl "><input type="text" value="'+i+'" class="quanxuan" name="quanxuan" /></div>';
						t+='<div class="sub_content fl">'+'<img style="width: 90px;height: 90px;" src="/image/'+dom.purl+'" />'+'</div>';
						t+='<div class="sub_content fl ft20">'+dom.pname+'</div>';
						t+='<div class="sub_content fl ">'+dom.pcost+'</div>';
						t+='<div class="sub_content fl"><input class="shuliang" type="text" value="'+dom.count+'" step="1" min="1" readonly="readonly" ></div>';
						t+='<div class="sub_content fl">'+getValue(dom.pcost,dom.count)+'</div>';
						t+='</div>';
						
						sum+=parseFloat(dom.count)*parseFloat(dom.pcost);
					});	
					$("#tbody").html(t);
					$("#zonge").html(sum);
				})
		}		
		function getValue(cost,count){
			return new Number(parseFloat(cost)*parseFloat(count)).toFixed(2);
		}
		
		function xiadan() {
			tt_=tt.split(',');
			var addrId=$("input[name='addrId']").val();
			var userCode=$("input[name='userCode']").val();
			ajax('/order/insert.do', {userCode : userCode,addrId:addrId,status:'已发货'}, 'json', function(data) {
				var orderCode = data.code;
				ajax('/car/getListAll.do', {userCode : userCode}, 'json', function(data2) {
// 					console.log("11")
// 					console.log(data2)
					$.each(data2.list, function(i, dom) {
						var id = dom.id;
						var spCode = dom.spCode;
						var count = dom.count;
						var pcost = dom.pcost;
// 	 					alert(spCode)
// 	 					alert(count)
// 	 					alert(pcost)

						$.each(tt_, function(i, dom) {
							if (id == dom) {
								ajax('/orderprod/insert.do', {orderCode : orderCode,spCode : spCode,count : count,price : pcost}, 
									'json', function(data) {
									console.log("11")

								})
								shanchu(id)
							}
						})
						layer.msg("下单成功");
// 						location.href = "/spring05/front/page/user/dingdan.jsp";
					})
				})
			})
			
		}

		function shanchu(id) {
			ajax('/car/del.do', {id : id}, 'json', function(data) {
				
			})
		}
	</script>
	<script type="text/javascript">
	function dingdan() {
		location.href='<%=request.getContextPath() %>/front/page/user/dingdan.jsp';
	}
	</script>
</html>
