<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!-- saved from url=(0024)https://www.77302hb.com/ -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  
  <title>澳门新葡京领红包</title> 
  <meta content="IE=edge" http-equiv="X-UA-Compatible">
  <meta content="webkit" name="renderer">
  <link href="https://www.77302hb.com/images/ico.ico" rel="shortcut icon">
  <link href="./css/font-awesome.min.css" rel="stylesheet">
  <link href="./css/reset.css" rel="stylesheet" rev="stylesheet" type="text/css">
  <link href="./css/animation.css" rel="stylesheet" rev="stylesheet" type="text/css">
  <link href="./css/global.css" rel="stylesheet" rev="stylesheet" type="text/css">
  <link href="./css/index.css" rel="stylesheet" rev="stylesheet" type="text/css">
  <script src="./js/jquery-1.11.1.min.js" type="text/javascript"></script> 
  <script src="./js/demo.js" type="text/javascript"></script> 
  <script src="./js/index.js" type="text/javascript"></script>
  <style>
  	#page{
  	color:#fff;
  	text-align:right;
  	margin:10px 55px 0 0;
  	}
  </style>

     <script type="text/javascript" src="./js/lottery.js"></script>

  
  <script type="text/javascript">
 
    var oWidth = document.documentElement.clientWidth || document.body.clientWidth;
    if (oWidth < 1024) {
      window.location.href = "./index_m.jsp";
    } else {}
    window.addEventListener("orientationchange", function () {
      var oWidth = document.documentElement.clientWidth || document.body.clientWidth;
      if (oWidth < 1024) {
        window.location.href = "./index_m.jsp";
      } else {}
    }, false);
    window.addEventListener("resize", function () {
      var oWidth = document.documentElement.clientWidth || document.body.clientWidth;
      if (oWidth < 1024) {
        window.location.href = "./index_m.jsp";
      } else {}
    }, false);
  </script>
  <script>
  		$(function(){
  			
        	$.ajax({
    			url:"<%=request.getContextPath()%>/rule/getrule",
    	　　　　　　type:"POST",
    	　　　　　　data:JSON.stringify({categories:'1'}),
    	　　　　　　contentType:"application/json",
    	　　　　　　success:function(res){
        			if(res.login){
        				window.location.href="login.jsp";
        			}
        			else
        			{
        				$('#activity_in_content').html(res.content);    				
        	　　　　　　}
    			}
    		});
    		/*$.ajax({
    			url:"<%=request.getContextPath()%>/rule/getrule",
    	　　　　　　type:"POST",
    	　　　　　　data:JSON.stringify({categories:'2'}),
    	　　　　　　contentType:"application/json",
    	　　　　　　success:function(res){
        			if(res.login){
        				window.location.href="login.jsp";
        			}
        			else
        			{
        				$('#activity_mo_content').html(res.content); 				
        	　　　　　　}
    			}
    		});*/
    		$.ajax({
    			url:"<%=request.getContextPath()%>/rule/getrule",
    	　　　　　　type:"POST",
    	　　　　　　data:JSON.stringify({categories:'3'}),
    	　　　　　　contentType:"application/json",
    	　　　　　　success:function(res){
        			if(res.login){
        				window.location.href="login.jsp";
        			}
        			else
        			{
        				$('#activity_ru_content').html(res.content);  				
        	　　　　　　}
    			}
    		});
    		
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
    					
    					$(document).attr("title",res.webname);
    					$("head").append('<meta name="Keywords" content="'+res.keyword+'" />');
    					$("head").append('<meta name="Description" content="'+res.description+'" />');
    		　　　　　　}
    			}
    		});
    		
    		
    		$.ajax({
    			url: '<%=request.getContextPath()%>/lb/getAllLb',
    			dataType: 'json',
    			cache: false,
    			type: 'POST',
    			success: function (obj) {  
    				if(obj){
    					var sAwardEle = "";
    					$.each(obj, function(i, award){
    						
    						//删除抽奖时间中的年份信息
    							var username=award.lbname.substring(0,2);
    							for(var i=2;i<award.lbname.length;i++){
    								username+='*';
    							}
    							sAwardEle += '<li>'+
    								  '<span class="span1">恭喜： <em class="huang">'+username+'</em></span>'+
    								  '<span class="span2">获得 <em class="huang">'+award.lbmoney+'</em> 元 红包</span>'+
    								  '<span class="span3">'+formatDateTime()+'</span>'+
    								'</li>';
    								
    						});
    					$("#announce").html(sAwardEle);
    					$(".luntop2").luntopFn({
    						time: 25
    					});
    				}
    			},
    			error: function(XMLHttpRequest, textStatus, errorThrown) {
    				var x = 1;
    			}
    		}) 
        	
        })
        
        function formatDateTime() {  
		    var date = new Date();
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
		    return y + '-' + m + '-' + d;  
		};
</script>

<style type="text/css">#xmt-collection,#xmt-collection-video{position:absolute;display:none;box-shadow:0 0 0 2px hsla(0,0%,100%,.2);font-family:PingFang SC,Source Sans Pro,Hiragino Sans GB,Helvetica Neue,Helvetica,Microsoft Yahei,arial,sans-serif;background:rgba(0,0,0,.6);height:30px;line-height:30px;color:#fff;border-radius:4px;font-size:0;z-index:9999999;user-select:none;text-align:left;-webkit-font-smoothing:antialiased}#xmt-collection-video a,#xmt-collection-video div,#xmt-collection-video dl,#xmt-collection-video h1,#xmt-collection-video h2,#xmt-collection-video h3,#xmt-collection-video h4,#xmt-collection-video h5,#xmt-collection-video h6,#xmt-collection-video li,#xmt-collection-video ol,#xmt-collection-video p,#xmt-collection-video span,#xmt-collection-video ul,#xmt-collection a,#xmt-collection div,#xmt-collection dl,#xmt-collection h1,#xmt-collection h2,#xmt-collection h3,#xmt-collection h4,#xmt-collection h5,#xmt-collection h6,#xmt-collection li,#xmt-collection ol,#xmt-collection p,#xmt-collection span,#xmt-collection ul{padding:0;margin:0;color:#fff}#xmt-collection-video li,#xmt-collection li{list-style:none}#xmt-collection-video img,#xmt-collection img{border:0}#xmt-collection-video a,#xmt-collection a{text-decoration:none;outline:none}#xmt-collection-video button,#xmt-collection-video input[type=submit],#xmt-collection button,#xmt-collection input[type=submit]{outline:none;-webkit-tap-highlight-color:transparent;-webkit-appearance:none;border:0}#xmt-collection-video a,#xmt-collection a{display:inline-block;cursor:pointer;padding-left:12px;padding-right:3px;height:30px;color:#fff;line-height:30px;font-size:14px}#xmt-collection-video .collect-arrow,#xmt-collection .collect-arrow{position:relative;display:inline-block;width:26px;height:30px;line-height:30px;text-align:center;cursor:pointer;vertical-align:top;color:#fff}#xmt-collection-video .collect-arrow.active,#xmt-collection-video .collect-arrow.active:hover,#xmt-collection .collect-arrow.active,#xmt-collection .collect-arrow.active:hover{background-color:rgba(0,0,0,.7)}#xmt-collection-video .collect-arrow:hover,#xmt-collection .collect-arrow:hover{background-color:rgba(0,0,0,.5)}#xmt-collection-video .collect-arrow:after,#xmt-collection .collect-arrow:after{content:"";display:block;position:absolute;top:9px;left:8px;width:0;height:0;margin-top:3px;border-style:solid;border-width:5px;border-top-color:#fff;border-left-color:transparent;border-right-color:transparent;border-bottom-color:transparent;vertical-align:middle}#xmt-collection-video .collect-menu,#xmt-collection .collect-menu{display:none;position:absolute;top:36px;left:0;background:rgba(0,0,0,.6);line-height:30px;font-size:14px;border-radius:4px;box-shadow:0 0 0 2px hsla(0,0%,100%,.2);white-space:nowrap;color:#fff}#xmt-collection-video .collect-menu.show,#xmt-collection .collect-menu.show{display:block}#xmt-collection-video .collect-menu li,#xmt-collection .collect-menu li{padding:0 15px;cursor:pointer;line-height:30px;height:30px;color:#fff}#xmt-collection-video a{padding:0 12px}#xmt-collect-loading{font-family:PingFang SC,Source Sans Pro,Hiragino Sans GB,Helvetica Neue,Helvetica,Microsoft Yahei,arial,sans-serif;-webkit-font-smoothing:antialiased;font-size:14px;font-weight:400;top:20px;right:0;display:inline-block;width:260px;height:70px;line-height:70px;text-align:left;padding-left:20px;color:#fff;background:#000;opacity:.8;border-top-left-radius:5px;border-bottom-left-radius:5px;text-decoration:none}#xmt-collect-loading a,#xmt-collect-loading div,#xmt-collect-loading dl,#xmt-collect-loading h1,#xmt-collect-loading h2,#xmt-collect-loading h3,#xmt-collect-loading h4,#xmt-collect-loading h5,#xmt-collect-loading h6,#xmt-collect-loading li,#xmt-collect-loading ol,#xmt-collect-loading p,#xmt-collect-loading span,#xmt-collect-loading ul{padding:0;margin:0;color:#fff;line-height:70px}#xmt-collect-loading li{list-style:none}#xmt-collect-loading img{border:0}#xmt-collect-loading a{text-decoration:none;outline:none}#xmt-collect-loading button,#xmt-collect-loading input[type=submit]{outline:none;-webkit-tap-highlight-color:transparent;-webkit-appearance:none;border:0}#xmt-collect-loading .xmt-tip-img{display:inline-block;height:20px;width:20px;margin-right:10px;background-size:contain;vertical-align:middle}#xmt-collect-loading .xmt-tip-img.load{background-image:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADQAAAA0CAYAAADFeBvrAAAAAXNSR0IArs4c6QAABNRJREFUaAXdmrFvFEcUxnMBohQBYaFISarIwlBYyB1poHDhgqSjSdoUuELQ0tIhQQV/AL1bRGUpV0WICApKFHAUI5GUkYkQShDH7zO7vtnPs8fO7Jw586TPtzP73vfe8+3Mzry5wScFZTQaLUC3DJbASTAPjoDDQPICbIEN8Bg8AsPBYPA7n7MhJLEEboBNkCuyFYf+ER9GcH4aDEFpGUJ4es+ywtlxsAamLfJxPDWxQVcDyA+iew1cAoda7Eb03wd3gcbJ8wp/8Sn5GnxTQePrB/AdaIvjf+7dBFcYZ6/5LCMkcwz8AtpknRur4KtUj7KpbMXRJvJ9LJU7qg/RInja4uke/Wejhhmd4gLijIliWMygHZtAsAK2IuwiPz/WLHslbrAR8atYVrK8YahvJpaMHo25rqTongPPKpxLsJvDJvYYKqa0bwoDjZnYY3aT/gNdg5Ie+kqmlmeJtgcwlE8XxdZtTKF4EAyBy+WUYGpdJ6n7Uz7huOw8tDVRaOadLCjpje2iqTNLnCiLBCN4Yt/UjYl8GOml+Z8Foec46TELnRiX3lNZohiAjynF2v7y5aavAPSsdp4AYpFi35CYTtc+iDRR+Nhei9qjqLWZS++p2QmjzhM64TvvnLR3r/3oHJrivQQ/rarGmf3IhQ7g9JfvMLyvAactgMuZhlJmw0kzaRpmcJ5xXtrjrQcNn9nWGww9Gu64B1XDFF6fIMYzHjd9c3ahYd2jMcWEtBgOZXM7THoWwl6u34DkVXNbzsZdZAzJl2KsYg1dLHzKPdUAQrnP3uPvsGMWr6sYtfcKZVkJjQfTu1vanO0X8ViXlJCqM6Fop7lfxGM9qYTmLXptm/eLeKzzSkh1s1BcKbw3a9ce6xElVBcB62Bdqe6fxU+P9bAScmmrwLjeLLR3xaqEVJ4NRaWmkvIyIHvFS+PzoN330mN9oYS2jFV1s5ISvkyVzAOSOlXIgce6pYR86nOlvr7/MAIVOH4jqYvWn9P0WDeUkE4BQpkPGwWuf4TjifHom7pFUnfAl3YvpemxPtaayBd5RfZBYVT4+ALcBjF5TmdWrQ073xetKqGpLk4tsZ/w9w9w0YL4Ovgs1J90jW50cbptw03fPqxOIutzD1/fgl9BTB7SeaILP3r+ZG3u2HFzahu8HSfBBf5UwbkKXgOXf+nQqcREQWfiBi+2BS9WhG+LjKC0lf4TuEyssKJ81g1oN3cNdAxNqfjkEEsMn0eBl8/Gj0/ECH2fDJpFEtmgNJUyViSeaBf+fwYay6qFfx9VehdntzKWCCDy/5SKer0KjW2B5fQrFuDHLPFCY5VQ8VJwTuAxGxJJLwVXSfmMB9cou1gfCy6nTzEoEJNx6aqNFAMdp+iowiXrOKXNT0o/geQfp8gRBMUOvFICd13i0GMW+2Y0trsdeNWkGBQ5kqz5Uj/xX+5IsnYO6cdzaBwk9b5j/SJFffnjH6iVg7806doWPWZph8V1Ev4JkcZUbKLY9sQfrasugOQSsmwqW1+b0b0j8t1pzOwqMngydRvCPj+Nqasz2mHW0OZMi9C9/2lMnZQ+SUwvX19R0FVc5KP9/DQMqsQ1zj6On5f5P4PEtPXQ6sI3iXR1FtmKo7kFcGcd2p3HUAcuPY4L6C0DBaZDAI2TPf2J5ls86kG3sSzIlwAAAABJRU5ErkJggg==)}#xmt-collect-loading .xmt-tip-img.succ{background-image:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADQAAAA0CAYAAADFeBvrAAAAAXNSR0IArs4c6QAABLNJREFUaAXtmr2P3EQYxm/DEQFSIqHQ0KJbgUhxDTqBhLSiOCllKjraiDJd/oBURGlTXLVFujRwNRFHiejoQMAhRZQRSOFLASTz+znz5mxr9zz22vex4pUeeeyZed/n2bHH73h2sjGgFUUxxd0HYBu8Cd4Al8EloP0GnoBD8B34BhxMJpPvOZ4NQ8Q2uAsegb5mX334Q6xkk769Cb5D3ztgVvHxF+XPwQH4FvwAfgWOjOZIvQq2wFvA0dwFL4OwLyncYtS+jgujHhGyBR6AsF8ozMF18ErX4PZJfecc9RVmDIWPYzjfBN4WfwPtD3AbxPOxcmB8XU4+9a0Zy5ibKzuvOsDhFfAF0P4Fe+D1apshy/pOMYylGfvKIDFwdBX8CLSfwTuDOM5wYqwUk0PJ4WpGt+VNcLILnugN+wqMNirLWBgzxeZQcnES6W50dmRCzH3KL3X3MkwPYwM5aHLqNlJ08JmJ2+z+MLRW9wKnECW3vGeKhs5mMQF4m53ayDR/ArkAOWlybJ/9aOQ0qTkBnPgz0xTRPJdT4sahuNusr53TYAs49ztdnthsViORcSK3xFGuy1++VEYGsJfh91SbwNV3ofZgIREqdsrqZxnAmbvVmqTh6q0XGYV5Zd2oPADa7XrN2T2Ta8kY7jWWXHQJoJkcDpab1YKMcAJXc79IaMulx4UU56N03Cdtj1R/BArtLiHoa+NDcK2tNVxdLO6ndqFhY4POsTi73uZkzHp4vAg+BWHvt8WjocsW7VHZlsK0PC2KPzl2Xs+0BcytJ3ZTjLTebesvZyB3bero3CiLRRFD1+Zj8HriLxLzSW4g+u8nDTd8hmIdX58pcr2t2E4xuPBdUr3d7/B83OrgOrhvO0IPk7rWh7BDgKymigHVZ0Yq2SMTQehzzY7YQwUdlsXjUojoOeCRmIOIkRK+TNm0Q08el8XcdPzIwcf0e62PRvoNJiYJcrmjPVbQ07JYFBdzyNH2BRDTvBn58uRwgUPaDyomCbqIX+1pH0EX6PiTvZNli6L94GIWCepzy80g93sS5KFVFG1GEZME1W65XpMCBGcgS9SYYpKg2qTQe9rOETW2mCSoNm3fI6h208quRr8ZWDhSXB/tNqvyJM5NoN1zUlg59cHHDDRFvc21lV+aVeLLysR5nvooaAq0lZJT+s9AVdQ/nFetcwawTED1OgHqyamVXIz3SjWfqvbLKuNnBqqiOC1tFDGJe335kC7Gp6t5FvNjGkF/BqqiRhOTuM+Jpx190uJk0CU4/t4Dn4EuGfMxP9PiKvxfArUl+POWVBwA7fx/JElDt/NMT/lp6Px/xkqi1udDYxJkCrE+n4KTqJjxTDjP3K0nJyA37Whmk/wio9EmcKtCc+vifG+nKBIR67PhFaOGqPXZkqyI2kVY7LN6+534M2VMYGxNLv02jSui1mdbvyLKZyomCnf39sBoo6XvFMNYmrHzNomDdNsRh85+Tum+p7Qx/hpjbuaeT2xkGcuY7ZvDbQKW1eN8C0RGQbFMDuccTeM7f+y3T+o75xiJJsUyRqdPZHL+/+9lzZHjl3Tp4W0Ri0SKnc2++oiNg2aY7PPeI7QoAoSmXPdPfRI7lb9o/geraB3hGmMyvAAAAABJRU5ErkJggg==)}#xmt-collect-loading .xmt-tip-img.fail{background-image:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADQAAAA0CAYAAADFeBvrAAAAAXNSR0IArs4c6QAABNxJREFUaAXdmrtrVEEUxl1ZggoJSFC0lQ0KKQSRLdKIhWBpJdpaxDZW/gEWQghYWQjqgunSBewUYyl2goViTCGxEwVFxRfX33czZzP3emf3PiYP98CXeZ7Ht3N39szctPZElCRJpjB3FpwEx8ExMAHGgeQL+AzWwGvwAqy0Wq03lLtDIHESLIB3oK5IVzb0QTSSVl1tnHfRnQdnPBvfqT8CK+AVWAWfgFZGopU6CDrgBNBqngP7gclTKtdZtefWsaUlRDpgCZh8pNIDF8CBqs6l43R7lLJlIh8ivjWC8TbQY/ETSL6CG8C+H40dY2vC2ZRtiXzJZ7uxcd8ABifBEyD5De6Ao/6cmHXZdj7kSyLfk1F8YGgavAWSdXA6iuESRuTL+aRIY5guoRaegpFz4LOsIc/Alq1KKAr5dL4p0li0iVQXlLUyRmaR+r7qVuJoyDdQDBLFVG2lUNB3xh6zxThhNbdCTEZKsZX7TjFRu5ltAHrMdmxl8h+BYgGKSaIYh+9+TNI2KdEGsO3fmTyJfFsxudgokoX8eKbNhA7Q3q/tctt2s0wQJRqKzcWoWMM/vgxaBnCnhN0dnUKs+i2ULBUGwkA3Hd7IAHbdo5YPmlj16FlGobwyKwyuAMmN7MjubSnWNGJiz0RJp44AEiWHlXIz5l8D78FN0CR7P4z+Q7AKZjIBBhrMU+5nCe3m0YNO29l6Ad1gN7oiY3KPSmVS6IjMSzNCWfo7zNye09vc8eiww9mFYOSBAXS1Mr5UIoVinswv+vwzVsDzRjdzdWyRvEt7qEylzST5RlnnPNNCTyR8KUUKhSIyFwcyyA1iQ+cpxS6Z2sOf2bSaJMu5uaWb6FcmhU5jMhYgtpYdh1kRuu0aczahTomN0qSYG42MYsXenONwW43HrnG+DhFfBztDSTEnKhlH6Lzj8FiE1lwjnEL4UQ+pYytIirHoZBwhpWySNRH6kFbLpuNDCDkHRaQe4MffmpUvVtoAQq6xo+OO5IMI/UirSTIWUqjTj80iUs5VmvxGIeM+wDFn+MeWEXKOREork5dLdT6kkA7G+4T2Msm/BAzp1O0/hOKpAmXdVVTOKArsWJela1+ibwrmgYDzG0B+lUr9+Jq9QSWG+5uCVkgX55Iou5wMiQzFE2CXGX+oXwb3gckVKneZG2OlLPZ0l4vyw2pRigwo3M0UPKiVJpn9ohKbmR/WxqmPOcFwkIw3Jzop/GZSn0bJqRfoUDLe3GikIJNNTuWEztrHB6dfmkxsUsSePT64gJoc8CqTiUkKQj0gyRzwmhzBdWw2qZzOoFj0+F010oNKdMfBv0dwt0orDEoqXZIwfzXV2rjLq5XOoJ8ndWsQERtTrM539pLEEeq6QV0Nlb7GYu4M0B1Z6WOzBeSX6IvUVXALHPHHiurMGXyNJSUmjc5FoyM0WlfBjpTteOtaVvXtJnGPmmKTbO5soSCZ1Aaj8zpFRCE0Oi+8bOUgNTqvJD1SOojZe1a9Odv275R8Antrp1jqvTT2SI3Oa32P1Oj844VHSruftnS9BpQoo1DqYed5m1q7lC1nU7Yl8iWf7dpGhylivAMso6CaJoc9SqXxdS77dZ6Rbg9Yokk19WFH62Fh9cdrn+dx2MXKPPBzuP/v38v6H4WrQGw0/gEwT0xtyO34v2j+BVBzOa9sBqlIAAAAAElFTkSuQmCC)}#xmt-articleCollect{font-family:PingFang SC,Source Sans Pro,Hiragino Sans GB,Helvetica Neue,Helvetica,Microsoft Yahei,arial,sans-serif;font-size:14px;position:fixed;font-weight:400;top:100px;width:280px;padding:0 10px;height:36px;background:#1b93fb;border-radius:5px;color:#fff;text-align:center;line-height:36px;left:50%;margin-left:-135px;z-index:9999999999}#xmt-articleCollect:before{content:"";display:inline-block;height:18px;margin-top:-2px;width:18px;background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAAF30lEQVR4XuWbjZUWNRSGcytQKhAqECoQKlAqECoQKhAqECrQrUCpQLYClwpkKxAquJ5nzs2aL18yk7/JfGrOmQO7O5PkvnnvX3Ijbuemql86575xzj20h5/v2xOO/tE5x/PJOXdjz7WI8PNuTfboWVUR9nvn3GMTumcYwHjvnLsSEf4/tA0DwFYaoV8kVnfUpAHgFwNjCDO6ATDBfzDBofeMhvBvnHNve1WkCwBVZcWZSI3gH0zPAcpTGpWh0c/XFQgCxAsRuar45uTVJgBUFSP2s+n42tifnXO/mQ6/FxGM3Gaz/rEf39kYX2x8hI14Xtp/2Fc1AKrKpBB+bdXfoasigvDdzcZ85pz7dqUz2AAIVWNWAaCqP5mu5+YBFV+1rEQJSsaMV+Zhcp+8EZGXJf3xTjEAqsqqswqpdm26ONxNpQYzN4vtIb5INdj3vASEIgA2hH8pIkxmelNVXC6sbAZhE4AV4W8xUnsEJzVIGhvQ+68S320yYRUAVWVl8fFxw5U97vXBNYKuvWuxCJ4g5UKJFWBKsmUBMMv7a+Ir9J2VHxKJTQLhac47JAEwa/tHwtV1r7ytFit1O9pbrDCBxXqUGi8HwO+JIAedf9iz8jZBgCWQouG3ie2HNRsDbxTbBAKxJ/FAZwCoKq4Olxc3EOxyc6qKD/8x6PijiDwYJr11ZIYRoON2BvgJAIbenwnqD3F1CQCciGx6ohaAMi4SVXgQsjgGIF4hxmZTgri8u80EgMmqKp4hDpZeiwhyLu0OgJXV76a+H+wAAMgyY1U4YUEIQCqqYhcmF/5WM2I2AMYCjCxpe9juVDoEAN331tm/jL4UpbAlaBwEADIhW9huROTRnQpkrOY7ESH1HdaOAMBYQKgcp9KLai8MyIS82eipFZEDAUi59iVE9gBgKPy2FPJ9FpGaba4iTI4CwBYZ4xfuLC1qIGb9/4okGGr8jvICoUyqmlKDewCAnsdJz/AQ1VbhLM7YKxCKKZkJjJ4CQCr4GWr9L4QBqZjgNQCcUWOvVTnSBhgD9UzVE+HiBxEJDWKRgSt56QIAIJkLN02uYUAcAA2L/RN6eJgNMAbEucENAMS0+D8B4FIArO6hlVA9984FqMBZXnA4AA2AIgTJTPWepKoWATBVBRoA4JOTnL60j9T+AAwg2wv3z/4NADQlagkAbgHg3DJaqliKbOl7K3t1pV3495oSNVWNc57FDU4LhMwVEWP0pNns7rJo1S3h8a6mhsLVMx74QYZ9Syg8LRkaKE91V2vJEHl/nA43GZnqWU38IJsOm17GMfInEbk3cX67D6WqLHK4ybPkPFO3xHaXMjNA5rTrZEsslSv/Z9QgQ/9/NkVNDeKAiF/vsjEykwl20h1vi9+l/FMPRmYK7sdKxf+WSyxlPfHRGCyIa/KGHY3NBiDj+6ldvO+TqZLD0eS5+mxhWsZT1VSdQ/pw1OwAbiLFgiHH4y1CtH6TCXxOVv9EBQKd2a1AolWY2u+aCyQCEFLn6jADe1C9EVErQM/7iTIc310yzV8rkiI6jA0iv3tyqSCY8Oh9vKsN9alvOjvpbimTu0gQVoSHAXVlcoEq5AolLwqEDeHbCiU3Agn+DJ1AtqtyrEffzXNBd8424+IO/rx5yFtUoZWJpvzcubHxtleQlu9VlTLeXKH2pvBJN5ibyAYIeA1ihSlsMDdHlXiueq1I+CoAjG45m+BxY9+dSGtYXVG4IJbYUGi5VrhVdbBTpALRJNhCQ9C1ezxstFKqztWZ7maXsxh3bTMVV/ds1yszgWHE4ABC7saGf5WgCfUAEFLQIhUxitM3FOfZKtehgh3hq5lXzYCIDVARtdi61RV+Bgg+mvQT9hYcQWuO5ll1jHBzwXUXAGYXmDRFljw1QPSoBoIDPBekukLzbgACtQAIGAEQqesrPQL7b7mvwGpjX7oE9x0OAyBSDWgMGOhvzU3QFEgIjR1B6CIbUoP0LgBEYMAMf4scYPz1+ZglXMjwV+j5d7k1Pmqlc6D8DTpS6VqgaDXhAAAAAElFTkSuQmCC) no-repeat;background-size:contain;margin-right:10px;vertical-align:middle}#xmt-articleCollect.xmt-collect-success{background:#1b93fb}#xmt-articleCollect.xmt-collect-success a{margin-left:10px;color:#fff;opacity:.8;text-decoration:underline}#xmt-articleCollect.xmt-collect-success a:hover{color:#fff;background-color:#1b93fb;text-decoration:underline}#xmt-articleCollect.xmt-collect-success:before{content:"";display:inline-block;height:18px;margin-top:-2px;width:18px;background-image:url(data:image/png;base64,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);background-repeat:no-repeat;background-size:contain;vertical-align:middle}#xmt-articleCollect.xmt-collect-fail{background-color:#f9576b}#xmt-articleCollect.xmt-collect-fail a{color:#1b93fb;margin:0 4px;vertical-align:middle;text-decoration:underline}#xmt-articleCollect.xmt-collect-fail a:hover{color:#1b93fb;background-color:transparent}#xmt-collection-mask{position:fixed;top:0;left:0;right:0;bottom:0;font-family:PingFang SC,Source Sans Pro,Hiragino Sans GB,Helvetica Neue,Helvetica,Microsoft Yahei,arial,sans-serif;-webkit-font-smoothing:antialiased;background-color:rgba(0,0,0,.5);text-align:left;z-index:999999}#xmt-collection-mask a,#xmt-collection-mask div,#xmt-collection-mask dl,#xmt-collection-mask h1,#xmt-collection-mask h2,#xmt-collection-mask h3,#xmt-collection-mask h4,#xmt-collection-mask h5,#xmt-collection-mask h6,#xmt-collection-mask li,#xmt-collection-mask ol,#xmt-collection-mask p,#xmt-collection-mask span,#xmt-collection-mask ul{padding:0;margin:0}#xmt-collection-mask li{list-style:none}#xmt-collection-mask img{border:0}#xmt-collection-mask a{text-decoration:none;outline:none}#xmt-collection-mask button,#xmt-collection-mask input[type=submit]{outline:none;-webkit-tap-highlight-color:transparent;-webkit-appearance:none;border:0}#xmt-collection-mask .collect-hide-hint{position:absolute;width:250px;padding:20px 15px;top:50%;left:50%;background:#fff;border-radius:4px;margin-left:-125px;margin-top:-100px;font-size:14px;color:#333;line-height:1.7}#xmt-collection-mask .collect-hide-hint .collect-hint-title{margin-bottom:10px;text-align:center}#xmt-collection-mask .collect-hide-hint .collect-hint-content{margin-bottom:20px}#xmt-collection-mask .collect-hide-hint .collect-hint-content span{padding:0 5px;color:#1b93fb}#xmt-collection-mask .collect-hide-hint .xmt-hint-button{display:block;width:90px;height:32px;line-height:30px;margin-left:auto;margin-right:auto;border-radius:3px;text-align:center;color:#fff;background-color:#1b93fb;cursor:pointer;font-size:14px}#xmt-drop-area{position:fixed;left:0;right:0;bottom:-100px;height:100px;max-height:30vh;text-align:center;line-height:100px;background:#006eff;transition:all .3s cubic-bezier(.6,0,.4,1);opacity:0;font-family:PingFang SC,Source Sans Pro,Hiragino Sans GB,Helvetica Neue,Helvetica,Microsoft Yahei,arial,sans-serif;font-weight:400}#xmt-drop-area .drop-hint{position:relative;color:#fff;font-size:14px;line-height:100px}#xmt-drop-area .drop-hint span{vertical-align:middle;line-height:100px}#xmt-drop-area .drop-hint .drop-icon{display:inline-block;margin-right:12px;width:21px;height:14px;vertical-align:middle;background-image:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACoAAAAcCAYAAAAX4C3rAAAABGdBTUEAALGPC/xhBQAAAtVJREFUWAnNmL1PFEEYxl0VQyKWGMOnkUhDo4000kBiQ6IWYoGtjRTExlL/BRurszBaGWOARCsT5avxD5DkLGwoSGgQpTDxg/P37M3sMcvN3t7O5nJP8rvdnXnfd57bnZk9iE4EqFarDZF+C2ZhDAYggl2owgdYjqJom2PnhcEBeA5/oZX+EPAChjvqlAFvwk+QfsMbmIdx6IOzMAb34DXIqPQd7nTELAMtwj+QlkCPO1PEXIRlsHqQmRDaySi6k4cgo4/arUfOQ5OvGnfbzc8VT2HNSfu42zZpB6GGzEp7MGjbSztSVAtHWgotSg07DV6G1nLyKTwEWt1aOC3npJPc5IIaI6AFpnra3nLpZI4o7ZOnYIX98FureAY/D/2+OLOnvqW/B+Z8cen2PEa1mUsr9YP/0xj8RMRqlln635sq0/5qbfYw4FeQxrNS6e+HLwo00nnTO0u7Hr+kHeQXHEAVKjCTNY63zxThUOvzBdGXNql4Kcus3UXqke7nGpeXfePF7QRMwFPYAn3TWL4kOo+aTN9R5TY1S/s1uAS9oDfaFXgC9gtoC5s6Ni6NZ+AZ2DcPpw0dSzANRCyYqNhQI8P5Agu+/HQ7+aPw0dSR2cad5UImbafeHJork+B93EcHIE5m4/nIMZb6OdEOkNukrUlOBNbPmm1XQd1JaQeCVmJchY+keMETSoyCnQYzMqk5qcetOxlkUp6oEaugPyeNQpqzUkWFtXCkihNV8KJeKvyOanhqaYFJVV1odUuTBb05afVSpRk9Z+od6M00YkbackbsjotkrstoN8v+CNqR0W3jdKILHd82njZKX0xlfVnm5jDYN2P521MZRjF4Gt6BtJnU5KK0DT8pWvAELxdgHaQfYOdpvF8FvUILekrSMNMDV+Ex7IK0D9eTIHtCY+aPEmV2UBuM5fz+1b9fHBGg1X8fboD22Fw/TIgLlf4F9Ble8efKarrYf4sfOsOBuCNgAAAAAElFTkSuQmCC);-webkit-background-size:contain;background-size:contain}#xmt-drop-area-hightlight{position:absolute;top:8px;left:8px;right:8px;bottom:8px;border:1px dashed hsla(0,0%,100%,.3);transition:all .2s ease;z-index:-1}</style><style type="text/css">.xmt-toast{position:fixed;top:0;left:0;text-align:center;width:100%;z-index:10000}.xmt-toast .xmt-toast-inner{display:inline-block;height:30px;line-height:30px;padding:0 20px;min-width:280px;border-radius:4px;color:#fff}.xmt-toast .xmt-toast-inner.err{background-color:#ed6f6a}.xmt-toast .xmt-toast-inner.succ{background-color:#1b93fb}.xmt-toast .xmt-toast-inner.inform{background-color:#eaa000}.xmt-search-img{cursor:pointer}.xmt-search-img,.xmt-search-img:before{display:inline-block;width:40px;height:40px}.xmt-search-img:before{content:"";background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGAAAABgCAYAAADimHc4AAAAAXNSR0IArs4c6QAADd1JREFUeAHtne1vHMUdx38zsw+35zsMRA4PDmAsIoiBCohQeWqJSlWVVi0qwlCpD2qlvmnf9lWlSiFS/4O+RaL0QSpchFQqlaoSVUAIUKNAxIODFWpIcHBjyyHO2bd3uzsz/f3mPMdd7hxfXd3eQ3Yk387Nzs7ufr7ztOO7+zLYJmitmc1y6NChRvzgwYM2uWVbKpUaeVp2jMib2dlZ3elWkE0jGdk08jDGGvFGhqZIR1gWugVOsOtgZ2Fi4kjjmGKx2Ig3lXnZRcvlcgPyysoBjJeAhLKiWEE6idEGkOBb8DMzM7i/Dp1gLywErFA4xWDvXggWHeb7Sy3Hr656Le9HVYldu6IGcLrHWu06He5JNJw8CevrN+np6VCTKFaMubk5k5+EuFgEpxmShV+v8cCotheLx9jycsgBplgQrHIxOcm8xYi5rmScT7ByeY3BVfVSCgVxWQiw4Xl1AT4HKBbHtevWNCxKHU1O6uA0wd+lwnAZhTimyuUJPTNzEFsEUItgyBiaRWgIcDF8PJhb8EK4wnXP8Fwux3MXGK/JdQ5FwVSFs3zeZWESIvgxkAGACCk+ukEGgWYJYduAIB/oKCprmVdaVqXOXwgUz4FCViqKJhH+FdIKUSrtV9QCLhbBCNAR/vg4l0sgACrc85RTrbpC5V2hZSRY3udcCR6LmEuumFsLGOSUoR47bKQFcJmq1/5qAJGnNN61dpSvVF4qnUS4dWU1lBKZSWTHpNytlsfHASs0jqPtIhhYJADSY6USMFPzEf7utTWxnCROMc6LCtcu09J54K7bfhQE/vc553sx/5ghnr1YAhtKqZNhWPvzG8c//INmIskrFpfditztOAmKIJGpWljYr6g7woPMeIA1HMkzxldWVrDPX2FrCF6uOCIMEudKVXSqDnjTu8dvuPuOW5/1ffenmPdaPMSj47LQQsAjNp7nfn1q8tr7eRK9sVqLNooqB6u6CvJ0DNgdwfj4GX306FE4fPgwHDlyRPPN2o8lzeKAUsSBdh/OdAJer/nK1UnNn5qa/K0Q7IGW02VvtiRArIgZsatw5RJLYkps61P3WXMssadR2XQ/qAYPw1AIMelg/+VGHvdyWMA999z540Ih95stz5bt2JLA+nr112+//d7vq45f8yIclyMeS3kmCYJAHjhwgAZNjdNLfGzAp1db+8fGylzSQIt9Ps/n3Fzee3LLM2Q7LkmA2BFDYklMia1tBXbFQFD/PzHxC/b55+exO7qAY4LjqLzvjoHnxVL50zde8yvM417yTNnOjgSwaykufHL2mRx4quZyJUOuKpUQH9ACHIQP6MOHD4GZhtIDF3Y/jB6yaJ5PU80qixzBPRfh5zuWniVuS4DY4aTcrapKHCgmWM7jajfOj86cwrF2mbr+ehdkSsLlBe+cw2q1kMeOw13XwdagjEDbninLcAkCyiGWxJTYEmNayrGB07IDBVrbcV3BxJWCOVj3lZLCwSHZZsy2OyNADA1LZEpsiTGxptKIvanhNABH0ZJZ29nAzsqBGLshfNh1VCbAzrg3jsJnY6ETZKljnoDLA0cg5yXmefWVZDMLsrlpYa2AbzjHkRlfcNho2W/zZdvuCRBDwxKZEluzeNl0OLfTIZOGq5qhQPAR5t4MTXmz6A4IWI7ElNjalWMqitg3anjLWn4OWwGLsZ/KxuAdML/oEKfOEpna0My6hbBTpvX8kNGKpit8kEyawcIemG3/dwLEEJfTII5quDxHqw4u/uFC6WZotACbkG3TJZAJkC7vtrNlArQhSTchEyBd3m1nywRoQ5JuQiZAurzbzpYJ0IYk3YRMgHR5t50tE6ANSboJmQDp8m47W8tSRNvelBKqtQjmTy7CufNloHgvQ8734Oori3Dr3j1A8X6HvgtAwF9/632Iky/WR3oJhc732dlVWFk9Dw/dd0ffReiLAOX1EP75+nE4tXgW1jfCXvK+ZNn/Oj4PhbEAbtpzDXztobugWMAPt6YcUheA4D/zp5chrNZSvtXOp6MK8MH8J7Bwagl+9oNHUxch9UGYav6gwG+WhK6Jri3tkLoA1O0MaujHtaUuQD/7/O2E78e1pS7AdhAut/2ZAH1WPPVZUC/v94brJ+C+/fvgumuuNqdZOnsO3jp2Aj79bKWXp/2/yh4ZAR64dwYevv9L9GWTBpC905Nwy83Xw6tvvgtvHJ1rpA9SZCQEoJpP8PErQgj7PXjvxMeG8Z37bsb0O82+T8+sDGRLGIkxgLodqvkEn7qcjUrV/FGc0mgf5RnEMBIC2D7f1vxm0DbN5mneNwjxkRBgEEDu9BpGQgCa7VCgPv/iYNNsnov39/v9SAzC1NfTbIcGXAq227GDMH4R0YwN/Ybd6fwDIcCT333YAOx0gTbts/+swot/ex0ulCs2qbGleT5NNWkmRMvK9GcDwad9g/osMBACWFiX2l5/7S74yVPfgNJfX4NO3QnN82mqmT2IXYriFvteeOnVLfbUk33Phe9960GYvuk6+OETj8BLf38T5v+92HYM1fJBreltF7uZMBSDcC2K4fm/vArvvP8RuI4Dj3/7IfjyPbdtdU9DlT4UAhBR6stffuVo458mj3zlbnj0kXtblh6GivzmxQ6NABYuzXhoMI6TBO6+4xZ46rGHgbqoYQ1DMwg3A57/aBH+WH4FZr/zVTMu/PLnTzTv3jb+0cdn4IWXXts2XxoZhq4FWCg0E/rd8/8Amp4OcxjKFmCB0zMBiTDMYWhbwDBDb772TIBmGn2Ipy4AfRJtUEM/ri11AehjgIMa+nFtqQtAC2VBzh84Deiamhfx0rrA1AWgD8DSZzBvv3XKfDA2rRvd6jzU7dC19ONzoXRNfZmGkgiPffP+rZhcVumpt4DLim4XN5sJ0AWkXmbJBOgl3S7KzgToAlIvs2QC9JJuF2VnAnQBqZdZMgF6SbeLsjMBuoDUyyyZAL2k20XZmQBdQOpllkyAXtLtouxMgC4g9TJLJkAv6XZRdiZAF5B6maVlOTopSjQpC9CzCr2yZARCbzrG9fIKRrxsoQVa50Xgovte7KJJiYOue+tf3HSjBbT4I1bRukG7aLORfJEzi+2QQFJniUxtaGbNW+xZ0RsxQEM4hQ5xNtiDsu3OCFiOxJTYAjK2gdg3WgAlkjEltQ6F/PErn1pxQUr07wd97JUO6ZbYEUPDEkkSW2LcfDtGALJeJUvWJJHa82MyPVHCUcrj6Ggldf1Lt81HZfGuCBA7YkgsiSmxJcbE2noQk40Vm5qaYuGeAuPnEy7DGo4bXKDXAHpfaeeqKwo++kc+2NUZs0wtBNbW1p9dWl59lwteQ+6RKseJ1m4S7mHSvXBBP/fcc01dEJoRR1cn2vcD5SaJis2PuPHkg/mPX4zi+J2WkrM32xIgZsQOrTASYklMiS0xJuNnG0wXRM7P5AQdnY51tRqpULgyx/KoFvoOQBzPnzxzKIri9H9Oyl7lkG2JlWGG7IghsSSmxJYYE2tiTrdlvCTRy4RPT09zdIIm42YXvYM9lXP9wHdycU0FnOk8Wo7lbt839fh4Mf+o4zo34k9iDO5nDPsgGNIMkzg5vVauvPzBiU9eBKaqSrOK66NFZy2p8mpcy+VibBiTcbG4KhcWFtDWdlZta+aJlhs5wAahsAGh9UYO7X08xRL8wU20GdM4xDOFFk2Ko18W4IiNuox+QGswnUiJ3jBccY0+SYzMm2XCtRPhZAd/+FRUOdq2QSxw9h9XL2XmaQQgm230PTdmztQK0AnacRzp1lzmkSWrJ4UvBcZFgj916ro4oLj4pS0HH/LQ8Y1xSSM5gwb8lsfrEdKj+bEUuxa8fZyuc63QJkbil9UStAgzXTaTTk3goBsJWWPopOrHOkoSEQPkk3rt36/m5g5pNHLTaNfD9NNPP43wSuhxNaHJA51suMVEItHQOa44VPFD7fo5GddwKEFvROy4UCAhjEkZSC7w7Gjs3TD9wTONdDDLC7hKgBqgDgI95LnEFiET7BqYdmPXZ7GqVGPmBFFe8fi8W5byPLriiVPYU5GRZ8nwIfam1mIxtN3W0pyhtyQ2GeONSPZ82OiMSRnV/7rtFZXb/58DNnfXs5f6TyvTUg0FesiieT7nQtJsBy2acZrD0S+pO0vzhgDUDZG3YbOvvPxwzThBA0TGD1cGORHI2BhTkt8kzq/IJM4Yv8GmT1YcRabMnt1/nwumRTVzCbRehssLtGpAD1n4gGWm7zTbEWFVCuHhuOAl6+uhEre1+skja/KRNJ7yprumpoABNkXQpdJ+NT19DJbFMp5rH1pBJ3psLJZhBR/P0JJVV9AYl4wpJWcCh6LQD7ELGjPXVffK6jOlHp6eVjRN8f4GrpsF2F1LLf2a1hWs/DjP55VI5YJYbWzklOflUYhTevcaqIWF/TjrAd0Mn8ppjJedRECfYY2DBlteXtZxvI9Vq6vGD9c7V2BuFV1XPcGMN+JVVEwN6kZww/udXQN2mxcRJkDL9oSuUo7N2k5Sxfc46lauSHR0HkdDZ1JJeQLZxWhbHmiErzvBp1O1dRfYEhi1BNo5MzOD21kgw2dyXF1YCFihcMr44ZIlq+8vtRzfbNFHx49qaF5OpnuktZ1wT/0Jlx6ypqdDs9ZTf9gqwdzcnGk1tttp5tIC0O4gEShuhaiPDaWGGDYfiWLjl/PWLqwRAwudlpqpu6FA4GlLvQxtm8O2AK0YdJAVhOIkSqfQ4s7aKcOQp7X8/6TpXixsSrLAKd4JOqXb8F8udNoAwLXtOQAAAABJRU5ErkJggg==) no-repeat;background-size:contain;vertical-align:middle}.xmt-search-img:hover:before{background:url(data:image/png;base64,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) no-repeat;background-size:contain;vertical-align:middle}</style><style type="text/css">.xmt-collect-video{display:inline-block;width:110px;height:30px;line-height:30px;border:1px solid #36363e;border-radius:15px;text-align:center;color:#1b93fb!important;vertical-align:top}.xmt-collect-video:before{content:"";display:inline-block;width:22px;height:22px;background:url(http://webxmt.image.alimmdn.com/png/logo.png) no-repeat;background-size:contain;vertical-align:middle;margin-right:5px;position:relative;top:-1px}.xmt-collect-video:hover{color:#fff!important;border:1px solid #1b93fb;background:#1b93fb}.xmt-collect-video:hover:before{background:url(http://webxmt.image.alimmdn.com/png/logo-hover.png) no-repeat;background-size:contain}</style><style type="text/css">.xmt-depth-search{right:10px;top:10px}.xmt-depth-search,.xmt-depth-sec-search{position:absolute;display:none;width:70px;height:25px;line-height:25px;border:1px solid #93b2f7;text-align:center;border-radius:20px;color:#3a65cc;background:#e6efff;text-decoration:none!important;cursor:pointer}.xmt-depth-sec-search{right:30px;top:5px;z-index:10}</style><style type="text/css">#js_content{background-color:#fff}#activity-name,#js_pc_qr_code,#js_preview_reward,#js_preview_reward_qrcode,#js_sponsor_ad_area,.rich_media_meta_list,.rich_media_tool{transition:opacity .2s linear}#js_pc_qr_code .qr_code_pc{width:170px!important;right:-170px!important}.xmt-styleArticle-collect{color:#717375;text-align:center;width:140px;padding:15px;font-size:14px;border:1px solid #e7e7eb;border-radius:2px;right:-170px;position:absolute;top:200px;background-color:#fff;display:inline-block}.xmt-styleArticle-collect:before{content:"";display:inline-block;width:125px;margin:10px 0;height:30px;background:url(http://extcdn.azber.com/static/img/n_logo.56d6f30.png) no-repeat 50%;background-size:contain}.xmt-styleArticle-collect li:first-child,.xmt-styleArticle-collect li:nth-child(2){margin-top:0}.xmt-styleArticle-collect li{list-style:none;font-size:12px;float:left;text-align:center;width:50%;margin-top:20px;cursor:pointer}.xmt-styleArticle-collect li:hover{color:#0590ff}.xmt-styleArticle-collect li:before{content:"";display:block;width:20px;margin:0 auto;height:18px;margin-bottom:6px}.xmt-styleArticle-collect .xmt-collectArticle:before{background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAAAAXNSR0IArs4c6QAABBBJREFUaAXtWV1Ik1EYdptjjIogKMigqMQh3XVhUBYM04tJGl4MInCJoRPpKooihH6Qfi6CINANNNhF1IJEjKlJMCzs586bwChQw7scw9LKta3n+fom8/P7zPmdz7mxA2fvOe85532f5/yfb6Yig0NXV1c/XNTRjdfrNZtMpqQRLs1GGM2GzQKRbPT6aj4LI7Ja72SjLG9GxMTe8/l8VoiLiUSiGnIvdaICttvdyWRyi2zvsyi7sDNpNpuHysrKHjidzj+mUChkm56eHoWzCoFONtLUaxCqslRWVnbA69mN9CzY1z7Ymy/G0DdgNIogY5A1bW1tYZGOuru7+2D3NG2KPNmxHGqwFAZhluu8wQwn5XSCMCqaxD+zxvy2tra+hOV3svVysilmBoR+ysqcEZhFKczWvNl+C0Q22/wrjEhejghvB3qJ6bWhe2rhYOrAFeeVHiA4NK9OTU2N9PT0bFtvh+giAhKXcLrexBl0DGQCkNIlNBMwIHEG9TsRj8diseFgMGjJpH2qri4iAM7T9QeNIe32+/13UobXIkHiBNo9Qkx1QL/b7Y6vpa2yji4iuDuNWywWN05YyTlG5zLAeZVO1PKYRg7o+xCl9QUbfti7q1Z3LTpdROigpaVlED3anubsIci40vIrkoFAYBemEdvtYCFIDDkcjnQbK9r8T6GbCB3gsunDm+Ae0wBnQXyK9XOYeWXAGrAvLCwMoM5+loHEuNVqdfNxpKybSV4IETrEyFwBqGey860A+gJklr02w+GwJRKJPEaZ9IhD/Rmka5ubm79nAlqtrjAiAJW02WyNkG/pCAD5xA0huT3leGJi4j500tsE9Qi+FqM5kyrXI4URIYimpqZfAFiH+IV5gD6E6GSaAekLlCjn5uDmZsG8iCCUCAHhwfMN64WLfVYLIAi1g8SQVvl69MKJEATWyyeQ4RT6rQTFTYGbg1KvN28IEYLCyLzBGXMO02jp6zvSQW4KekGrtTeMCJ0B9BOIa7LjMWwGnnRisl6IMJQIEWIt3MZ0uo5Yz81ACGoVI9KHBxW9UBWm2Q2hBlWMGT4iKj4NURWIGNKtOozyz8kI20OW6rCz4U1xqPINc1B2PGvCv64jyJykAmSeQ4SZzoFQDTKniBO4B/gR+xbSVWSI2IA0Yy6FBDh0mrHPj2KPP4/MfC6hJ1Zg5g26Edv7e84zKfT29u5cXFw8isyyN4RcvBnFpN1uH/N4PNLldImIEilfcnNzc3uU+mzmS0pKvrpcrhUXUWLSPNmj0WhFPB4PZxO40je+fR2B7oNSz3zeHIiaI4IdjOcL/9raNAHPguimAWMUEM3FruUQ36yGMVoHtMoF6T/iFVmfiS3NqaVlBCT4d3CpVrkIPc4H6TNsJrbyZrH/BZcBYZc02GJvAAAAAElFTkSuQmCC) no-repeat;background-size:contain}.xmt-styleArticle-collect .xmt-collectArticle:hover:before{background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAAAAXNSR0IArs4c6QAABDpJREFUaAXtWV1oVEcUPudusruhqYLYQrUq1kApgoKFlCotBH8eFH8QXPBFWxRUmmykYqmUQlsobX2Q7hJaFEqhD0UjKGIxSUVYorXVtyj0QRTUEhGNYlkl2U12T78z2Wvjdm90vXO7m2Xn4c6dMzPnfN/8nDNzL1PAKfytnBCidWom20kOM6NoPzn2VVZGY51IZcbd22p9RrzHpjI1NTMjrOP35kFpvDxCe0RoJQRzbY4pfO0r0PeC6oTuq7Z0C9N1R6j37cWUSLXxGLckJXJDqJ+EWm0Z+V/1MJ1dFKXlzk2hfVOWhI6Y0DuXM/RhA143mhFkGg05tGqkg1OmbOmByH4cy2uDqrMZ2SNJWZXPUw/UOtgSG/XxRgFzv20SBb2BZJk4/4pN94dRDg7qtXRWdCMOG+HUeoxjZmqsGfdbJ1JtK7A+IzU5I3o68EvMrw7fSyuckE9v5OmMHyDQsQ/HpNMzf5AXn3dAfBFBdN2LgPoFjC/DUecnERzlykzhpGxG5P9Sjxp/p6lvU7eEylRhmvsikifS6PpQNYFQLJKkr8sBEe2Sd9HvR5AwA8AOnTga41w5Oty2voiMxnnAcSgGGMY4QH0USchOV/lkeeQ7eT03RsdBYnx/MR3KxvmbyfpMVueLiCrOdHCPw/SBawSz1AUyq91yqbz5e3lZRs2Bb4bWM1PvskX/6ijV52ky30TUAA5wBwFmvzEmFAKZI41dsqSU8Ve7pSmTpZOYvflaj34D05opppejUu2fVWaFiBrLxOljLPSjxrBQM2D90pSQJ26bbSkK3blFP2M5mUsc2g+GwrRmaBunnxWwVztrRPQL4qzptAWGfldjesXNCZ2CH5vuGv/tEh1w7yaQpcWhNcO7eNCt95NbI6Igrr/PI9EmWoflck3LAL0QjzZ9N0mow+RwDthXMXUWhRrfmVUiiia9g4c4RKvhye55oVPnkOnkXq/655FbJ6IgMu18Bbe1DSCTKQalTkGdQ7HcbzkQIgpquJPPYTO/BzJYYeMJJLrVKbhlm3lgRBRktpMPg8wnBjDT+VnTaOuU/a0AMl9hJj6LRmm9OgObszBRl/nwMFEQxDvIfJ4NQvEEnYEurQl2An+tEwl8iMs0oDNyv9Cnpcy+FW2ulzj8Vl2gIJDf48aEnIanX2EERMfgYVL6Xu0JwWklTtBrFScwn2S9peVyAF+4pVU7gRL48g0NtNQZaed+RN/taPCoRKNqF6VxPd4y3M4XEHjHU3NSXsoKLYXgiTuEW191Of5YhR06n25nczh9TKQYqN7k7t6l2cXySpbn5Oivq3H+z0FUMXlG9qHb1IofKalKAi+2PejQW5BdLJZruWYCoueM5JnuY93pr62qSXmHHlQNmKCAeG52L4P4TtuHmPOaV70l+Z/Z3by+HF2eS8tTidA8RNUWz3oLFRhd8xm2HFU1s9n/AZcbKQuxnmnLAAAAAElFTkSuQmCC) no-repeat;background-size:contain}.xmt-styleArticle-collect .xmt-collectStyle:before{background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACQAAAAoCAYAAACWwljjAAAAAXNSR0IArs4c6QAAAo9JREFUWAntmD1oU1EUx/NeJCIBhYKD4NBd0VXEITqmioF8DA5dqhSKCg5VFx10UTuIiEM7ikXIx6DYQEHQRRE3RdFRUOggCEqCKCTx9399L9y81+bS5fkK78LNPd/nvHP/3NLjZFitVmt/v9+/A1kYDAb7JItrOY6zRq6XruteLpfL3xwV0+v13iGciKuITfL8yGazh12/M/+7GNU4oVp2QBTEadG2qUql0l7n4vmt1+tTZHrmZyu4JmbiLkZF1Gq1Fb+YjGpxAyYpZ1qQ7SYE6rEL0A3GGmxRCWaccS7plY3rjnSJ65AVQ7Y7t33xVvWJ61BakO0KrRhK3yFbC+PWJw7UVgyl71DcGLHl234YSt8h253Grd9+GErfobgxYsuXOAwlriDrH9egxcyRjjBHWmDA9CSfz98vFot/At1GZ7vd3tntdi8wQDjN3GeeYdSbjezCMnWoEwhJGpmeEXh3o9F4QDGvsDtGgoVOp/OZF/wMdOS/UMmkk41s5SNfxVCsINdmp8sXfwyUDIymA1pns9ksE/gTgedgzeudhF9G/5ZEBWhviZYMZpk96QnXfzT2mVMsxTTkEdLB4ByFLPmavxR4HedV+BvsUyGPF/AH2XtNOT7ewAm/k6Yc+jv7A/t4SP40l8udL5VKX+nmcGBFnDWHIA5f9hyHEyGnIStD7C7ySDbVdrBxBf4SBruGRqPEb3zugrXbYO0X8auo7+ETgYTphs9jDwPCDvf8COVIURho8rFIoKsU89N09oelN5HpmoPr7EM/BMTXNFE17enEHuLdQjZLvAj2kHtDz6FCRiQ5yznDPoDBFwLMVqvV12bgMM2VH8Je4M1gP89Y8H3YxuTp1lH4JT+HfEbGwv8Abt0W+vBIMxYAAAAASUVORK5CYII=) no-repeat;background-size:contain}.xmt-styleArticle-collect .xmt-accountSearch:before{background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAoCAMAAAC7IEhfAAAAAXNSR0IArs4c6QAAASBQTFRFAAAAv7+/zMzMqqqqtra2v7+/qqqqsbGxqqqqtLS0rq6usbGxqqqqra2tsLCwqqqqrq6uqqqqrKysrq6urKysqqqqra2tqqqqqqqqra2tqqqqqqqqq6urra2tqqqqq6urqqqqq6urq6urqqqqrKysq6urq6urrKysqqqqqqqqq6urrKysq6urq6urq6urq6urq6urq6urqqqqq6urq6urq6urq6urq6urq6urqqqqq6urqqqqq6urq6urqqqqq6urqqqqqqqqqqqqq6urqqqqqqqqq6urqqqqqqqqq6urqqqqq6urqqqqqqqqq6urqqqqq6urqqqqqqqqqqqqq6urq6urqqqqq6urqqqqqqqqqqqqq6urqqqqqqqqq6urqqqqp6yG2wAAAF90Uk5TAAQFBgcIDA0PERYXGxwdJCkqKywxMzU2OTs/QkNERUxUVVhdX2RnaGlsbXF0eoCGlJWWl5qbnqChoqSlqaqrra60ur/Bx8jKzM7T19vc3d/j5+jq7O/09fb3+fv8/f5vWHlhAAABp0lEQVQ4y82U2VbCMBCGowVxRRFwQUVlUwtaRYsLIhSVVRFw3/q//1s49Ri6kJzDpXM18+drmpnJhDHbFveNZv+jW6/sBZncxtU72NbYknHb93BbbVWEjR1ba8/FRGRGmVtOG+8UfWWHualrWnhUlYEwqb2RUhjz7mdxZwGXNntDWt4D0n+/c0PJnRC5686DlJzg4OfAZ9j5KeV7JsrQVwMMR6xSHgFhyUJfQMwOqc6qpLg6ULb7RvVTJOA88OLnwT5QlPa1BWxy3wASUlADNO43gYgUTAGn3O8DM1IwDlS5/wEoUjBKF477XWBupB3rwJIUTAIX3K8AaSl4BBxwf8/dULe1HT0MAu+TEm4FePUNooajqB67AnQ72gLeZoXcGmCGHDFdu5txATfRAS6dwipduxMBWAKepl1Klmbh3OfBAiXBdBVIu11wn69jTbqZ8cxr3hp4fd6uS+nvvfCSbPfTkltaKh7dSB62reApb4rIsOF+eszLaZYRkixWfhlgr/pv/SQk829qp9VGtXgQ4yXYkZDDlvkHZHJUssdGJB9GAVmy97D+A+5GfmwfJ3plAAAAAElFTkSuQmCC) no-repeat;background-size:contain}.xmt-styleArticle-collect .xmt-accountSearch:hover:before{background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAoCAMAAAC7IEhfAAAAAXNSR0IArs4c6QAAASBQTFRFAAAAQL//M5n/K6r/JLb/IJ//K5X/J53/Ipn/Hpb/I5f/IZv/HJf/G5v/I5X/HJX/H5X/Hpj/HpT/HZf/H5f/Hpb/HZX/HJf/H5T/Hpf/HJb/G5f7HpT7Hpb7HpT7HpT8G5X8G5P8HZT8G5T8HpT8HJT8G5X9HZP9HZT9HJX9HJP9G5X9HZP9G5T9HJP7HZT7HJT8G5P8G5T8G5X8HJP8HJT8G5T8G5T8HZP8HJT8HJT8HJT8G5T8G5P8HJT8HJP8HJT8HJP8G5T8HJT8HJT7HJP7HJT7HJT7HJT7G5P7HJP7G5P7HJT8HJP8HJT8G5T8HJP8HJT8G5P8G5P8G5T8HJP8G5P8G5T8HJP8HJT8HJP8G5P8G5T8G5P8G5T8G5P70pu8OQAAAF90Uk5TAAQFBgcIDA0PERYXGxwdJCkqKywxMzU2OTs/QkNERUxUVVhdX2RnaGlsbXF0eoCGlJWWl5qbnqChoqSlqaqrra60ur/Bx8jKzM7T19vc3d/j5+jq7O/09fb3+fv8/f5vWHlhAAABp0lEQVQ4y82U2VbCMBCGowVxRRFwQUVlUwtaRYsLIhSVVRFw3/q//1s49Ri6kJzDpXM18+drmpnJhDHbFveNZv+jW6/sBZncxtU72NbYknHb93BbbVWEjR1ba8/FRGRGmVtOG+8UfWWHualrWnhUlYEwqb2RUhjz7mdxZwGXNntDWt4D0n+/c0PJnRC5686DlJzg4OfAZ9j5KeV7JsrQVwMMR6xSHgFhyUJfQMwOqc6qpLg6ULb7RvVTJOA88OLnwT5QlPa1BWxy3wASUlADNO43gYgUTAGn3O8DM1IwDlS5/wEoUjBKF477XWBupB3rwJIUTAIX3K8AaSl4BBxwf8/dULe1HT0MAu+TEm4FePUNooajqB67AnQ72gLeZoXcGmCGHDFdu5txATfRAS6dwipduxMBWAKepl1Klmbh3OfBAiXBdBVIu11wn69jTbqZ8cxr3hp4fd6uS+nvvfCSbPfTkltaKh7dSB62reApb4rIsOF+eszLaZYRkixWfhlgr/pv/SQk829qp9VGtXgQ4yXYkZDDlvkHZHJUssdGJB9GAVmy97D+A+5GfmwfJ3plAAAAAElFTkSuQmCC) no-repeat;background-size:contain}.xmt-styleArticle-collect .xmt-collectStyle:hover:before{background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACQAAAAoCAYAAACWwljjAAAAAXNSR0IArs4c6QAAAo9JREFUWAntWD9oE1EY/33XmqSLBcHB4uBe0VXEITpaxUF0EBGMhoKo4FB10UEXtYOIONikFTQiiIsiBUHQRRE3RdFRUMwgCBUhdxeb5++75M68pPjqcqZwD473vv/ffd/v3sEn0FUz69EIrwCmSGqdslJcdUCeYyR3Ggfli0TJ+OEbGLMmxST6Q4l8RyG3ebhTmf+bjKanBWGXhjttijOeQLkwHxOp7FV/AgaP27FMUVDxTRK4XJDknOahKwcvzbjLiZUl5KoSQe1YXf11aC5P7MBp1jJXGQeuQm4MOXrueuN/lQ9chbKEXC10Yyi7h1w1TFk+cKB2Yyi7h1LGiCvcCsRQdg+5mpqyfAViKLuHUsaIK9zAYWjgEnL/XOMa3wq3YLE1TfIhxvLXsVOCWLTkPm/y+BqcoGwPhrwpHM69WlKvh8kKyc+Ed8f0T89qZjWq/g38Mi84NtnGZ5qBPqIaHOBMp39aojyVqY7qqo3aqg/15VgeBO8TnSA8lJz1MBvshR98oNNjnCP9aa/BBiZzF7Pha1SaxcRGz8pTmeoki7bqQ32pz78soYMyWq2ZSEck5H4eQ/IEi+YCHe+2bAXPSG+k87UWHxIPnHZZfME30u+ov93myyN4ueMoyWdWrmtghbpEZa8GT2mwwzKyiTqTPIlS/kFU9kZ4huJTrNqIrRZT0uDpKgeZlznI/MEW7mOca+T1QyI2iXa518aAYscPauTZSYkYOrqJ0fxZ7JcFy1Ynt354kW/PNsftlBYhcJvDy3M6UbX075tRLASXIDIZFcESkugMPdsJqVDBONc8yv0Ig4zT8Sd43iRKq1722lp0JdgEMfr10YdMoZx/a8l7ibnmVn6thIgZ74issfBvtIflBRdbSJkAAAAASUVORK5CYII=) no-repeat;background-size:contain}.xmt-styleArticle-collect .xmt-someArticle:before{background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAoCAYAAACM/rhtAAAAAXNSR0IArs4c6QAABPJJREFUWAnNmc9LnEcYx911hZRYchAjiMVDSk9CCf4FnoJJoVVci/bgTWhIDsWQizSJCV5Eb6EHoYcebKkrLoU2Nif/AgkBT6UeAsFiPAWUBNTYz3ec52V8d9/1fXfVOPDu88wzz4/vPPPOvDOzuaY6S7lcvra3t/c15r25XK7z8PCwE16PyiayTWSb8GstLS1/DAwMbLiWjD+5LPrLy8tXDw4O7hB4ALueLLborgO63Nzc/HRwcPBNWttUABcXF1txPgGwezhuTes8QW8HX7P4mhseHt5J0InEJwIslUqDOPsJi47I6ojZJdBz2p5BN8jM5v7+voa0qVAodJJpDfs12m5CbyC+fGQW/W7RdrtYLC5HkipMIkCc5paWlh5g81C82eL0BfUn7e3tK319fe9NXouurq5e2t7e7sf2R2yvmy71Q/ipoaGhx563pohGgSMJDEP6CQa/4Kxocuqv4Cdx9muSM9NNouoonR6lfRq+2/TwV6I+xpC/M5nRvDFG5YQSB7eC/EuGY6FecPIvW/mQL/iVIGbRx6xIWIWAd+4hDh6ZMYZzZO0+9IPJToMSI082Z6AT5o8Yj+jAlNVFjwHUhEC2hJGTCxwGmrlnVoipGe1AEk/v5BAxo4kTAdRSQuO/PG62orxC5r6Cnmrm4j31mfwT2u/btqCf2xJUMAOAaJ0zcK/gR6qBo8dyNE97l9mmofh6jd442YnePdkpBslRrJf41MTpgFdG3VC7SaIvBI3hUE7Sg7dyUKVkBicfvkPzVfw1+ViT1iYswqS6yyCL6l1494UA/QstJaYcpz6QnEavR1ynWp0sYZqcdcVk0mgUtU626pMKfeAyiPAbcwrAxEXTdM6CElcdeGK+4fW9b8prVwLt8Q27bW1tf3s+FSEzf+lJpXyCkr5OqOx6tR5hy/stk5PRi+dpP1+xWFoeGi6KLQzmSNj0DvaagLQ+Mz4t5V28lVY3jZ7HoPVYpTcPYttkasrXtak88nU6vyEGYSuAOAKoLVPWMJqdtWyyzna/bXMuhU1DHAG0/VytgPG2rADi9vF6DEOnhrhmBuIOzrMubBri/wj6qQJrJwz5R3zaEh/iRjMqDGTRhRe2Aih1+vpCEm3TIZkANgrIIQl+PAYnEbY84KKJAa9F+6OWEIOwaZKs8YwKFYhvQn4Wn7bEh9js6s2sMADM3KwVdKhmxZ6ThIYbOuBk+ZrUC8QQhNQfrnQCdEXY8v7Ev+5ll3X68vy5Ex/bjqfrwuZ2M6S1bGjgdTTMtJUy20aoYiq2+TBMbj+o6wim9g80tqJ43R8NF0w5pBi+Rqcr6d0LdeO8bOMyqyumYvv6jjCJdxnUXQnGs6YMnQbAlaAesuO1AoWKIe9txkOZ8T7WtNWFxe5vXAbVAHpNlO95OuC7UfoNWnFo8meKz2RzGoUYOn4qVrf3twXvJq3qLoNimI261LnN4+Y4Sv0YzqjtLItiKJZiKLYwCIvFjABK4M+j7jSlOoYT/tx6TE9tjRZ858Mzsfc3FZ6JJauYrRjq/uR3aHgvo6uPEXr2tlFgstc7R6Y0rNGSRr3EwelbZTGMUZEZKVDGZGCKckT9JT3+Dr6iU6Z3EpWtfMiXfJq+YlFXzGPg1J4YTM7I5MW8frOeidLji3mBGYLknbm4V8AhUH+Jfpfh10HfztKhSi3+7C7Rq0U9r78h/gesgMzQ8f9UeQAAAABJRU5ErkJggg==) no-repeat;background-size:contain}.xmt-styleArticle-collect .xmt-someArticle:hover:before{background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAoCAYAAACM/rhtAAAAAXNSR0IArs4c6QAABURJREFUWAnNWd1rHFUUP3dmNiYkUp8MbDcoRnyxIME/olQFbTFK6oMIajHZPkiLL6W1sfgiyZObSP1AfKiiEYugxv4RpQj1RYwo2W6JTxYSmmRn9vr73Zk7OzP70Z3Nps2Fzbn3zvn43XO/zrlR0meZuKwnpd54UYt+FiqKoEURhR+LrilRNVRIr0vB+XH9lFozn3L+UXn4Jz/Rj277fhlCx7XIkTyykLkJmavDnldZe0f926tsTwCfXtJjd6RxRmt9VrQe61V5Wz6lNpVSC4fEWfx9Tm225Ul03hNgack/oRuyjGkbT8ihqrYgfE0c+UUaem1IebURJZxWuauluKv9ojhqUhryHDx3FPKjGfkN5chsdc77Id2fbnUECG+pieXGBdD34bUk3w144JI36q7+/YbaTqtr33r8Sz3sbwXHoOs8OKZiLqU0dM2vzzofgGIcrSVpOP5a+k6P6I3gK4x6Ou5U6h+l5Nz6rPt1J2Uxb4dKOOjgpNbyIQb9WJNNrahx9/XqK+pusy+sOdkOKsmCw05cfajgPoPpuNIvONqhLHVQF3U2betp2qTtZl9YawHIaU17ThbfLLsv/HVK3ckK99umLuoUJYtNHXo6tN3sYS2F2GwILd/Haw4KbpULZ9Mig20drtQXRMsZo9WsSXk5uXFiD/IoMbs1cjOn4K05773BwmnVRhvxdHN54cQgFsvp2QrPufgowYYYKrgzF5Vq2O+Wlpb9YxLIp7g5SravFwoQVXHl7eqsl1h7IrTxxGU9s1MPfgs3jh4Pscg89RoP8obAAo2nkru145rrAxwNmQFBlvVsoS3atP3EQkxsGw9uB/5paLBuvWGOkjnLnqbWc7dOF1LrN83V2jr8cR2nS2ev02ap4nMtTsGTY7xSUb9gPIgj8iWr0nFVx0PT8uwH5RGE3yWrG6M/zrrDqARH+JHwg9pyR9xfLVMvFKP+mb9eeO/Fw9uJVyj5iInYHIZMVhCor/V6fVkZQzF3qXafDdomhlgc2DzoZjwXFl78OUu17D2fU6Q7uwk+5ASZiI1rMAoyUUNUwg8PtKQxFOnBGCBDprzguDu7yeTd7cSwo32jkthwzDBMD23YeK6bwey3vACy8tk2MezEQ1ZFTnHczDIfgLaGB/VtAHmYYBgJg/zBeq8lO8V79WiEITKvb3u4I2uY66fYY8L0nAD3CijriAiD6SY2TnFzYzCHeNAljaFGD16HB08aXEhwQL/IgzE7xVa2b8+GGIwaYvOYVMtuw0S22C1HmeDkuU36BmJHkqC0Xd8MkAFGBdgcZvy4Xm6GXXqU2Zf9fr9paDtMT4mJ2Ew0A89dtWAQi51vl7zY7/tFaZO2rX6LycSDfI7YDoJ3GYeBYWpiOeCavGKZkxTrooo1W+q09pK82Tpls322HdkMc2a8Pgy7boXfjAf5VoJYbMEyM29FGH7ItlMUYXs3QyneRMPIQDbRFVdpy+TKUQ+x2PcbTHVYmKj81wj+xME9zh4oXGVq2C4viUQGQi5q7XxeCX7CrERrX2084rhP2ncb40FaYgffSpBdm6uPAp8t+R8NBEUXJbQRg2NUDQwWHMVigGwwH4V751k3Bfkq81aO0nYNilJnKieGYtpO5sS0FU+xNczdVKoE32Kq43cZTvfQkDvTMdOzwj1Srrnd3eCb2HNGTq1Uy+6rAGlm0Kpq8QwZ+JAD7CuWiYqYt+Ll4bW9HEFm8NBBXVlwtJkFR/stHoxBwZMH9vnNgiQ9sA+YSZAH+gk4CZTPEXyFYKKPlRzl0kmOznWspf17RG9n9n79G+J/pPOPurIk1qkAAAAASUVORK5CYII=) no-repeat;background-size:contain}.xmt-styleArticle-collect .xmt-readCover:before{background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAeCAYAAABe3VzdAAAAAXNSR0IArs4c6QAAA4dJREFUWAnNmN9Lk1EYx323aaMgwQtJqDAh6KIwS4ugQkNQ3NyMol9YXfYXFNQ/EHXdRdJVEYlQqHNThhcWeJVaSYV0UUEJRsSgXcjyx+zzHTvyss053eT1wOtzznOec57Pnud5z/v6WmW04eHhvYuLiw9XVlaaGdZI52CbsyzrdXl5+Z2Ojo5ZS3ALCwvTAFU5CJXLdayioqLepchtQzgBV4nNk05r6he43W5fZ2fncGrg0J/BwUEfTGG5F5sLuVpzTsMJKhgMRiTTrUaA27p5tpKOFLnD4XA9slF+uDsn/X7/NHK5UL9bFsFIJHIkFApNLC8vTyWTyR5d6kunOUcBBbC0tDRB5BoyQaTTXKGQJUtxNBqtTiQSQc6uUc7Vp4DsSMP9JaV96qO7jKjUHJCyaVov3SUDBC6Cw0bg5pE7DZzH4zlG3X3TmHp8ANi7NGSD6pO+xmu2ktegDU43RZ+BE4H6Jpoa6wdJ5mslA+SQv4GjrxnOWkn9rgzdhoYlAyQ6M16v9wTe3xoCIlRH6idHRkZqpSOldehUh6lGNCdNfy2ZVYNsYHEUXGPBwbUWSe9yuT4AFcJJ0ti1t7fHWH+a9bPIaumRh6jLGXSj1N9ZVJXSs+496/WSkrdlAQqOTZ/nXcUkZ1oZtv1DQ0PdPCLnjT2OFzlCWnnQT6Erl579vFydNpt/3Dw3sV33wC4qxTg9zwH8BqA9xrmkz+f7yPvccQC+2PXqo/vD3CnZZM7lGlsDAwMrZqKrq8vCaSEpPoCdbopUw+kPvQmRsk9GJ4mNW9Ek2o/p15o57Mep1wttbW2/jc4u7UxZgHbDfH3Sewunj7hSZYLTOJCXgIxmrhsbG/PG4/En2Hbb5n5i30V5ZJ2DdsBNpzgQCPTgwC8wOcX5biIVFrgNItVtaWlJ8Bp1nRvrNgpTd/uwH+f970qmvX286QiaTTg6DuNIT5H9Rgf0M/rfzdgusTvH+Ixdh/19fsA9o7NHMOsuNkaFStUddXaSIySE8yatQ67WZyH7YH+XyE+RlVeZ9ptOsX0j7shfpK+ZSPTb9RvpcxpYueyLjqDZVGchkbhIygM4O2r0BcrPpPhlLtuSAWpzIphEDKQvqYpuJUlx0RR5NhDgnJnXv3ym75TMYJizULygdq46BZTPLyXT69I3EIxi+QwdmouJzaUPNPoGIlpAVtPtEJTc6uNRr5jE9h92D8R+2kHVlAAAAABJRU5ErkJggg==) no-repeat;background-size:contain}.xmt-styleArticle-collect .xmt-readCover:hover:before{background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAeCAYAAABe3VzdAAAAAXNSR0IArs4c6QAAA3FJREFUWAnVmM9PE1EQx7+zFFu3RA0HookaJDHxoMEfYGKiBg03/AmkrYJ49C/Qg/+A0bMHiSeBSGlEDAETwkFNOCmCRA3xoCZKoiEGI7HbVss+5712l+0vS3GxOgndmXnv7Xw6M+8tXYKUPrEVIn4DEE0Q2KJ85fogfALoMch3BZ00RwrOjM0wT3W5mArEXYC2vl5LZe6fg5PM1ZLNo8pqfYUKrQUdvoeWWZZrb7wFwhxJxRZNhB5D2CBdOtl6ORUHk1ZOjpXE5hKvoUREBUyjHhoaVBQTk9D0GQRoaaVR1w4wktjDcHe4x/fBdOCYxjQiiYsIeF86vAXVtSmxhBPJZwouJzQDyzE5ZwXiXgbvixr8NE7D1MZhJmXmvCo+4RsEDaR0EeQHwUYIHhM8JyIai5XbPcAfxihDNUAzDQbQbTiPZz/afO+UPRi/jmRySkGq0nN/AlNqrMCH+yW24GRAmTkLTtpSt7IpbWvzSL2AuAe4ztPFz9C3WXGaMSb8Wb6STPcAW72zfIQc5PI9XSYQdfgancRQrFb5BuN1IO5DS+SxU0Rye1AIwkD8PMjcWWTtCwT0YRAtHyIBWkC3OIxNxhz3YU16/S4kzFkMRMe5/46m+k+O0LQ6E4sEyX3UhWMdwFJfkXWpYaIh6HonTpKRMV+dgcnn3ISVGX7LIEqAPLyDC5yFrj3qhDiLqPEEke+brdjqKgNrngMg7U2GXxn0BRWVhwrCZS3IzeDKSryDS8ibIi1EHyA8LQh5X1kudZWPOhFt5nLe4vm19hjRBCr1NrTSvO1zKo4M5gI6J/5OD0cvgXCTA1t9vMh2AMGqsZxlj4QP89Hb3H+dy2P0kfUzCPlzz0EH4Op3ccjfzT12goMspoNu4EyNQIJnyzGKM/gF/gKXeVOl/1EQ29ieQNgIZU932qvPoHWXcGI3KDnKmdxuuRiih/X3tu1UhDjO5hGni+dfQ9B/1fY5MvjngPKucpMIGmbIRjtIqQpp7Qjqg2qZA3D1JXYCBKo+83HTxJkYcrpL0okLnkesBs8zVKJLnoVCtCNinOKVe0taLeg1H/r38q1xD1DePfVUecCa/HNF3CmxKyj5b6Jx5fmXfFrkT75yi5OB2Qi9sbvcO+fKzZU3PlH/f/Dqg1/QyHcg3OD9GeXO+5X+glO2nGSRTMz2CxgEO9beb8TMAAAAAElFTkSuQmCC) no-repeat;background-size:contain}.xmt-styleArticle-collect .xmt-genLongImg:before{background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACYAAAAoCAYAAACSN4jeAAAABGdBTUEAALGPC/xhBQAABA5JREFUWAnNWNlKI0EUvenEFRcMKkYnMii4okEcyZMYFfwBzcP8iB8xPzLg6JtPKhjFl+CoRHFFncGMxo2AC+5Jpk5hld0x6bazmYJOVddy6/S551ZVykIsTU5OfotGo78sFoszFotZUZfpxGxHmO2goijesbGx30b2La+g/KyjYtQ5Q+1RBs5tBE4BUzkEhW8Tc+p+p+3VfbxTf38/1dXV6Q5ItTEUCtHS0hIfjjmN7NjUmsoWKIBwOBwSC+acmJiIyQpWYGBDLPMxN4+Pjo7+y5Wu1BgSlhlYB3u+RyKRwNTU1Je8AaZCa2e6/2FTVeS06PV6NfOpNcgaPHnDWJwGHYaM3d/f0/r6Ol1cXPAvrKmpoe7ubiopKdF8caZfdIEB1MzMDD09Pcl5j46O6PT0lEZGRrIKThcYmAIo0Nzb28vBraysEPSANrfbLQFnuqCrMeE+gILr8AiAoi3TgIQ9XWCi02fkusAgdCS4D3rDgzKSaOMvWfjR1RiiD0KHpqanp+X0hYWFPDJlRRYKusCgKURf3i0XIALgshl9ycjW1ViyQbmo13WlWQDsdEA+n48PGxgYIHaEMWtC9k99pDTxVsCucHl5yZ/t7e23hhRKpoGxIwktLi5yZh4fH+WUYEsNZmdnh66vr2W72YJpYJubm3R2dsY39YWFBRLgwNbNzQ2Vl5dTU1MT4QPEmmcWFPqbAhYOh2l3dxfHYCorK6OrqysCuIeHB8lWe3u7PH3ArQcHB6ng+jgwMLC8vExwWWtrKw0NDVFlZSUHNzc3J9lqbGykgoIC6unp4YA2Njb4jmEWXVLGAABamp+fp7u7O4ILoZmKigrq7OykoqIiQuThHVsVEtgCm0gNDQ38eX5+prW1NV5n5icpsL29Pa4luGN2dpYgZkza19cnlwGAa25u5vNBW2BLncAa2Ds+PuaPus2onBAYGNja2uJjq6qq5EGxvr6e7Ha7tAlW9/f3+buaLdEBu0ZXVxd/NctaQmCBQIBeXl7I6XTS8PAwjzJYPzk54eIXE6sjMZ4t0QeMVldXS3eLeqP8HbDz83MKBoNks9nI5XJx9+FwiJMGEjZ0LAMIBrFuJWJLPTHGm90FNFsSXLO6usptdnR0aM70iEQsEX6/nw4PDwkfcHt7y9etZGwJcAiQtrY2KQ9Rr5drGIPgsUjCUEtLy7txiDSPx0PFxcUcFDoYsSWMoJ+ZpAEmBI9oEmEfbwzih+6gG9x1GLElxqflSiH42tpaYS9hXlpaSoODgwnbMlWpYUwIPlPG07GjARYv+HQMpztWYVqKCCNYvT8r4Q+PSAxTyMIu0P6wiq+iMh9yBuwnCxYF90HRfAD0iiHMMI0ruD1mBVxC/FW7NddAufsYU1ar1YWrzv8Ija1kd470BgAAAABJRU5ErkJggg==) no-repeat;background-size:contain}.xmt-styleArticle-collect .xmt-genLongImg:hover:before{background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACYAAAAoCAYAAACSN4jeAAAABGdBTUEAALGPC/xhBQAABJpJREFUWAnNWF1oHFUUvmdmNm4jiFRqaXcbW20RrdAHpYEEcUMFUV+KkIL6Ikp/bBIK9a+gJdKKlCC+ZNvURO2TBAyKiD8IBSPUQqVFCrYVjLZNNw2xIFS03WZn5vid2bnL7HZ3JhNm116Yvf/nfPOd78zsHVIoKz7iR4zr7oRSvEoxmzKWeCFylKJL7hKjd/YlOhllnzxQ15wTAGVELU5mnly33eyMAmf4TLUIlNwa+z7Db9PywuevYVKDl/tT+8K3LG525YgzSLb7dnk3JBNRKDNcYr1mZiBFut2MOuir1j4pmsXYJKfN12e2UqGFIayFUt1nxStwPUtF53RmjLO3DDANE+CWAtwQNPb/lFrZZA7ZTyuHv/LR5G4ZxmZ2Wl9riiSskYxJvIVabMr5GysC1YaaUYcy5oM6LaKUu/CvikCbAUjbDAUmTAHMUqTytyptrZJL2t5YmUVtJ/E6FBi85cQjni3b5Nkil7RlDCXn/TbpJwpYk9xGm40CNikmENJR0ZuvuVHfrDfntxOvQrNSXg8A9QQ09aQq2pfEu7y/oLO/ZC5xNAGDoYz5mtoAIOO4Zv1rHKA2yFzATuLNUMbEmw/gucQ9RxgMZSxib1OnIxmL4733UzaPz9k/iAjvvNvqObOF5uPsD65NlLHjV5znYbwbGdJ19U/7zaCjuO3YwNZ+w7dl8vbR7HBpcu3HvEw7FLbI5bd0XzHt6TjMD1b6MRuxgRV/t/fhJLUJj43Hitfs7zU4YQtj6/AX+Dci+hCPmDanZI8y4w/7IkosYNk8dzLRKwpHMTifYlbrBdyaMV6u2WKD3mlLma9i/jLwdHccdHcsApdaMDAJISv7iJw7SfF76Xazi0idEXDzN5yTmq2uZeYnf2ynq0iAAQEExg5kRzgTF1xDYA9/wCnREg4Qx9bk+Z5yCNUDcHgufa81OPUiXUm3Wz0CDt6zHgiwNbFFDrZKFfqsz5GcXyCkdyjbyScGbK7k7obDTTDYPa/cU5UQmtYLU0/RDXEk4MgwRqQt2hK2pF0pltkPcH8D3ObsQfuZyvgCGnUZk5c1QrDX3/+zYveucgjVl4WX6SdtVzKRHXeX9EVbmi09j7Uz0Noer89qWI8vpK4LTBWd9+HqdvAwse4hayPuekyMQUebs3nnNW04mIk3seUvmu4zDqP5I250pd63kPomYB2HSo8DQi9A/avS5u7JHrILA9Y2hOwNMcjsDmWH7dHVRzgdzMRatrRzMMZmCvtVvLdAFTARvOMqT6gwuD/4D6LQZw4Rq144uA7NbLX/cX4JZqIGUq+e3kFnFfGBenONxqqAlQWv7sfiX5enDISzuoC5z5Rl5sDmHMDdJ7P1tFW9q9xDJr9bb7zRWBUwLXjTVAOntlOp3iYRfxuZnUjDY2D1u0baqt2rM7l2vFG/5t9FWfDTO62jjTbI+Pl+uojqUWnja19TShVjWvBN8RTTaBWwWsHHtJXockNeyNqia6h23W517X1U8Z0i82cpk3fO48m+utVAwvwB2LghX5GhLTdsYSvnAMo7Ghry9Vi+IisyLgTD2kow4ssLH5jSR8P/AE7g3feOsCZyAAAAAElFTkSuQmCC) no-repeat;background-size:contain}#xmt-articlecollect-start,#xmt-stylecollect-start{display:inline-block;height:30px;line-height:30px;width:90px;font-size:12px;color:#fff;-webkit-appearance:none;border:none;background-color:#1b93fb;border-radius:30px;cursor:pointer;-webkit-tap-highlight-color:transparent;outline:none;margin-top:5px}#xmt-stylecollect-start.cancel{background-color:#d9dadc;color:#717375}#xmt-stylecollect-start-tip{position:fixed;width:400px;top:200px;left:50%;margin-left:-175px;height:40px;line-height:41px;font-size:16px;color:#fff;border-radius:20px;background-color:#222;text-align:center;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none;opacity:.8;z-index:1000}#xmt-stylecollect-exit{display:inline-block;padding:0 10px;height:24px;line-height:26px;background-color:#636363;border-radius:4px;margin-left:10px;font-size:14px;vertical-align:initial;cursor:pointer}#xmt-stylecollect-mask{position:absolute;top:0;bottom:0;left:0;right:0;z-index:100;cursor:crosshair}#xmt-stylecollect-block{position:absolute;background-color:hsla(52,95%,69%,.1);top:0;left:0;width:0;height:0;cursor:hand;visibility:hidden;cursor:-webkit-grab;cursor:grab}#xmt-stylecollect-block.dragging{cursor:-webkit-grabbing;cursor:grabbing}#xmt-stylecollect-block.clipping{cursor:crosshair}.xmt-stylecollect-borders div{position:absolute;background-color:rgba(27,147,251,.5);background-image:url(data:image/gif;base64,R0lGODlhCAAIAIABAGZmZgAAACH/C05FVFNDQVBFMi4wAwEAAAAh/wtYTVAgRGF0YVhNUDw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTM4IDc5LjE1OTgyNCwgMjAxNi8wOS8xNC0wMTowOTowMSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDpkM2NlZWViMy03YjM5LTQ2ZTEtYTk2NC03NWNiZTJhNmZkYTIiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6OTE4OEM3N0QzODdFMTFFNzgzQjBEOUY2MTdGNDY2NzUiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6OTE4OEM3N0MzODdFMTFFNzgzQjBEOUY2MTdGNDY2NzUiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTcgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpkM2NlZWViMy03YjM5LTQ2ZTEtYTk2NC03NWNiZTJhNmZkYTIiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6ZDNjZWVlYjMtN2IzOS00NmUxLWE5NjQtNzVjYmUyYTZmZGEyIi8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+Af/+/fz7+vn49/b19PPy8fDv7u3s6+rp6Ofm5eTj4uHg397d3Nva2djX1tXU09LR0M/OzczLysnIx8bFxMPCwcC/vr28u7q5uLe2tbSzsrGwr66trKuqqainpqWko6KhoJ+enZybmpmYl5aVlJOSkZCPjo2Mi4qJiIeGhYSDgoGAf359fHt6eXh3dnV0c3JxcG9ubWxramloZ2ZlZGNiYWBfXl1cW1pZWFdWVVRTUlFQT05NTEtKSUhHRkVEQ0JBQD8+PTw7Ojk4NzY1NDMyMTAvLi0sKyopKCcmJSQjIiEgHx4dHBsaGRgXFhUUExIREA8ODQwLCgkIBwYFBAMCAQAAIfkECQoAAQAsAAAAAAgACAAAAg+MA3mol7CeY9C8SvF1qgAAIfkECQoAAQAsAAAAAAgACAAAAg5EHqCYi2qek/FAWmFWBQAh+QQJCgABACwAAAAACAAIAAACDgSCYZebap6TsVU04TUFACH5BAkKAAEALAAAAAAIAAgAAAIOhINhkHq5WpQPTVsdswUAIfkECQoAAQAsAAAAAAgACAAAAg8MHmmoB7pec5BOmWxmoQAAIfkECQoAAQAsAAAAAAgACAAAAg9MgGYIeqmYYy3CdV/FtQAAIfkEBQAAAQAsAAAAAAgACAAAAg6MgXapCBocdK+xVfFMBQA7)}.xmt-stylecollect-borders .border-top{height:1px;left:0;right:0;top:0;background-repeat:repeat-x}.xmt-stylecollect-borders .border-right{width:1px;right:0;top:0;bottom:0;background-repeat:repeat-y}.xmt-stylecollect-borders .border-bottom{height:1px;left:0;right:0;bottom:0;background-repeat:repeat-x}.xmt-stylecollect-borders .border-left{width:1px;left:0;bottom:0;top:0;background-repeat:repeat-y}.xmt-selected{position:relative}.xmt-selected:after{content:"";background-color:rgba(27,147,251,.2);position:absolute;top:0;right:0;left:0;bottom:0;z-index:10}#xmt-stylecollect-tip{position:absolute;top:-30px;left:0;padding-bottom:15px}#xmt-stylecollect-start{margin-bottom:15px}#xmt-stylecollect-tip .xmt-func-btn{min-width:200px;text-align:center;cursor:default;margin-left:0;vertical-align:top;box-sizing:border-box}#xmt-stylecollect-func{position:absolute;bottom:-35px;right:0;padding-top:10px;min-width:180px;text-align:right}.xmt-func-btn{display:inline-block;padding:0 12px;vertical-align:bottom;height:24px;line-height:24px;border-radius:12px;color:#fff;background-color:#222;font-size:12px;text-align:center;margin-left:10px;cursor:pointer;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none}.xmt-stylecollect-handle{position:absolute;width:16px;height:16px;min-width:16px;min-height:16px;text-align:center;line-height:16px}.xmt-stylecollect-handle:after{content:"";display:inline-block;width:10px;height:10px;vertical-align:top;margin-top:2px;background-color:#1b93fb;-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px;border:1px solid #fff}#block-handle-b:after,#block-handle-l:after,#block-handle-r:after,#block-handle-t:after{width:8px;height:8px;margin-top:3px;-webkit-border-radius:5px;-moz-border-radius:5px;border-radius:5px}#block-handle-bl:hover:after,#block-handle-br:hover:after,#block-handle-tl:hover:after,#block-handle-tr:hover:after{width:14px;height:14px;-webkit-border-radius:8px;-moz-border-radius:8px;border-radius:8px;margin-top:0}#xmt-stylecollect-block.clipping .xmt-stylecollect-handle{display:none}#block-handle-tl{top:-8px;left:-8px;cursor:nwse-resize}#block-handle-t{top:-8px;left:50%;margin-left:-8px;cursor:ns-resize}#block-handle-tr{top:-8px;right:-8px;cursor:nesw-resize}#block-handle-l{left:-8px}#block-handle-l,#block-handle-r{top:50%;margin-top:-8px;cursor:ew-resize}#block-handle-r{right:-8px}#block-handle-bl{bottom:-8px;left:-8px;cursor:nesw-resize}#block-handle-b{bottom:-8px;left:50%;margin-left:-8px;cursor:ns-resize}#block-handle-br{bottom:-8px;right:-8px;cursor:nwse-resize}#xmt-stylecollect-alert{display:none;position:absolute;width:180px;height:140px;padding-top:40px;left:50%;margin-left:-70px;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;-webkit-border-radius:5px;-moz-border-radius:5px;border-radius:5px;color:#fff;text-align:center;background-color:rgba(0,0,0,.7)}#xmt-stylecollect-alert:before{content:"";display:block;width:45px;height:31px;margin:0 auto 15px;font-size:18px;background-image:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFoAAAA+BAMAAABZ4xF9AAAAJ1BMVEUAAAD///////////////////////////////////////////////+uPUo5AAAADHRSTlMAMe1fKehrF9bVvqQ8h1RDAAAAtklEQVRIx+3QoQ0CYRQE4ZdAgqUFOkAgERg6QCIogyIQ0AcloEju1BZ1cuTuS07+U8AnpvJO1WgzXSrvrFuDlsADWno3aP33Hfow6EEPumh37NDPuUO/9GjQ0pwP+UrgdshV4P719g5uaXBPg4c0uKfBQxrc0+AhDe5p8JAG9zR4SIN7GjykwT0NHtLgngYPaXBoj0MnOHSEQyc4dIL/oAMcOsGhPQ4d4tAeh45w6ASHTvBPrdYCudsHltdLTTMAAAAASUVORK5CYII=);background-repeat:no-repeat;-webkit-background-size:contain;background-size:contain;background-position:50%}#xmt-stylecollect-alert.fail:before{background-image:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAMAAACdt4HsAAAANlBMVEUAAAD////////////////////////////////////////////////////////////////////xY8b8AAAAEXRSTlMA8TdE+PZXSCnoHNzfCtiIdVnKQRwAAADXSURBVFjD7dc7EoMwFEPRZyBgEvJ5+99sCo9RoUoiTWbs/tzGheX4zXle9PfXaqj5qN0/Mlfd33Kvp0dB8NkKzaMg+FaYSqIg+lzmcArwWwQVRE8F0VNB9VxQPRdUzwXVc0H1XFA9F1TPBdVzQfVcUD0XVM8Fy3OBvVZgrxXYiwXycoG8XCCvFt7k1QK8V4D3CvBuwfe4v8zV9iiYHgXXo2D65VNQcPzm7Qf4sR/Gfhj7YeyH/9oPcdj7obQfa93N/VCmiF7Q90PzZ8HYD833wqy/3fCXzhfenTVSutDogwAAAABJRU5ErkJggg==)}.xmt_cover-download{position:fixed;left:50%;top:50%;width:660px!important;margin-left:-330px;margin-top:-220px;background:#fff;z-index:99999999}.xmt_cover-download img{margin:10px;width:640px}.xmt_cover-download .bom{border-top:1px solid #e8e8e8;height:50px;font-size:12px}.xmt_cover-download .bom a{cursor:pointer;margin-top:10px;width:90px;height:30px;border-radius:20px;display:inline-block;text-align:center;line-height:30px;margin-left:160px}.xmt_cover-download .bom a:hover{text-decoration:none}.xmt_cover-download .bom .download{background:#1b93fb;color:#fff}.xmt_cover-download .bom .download:hover{background:#1b4ffb}.xmt_cover-download .bom .cancel{border:1px solid #e7e7eb;color:#999}.xmt_cover-download .bom .cancel:hover{background-color:#e7e7eb}</style></head>
<body>


<div class="header">
  <div class="inner">
    <div class="logo">
      <h1><a href="https://www.3078.com/" class=""><img src="./images/logo.png" alt=""></a></h1>
    </div>
    <div class="nav">
      <ul>
        <li class="cur"><a href="https://www.3078.com/" target="_blank" class=""><span class=" nv1"></span>官方首页</a></li>
		 <li><a href="https://77302c.com/member/member?type=returnSavaMember" target="_blank" class="">免费注册   </a></li>
        <li><a href="javascript:;" onclick="showQueryWin();">红包查询   </a></li>       
        <li><a href="https://77302c.com/jsp/ogmember/space.jsp" target="_blank" class="">活动中心   </a></li>
        <li><a href="https://static.meiqia.com/dist/standalone.html?_=t&amp;eid=58916" target="_blank" class="">在线客服   </a></li>
      </ul>
    </div>
  </div>
</div>
<div class="banner">
  <div class="inner"> 
    
    <div class="hongba"> 
      <div class="juhd"> 
        <div class="">
          <span id="hb-clock-d">0</span> <em class="">天</em> 
        </div>
        <div class="">
          <span id="hb-clock-h">3</span> <em class="">小时</em> 
        </div>
        <div class="tac haishen" id="hb-message">本期抽奖中...</div>
        <div class="">
          <span id="hb-clock-m">29</span> <em class="">分</em>
        </div>
        
        <div class="">
          <span id="hb-clock-s">47</span>
          <em class="">秒</em> 
        </div>
      </div>
      <div class="hongba-in"> 
        <div class="bsaiige"></div>
        <input id="username" type="text" class="bsaoint" placeholder="请输入会员账号" value="">
        <a href="javascript:;" onclick="getPacket();" class="baoqiang"></a>
        <div class="cl"></div>
      </div>
    </div>
  </div>
</div>
<style>
.reward{ width:359px; height:520px; background:#fff;border-radius:5px; position:fixed; z-index:10; left:50%; top:50%; margin-left:-180px; margin-top:-260px;}
.reward-t{ background:url(./images/tu07.png) no-repeat; height:170px; position:relative; text-align:center;}
.reward-t .b1{ position:absolute; left:16px; top:10px;}
.reward-t .b2{ padding-top:69px; padding-bottom:20px;}
.reward-b{ text-align:center; font-size:20px; color:#ffb02b; padding-top:27px;}
.reward-b .w1{ font-size:24px; line-height:24px; color:#000; padding-bottom:21px;width:100%;}
.reward-b .w2{ font-size:24px; color:#b4b0b0; line-height:24px; padding-bottom:30px;width:100%;}
.reward-b .w3{ font-size:78px; line-height:78px; font-family:Arial, Helvetica, sans-serif; color:#000; padding-bottom:35px;width:100%;}
.reward-b  em{ font-size:24px; line-height:24px;}
.reward-b .w4{ font-size:20px; line-height:20px; color:#000;width:100%;}
.mask{position:fixed;top:0;bottom:0;left:0;right:0;background:#000;opacity:0.5;-webkit-opacity:0.5;}
</style>
<div class="mask" id="mask" style="display:none;"></div>
<div id="hongbao_result" class="reward flip" style="display: none;">
		<div class="reward-t">
			<a href="javascript:;" onclick="close_hongbao()" class="b1"><img src="images/x.png"></a>
			<p class="b2">
				<!--<img src="images/tu08.png">  -->
			</p>
		</div>
		<div class="reward-b">
			<p class="w1">&nbsp;&nbsp;</p>
			<p class="w2">恭喜发财，大吉大利!</p>
			<p class="w3" id="money">
				00.00<em>元</em>
			</p>
			<p class="w4"><!-- 威尼斯人娱乐城 --></p>
		</div>
	</div>


<div class="inner">
  <div class="luntopwa">
    <div class="luntop luntop2">
      <ul id="announce" style="top: -9px;">
			</ul>
    </div>
  </div>
  
  <div class="contin" id="activity_in_content">
   <!-- <div class="tlbx"><img src="images/t1.png" alt="" /></div>-->

    
   
   </div>
    
   
    
  </div>
  
  <div class="cop">Copyright © 澳门新葡京赌场 Reserved</div>
</div>


<!-- 公告 -->

<div class="gonggao">
  <div class="gaoti">
    <span class="fl l30 cw f12 pl10">活动公告：</span>
    <div class="fr">
      <span class="db w22 tac fl  cup xiao">-</span>
      <span class="db fl  tac w22 cup  chag">X</span>
    </div>
  </div>
  <div class="cl h10"></div>
  <div class="luntop luntop1">
    <ul   id="activity_ru_content" style="top: -44px;">
      <li>领红包活动于2018年3月10日上线，3月11日达到要求的会员可参与领红包活动！</li>
      
</ul>
  </div>
</div>



    <!-- 查询窗口 start -->
	<div class="tanchuceng" id="querywin" style="display:none; z-index:99999999">
		<div class="tanin">
			<div class="chacha" onclick="closeQueryWin();">×</div>
			<div class="tantoux">输入会员账号查询</div>
			<div class="cl h35"></div>
			<div class="tac shuzangh">
				<span class="">会员账号：</span>
				<input id="username-query" type="text" class="shuimsnt" value="">
				<a href="javascript:;" class="chaaa" onclick="query();"><img src="./images/chaa.png" class="vm" alt=""></a>
			</div>
			<div class="cl h15"></div>
			<div class="chatablewa">
				<table class="chtable">
					<tbody><tr class="toum">
						<td>红包金额</td>    
						<td>领取时间</td>      
						<td>是否派彩</td>
					</tr>
					</tbody><tbody id="query-result">
                    
                    </tbody>
				</table>

			</div>
			<div class="cl h35"  id="page"></div>
		</div>
	</div>
    <!-- 查询窗口 end -->
<script type="text/javascript">
var requestUrl='<%=request.getContextPath()%>';
var NowTimeOld = new Date("2016/12/17 16:07:16");
var startDateTime = new Date("2016/12/17 00:00:00");
var endDateTime = new Date("2016/12/17 23:59:59");
var one,two,NowTime,waveTime;

function getROne(){
	var startDateTime = new Date("2016/11/16 14:00:00");
	var t_s = NowTimeOld.getTime();
	var NowTime = NowTimeOld.setTime(t_s + 1000);
	var t = startDateTime - NowTime;
	if(t<=0){
		window.location.reload();
		return;
	}
	var d=Math.floor(t/1000/60/60/24);
	var h=Math.floor(t/1000/60/60%24);
	var m=Math.floor(t/1000/60%60);
	var s=Math.floor(t/1000%60);
	var str = "<p>"+d+"</p>天"+"<p>"+h+"</p>小时"+"<p>"+m+"</p>分"+"<p>"+s+"</p>秒";
	document.getElementById("luck_title").innerHTML = str;
}

function getRTimeOne(){
	var t_s = NowTimeOld.getTime();
	var NowTime = NowTimeOld.setTime(t_s + 1000);
	var t = startDateTime - NowTime;
	if(t<0){
		clearInterval(one);
		ajaxLottery();
		return;
	}
	var d=Math.floor(t/1000/60/60/24);
	var h=Math.floor(t/1000/60/60%24);
	var m=Math.floor(t/1000/60%60);
	var s=Math.floor(t/1000%60);		
	//var h = d * 24 + h;
	$("#hb-message").html("活动开始倒计时...");
	$('#hb-clock-d').html(d);
	$('#hb-clock-h').html(h);
	$('#hb-clock-m').html(m);
	$('#hb-clock-s').html(s);
}
  
function getRTimeTwo(){
	//$('#ipt_div').show();
	var t_s = NowTimeOld.getTime();
	var NowTime = NowTimeOld.setTime(t_s + 1000);
	var t = waveTime - NowTime;
	if(t <= 0){
		clearInterval(two);
		ajaxLottery();
		return;
	}
	var d=Math.floor(t/1000/60/60/24);
	var h=Math.floor(t/1000/60/60%24);
	var m=Math.floor(t/1000/60%60);
	var s=Math.floor(t/1000%60);
	//var h = d * 24 + h;
	$("#hb-message").html("本期抽奖中...");
	$('#hb-clock-d').html(d);
	$('#hb-clock-h').html(h);
	$('#hb-clock-m').html(m);
	$('#hb-clock-s').html(s);
//	html = '';
//	html += '<span class="sjaimmt">'+h+'</span> 时'+'<span class="sjaimmt">'+m+'</span> 分'+'<span class="sjaimmt">'+s+"</span> 秒";
//	$("#hb-clock").html(html);
}

function setEnd() {
	$("#hb-message").html("当日领取红包结束");
	//$("#hb-clock").html('');
	$('#hb-clock-d').html('0');
	$('#hb-clock-h').html('0');
	$('#hb-clock-m').html('00');
	$('#hb-clock-s').html('00');
}
ajaxLottery();


/*loadAnnounce(function() {
	
});*/
</script>



<!--[if lt IE 11]>
<div class="eachlisq"><div class="" style="display:table;width:100%;height:100%"><div class="" style="display:table-cell;vertical-align:middle"><div class="dwnntl1">温馨提示：<strong class="sainsnb">您的浏览器需要更新才能访问哦 ^_^</strong></div><div class="dqiangshiy">请使用 <strong class="sainsnb">Chrome</strong>、 <strong class="sainsnb">firefox</strong>、 <strong class="sainsnb">Safari</strong>、 <strong class="sainsnb">opera</strong> 、 <strong class="sainsnb">Microsoft Edge</strong>、 <strong class="sainsnb">Internet Explorer 11</strong> 浏览器访问~</div><p class="dsannp"><a class="sannbw1" href="http://www.google.com/chrome" target="_blank"></a> <a class="sannbw2" href="http://www.apple.com/safari" target="_blank"></a> <a class="sannbw3" href="http://www.firefox.com/" target="_blank"></a> <a class="sannbw4" href="http://www.opera.com/zh-cn" target="_blank"></a> <a class="sannbw5" href="https://www.microsoft.com/en-us/windows/microsoft-edge" target="_blank"></a> <a class="sannbw6" href="https://support.microsoft.com/en-us/help/17621/internet-explorer-downloads" target="_blank"></a></p><h4 class="dwnsnht">Please update to a modern browser</h4></div></div></div>
<style type="text/css">
  .eachlisq{position:fixed;left:0;top:0;width:100%;height:100%;z-index:9999;background:#fff;text-align:center;color:#666}.sainsnb{border-bottom:1px dotted #930;font-weight:400;padding-bottom:2px;color:#930}.dwnntl1{font-size:23px;font-weight:700;line-height:50px}.dqiangshiy{font-size:18px;line-height:40px;font-weight:700}.dsannp{padding:40px 0;text-align:center}.dsannp a{display:block;width:125px;height:135px;margin:0 10px;display:inline-block;background:url(images/lqx.png) no-repeat}.dsannp a.sannbw1{background-position:0 0}.dsannp a.sannbw2{background-position:-125px 0}.dsannp a.sannbw3{background-position:-250px 0}.dsannp a.sannbw4{background-position:-375px 0}.dsannp a.sannbw5{background-position:-500px 0}.dsannp a.sannbw6{background-position:-625px 0}.dwnsnht{margin:20px 0;color:#888}
</style>
<![endif]-->

<div id="xmt-collection" style="z-index: 9999999; top: 950.987px; left: 262.993px; display: block;"><a href="javascript:void(0)" class="collect-img">采集</a><span class="collect-arrow"></span><ul class="collect-menu"><li class="hide-collect">隐藏采集按钮</li></ul></div><div id="cli_dialog_div"></div><div id="qb-sougou-search" style="display: none; opacity: 0;"><p>搜索</p><p class="last-btn">复制</p><iframe src="./澳门新葡京领红包_files/saved_resource.html"></iframe></div></body></html>