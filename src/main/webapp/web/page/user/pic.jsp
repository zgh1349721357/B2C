<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/web/header.jsp"%>
	<title>图片维护</title>
</head>
<body>
	<fieldset class="layui-elem-field layui-field-title" 
            style="margin: 10px;padding:15px;">
	  <legend>图片列表</legend>
		<button type="button" class="layui-btn" id="test1">
		  <i class="layui-icon">&#xe67c;</i>上传图片
		</button>
	  <div class="layui-upload-list">
	    <table class="layui-table">
	      <thead><tr>
	        <th width="5%">文件名</th><th width="10%">图片</th>
	        <th width="10%">操作</th>
	      </tr></thead>
	      <tbody id="demoList2"></tbody>
	    </table>
	  </div>
	</fieldset>
	<script type="text/javascript">
	    var code='<%=request.getParameter("code")%>';
	    renderUpload('test1','/EmployeeUploadServlet'
				,{code:code} ,function(res){
			if(res.code=='0'){
				layer.msg('上传成功');
				showPic(res.data);
			}
		})
		function delPic(){
		    openConfirm(function(index){
		        ajax('/EmployeeServlet', {action:'delpic',code:code}
		        , 'text', function(data){
		            if (data == 1) {
		                layer.msg('删除成功');
		                init();//$("#demoList2").html('')
		            } else {
		                layer.msg('删除成功，该编号已被使用');
		            }
		        })
		    })
		}
		init();
		function init(){
			ajax('/EmployeeServlet', {action:'get',code:code}
			 , 'json', function(data){
				 var image=data.image;
				 if(image)
					 showPic(image)
				 else
					 $("#demoList2").html('')
            })
		}
		function showPic(url){
			var html = "<tr><td>"+url+"</td><td>"
            +'<img src="/image/'+ url +'" alt="'+ url +'" class="layui-upload-img">'
            +"</td><td><input type='button' class='layui-btn' onclick='delPic()' value='删除' />"
            +"</td></tr>";
           $("#demoList2").html(html);
		}
	</script>
</body>
</html>