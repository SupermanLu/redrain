<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>用户列表</title>


    <script type="text/javascript">
   var isAdd=true;
   var id='';
   var $tableUser;
    	
    	$(function(){
    		
    		$tableUser= $('#tableUser').bootstrapTable({  
    		    columns: [  
    		        {field: 'lbid', title: '中奖编号'},  
    		        {field: 'lbname', title: '用户名'}, 		        
    		        {field: 'lbmoney', title: '中奖金额'}, 
    		        { align:'center',field: 'lbid', title: '修改',formatter: function (value) {
    		            return "<button class='btn btn-info' data-id='"+value+"'> 修改 </button>";
    		        }},
    		        { align:'center',field: 'lbid', title: '删除',formatter: function (value) {
    		            return "<button class='btn btn-warning' data-id='"+value+"'> 删除 </button>";
    		        }}
    		    ],  
    		    url:"<%=request.getContextPath()%>/admin/lb/getObject",
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
    				url:"<%=request.getContextPath()%>/admin/lb/deleteallobject",
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
    				url:"<%=request.getContextPath()%>/admin/lb/getObjectbyid",
    		　　　　　　type:"POST",
    		　　　　　　data:'{"lbid":"'+id+'"}',
    		　　　　　　contentType:"application/json",
    		　　　　　　success:function(res){
    			if(res.login){
					window.location.href="login.jsp";
				}
				else{
    					$('#username').val(res.lbname);
    					$('#fixedmoney').val(res.lbmoney);
    					
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
    				url:"<%=request.getContextPath()%>/admin/lb/deletebyid",
    		　　　　　　type:"POST",
    		　　　　　　data:'{"lbid":"'+id+'"}',
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
    				data='{"lbname":"'+$('#username').val()+'","lbmoney":"'+$('#fixedmoney').val()+'"}';
    				url="<%=request.getContextPath()%>/admin/lb/addobject";
    				type='新增';
    				
    			}
    			else{
    				data='{"lbname":"'+$('#username').val()+'","lbmoney":"'+$('#fixedmoney').val()+'","lbid":"'+id+'"}';
    				url="<%=request.getContextPath()%>/admin/lb/updateobject";
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
    		
    		
    		$('#import').on('click',function(){
              	 $('#myfile').click();
               })
       		
       		$('#myfile').on('change',function(){
       			ajaxFileUpload();
       		})
    		
    	});
    	
    	function ajaxFileUpload(){
			$.ajaxFileUpload({  
		           url: '<%=request.getContextPath()%>/admin/lb/importExcel',  
		           secureuri: false,  
		           cache:false,
		           fileElementId: 'myfile',  
		           dataType: 'json',  
		           success: function (data, status){  
		        	  if(data.login){
						window.location.href="login.jsp";
					  }
		        	  else{
		                alert("导入成功");  
		                $('#myfile').val('');
		                $tableUser.bootstrapTable('refresh');
		     
		        	  }
		           },  
		           error: function (data, status, e){  
		        	   if(data.login){
   						window.location.href="login.jsp";
   					  }
   		        	  else{
		        	   console.log(JSON.stringify(e));
		                alert(data.msg);  
		                $('#myfile').val('');
		               
   		        	  }
		           }  
		    }); 
			
			 $('input[type="file"]').on('change',function(){
             	ajaxFileUpload();
             })
             
            
    	}
    </script>
    
    
    
	<input type="file" name="myfile" id="myfile" style="display:none;"/>
    <table id="tableUser" data-classes="table table-hover "
	data-search="true" data-show-refresh="true" data-show-toggle="true"
	data-show-columns="true" data-toolbar="#toolbar"></table>
	<div id="toolbar">
		<div class="btn-group">
		<i class="glyphicon glyphicon-remove"  id="delete-user" title="删除全部"></i>
		<i class="glyphicon glyphicon-import"  id="import" title="导入"></i>
		
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
						
						
						<label for="fixedmoney">中奖金额</label> 
						<input type="text" class="form-control" id="fixedmoney" placeholder="请输入中奖金额">
						
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