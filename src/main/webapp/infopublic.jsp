<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>信息发布</title>


    <script type="text/javascript">
   var isAdd=true;
   var id='';
    	
    	$(function(){
    		
    		var $tableInfo= $('#tableInfo').bootstrapTable({  
    		    columns: [  
    		        {field: 'infocontent', title: '信息内容'},  
    		        { align:'center',field: 'infotime', title: '发布时间',formatter: function (value) {
    		        	var infotime=new Date();
    		        	infotime.setTime(value);

    		            return infotime.toLocaleString();
    		        }},
    		        { align:'center',field: 'infoid', title: '修改',formatter: function (value) {
    		            return "<button class='btn btn-info' data-id='"+value+"'> 修改 </button>";
    		        }},
    		        { align:'center',field: 'infoid', title: '删除',formatter: function (value) {
    		            return "<button class='btn btn-warning' data-id='"+value+"'> 删除 </button>";
    		        }}
    		    ],  
    		    url:"<%=request.getContextPath()%>/admin/info/getInfo",
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
    		
    		
    		$('#add-info').on('click',function(){
    			$('#infocontent').val('');
    			
    			$('#myModal').modal('toggle');
    			
    			$('#myModalLabel').html('发布');
    			
    			isAdd=true;
    		})
    		
    		$('#tableInfo').on('click','.btn-info',function(){
    			id=$(this).attr('data-id');
    			$.ajax({
    				url:"<%=request.getContextPath()%>/admin/info/getInfobyid",
    		　　　　　　type:"POST",
    		　　　　　　data:'{"infoid":"'+id+'"}',
    		　　　　　　contentType:"application/json",
    		　　　　　　success:function(res){
    			if(res.login){
					window.location.href="login.jsp";
				}
				else{
    					$('#infocontent').val(res.infocontent);
    					$('#myModal').modal('toggle');
    	    			
    	    			$('#myModalLabel').html('修改');
    	    			
    	    			isAdd=false;
				}
    				}
    			});
    		});
    		
    		
    		$('#tableInfo').on('click','.btn-warning',function(){
    			id=$(this).attr('data-id');
    			$.ajax({
    				url:"<%=request.getContextPath()%>/admin/info/deletebyid",
    		　　　　　　type:"POST",
    		　　　　　　data:'{"infoid":"'+id+'"}',
    		　　　　　　contentType:"application/json",
    		　　　　　　success:function(res){
    			if(res.login){
					window.location.href="login.jsp";
				}
				else{
    		　　　　　　　　if(res.status=="success"){
    					alert('删除成功');
    					$tableInfo.bootstrapTable('refresh');
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
    				data='{"infocontent":"'+$('#infocontent').val()+'","infoid":"'+id+'"}';
    				url="<%=request.getContextPath()%>/admin/info/updateinfo";
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
    					$tableInfo.bootstrapTable('refresh');
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
    <table id="tableInfo" data-classes="table table-hover "
	data-search="true" data-show-refresh="true" data-show-toggle="true"
	data-show-columns="true" data-toolbar="#toolbar"></table>
	<div id="toolbar">
		<div class="btn-group">
			<button class="btn btn-default" id="add-info">
				<i class="glyphicon glyphicon-plus"></i>发布信息
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
						<label for="remark">信息内容</label>
						<textarea class="form-control" id="infocontent" placeholder="请输入信息内容" rows="6"></textarea>
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
