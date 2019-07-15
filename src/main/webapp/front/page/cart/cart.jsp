<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.situ.crm.grant.model.UserCrmModel"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@ include file="/front/header.jsp"%>
		<title>购物车</title>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/front/css/style.css">
	</head>
	<body>
	<!-- start header -->
	<!--end header -->

<!-- start banner_x -->
		<div class="banner_x center">
			<a href="<%=request.getContextPath() %>/front/page/home/main.jsp" target="_blank"><div class="logo fl"></div></a>
			
			<div class="wdgwc fl ml40">我的购物车</div>
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
			<div class="gwcxd center">
				<div class="top2 center">
					<div class="sub_top fl">
						<input type="checkbox" value="quanxuan" class="quanxuan" onclick="quanxuan0(this)" />全选
					</div>
					<div class="sub_top fl">商品名称</div>
					<div class="sub_top fl">单价（元）</div>
					<div class="sub_top fl">数量</div>
					<div class="sub_top fl">小计</div>
					<div class="sub_top fr">操作</div>
					<div class="clear"></div>
				</div>
				<div  id="tbody"></div>
			</div>
			<div class="jiesuandan mt20 center">
				<div class="tishi fl ml20">
					<ul>
						<li><a href="<%=request.getContextPath() %>/front/page/product/list.jsp">继续购物</a></li>
						<li>|</li>
						<li>共<span id="zongshu"></span>件商品，已选择<span id="xuanzhong"></span>件</li>
						<div class="clear"></div>
					</ul>
				</div>
				<div class="jiesuan fr">
					<div class="jiesuanjiage fl">合计（不含运费）：<span id="zonge"></span>元</div>
					<div class="jsanniu fr"><input class="jsan" type="submit" name="jiesuan"  value="去结算" onclick="tijiao()"/></div>
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
		init()
		function init() {
			var userCode='<%=request.getParameter("userCode") %>';
// 			console.log("11")
			ajax('/car/getListAll.do', {userCode:userCode},'json', function(data){
// 				console.log(data)
				var userCode=data.userCode;
				if(data==2){
					layer.msg("请登录");
					location.href="<%=request.getContextPath() %>/front/page/login.jsp";
					return;
				}
				var t='';
				$.each(data.list, function(i,dom){
// 					console.log(dom.userCode)
// 					console.log(dom.pname)
					var id=dom.id;
					t+='<div class="content2 center">';
					t+='<div class="sub_content fl "><input type="checkbox" value="'+id+'" class="quanxuan" name="quanxuan" onchange="zonge()"/></div>';
					t+='<div class="sub_content fl">'+'<img style="width: 90px;height: 90px;" src="/image/'+dom.purl+'" />'+'</div>';
					t+='<div class="sub_content fl ft20">'+dom.pname+'</div>';
					t+='<div class="sub_content fl ">'+dom.pcost+'</div>';
					t+='<div class="sub_content fl"><input class="shuliang" type="number" value="'+dom.count+'" step="1" min="1" onchange="sumchange(this,'+id+')" ></div>';
					t+='<div class="sub_content fl">'+getValue(dom.pcost,dom.count)+'</div>';
					t+='<div class="sub_content fl"><a href="javascript:del('+id+')">×</a></div><div class="clear"></div>';
					t+='</div>';
					$("#tbody").html(t);
					$("#zongshu").text(data.list.length)
				});
				
			})
		}
		
		//	计算小计
		function getValue(cost,count){
			return new Number(parseFloat(cost)*parseFloat(count)).toFixed(2);
		}
		
		//	修改数量
		function sumchange(obj,id){
			var v = obj.value;
			ajax('/car/updSum.do',{id:id,count:v},'json',function(data){
				if(data == 1){
					obj.value = v;
					var cost =$(obj).parent().prev().text();
					$(obj).parent().next().text(getValue(cost,v));
					zonge()
				}
			})
		}
		
		//	全选
		function quanxuan0(obj){
			$("input[type='checkbox']").prop('checked',$(obj).prop('checked'));
			zonge();
		}
		
		//	总计
		function zonge(){
			var quanxuan = $("input[name='quanxuan']:checked");
			$("#xuanzhong").text(quanxuan.length);
			var zonge = 0.0;
			quanxuan.each(function(index,domEle){
				var cost =$(this).parent().next().next().next().next().next().text();
				zonge += parseFloat(cost);
			})
			$("#zonge").text(zonge.toFixed(2));
		}
		
		//	提交
		function tijiao(){
			var quanxuan = $("input[name='quanxuan']:checked");
			var ids = [];
			//$.each(quanxuan,function(index,dom){})
			quanxuan.each(function(index,dom){
				ids.push($(this).val())
			})
			if(ids.length == 0){
				layer.msg('请选择商品');
				return;
			}
			location.href = "/spring05/front/page/cart/cart2.jsp?ids="+ids;
		}
		
		//	删除
		function del(id){
			ajax('/car/del.do',{id:id},'json',function(data){
				if(data == 1){
					init();
				}
			})
		}
		
		//	选中删除
		function delcheck(){
			$("input[name='quanxuan']:checked").each(function(index,dom){
				del($(this).val())
			})
		}
		
		//	进入订单界面
		function dingdan() {
			location.href='<%=request.getContextPath() %>/front/page/user/dingdan.jsp';
		}
	</script>
</html>
