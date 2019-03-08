<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<title>手机端领红包</title>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">
<link href="images/ico.ico" rel="shortcut icon">
<!-- <meta name="viewport"  content="width=device-width,user-scalable=no"> -->
<meta name="viewport" content="width=640,maximum-scale=4,user-scalable=no">
<link rel="stylesheet" rev="stylesheet" href="css/reset.css" type="text/css" />
<link rel="stylesheet" rev="stylesheet" href="css/font-awesome.min.css" type="text/css" />
<link rel="stylesheet" rev="stylesheet" href="css/global_m.css" type="text/css" />
<link rel="stylesheet" rev="stylesheet" href="css/index_m.css" type="text/css" />
<style>
  	#page{
  	color:#fff;
  	text-align:right;
  	margin:10px 55px 0 0;
  	}
  </style>
<script type="text/javascript">
  var oWidth = document.documentElement.clientWidth || document.body.clientWidth;
  if (oWidth < 1024) {}
  else {
    window.location.href = "./index.jsp";
  }
  window.addEventListener("orientationchange", function () {
    var oWidth = document.documentElement.clientWidth || document.body.clientWidth;
    if (oWidth < 1024) {}
    else {
      window.location.href = "./index.jsp";
    }
  }, false);
  window.addEventListener("resize", function () {
    var oWidth = document.documentElement.clientWidth || document.body.clientWidth;
    if (oWidth < 1024) {}
    else {
      window.location.href = "./index.jsp";
    }
  }, false);
</script>
</head>
<body>

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
<div class="loading">
<span class="loadingfa xuanzhuan"><em class="fa fa-spinner"></em></span>
</div>
<!-- id=innerbox 标签外面 不放任何标签  为自适应标签   -->
<div class="" id="innerbox"> 
	<div class="header"><div class="logo"><h1><a href="#" class="" ><img src="images/logo.png" alt="" /></a></h1></div></div>
  <div class="content">
    <div class="baobox">
      <div class="shengyu">
        <div class="juhd"> 
          <div class="">
            <span id="hb-clock-d">0</span> <em class="">天</em> 
          </div>
          <div class="">
            <span id="hb-clock-h">0</span> <em class="">小时</em> 
          </div>
          <div class="tac haishen" id="hb-message">...</div>
          <div class="">
            <span id="hb-clock-m">0</span> <em class="">分</em>
          </div>
          
          <div class="">
            <span id="hb-clock-s">0</span>
            <em class="">秒</em> 
          </div>
        </div>
        <div class="hongba-in"> 
          <div class="bsaiige"></div>
          <input id="username" type="text" class="bsaoint" placeholder="请输入会员账号" value="" />
          <a  onclick="getPacket();" class="baoqiang" ></a>
          <div class="cl"></div>
        </div>
      </div>      
      <div class="luntiwa">
        <div class="luntop">
          <ul id="announce">
          </ul>
        </div>
      </div>
      <div class="">
        <a href="detail_m.jsp." class="chakna" ><img src="images/chakan.png" alt="" /></a>
      </div>
       <div class="cl h100"></div>
       <div class="cl h100"></div>
    </div>
   
  </div>
	<div class="nav df ac js">
    <a target="_blank" href="https://77302b.com" class=""><span class="nvig"><img src="images/nv1.png" alt=""></span>官网首页   </a>
    <a target="_blank"href="https://www.30277pay.com" class=""><span class="nvig"><img src="images/nv2.png" alt=""></span>快速充值   </a>
    <a onClick="showQueryWin();"><span class="nvig"><img src="images/nv3.png" alt=""></span>红包查询     </a>
    <a href="./detail_m.jsp" class=""><span class="nvig"><img src="images/nv4.png" alt=""></span>活动详情    </a>
    <a target="_blank"href="https://static.meiqia.com/dist/standalone.html?_=t&eid=58916" class=""><span class="nvig"><img src="images/nv5.png" alt=""></span>在线客服   </a>

  </div>
  
</div>




<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<!-- <script type="text/javascript" src="script/global.js"></script> -->
<script type="text/javascript" src="js/demo_m.js"></script>
<script type="text/javascript" src="js/index_m.js"></script>
<script>
$(function(){
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
							  '<span class="w175">恭喜 '+username+'</span>'+
							  '<span class="w213">获得 '+award.lbmoney+'元 红包</span>'+
							  '<span class="">'+formatDateTime()+'</span>'+
							'</li>';

							
					});
				$("#announce").html(sAwardEle);
				
				$(".luntop").luntopFn({
				    time:15
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


<script type="text/javascript" src="js/lottery.js"></script>



    <!-- 查询窗口 start -->
	<div class="tanchuceng" id="querywin" style="display:none; z-index:99999999">
		<div class="tanin">
			<div class="chacha" onclick="closeQueryWin();">×</div>
			<div class="tantoux">输入会员账号查询</div>
			<div class="cl h35"></div>
			<div class="tac shuzangh">
				<span class="">会员账号：</span>
				<input id="username-query" type="text" class="shuimsnt" value="" />
				<a href="javascript:;" class="chaaa" onclick="query();"><img src="images/chaa.png" class="vm" alt="" /></a>
			</div>
			<div class="cl h15"></div>
			<div class="chatablewa">
				<table class="chtable">
					<tr class="toum">
						<td>红包金额</td>    
						<td>领取时间</td>      
						<td>是否派彩</td>
					</tr>
					<tbody id="query-result">
                    
                    </tbody>
				</table>
			</div>
			<div class="cl h35" id="page"></div>
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
	$("#hb-message").html("活动已结束");
	//$("#hb-clock").html('');
}
ajaxLottery();


  /*
loadAnnounce(function() {
 
});*/
</script>
</body>
</html>