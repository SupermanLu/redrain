<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>基本设置</title>
<script type="text/javascript">
$(function(){
	var setting;
	if('<%=request.getSession().getAttribute("userid") == null
				? ""
				: request.getSession().getAttribute("userid")%>'==""){
		window.location.href="login.jsp";
	}
	$.ajax({
		url:"<%=request.getContextPath()%>/setting/getsetting",
　　　　　　type:"POST",
　　　　　　data:'',
　　　　　　contentType:"application/json",
　　　　　　success:function(res){
			if(res.login){
				window.location.href="login.jsp";
			}
			else
			{
				console.log(res);
				setting=res;
				$('#webname').val(setting.webname);
				$('#keyword').val(setting.keyword);
				$('#description').val(setting.description);
				$('#max').val(setting.max);
				$('#min').val(setting.min);
				$('#starttime').val(formatDateTime(setting.starttime));
				$('#duration').val(setting.duration);
				$('#endtime').val(formatDateTime(setting.endtime));
				$('#fbtime').val(setting.fbtime);
				$('#sbtime').val(setting.sbtime);
				$('#totalnum').val(setting.totalnum);
				$('#totalmoney').val(setting.totalmoney);
				$('#max').val(setting.max);
				$("input[name='hasevent'][value='"+setting.hasevent+"']").attr("checked","checked");
	　　　　　　}
		}
	});
	$('#save-button').on('click',function(){
		if($('#webname').val()==''||$('#keyword').val()==''||$('#description').val()==''||$('#max').val()==''||$('#min').val()==''||$('#starttime').val()==''||$('#duration').val()==''||$('#endtime').val()==''||$('#fbtime').val()==''||$('#sbtime').val()=='')
		{
			alert('请将信息填写完整');
		}
		else{
		setting.webname=$('#webname').val();
		setting.keyword=$('#keyword').val();
		setting.description=$('#description').val();
		setting.hasevent=$('#hasevent input[name="hasevent"]:checked ').val();
		setting.max=$('#max').val();
		setting.min=$('#min').val();
		setting.starttime=new Date($('#starttime').val());
		setting.duration=$('#duration').val();
		setting.totalnum=$('#totalnum').val();
		setting.totalmoney=$('#totalmoney').val();
		var duration=parseInt($('#duration').val());
		var time = $('#starttime').val();  
		time = time.replace(/-/g,':').replace(' ',':');  
		time = time.split(':');  
		var starttime = new Date(time[0],(time[1]-1),time[2],time[3],time[4],time[5]);  
		var endtime=Number(starttime)+duration*60*60*1000;
		setting.endtime=endtime;
		setting.fbtime=$('#fbtime').val();
		setting.sbtime=$('#sbtime').val();
		var data=setting;
		$.ajax({
			url:"<%=request.getContextPath()%>/admin/setting/savesetting",
	　　　　　　type:"POST",
	　　　　　　data:JSON.stringify(data),
	　　　　　　contentType:"application/json",
	　　　　　　success:function(res){
				if(res.login){
					window.location.href="login.jsp";
				}
				else{
					if(res.status=='success'){
						alert('保存成功');
						var duration=parseInt($('#duration').val());
						var time = $('#starttime').val();  
						time = time.replace(/-/g,':').replace(' ',':');  
						time = time.split(':');  
						var starttime = new Date(time[0],(time[1]-1),time[2],time[3],time[4],time[5]);  
						var endtime=Number(starttime)+duration*60*60*1000;
						$('#endtime').val(formatDateTime(endtime));
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

	function formatDateTime(inputTime) {  
		    var date = new Date(inputTime);
		    var y = date.getFullYear();  
		    var m = date.getMonth() + 1;  
		    m = m < 10 ? ('0' + m) : m;  
		    var d = date.getDate();  
		    d = d < 10 ? ('0' + d) : d;  
		    var h = date.getHours();
		    h = h < 10 ? ('0' + h) : h;
		    var minute = date.getMinutes();
		    var second = date.getSeconds();
		    minute = minute < 10 ? ('0' + minute) : minute;  
		    second = second < 10 ? ('0' + second) : second; 
		    return y + '-' + m + '-' + d+' '+h+':'+minute+':'+second;  
		};
	
</script>

<form method="post" role="form">
	<div class="form-group col-md-4">
		<label for="webname" style="margin: 10px 0 0 0;">网站名称</label> 
		<input type="text" class="form-control" id="webname" placeholder="">
		<label for="keyword" style="margin:10px 0 0 0;">关键词</label>
	    <input type="text" class="form-control" id="keyword" placeholder="">
		<label for="description" style="margin: 10px 0 0 0;">网站描述</label> 
		<input type="text" class="form-control" id="description" placeholder="">
		<label for="hasevent" style="margin: 10px 0 0 0;">活动是否进行</label> 
		<div class="radio" id="hasevent"><label><input type="radio" name="hasevent" value="1" checked>是</label>
<label><input type="radio" name="hasevent" value="0">否</label></div>
<label for="totalmoney" style="margin: 10px 0 0 0;">总金额</label>
	    <input type="number" class="form-control" id="totalmoney" placeholder="">
	    <label for="totalnum" style="margin: 10px 0 0 0;">总个数</label>
	    <input type="number" class="form-control" id="totalnum" placeholder="">
		<label for="max" style="margin: 10px 0 0 0;">最大金额</label>
	    <input type="number" class="form-control" id="max" placeholder="">
	    <label for="min" style="margin: 10px 0 0 0;">最小金额</label>
	    <input type="number" class="form-control" id="min" placeholder="">
	    <label for="starttime" style="margin: 10px 0 0 0;">活动开始时间</label>
	    <input type="text" class="form-control" id="starttime" placeholder="">
	    <label for="duration" style="margin: 10px 0 0 0;;">活动持续时间(单位小时)</label>
	    <input type="number" class="form-control" id="duration" placeholder="">
	    <label for="endtime" style="margin: 10px 0 0 0;">活动结束时间(内容自动计算)</label>
	    <input type="text" class="form-control" id="endtime" placeholder="" readonly="readonly">
	    <label for="fbtime" style="margin: 10px 0 0 0;">发包时间</label>
	    <input type="text" class="form-control" id="fbtime" placeholder="">
	    <label for="sbtime" style="margin: 10px 0 0 0;">结束时间</label>
	    <input type="text" class="form-control" id="sbtime" placeholder="">
		<button type="button" style="margin: 10px 0 0 0;" class="btn btn-primary" id="save-button">保存设置</button>
	</div>
</form>
