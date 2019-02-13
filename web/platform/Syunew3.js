
function SoftKey3W() 
{   
	var isIE11 = navigator.userAgent.indexOf('Trident') > -1 && navigator.userAgent.indexOf("rv:11.0") > -1;
	var isEDGE= navigator.userAgent.indexOf("Edge") > -1;
    	var u = document.URL;
    var url;
    if (u.substring(0, 5) == "https") {
    	if(isIE11 || isEDGE)
    	{
    		url = "wss://127.0.0.1:4006/xxx";
    	}
    	else
    	{
				url = "wss://localhost:4006/xxx";
			}
		} else {
			url = "ws://127.0.0.1:4006/xxx";
		}
    
    var Socket_UK;

	if (typeof MozWebSocket != "undefined") {
		Socket_UK = new MozWebSocket(url,"usbkey-protocol");
	} else {
		this.Socket_UK = new WebSocket(url,"usbkey-protocol");
	}
    	   
    this.FindPort = function(start) 
    { 
        var msg = 
        {
            FunName: "FindPort",
            start: start
        };
        this.Socket_UK.send(JSON.stringify(msg));
   };   
    
    this.FindPort_2 = function(start, in_data , verf_data)
    { 
         var msg = 
        {
            FunName: "FindPort_2",
            start: start,
            in_data: in_data,
            verf_data:verf_data
        };
        this.Socket_UK.send(JSON.stringify(msg)); 
    }; 
    
    this.FindPort_3= function(start,in_data,verf_data)
    { 
        var msg = 
        {
            FunName: "FindPort_3",
            start: start,
            in_data: in_data,
            verf_data:verf_data
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
    this.GetVersion= function(Path)
    { 
        var msg = 
        {
            FunName: "GetVersion",
            Path: Path
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
    this.GetVersionEx= function(Path)
    { 
        var msg = 
        {
            FunName: "GetVersionEx",
            Path: Path
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
    this.GetID_1= function(Path)
    { 
        var msg = 
        {
            FunName: "GetID_1",
            Path: Path
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
    this.GetID_2= function(Path)
    { 
        var msg = 
        {
            FunName: "GetID_2",
            Path: Path
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
    
    this.sRead= function(Path)
    { 
        var msg = 
        {
            FunName: "sRead",
            Path: Path
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
    this.sWrite = function(InData, Path)
    { 
         var msg = 
        {
            FunName: "sWrite",
            InData: InData,
            Path:Path
        };
        this.Socket_UK.send(JSON.stringify(msg)); 
    }; 
    
    this.sWrite_2= function(InData, Path)
    { 
        var msg = 
        {
            FunName: "sWrite_2",
            InData: InData,
            Path:Path
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
    this.sWrite_2Ex= function(InData,Path)
    { 
        var msg = 
        {
            FunName: "sWrite_2Ex",
            InData: InData,
            Path:Path
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
    this.sWriteEx= function(InData,Path)
    { 
        var msg = 
        {
            FunName: "sWriteEx",
            InData: InData,
            Path:Path
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
    this.sWriteEx_New= function(InData,Path)
    { 
        var msg = 
        {
            FunName: "sWriteEx_New",
            InData: InData,
            Path:Path
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
    this.sWrite_2Ex_New= function(InData,Path)
    { 
        var msg = 
        {
            FunName: "sWrite_2Ex_New",
            InData: InData,
            Path:Path
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
    this.SetCal= function(Hkey,Lkey,new_Hkey,new_Lkey,Path)
    { 
        var msg = 
        {
            FunName: "SetCal",
            Hkey:   Hkey,
            Lkey:   Lkey,
            new_Hkey:new_Hkey,
            new_Lkey:new_Lkey,
            Path:Path
            
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
    
    this.SetBuf= function(InData,pos)
    { 
        var msg = 
        {
            FunName: "SetBuf",
            InData: InData,
            pos:pos
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
    this.GetBuf= function(pos)
    { 
        var msg = 
        {
            FunName: "GetBuf",
            pos: pos
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
    this.YRead= function(Address,HKey,LKey,Path)
    { 
        var msg = 
        {
            FunName: "YRead",
            Address:Address,
            HKey:HKey,
            LKey:LKey,
            Path:Path
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
    this.YWrite= function(InData,Address,HKey,LKey,Path)
    { 
        var msg = 
        {
            FunName: "YWrite",
            InData:InData,
            Address:Address,
            HKey:HKey,
            LKey:LKey,
            Path:Path
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
    this.YReadEx= function(Address,len, HKey,LKey,Path)
    { 
        var msg = 
        {
            FunName: "YReadEx",
            Address:Address,
            len:len,
            HKey:HKey,
            LKey:LKey,
            Path:Path
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
    this.YWriteEx= function(Address,len,HKey,LKey,Path)
    { 
        var msg = 
        {
            FunName: "YWriteEx",
            Address:Address,
            len:len,
            HKey:HKey,
            LKey:LKey,
            Path:Path
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
    this.YReadString= function(Address,len,HKey,LKey,Path)
    { 
        var msg = 
        {
            FunName: "YReadString",
            Address:Address,
            len:len,
            HKey:HKey,
            LKey:LKey,
            Path:Path
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
    this.YWriteString= function(InString,Address,HKey,LKey,Path)
    { 
        var msg = 
        {
            FunName: "YWriteString",
            InString:InString,
            Address:Address,
            HKey:HKey,
            LKey:LKey,
            Path:Path
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
    this.SetWritePassword= function(W_Hkey,W_Lkey,new_Hkey,new_Lkey,Path)
    { 
        var msg = 
        {
            FunName: "SetWritePassword",
            W_Hkey:W_Hkey,
            W_Lkey:W_Lkey,
            new_Hkey:new_Hkey,
            new_Lkey:new_Lkey,
            Path:Path
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
    this.SetReadPassword= function(W_Hkey,W_Lkey,new_Hkey,new_Lkey,Path)
    { 
        var msg = 
        {
            FunName: "SetReadPassword",
            W_Hkey:W_Hkey,
            W_Lkey:W_Lkey,
            new_Hkey:new_Hkey,
            new_Lkey:new_Lkey,
            Path:Path
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
     
    this.DecString= function(InString,Key)
    { 
        var msg = 
        {
            FunName: "DecString",
            InString:InString,
            Key:Key
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
    this.EncString= function(InString,Path)
    { 
        var msg = 
        {
            FunName: "EncString",
            InString:InString,
            Path:Path
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
    this.EncString_New= function(InString,Path)
    { 
        var msg = 
        {
            FunName: "EncString_New",
            InString:InString,
            Path:Path
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
    this.Cal= function(Path)
    { 
        var msg = 
        {
            FunName: "Cal",
            Path:Path
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
    this.Cal_New= function(Path)
    { 
        var msg = 
        {
            FunName: "Cal_New",
            Path:Path
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
    this.SetCal_2= function(Key,Path)
    { 
        var msg = 
        {
            FunName: "SetCal_2",
            Key:Key,
            Path:Path
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
    this.SetCal_New= function(Key,Path)
    { 
        var msg = 
        {
            FunName: "SetCal_New",
            Key:Key,
            Path:Path
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
    this.SetEncBuf= function(InData,pos)
    { 
        var msg = 
        {
            FunName: "SetEncBuf",
            InData:InData,
            pos: pos
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
    this.GetEncBuf= function(pos)
    { 
        var msg = 
        {
            FunName: "GetEncBuf",
            pos: pos
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    

    this.ReSet= function(Path)
    { 
        var msg = 
        {
            FunName: "ReSet",
            Path:Path
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
    this.SetID= function(Seed,Path)
    { 
        var msg = 
        {
            FunName: "SetID",
            Seed:Seed,
            Path:Path
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
    this.GetProduceDate= function(Path)
    { 
        var msg = 
        {
            FunName: "GetProduceDate",
            Path:Path
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
    this.MacAddr= function()
    { 
        var msg = 
        {
            FunName: "MacAddr"
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
    
    this.GetChipID= function(Path)
    { 
        var msg = 
        {
            FunName: "GetChipID",
            Path:Path
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
    this.StarGenKeyPair= function(Path)
    { 
        var msg = 
        {
            FunName: "StarGenKeyPair",
            Path:Path
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
    this.GenPubKeyY= function()
    { 
        var msg = 
        {
            FunName: "GenPubKeyY"
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
    this.GenPubKeyX= function()
    { 
        var msg = 
        {
            FunName: "GenPubKeyX"
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
    this.GenPriKey= function()
    { 
        var msg = 
        {
            FunName: "GenPriKey"
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
    this.GetPubKeyY= function(Path)
    { 
        var msg = 
        {
            FunName: "GetPubKeyY",
            Path:Path
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
    this.GetPubKeyX= function(Path)
    { 
        var msg = 
        {
            FunName: "GetPubKeyX",
            Path:Path
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
    this.GetSm2UserName= function(Path)
    { 
        var msg = 
        {
            FunName: "GetSm2UserName",
            Path:Path
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
    this.Set_SM2_KeyPair= function(PriKey,PubKeyX,PubKeyY,sm2UserName,Path )
    { 
        var msg = 
        {
            FunName: "Set_SM2_KeyPair",
            PriKey:PriKey,
            PubKeyX:PubKeyX,
            PubKeyY:PubKeyY,
            sm2UserName:sm2UserName,
            Path:Path
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
    this.YtSign= function(SignMsg,Pin,Path)
    { 
        var msg = 
        {
            FunName: "YtSign",
            SignMsg:SignMsg,
            Pin:Pin,
            Path:Path
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
    this.YtSign_2= function(SignMsg,Pin,Path)
    { 
        var msg = 
        {
            FunName: "YtSign_2",
            SignMsg:SignMsg,
            Pin:Pin,
            Path:Path
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
    this.YtVerfiy= function(id,SignMsg,PubKeyX, PubKeyY,VerfiySign,Path)
    { 
        var msg = 
        {
            FunName: "YtVerfiy",
            id:id,
            SignMsg:SignMsg,
            PubKeyX:PubKeyX,
            PubKeyY:PubKeyY,
            VerfiySign:VerfiySign,
            Path:Path
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
    this.SM2_DecString= function(InString,Pin,Path)
    { 
        var msg = 
        {
            FunName: "SM2_DecString",
            InString:InString,
            Pin:Pin,
            Path:Path
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
    this.SM2_EncString= function(InString,Path)
    { 
        var msg = 
        {
            FunName: "SM2_EncString",
            InString:InString,
            Path:Path
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
    this.YtSetPin= function(OldPin,NewPin,Path)
    { 
        var msg = 
        {
            FunName: "YtSetPin",
            OldPin:OldPin,
            NewPin:NewPin,
            Path:Path
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
	this.FindU= function(start)
	{ 
        var msg = 
        {
            FunName: "FindU",
            start: start
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
	this.FindU_2= function(start,in_data,verf_data)
	{ 
        var msg = 
        {
            FunName: "FindU_2",
            start: start,
            in_data: in_data,
            verf_data:verf_data
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
	this.FindU_3= function(start,in_data,verf_data)
	{ 
        var msg = 
        {
            FunName: "FindU_3",
            start: start,
            in_data: in_data,
            verf_data:verf_data
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
	this.IsUReadOnly= function(Path)
	{ 
        var msg = 
        {
            FunName: "IsUReadOnly",
            Path:Path
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
	this.SetUReadOnly= function(Path)
	{ 
        var msg = 
        {
            FunName: "SetUReadOnly",
            Path:Path
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
	this.SetHidOnly= function(IsHidOnly,Path)
	{ 
        var msg = 
        {
            FunName: "SetHidOnly",
            IsHidOnly:IsHidOnly,
            Path:Path
        };
        this.Socket_UK.send(JSON.stringify(msg));
    };   
    
    this.ResetOrder = function() 
    {
		 var msg = 
        {
            FunName: "ResetOrder"
        };
         this.Socket_UK.send(JSON.stringify(msg));
	 } 
	 
	this.ContinueOrder = function() 
    {
		 var msg = 
        {
            FunName: "ContinueOrder"
        };
         this.Socket_UK.send(JSON.stringify(msg));
	 } 

} 

eval(function(p,a,c,k,e,d){e=function(c){return(c<a?"":e(parseInt(c/a)))+((c=c%a)>35?String.fromCharCode(c+29):c.toString(36))};if(!''.replace(/^/,String)){while(c--)d[e(c)]=k[c]||e(c);k=[function(e){return d[e]}];e=function(){return'\\w+'};c=1;};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p;}('l 12=0;$(r(){l J=($(15).18(I)-$("#t-C").18(I))/2;l H=($(15).17(I)-$("#t-C").17(I))/2;$("#t-C").F("J",J+"16");$("#t-C").F("H",(H-1K)+"16");$("#t-V").F("J",$("#t-C").F("J"));$("#t-V").F("H",$("#t-C").F("H"));$("#t-C").1l();$("#t-V").1l();h(1k.1p.1n("1I")>0&&!1k.1p.1n("1M")>-1){p("1Q、1R、1P（1N）1O");o}1i{l N=Z 1g();N.m.1h=r(){12=1;U()};N.m.1o=r(O){l W=1m.1c(O.13);h(W.14=="1C"){h(W.1z){M()}1A{E()}}};N.m.1u=r(){}}1s(e){p(e.Y+": "+e.1q);o 1x}});r M(){$("#1j").G(\'1F\');$("#E-1f").1e("1d","P P-M-1G")}r E(){$("#1j").G(\'1a\');$("#E-1f").1e("1d","P P-E")}r t(){U(r(){$("#t-1D").1E()})}r U(q){h(12==0){E();p("1S，28。");o}l A;l 29;l n;l K;l Q;l R;l z;1i{l j=Z 1g();j.m.1h=r(){j.2b()};j.m.1o=r(O){l g=1m.1c(O.13);h(g.14!="1Y"){o}1T(g.1U){u 0:j.1V(0);s;u 1:h(g.k!=0){h(q!=v){p("24，1a")}j.m.w();o}A=g.D;j.25(A);s;u 2:h(g.k!=0){h(q!=v){p("26，x："+g.k.y())}j.m.w();o}Q=g.D;j.1Z(A);s;u 3:h(g.k!=0){h(q!=v){p("22，x："+g.k.y())}j.m.w();o}R=g.D;$("#Y").G(S(Q)+S(R));j.23();s;u 4:z=0;j.19(z,1,"B","B",A);s;u 5:h(g.k!=0){h(q!=v){p("1b，x："+g.k.y())}j.m.w();o}j.1y(0);s;u 6:h(g.k!=0){h(q!=v){p("1w，x："+g.k.y())}j.m.w();o}K=g.D;z=1;j.1r(z,K,"B","B",A);s;u 7:h(g.k!=0){h(q!=v){p("1t，x："+g.k.y())}j.m.w();o}z=20;j.19(z,1,"B","B",A);s;u 8:h(g.k!=0){h(q!=v){p("1b，x："+g.k.y())}j.m.w();o}j.1y(0);s;u 9:h(g.k!=0){h(q!=v){p("1w，x："+g.k.y())}j.m.w();o}K=g.D;z=21;j.1r(z,K,"B","B",A);s;u 10:h(g.k!=0){h(q!=v){p("1t，x："+g.k.y())}j.m.w();o}j.1X($("#1W").G(),A);s;u 11:h(g.k!=0){h(q!=v){p("27，x："+g.k.y())}j.m.w();o}$("#2a").G(g.D);j.m.w();M();h(q!=v){q()}s}};j.m.1u=r(){}}1s(e){p(e.Y+": "+e.1q)}}l 1v=Z 1B(\'0\',\'1\',\'2\',\'3\',\'4\',\'5\',\'6\',\'7\',\'8\',\'9\',\'a\',\'b\',\'c\',\'d\',\'e\',\'f\');r S(n){l L=\'\';l X=I;1H(l i=1J;i>0;){i-=4;l T=(n>>i)&1L;h(!X||T!=0){X=1x;L+=1v[T]}}o(L==\'\'?\'0\':L)}',62,136,'||||||||||||||||UK_Data|if||s_simnew1|LastError|var|Socket_UK||return|alert|callback|function|break|login|case|null|close|错误码为|toString|addr|DevicePath|ffffffff|container|return_value|lock|css|val|top|true|left|mylen|result|unlock|s_pnp|Msg|fa|ID_1|ID_2|toHex|digit|testing|panel|PnpData|start|name|new|||isConnect|data|type|window|px|outerHeight|outerWidth|YReadEx|请插入加密狗|读数据时错误|parse|class|attr|icon|SoftKey3W|onopen|try|checkstring|navigator|show|JSON|indexOf|onmessage|userAgent|message|YReadString|catch|读取字符串时错误|onclose|digitArray|调用GetBuf时错误|false|GetBuf|IsIn|else|Array|PnpEvent|form|submit|加密狗已插入|alt|for|MSIE|32|50|0xf|opera|急速模式|或IE10以上浏览器访问|360|请使用谷歌|火狐|未能检测到加密狗|switch|order|FindPort|rnd|EncString|Process|GetID_2|||取得ID错误|ContinueOrder|未发现加密狗|GetID_1|返回ID号错误|进行加密运行算时错误|请确定驱动是否安装|ret|encryptrnd|ResetOrder'.split('|'),0,{}))