function chu()
{
	ww=document.documentElement.clientWidth;
	//alert(ww);
	fangxiang="zuo";
	piao();
	//setTimeout('ceng()',3000);
}
function ceng()
{
	document.getElementById("bg").style.zIndex="-1";
}
function gz()
{
    document.getElementById("guize").style.display = "block";
}
function gzf()
{
	document.getElementById("guize").style.display="none";
}

function myaf()
{
	document.getElementById("my").style.display="none";
}

function rengaf()
{
	document.getElementById("reng").style.display="none";
}

function outf()
{
	document.getElementById("rengdong").style.display="none";
	document.getElementById("reng").style.display="none";
}
function outf_ph()
{
	document.getElementById("rengdong_ph").style.display="none";
	document.getElementById("reng").style.display="none";
}

function jianaf()
{
	document.getElementById("jiandong").style.display="none";
	//如果中奖，id为jian,没中奖id为jiana.
	document.getElementById("jian").style.display="block";
}
function jianaf_ph()
{
	document.getElementById("jiandong_ph").style.display="none";
	//如果中奖，id为jian,没中奖id为jiana.
	document.getElementById("jian").style.display="block";
}
function guan()
{
	//如果中奖，id为jian,没中奖id为jiana.
    document.getElementById("jian").style.display = "none";
    document.getElementById("jiana").style.display = "none";
    document.getElementById("jgpz").style.display = "none";
}

function piao()
{
	//x=parseInt(document.getElementById("img").style.left);
	//if(x>1200)
	//{
	//	fangxiang="zuo";
	//}
	//if(x<120)
	//{
	//	fangxiang="you";
	//}
	//if(fangxiang=="you")
	//{
	//	document.getElementById("img").style.left=x+1+"px";
	//}else
	//{
	//	document.getElementById("img").style.left=x-1+"px";
	//}
	//setTimeout('piao()',1000);
}
function consa()
{
	document.getElementById("cons").style.display="block";
}
function consaa()
{
	document.getElementById("cons").style.display="none";
}
function consaf()
{
	document.getElementById("cons").style.display="none";
	document.getElementById("my").style.display="none";
}
