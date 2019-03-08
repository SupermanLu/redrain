<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>红包后台管理系统</title>
<link rel="alternate icon" type="image/png" href="images/favicon.ico">
<link href="css/login.css" rel="stylesheet" type="text/css" />
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
	if(!('<%=request.getSession().getAttribute("userid")==null?"":request.getSession().getAttribute("userid")%>'=="")){
		window.location.href="master.jsp?page=changepassword.jsp";
	}
	$('#login').on('click',function(){
		var data='{"username":"'+$('#username').val()+'","password":"'+$('#password').val()+'"}';
		$.ajax({
			url:"<%=request.getContextPath()%>/user/login",
	　　　　　　type:"POST",
	　　　　　　data:data,
	　　　　　　contentType:"application/json",
	　　　　　　success:function(res){
				if(res.status=='success'){
					alert('登录成功');
					window.location.href="master.jsp?page=changepassword.jsp";
				}
				else{
					alert(res.msg);
				}
	　　　　　　}
		});
	});
	
	$('#register-submit').on('click',function(){
		if($('#register-username').val()==''||$('#register-password').val()==''||$('householdname').val()==''||$('#phone').val()==''||$('#houseinfo').val()==''||$('#remark').val()=='')
		{
			alert('请将信息填写完整');
		}
		else{
		var data='{"userName":"'+$('#register-username').val()+'","password":"'+$('#register-password').val()+'","householdname":"'+$('#householdname').val()+'","phone":"'+$('#phone').val()+'","houseinfo":"'+$('#houseinfo').val()+'","remark":"'+$('#remark').val()+'"}';
		$.ajax({
			url:"<%=request.getContextPath()%>/admin/user/register",
	　　　　　　type:"POST",
	　　　　　　data:data,
	　　　　　　contentType:"application/json",
	　　　　　　success:function(res){
	　　　　　　　　alert(JSON.stringify(res));
				if(res.status=='success'){
					alert('注册成功');
					$('#myModal').modal('toggle');
				}
				else{
					alert(res.msg);
				}
	　　　　　　}
		});
		}
	});
});
	
</script>
</head>

<body>
	<div class="login_box">
		<div class="login_l_img">
			<img src="images/login-img.png" />
		</div>
		<div class="login">
			<div class="login_logo">
				<a href="#"><img src="images/login_logo.png" /></a>
			</div>
			<div class="login_name">
				<p>红包后台管理系统</p>
			</div>
			<form method="post">
				<input id="username" name="username" type="text" value="用户名"
					onfocus="this.value=''"
					onblur="if(this.value==''){this.value='用户名'}"> <span
					id="password_text"
					onclick="this.style.display='none';document.getElementById('password').style.display='block';document.getElementById('password').focus();">密码</span>
				<input name="password" type="password" id="password"
					style="display: none;"
					onblur="if(this.value==''){document.getElementById('password_text').style.display='block';this.style.display='none'};" />
				<div style="overflow: hidden;">
					<input id="login" value="登录" style="width: 100%; float: left;"
						type="button">
					<!-- 触发模态窗按钮 -->
					<!--<input id="register" class="btn btn-primary btn-lg" value="注册"
						style="width: 48%; float: right;" type="button"
						data-toggle="modal" data-target="#myModal">-->
				</div>
			</form>
		</div>
		<!-- 模态框（Modal） -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">注册</h4>
					</div>
					<div class="modal-body">
						<form method="post" role="form">
							<div class="form-group">
								<label for="register-username">账号</label> <input type="text"
									class="form-control" id="register-username"
									placeholder="请输入登录账号"> <label for="register-password">密码</label>
								<input type="password" class="form-control"
									id="register-password" placeholder="请输入登录密码">
								<label for="householdname">住户名</label> <input type="text"
									class="form-control" id="householdname" placeholder="请输入住户名">
								<label for="phone">联系方式</label> <input type="text"
									class="form-control" id="phone" placeholder="请输入联系方式">
								<label for="houseinfo">住房信息</label> <input type="text"
									class="form-control" id="houseinfo" placeholder="请输入住房信息">
								<label for="remark">备注</label>
								<textarea class="form-control" id="remark" placeholder="请输入备注" rows="6"></textarea>						
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" id="register-submit">提交</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>
	</div>

</body>
</html>
