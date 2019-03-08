<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>修改密码</title>
<script type="text/javascript">
$(function(){
	if('<%=request.getSession().getAttribute("userid") == null
				? ""
				: request.getSession().getAttribute("userid")%>'==""){
		window.location.href="login.jsp";
	}
	$('#change-password').on('click',function(){
		if($('#old-password').val()==''||$('#new-password').val()=='')
		{
			alert('请将信息填写完整');
		}
		else if($('#old-password').val()==$('#new-password').val()){
			alert('新旧密码一致');
		}
		else{
		var data={"userid":'<%=request.getSession().getAttribute("userid") == null
					? ""
					: request.getSession().getAttribute("userid")%>',"oldpassword":$('#old-password').val(),"newpassword":$('#new-password').val()};
		$.ajax({
			url:"<%=request.getContextPath()%>/admin/user/changepassword",
	　　　　　　type:"POST",
	　　　　　　data:data,
	　　　　　　contentType:"application/x-www-form-urlencoded",
	　　　　　　success:function(res){
				if(res.login){
					window.location.href="login.jsp";
				}
				else{
					if(res.status=='success'){
						alert('修改成功');
						$('#old-password').val('');
						$('#new-password').val('');
					}
					else{
						alert(res.msg);
					}
	　　　　　　		}
			}
		});
		}
	});
});
	
</script>

<form method="post" role="form">
	<div class="form-group col-md-4">
		<label for="old-password" style="margin: 10px 0;">原密码</label> <input
			type="password" class="form-control" id="old-password"
			placeholder="请输入原密码"> <label for="new-password"
			style="margin: 10px 0;">新密码</label> <input type="password"
			class="form-control" id="new-password" placeholder="请输入新密码">
		<button type="button" style="margin: 10px 0;" class="btn btn-primary"
			id="change-password">修改密码</button>
	</div>
</form>
