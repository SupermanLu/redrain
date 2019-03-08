<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>奖品发布</title>


    <script type="text/javascript">
   var isAdd=true;
   var id='';
    	
    	$(function(){
    		
    		var $tableAward= $('#tableAward').bootstrapTable({  
    		    columns: [  
    		        {field: 'awardid', title: 'ID'},  
    		        {field: 'awardname', title: '奖品名称'},  
    		        {field: 'awardtype', title: '奖品类型'},  
    		        {field: 'awardchance', title: '奖品概率'},
    		        { align:'center',field: 'awardid', title: '修改',formatter: function (value) {
    		            return "<button class='btn btn-info' data-id='"+value+"'> 修改 </button>";
    		        }}
    		    ],  
    		    url:"<%=request.getContextPath()%>/admin/award/getAward",
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
    		
    		
    		$('#add-award').on('click',function(){
    			$('#awardname').val('');
    			$('#awardtype').find("option[value = '"+$('#awardtype option:first').val()+"']").attr("selected","selected");
    			$('#awardtype').val($('#awardtype option:first').val());
    			$('#awardchance').val('');
    			
    			$('#myModal').modal('toggle');
    			
    			$('#myModalLabel').html('新增');
    			
    			isAdd=true;
    		})
    		
    		$('#tableAward').on('click','.btn-info',function(){
    			id=$(this).attr('data-id');
    			$.ajax({
    				url:"<%=request.getContextPath()%>/admin/award/getAwardbyid",
    		　　　　　　type:"POST",
    		　　　　　　data:'{"awardid":"'+id+'"}',
    		　　　　　　contentType:"application/json",
    		　　　　　　success:function(res){
    			if(res.login){
					window.location.href="login.jsp";
				}
				else{
    					$('#awardname').val(res.awardname);
    					$('#awardtype').find("option[value = '"+res.awardtype+"']").attr("selected","selected");
    					$('#awardtype').val(res.awardtype);
    					$('#awardchance').val(res.awardchance);
    					$('#myModal').modal('toggle');
    	    			
    	    			$('#myModalLabel').html('修改');
    	    			
    	    			isAdd=false;
				}
    				}
    			});
    		});
    		
    		
    		$('#tableAward').on('click','.btn-warning',function(){
    			id=$(this).attr('data-id');
    			$.ajax({
    				url:"<%=request.getContextPath()%>/admin/award/deletebyid",
    		　　　　　　type:"POST",
    		　　　　　　data:'{"awardid":"'+id+'"}',
    		　　　　　　contentType:"application/json",
    		　　　　　　success:function(res){
    			if(res.login){
					window.location.href="login.jsp";
				}
				else{
    		　　　　　　　　if(res.status=="success"){
    					alert('删除成功');
    					$tableAward.bootstrapTable('refresh');
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
    				data='{"awardname":"'+$('#awardname').val()+'","awardtype":"'+$('#awardtype option:selected').val()+'","awardchance":"'+$('#awardchance').val()+'"}';
    				url="<%=request.getContextPath()%>/admin/award/addaward";
    				type='新增';
    				
    			}
    			else{
    				data='{"awardname":"'+$('#awardname').val()+'","awardtype":"'+$('#awardtype option:selected').val()+'","awardchance":"'+$('#awardchance').val()+'","awardid":"'+id+'"}';
    				url="<%=request.getContextPath()%>/admin/award/updateaward";
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
    					$tableAward.bootstrapTable('refresh');
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
    <table id="tableAward" data-classes="table table-hover "
	data-search="true" data-show-refresh="true" data-show-toggle="true"
	data-show-columns="true" data-toolbar="#toolbar"></table>
	<div id="toolbar">
		<div class="btn-group" style="display:none;">
			<button class="btn btn-default" id="add-award">
				<i class="glyphicon glyphicon-plus"></i>新增奖品
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
						<label for="awardname">奖品名称</label> 
						<input type="text" class="form-control" id="awardname" placeholder="请输入奖品名称">
						<label for="awardtype">奖品类型</label> 
						 <select class="form-control" id="awardtype">
      <option value="奖品">奖品</option>
      <option value="语录">语录</option>

    </select>
						<label for="awardchance">奖品概率(千分之几)</label> 
						<input type="number" class="form-control" id="awardchance" placeholder="请输入奖品概率">
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
