

function showHide(objname)
{
	//鍙涓昏彍鍗曡缃甤ookie
	var obj = document.getElementById(objname);
	if(objname.indexOf('_1')<0 || objname.indexOf('_10')>0)
	{
		if(obj.style.display == 'block' || obj.style.display =='')
			obj.style.display = 'none';
		else
			obj.style.display = 'block';
		return true;
	}
  //姝ｅ父璁剧疆cookie
	var ckstr = getCookie('menuitems');
	var ckstrs = null;
	var okstr ='';
	var ischange = false;
	if(ckstr==null) ckstr = '';
	ckstrs = ckstr.split(',');
	objname = objname.replace('items','');
	if(obj.style.display == 'block' || obj.style.display =='')
	{
		obj.style.display = 'none';
		for(var i=0; i < ckstrs.length; i++)
		{
			if(ckstrs[i]=='') continue;
			if(ckstrs[i]==objname){  ischange = true;  }
			else okstr += (okstr=='' ? ckstrs[i] : ','+ckstrs[i] );
		}
		if(ischange) setCookie('menuitems',okstr,7);
	}
	else
	{
		obj.style.display = 'block';
		ischange = true;
		for(var i=0; i < ckstrs.length; i++)
		{
			if(ckstrs[i]==objname) {  ischange = false; break; }
		}
		if(ischange)
		{
			ckstr = (ckstr==null ? objname : ckstr+','+objname);
			setCookie('menuitems',ckstr,7);
		}
	}
}
//璇诲啓cookie鍑芥暟
function getCookie(c_name)
{
	if (document.cookie.length > 0)
	{
		c_start = document.cookie.indexOf(c_name + "=")
		if (c_start != -1)
		{
			c_start = c_start + c_name.length + 1;
			c_end   = document.cookie.indexOf(";",c_start);
			if (c_end == -1)
			{
				c_end = document.cookie.length;
			}
			return unescape(document.cookie.substring(c_start,c_end));
		}
	}
	return null
}
function setCookie(c_name,value,expiredays)
{
	var exdate = new Date();
	exdate.setDate(exdate.getDate() + expiredays);
	document.cookie = c_name + "=" +escape(value) + ((expiredays == null) ? "" : ";expires=" + exdate.toGMTString()); //浣胯缃殑鏈夋晥鏃堕棿姝ｇ‘銆傚鍔爐oGMTString()
}
//妫�煡浠ュ墠鐢ㄦ埛灞曞紑鐨勮彍鍗曢」
var totalitem = 12;
function CheckOpenMenu()
{
	//setCookie('menuitems','');
	var ckstr = getCookie('menuitems');
	var curitem = '';
	var curobj = null;
	
	//cross_obj = document.getElementById("staticbuttons");
	//setInterval("initializeIT()",20);
	
	if(ckstr==null)
	{
		ckstr='1_1,2_1,3_1';
		setCookie('menuitems',ckstr,7);
	}
	ckstr = ','+ckstr+',';
	for(i=0;i<totalitem;i++)
	{
		curitem = i+'_'+curopenItem;
		curobj = document.getElementById('items'+curitem);
		if(ckstr.indexOf(curitem) > 0 && curobj != null)
		{
			curobj.style.display = 'block';
		}
		else
		{
			if(curobj != null) curobj.style.display = 'none';
		}
	}
}

var curitem = 1;
function ShowMainMenu(n)
{
	var curLink = $DE('link'+curitem);
	var targetLink = $DE('link'+n);
	var curCt = $DE('ct'+curitem);
	var targetCt = $DE('ct'+n);
	if(curitem==n) return false;
	if(targetCt.innerHTML!='')
	{
		curCt.style.display = 'none';
		targetCt.style.display = 'block';
		curLink.className = 'mm';
		targetLink.className = 'mmac';
		curitem = n;
	}
	else
	{
		var myajax = new DedeAjax(targetCt);
		myajax.SendGet2("index_menu_load.php?openitem="+n);
		if(targetCt.innerHTML!='')
		{
			curCt.style.display = 'none';
			targetCt.style.display = 'block';
			curLink.className = 'mm';
			targetLink.className = 'mmac';
			curitem = n;
		}
		DedeXHTTP = null;
	}
}

