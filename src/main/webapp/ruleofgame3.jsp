<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>活动公告</title>

<!-- 加载编辑器的容器 -->
<script id="edit" name="content" type="text/plain">
    </script>

<button type="button" class="btn btn-primary" id="save-role">保存</button>

<!-- 配置文件 -->
<script type="text/javascript" charset="utf-8"
	src="js/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" charset="utf-8"
	src="js/ueditor/ueditor.all.min.js"></script>

<script type="text/javascript" charset="utf-8"
	src="js/ueditor/lang/zh-cn/zh-cn.js"></script>
<!-- 实例化编辑器 -->
<script type="text/javascript">
    	var ue;
    	var rule;
    	$(function(){
    		ue = UE.getEditor('edit',{
                initialFrameWidth:"100%",   //初始化宽度
                initialFrameHeight:400,     //初始化高度
            });
    		
    		
    		ue.ready(function() {
    			var data=JSON.stringify({categories:'3'});
	    		$.ajax({
	    			url:"<%=request.getContextPath()%>/rule/getrule",
	    	　　　　　　type:"POST",
	    	　　　　　　data:data,
	    	　　　　　　contentType:"application/json",
	    	　　　　　　success:function(res){
		    			if(res.login){
		    				window.location.href="login.jsp";
		    			}
		    			else
		    			{
		    				rule=res;
		    				ue.setContent(rule.content);	    				
		    	　　　　　　}
	    			}
    			});
    		});
    	});
        
        
        $('#save-role').on('click',function(){
        	var html = ue.getContent();
        	console.log(html);
        	rule.content=html;
        	rule.categories='3';
        	var data=JSON.stringify(rule);
        	$.ajax({
    			url:"<%=request.getContextPath()%>/admin/rule/saverule",
    	　　　　　　type:"POST",
    	　　　　　　data:data,
    	　　　　　　contentType:"application/json",
    	　　　　　　success:function(res){
		    		if(res.login){
						window.location.href="login.jsp";
					}
		    		else
		    		{
	    				if(res.status=='success')
	    				{
	    					alert('保存成功');
	    				}
	    				else{
	    					alert(res.msg)
	    				}
	    				
    	　　　　　　		}
    			}
			});
        })
    </script>
