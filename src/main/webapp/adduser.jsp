<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>新增用户</title>
<script type="text/javascript">
$(function(){

	if('<%=request.getSession().getAttribute("userid") == null
				? ""
				: request.getSession().getAttribute("userid")%>'==""){
		window.location.href="login.jsp";
	}
	
	$('#submit-btn').on('click',function(){
		if($('#username').val()==''||$('#floatercount').val()=='')
		{
			alert('请将信息填写完整');
		}
		else{
		var data='{"username":"'+$('#username').val()+'","fixedmoney":"'+$('#fixedmoney').val()+'","floatercount":"'+$('#floatercount').val()+'"}';
		$.ajax({
			url:"<%=request.getContextPath()%>/admin/user/adduser",
	　　　　　　type:"POST",
	　　　　　　data:data,
	　　　　　　contentType:"application/json",
	　　　　　　success:function(res){
				if(res.login){
					window.location.href="login.jsp";
				}
				else{
					if(res.status=='success'){
						alert('新增成功');
						$('#username').val('');
						$('#fixedmoney').val('');
						$('#floatercount').val('');
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
		<label for="username" style="margin: 10px 0;">用户名</label> 
		<input type="text" class="form-control" id="username" placeholder="请输入用户名"> 
		
		<label for="floatercount" style="margin: 10px 0;">抽奖次数</label> 
		<input type="number" class="form-control" id="floatercount" placeholder="请输入次数">
		<label for="fixedmoney" style="margin: 10px 0;">奖金设置</label> 
		<input type="number" class="form-control" id="fixedmoney" placeholder="请输入金额">
		<button type="button" style="margin: 10px 0;" class="btn btn-primary"
			id="submit-btn">新增会员</button>
	</div>
</form>
