<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>用户列表</title>


    <script type="text/javascript">
   var isAdd=true;
   var id='';
    	
    	$(function(){
    		
    		var $tableUser= $('#tableUser').bootstrapTable({  
    		    columns: [  
    		        {field: 'userid', title: '用户编号'},  
    		        {field: 'username', title: '用户名'}, 		        
    		        {field: 'floatercount', title: '抽奖次数'}, 
    		        {field: 'fixedmoney', title: '金额'}, 
    		        { align:'center',field: 'userid', title: '修改',formatter: function (value) {
    		            return "<button class='btn btn-info' data-id='"+value+"'> 修改 </button>";
    		        }},
    		        { align:'center',field: 'userid', title: '删除',formatter: function (value) {
    		            return "<button class='btn btn-warning' data-id='"+value+"'> 删除 </button>";
    		        }}
    		    ],  
    		    url:"<%=request.getContextPath()%>/admin/user/getUser",
    				pagination : true,
    				sidePagination : 'server',
    				pageList : [ 5, 10, 20, 50 ],
    				queryParams : function(params) {
    					//params.name = '张三丰';  
    					//特别说明，返回的参数的值为空，则当前参数不会发送到服务器端  
    					//这种指定请求参数的方式和datatables控价类似  
    					//params.sex = $('input[name="sex"]:checked').val();  
    					return params;
    				}
    			});
    		
    		
    		$('#delete-user').on('click',function(){
    			$.ajax({
    				url:"<%=request.getContextPath()%>/admin/user/deletealluser",
    		　　　　　　type:"POST",
    		　　　　　　data:'',
    		　　　　　　contentType:"application/json",
    		　　　　　　success:function(res){
    			if(res.login){
					window.location.href="login.jsp";
				}
				else{
    		　　　　　　　　if(res.status=="success"){
    					alert('删除成功');
    					$tableUser.bootstrapTable('refresh');
    		　　　　　　　　}
			    		else{
			    			alert(res.msg)	
			    		}
				}
    				}
    			});
    		})
    		
    		$('#tableUser').on('click','.btn-info',function(){
    			id=$(this).attr('data-id');
    			$.ajax({
    				url:"<%=request.getContextPath()%>/admin/user/getUserbyid",
    		　　　　　　type:"POST",
    		　　　　　　data:'{"userid":"'+id+'"}',
    		　　　　　　contentType:"application/json",
    		　　　　　　success:function(res){
    			if(res.login){
					window.location.href="login.jsp";
				}
				else{
    					$('#username').val(res.username);
    					$('#fixedmoney').val(res.fixedmoney);
    					$('#floatercount').val(res.floatercount);
    					$('#myModal').modal('toggle');
    	    			
    	    			$('#myModalLabel').html('修改');
    	    			
    	    			isAdd=false;
				}
    				}
    			});
    		});
    		
    		
    		$('#tableUser').on('click','.btn-warning',function(){
    			id=$(this).attr('data-id');
    			$.ajax({
    				url:"<%=request.getContextPath()%>/admin/user/deletebyid",
    		　　　　　　type:"POST",
    		　　　　　　data:'{"userid":"'+id+'"}',
    		　　　　　　contentType:"application/json",
    		　　　　　　success:function(res){
    			if(res.login){
					window.location.href="login.jsp";
				}
				else{
    		　　　　　　　　if(res.status=="success"){
    					alert('删除成功');
    					$tableUser.bootstrapTable('refresh');
    		　　　　　　　　}
			    		else{
			    			alert(res.msg)	
			    		}
				}
    				}
    			});
    		});
    		
    		$('#register-submit').on('click',function(){
    			var data='';
    			var url='';
    			var type='';
    			if(isAdd){
    				data='{"infocontent":"'+$('#infocontent').val()+'"}';
    				url="<%=request.getContextPath()%>/admin/info/addinfo";
    				type='新增';
    				
    			}
    			else{
    				data='{"username":"'+$('#username').val()+'","fixedmoney":"'+$('#fixedmoney').val()+'","floatercount":"'+$('#floatercount').val()+'","userid":"'+id+'"}';
    				url="<%=request.getContextPath()%>/admin/user/updateuser";
    				type='修改';
    			}
    			
    			$.ajax({
    				url:url,
    		　　　　　　type:"POST",
    		　　　　　　data:data,
    		　　　　　　contentType:"application/json",
    		　　　　　　success:function(res){
    			if(res.login){
					window.location.href="login.jsp";
				}
				else{
    		　　　　　　　　if(res.status=="success"){
    					alert(type+'成功');
    					$('#myModal').modal('toggle');
    					$tableUser.bootstrapTable('refresh');
    		　　　　　　　　}
			    		else{
			    			alert(res.msg)	
			    		}
				}
    				}
    			});
    			
    		});
    		
    	});
    </script>
    <table id="tableUser" data-classes="table table-hover "
	data-search="true" data-show-refresh="true" data-show-toggle="true"
	data-show-columns="true" data-toolbar="#toolbar"></table>
	<div id="toolbar">
		<div class="btn-group">
			<button class="btn btn-default" id="delete-user">
				<i class="glyphicon glyphicon-remove"></i>删除全部
			</button>
		</div>
		<div class="form-group"></div>
	</div>

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" style='z-index:9999;'>
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">修改</h4>
			</div>
			<div class="modal-body">
				<form method="post" role="form">
					<div class="form-group">
						<label for="username">用户名</label> 
						<input type="text" class="form-control" id="username" placeholder="请输入用户名" readonly="readonly">
						
						<label for="floatercount">次数</label> 
						<input type="number" class="form-control" id="floatercount" placeholder="请输入次数">
						<label for="fixedmoney">奖金设置</label> 
						<input type="text" class="form-control" id="fixedmoney" placeholder="请输入奖金设置">
						
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