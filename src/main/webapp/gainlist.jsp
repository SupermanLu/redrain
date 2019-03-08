<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>中奖列表</title>


    <script type="text/javascript">
   var isAdd=true;
   var id='';
    	
    	$(function(){
    		
    		var $tableGain= $('#tableGain').bootstrapTable({  
    		    columns: [  
    		        {field: 'gainid', title: 'ID'},  
    		        {field: 'username', title: '会员账号'}, 
    		        {field: 'awardid', title: '中奖金额'}, 
    		        { align:'center',field: 'gaintime', title: '中奖时间',formatter: function (value) {
    		        	var infotime=new Date();
    		        	infotime.setTime(value);

    		            return infotime.toLocaleString();
    		        }},
    		        { align:'center',field: 'status', title: '是否派彩',formatter: function (value) {
    		        	var res='';
    		        	if(value=='0'){
    		        		res='未派彩';
    		        	}
    		        	else{
    		        		res='已派彩';
    		        	}

    		            return res;
    		        }},
    		        { align:'center',field: 'gainid', title: '派彩',formatter: function (value) {
    		            return "<button class='btn btn-info' data-id='"+value+"'> 派彩 </button>";
    		        }},
    		        { align:'center',field: 'gainid', title: '删除',formatter: function (value) {
    		            return "<button class='btn btn-warning' data-id='"+value+"'> 删除 </button>";
    		        }}
    		    ],  
    		    url:"<%=request.getContextPath()%>/admin/gain/getGain",
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
    		
    		
    		$('#delete-gain').on('click',function(){
    			$.ajax({
    				url:"<%=request.getContextPath()%>/admin/gain/deleteallgain",
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
    					$tableGain.bootstrapTable('refresh');
    		　　　　　　　　}
			    		else{
			    			alert(res.msg)	
			    		}
				}
    				}
    			});
    		})
    		
    		$('#finish-gain').on('click',function(){
    			$.ajax({
    				url:"<%=request.getContextPath()%>/admin/gain/finishallgain",
    		　　　　　　type:"POST",
    		　　　　　　data:'',
    		　　　　　　contentType:"application/json",
    		　　　　　　success:function(res){
    			if(res.login){
					window.location.href="login.jsp";
				}
				else{
    		　　　　　　　　if(res.status=="success"){
    					alert('全部派彩');
    					$tableGain.bootstrapTable('refresh');
    		　　　　　　　　}
			    		else{
			    			alert(res.msg)	
			    		}
				}
    				}
    			});
    		})
    		
    		$('#tableGain').on('click','.btn-info',function(){
    			id=$(this).attr('data-id');
    			$.ajax({
    				url:"<%=request.getContextPath()%>/admin/gain/finishbyid",
    		　　　　　　type:"POST",
    		　　　　　　data:'{"gainid":"'+id+'"}',
    		　　　　　　contentType:"application/json",
    		　　　　　　success:function(res){
    			if(res.login){
					window.location.href="login.jsp";
				}
				else{
    		　　　　　　　　if(res.status=="success"){
    					alert('派彩成功');
    					$tableGain.bootstrapTable('refresh');
    		　　　　　　　　}
			    		else{
			    			alert(res.msg)	
			    		}
				}
    				}
    			});
    		});
    		
    		
    		$('#tableGain').on('click','.btn-warning',function(){
    			id=$(this).attr('data-id');
    			$.ajax({
    				url:"<%=request.getContextPath()%>/admin/gain/deletebyid",
    		　　　　　　type:"POST",
    		　　　　　　data:'{"gainid":"'+id+'"}',
    		　　　　　　contentType:"application/json",
    		　　　　　　success:function(res){
    			if(res.login){
					window.location.href="login.jsp";
				}
				else{
    		　　　　　　　　if(res.status=="success"){
    					alert('删除成功');
    					$tableGain.bootstrapTable('refresh');
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
    				data='{"username":"'+$('#username').val()+'","name":"'+$('#name').val()+'","floatercount":"'+$('#floatercount').val()+'","userid":"'+id+'"}';
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
    					$tableGain.bootstrapTable('refresh');
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
    <table id="tableGain" data-classes="table table-hover "
	data-search="true" data-show-refresh="true" data-show-toggle="true"
	data-show-columns="true" data-toolbar="#toolbar"></table>
	<div id="toolbar">
		<div class="btn-group">
			<button class="btn btn-default" id="delete-gain">
				<i class="glyphicon glyphicon-remove"></i>删除全部
			</button>
			<button class="btn btn-default" id="finish-gain" style="margin-left:10px;">
				<i class="glyphicon glyphicon-ok"></i>全部派彩
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
						<label for="name">姓名</label> 
						<input type="text" class="form-control" id="name" placeholder="请输入姓名" readonly="readonly">
						<label for="floatercount">次数</label> 
						<input type="number" class="form-control" id="floatercount" placeholder="请输入次数">
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