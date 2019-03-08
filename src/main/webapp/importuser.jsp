<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>导入用户</title>


    <script type="text/javascript">
    	
    	$(function(){
    		
    		
    		$('#myfile').on('change',function(){
    			ajaxFileUpload();
    		})
    		
    		
    	});
    	
    	
    	function ajaxFileUpload(){
			$.ajaxFileUpload({  
		           url: '<%=request.getContextPath()%>/admin/user/importExcel',  
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
    <div>
		<label for="myfile"class="
	 btn btn-default">导入Excel</label>
		<input type="file" name="myfile" id="myfile" style="display:none;"/>
	</div>
	<image src="images/importuser.png" style="width:485px;height:410px;margin-top:100px;"/>

