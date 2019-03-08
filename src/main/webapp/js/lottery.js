var Timerr;
function isIE() { //ie?
	if (!!window.ActiveXObject || "ActiveXObject" in window)
		return true;
	else if (/iphone|ipad|ipod|safari/.test(navigator.userAgent.toLowerCase())) {
		return true;		
	} 
	return false;
}

function formatTodayTime(inputTime) {  
	    var date = new Date();
	    var y = date.getFullYear();  
	    var m = date.getMonth();  
	    m = m < 10 ? ('0' + m) : m;  
	    var d = date.getDate();  
	    d = d < 10 ? ('0' + d) : d;  
//	    var h = inputTime.getHours();
//	    h = h < 10 ? ('0' + h) : h;
//	    var minute = inputTime.getMinutes();
//	    var second = inputTime.getSeconds();
//	    minute = minute < 10 ? ('0' + minute) : minute;  
//	    second = second < 10 ? ('0' + second) : second; 
	var time=inputTime.split(':');
	    return new Date(Date.UTC(y,m,d,parseInt(time[0])-8,parseInt(time[1]),parseInt(time[2])));  
	};

function ajaxLottery(){
	$.ajax({
		url: requestUrl+'/setting/getsetting',
		contentType:"application/json",
		cache: false,
		type: 'POST',
		success: function (obj) {
			var totalmoney=obj.totalmoney==null?0:parseInt(obj.totalmoney);
			var totalnum=obj.totalnum==null?0:parseInt(obj.totalnum);
			if(new Date(obj.starttime)<=new Date()&&new Date(obj.endtime)>=new Date()&&totalmoney>0&&totalnum>0)
				{
					var fbtime=formatTodayTime(obj.fbtime);
					var sbtime=formatTodayTime(obj.sbtime);
					
//					if (isIE()) {
//						var f_time = obj.starttime.replace(/-/g,'/');
//						var s_time = obj.endtime.replace(/-/g,'/');
//					} else {
//						var f_time = obj.starttime;
//						var s_time = obj.endtime;
//					}
					if(sbtime>=new Date())
						{
					if(fbtime>new Date()){
						//下一波倒计时
						clearInterval(Timerr);
						//if (isIE()) {
//						if(false){
//							var c_time = starttime.replace(/-/g,'/');
//							var start_time =starttime.replace(/-/g,'/');
//						} else {
//							var c_time =obj.starttime;
//							var start_time = obj.starttime;
//						}
						
						NowTimeOld = new Date();
						startDateTime =  fbtime;
						one = setInterval(getRTimeOne,1000);
						
						
					}
					else{
						//抽奖动画
						//if (isIE()) {
//						if(false){
//							var c_time = obj.starttime.replace(/-/g,'/');
//							var end_time = obj.endtime.replace(/-/g,'/');
//						} else {
//							var c_time = obj.starttime;
//							var end_time = obj.endtime;
//						}
						
						NowTimeOld = new Date();
						waveTime =  sbtime;
						two = setInterval(getRTimeTwo,1000);
					}
				}
					else{
						clearInterval(Timerr);
						setEnd();
					}
				}
			else{
				clearInterval(Timerr);
				setEnd();
			}
			
		},
		error: function(XMLHttpRequest, textStatus, errorThrown) {
			var x = 1;
		}
	}) ;
};
// 显示查询窗口
function showQueryWin() {
	$('#querywin').fadeIn();
}
// 关闭查询窗口
function closeQueryWin() {
	$('#querywin').fadeOut();
}
// 显示领取窗口
function showGetWin() {
	if ($.trim($('#username').val()) !== '') {
		getPacket();
	} else {
		$('#getWin').fadeIn();
	}
}
// 关闭领取窗口
function closeGetWin() {
	$('#getWin').fadeOut();
}
// 获取红包
function getPacket() {
	var username = $.trim($('#username').val());
	if (username == '') {
		alert('请输入会员名！');
		return false;
	}
	if($('#hb-message').html()!='本期抽奖中...'){
		alert('不在活动时间内！');
		return false;
	}
	$.ajax({
		url: requestUrl+'/gain/addGain',
		contentType:"application/json",
		data: JSON.stringify({username:username}),
		cache: false,
		type: 'POST',
		success: function (obj) { 
			console.log(obj)
			if (obj.status == '-5' || obj.status == '-3' || obj.status == '-1'||obj.status == '0') {
				var msg=obj.msg;
				if(obj.status == '0')
					{
					msg='恭喜获得'+obj.msg+'元红包';
				    $('#money').html(obj.msg+'.00');
				    showHongBao();
					}
				else{
				alert(msg);
				}
				closeGetWin();
			} else {
				alert('系统忙，请稍后再试！');
			}
		},
		error: function(XMLHttpRequest, textStatus, errorThrown) {
			alert('系统忙，请稍后再试！');
		}
	}) ;
}

function close_hongbao(){
	$('#hongbao_result').hide();
	$('#mask').hide();
}

function showHongBao(){
	$('#hongbao_result').show();
	$('#mask').show();
}
// 查询
function query(page) {
	var username = $.trim($('#username-query').val());
	if (username == '') {
		alert('请输入会员名！');
		return false;
	}
	$.ajax({
		url: requestUrl+'/gain/getGainbyName',
		contentType:"application/json",
		data: JSON.stringify({username:username,page:page?page:1}),
		cache: false,
		type: 'POST',
		success: function (obj) {  
			 if(obj.rows.length != 0){

					var sHtml1 = "";
					
					var x = "";
	//.data
					$.each(obj.rows, function(i, award){

						x = (award.status == 1)?"<font color=yellow>已派彩</font>":"<font color=white>未派彩</font>";
						var newDate = new Date();
						newDate.setTime(award.gaintime);
						var dateStr =newDate.toLocaleDateString();							
					    sHtml1 +="<tr><td><font color=white>"+award.awardid+"</font></td><td><font color=white>"+dateStr+"</font></td><td>"+x+"</td></tr>";

					})

					var sPage = Paging(page?page:1,5,obj.total,2,"query",'','','上一页','下一页');

					$("#page").html(sPage);							

					$("#query-result").html(sHtml1);

				}else{

					$("#query-result").html("<tr><td colspan='3'>未找到相关信息</td></tr>");

				}
		},
		error: function(XMLHttpRequest, textStatus, errorThrown) {
			alert('系统忙，请稍后再试！');
		}
	}) ;
}

function Paging(pageNum, pageSize, totalCount, skipCount, fuctionName, currentStyleName, currentUseLink, preText, nextText, firstText, lastText) {

    var returnValue = '';

    var begin = 1;

    var end = 1;

    var totalpage = Math.floor(totalCount / pageSize);

    if (totalCount % pageSize > 0) {

        totalpage ++;

    }

    if (preText == null) {

        firstText = 'prev';

    }

    if (nextText == null) {

        nextText = 'next';

    }
    

    begin = pageNum - skipCount;

    end = pageNum + skipCount;
    

    if (begin <= 0) {

        end = end - begin + 1;

        begin = 1;

    }
    

    if (end > totalpage) {

        end = totalpage;

    }

    for (count = begin;count <= end;count ++) {

        if (currentUseLink) {

            if (count == pageNum) {

                returnValue += '<a class="' + currentStyleName + '" href="javascript:void(0);" onclick="' + fuctionName + '(' + count.toString() + ');">' + count.toString() + '</a> ';

            }

            else {

                returnValue += '<a href="javascript:void(0);" onclick="' + fuctionName + '(' + count.toString() + ');">' + count.toString() + '</a> ';

            }

        }

        else {

            if (count == pageNum) {

                returnValue += '<span class="' + currentStyleName + '">' + count.toString() + '</span> ';

            }

            else {

                returnValue += '<a href="javascript:void(0);" onclick="' + fuctionName + '(' + count.toString() + ');">' + count.toString() + '</a> ';}

            }

        }

        if (pageNum - skipCount > 1) {

            returnValue = ' ... ' + returnValue;

        }

        if (pageNum + skipCount < totalpage) {

            returnValue = returnValue + ' ... ';

        }
        

        if (pageNum > 1) {

            returnValue = '<a href="javascript:void(0);" onclick="' + fuctionName + '(' + (pageNum - 1).toString() + ');"> ' + preText + '</a> ' + returnValue;

        }

        if (pageNum < totalpage) {

            returnValue = returnValue + ' <a href="javascript:void(0);" onclick="' + fuctionName + '(' + (pageNum + 1).toString() + ');">' + nextText + '</a>';

        }
        

        if (firstText != null) {

            if (pageNum > 1) {

                returnValue = '<a href="javascript:void(0);" onclick="' + fuctionName + '(1);">' + firstText + '</a> ' + returnValue;}

        }

        if (lastText != null) {

            if (pageNum < totalpage) {

                returnValue = returnValue + ' ' + ' <a href="javascript:void(0);" onclick="' + fuctionName + '(' + totalpage.toString() + ');">' + lastText + '</a>';}

        }

        return returnValue;
    

}

// 加载公告
function loadAnnounce(callback) {
	$('#announce').load(requestUrl+'/gain/getAllGain', '', function () {
		callback();
	});
}