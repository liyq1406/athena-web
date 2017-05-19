function validateInput(value,options,tobj){
	var errmsg='';
	var fvalue;
	if(options.notNull && options.notNull.toString()=='true'){
		if($.isArray(value)&&value.length== 0){//数组类型
			showMsg($.sdcui.resource.i18n['C_V_NOTNULL'](options.caption));
			return false;
		}
		
		if(typeof(value)=='string'&&(value==''||value==null)){
			showMsg($.sdcui.resource.i18n['C_V_NOTNULL'](options.caption));
			return false;
		}
	}
	
	//起始字符过滤
	if(options.startWidth&&value&&
			value.indexOf(options.startWidth)!=0){
		showMsg($.sdcui.resource.i18n['C_V_STARTWIDTH'](options.startWidth));
		return false;
	}
	
	
	if(options.escapeSpecial&&!/^[^\|"'<>]*$/.test(value)){
		showMsg($.sdcui.resource.i18n['C_V_ESCAPESPECIAL']);
		return false;
	}
	
	if(value&&options.maxLength&&value.length>options.maxLength){
		showMsg($.sdcui.resource.i18n['C_V_MAXLENGTH'](options.maxLength));
		return false;
	}
	
	if(value&&options.minLength&&value.length<options.minLength){
		showMsg($.sdcui.resource.i18n['C_V_MINLENGTH'](options.minLength));
		return false;
	}
	
	//取用户中心第二位
	var sUC;
	if(st_UserCenter.length>=2){
		sUC = st_UserCenter.substr(1,1);
	}
	
	//特殊字符过滤
	var regStr,
		regMessage = '';
	var fractionLength = options.fractionLength||0;
	if(options.expression){
		regStr     = options.expression;
		regMessage = options.expressionMessage;
	}else{
		switch(options.dataType){
			case 'integer':
				regStr = this.regexps.integer;
				regMessage = $.sdcui.resource.i18n['C_V_INTEGER'];
				break;
			case 'number':
				regStr = this.regexps.number(fractionLength);
				regMessage = $.sdcui.resource.i18n['C_V_NUMBER'](fractionLength);
				break;
			case 'text':
				regStr = this.regexps.text;
				regMessage = $.sdcui.resource.i18n['C_V_TEXT'];
				break;
			case 'email':
				regMessage = $.sdcui.resource.i18n['C_V_EMAIL'];
				regStr = this.regexps.email;
				break;
			case 'phone':
				regMessage = $.sdcui.resource.i18n['C_V_PHONE'];
				regStr = this.regexps.phone;
				break;
			case 'url':
				regMessage = $.sdcui.resource.i18n['C_V_URL'];
				regStr = this.regexps.url;
				break;
				
		    /*日期固定yyyyMMdd或yyyy-MM-dd*/
			case 'date':
				if (value && value.length == 8){
					value = value.substr(0,4) + '-' + value.substr(4,2) + '-' + value.substr(6,2);
				}
				regMessage = $.sdcui.resource.i18n['C_V_DATE'];
				regStr = this.regexps.date;
				break;
			/*日期固定yyyy-MM-dd HH:mm:ss*/
			case 'datetime':
				if (value && value.length == 14){
					value = value.substr(0,4) + '-' + value.substr(4,2) + '-' + value.substr(6,2) + ' '+ value.substr(8,2) + ':' + value.substr(10,2) + ':' + value.substr(12,2);
				}
				regMessage = $.sdcui.resource.i18n['C_V_DATETIME'];
				regStr = this.regexps.datetime;
				break;
			/*固定长度英数字*/
			case 'letter_numeric':
				var length = options.limitedLength;
				var length2 = options.limitedLength2;
				var msg = length;
				if (length2 && length2 > 0){
					msg = msg + '/' + length2;
				}
				regMessage = $.sdcui.resource.i18n['C_V_LETTER_NUMERIC'](msg);
				regStr = this.regexps.letter_numeric(length,length2);
				break;
			/*固定YesNo如原包装冻结*/
			case 'yesno':
				regMessage = $.sdcui.resource.i18n['C_V_YESNO'];
				regStr = this.regexps.yesno;
				break;
			/*固定YesNo如原包装冻结*/
			case 'yes':
				regMessage = $.sdcui.resource.i18n['C_V_YES'];
				regStr = this.regexps.yes;
				break;
		    /*固定YesNo如原包装冻结*/
			case 'no':
				regMessage = $.sdcui.resource.i18n['C_V_NO'];
				regStr = this.regexps.no;
				break;
			/*数据库number(8,3)类型*/
			case 'dbnumber':
				regMessage = $.sdcui.resource.i18n['C_V_DBNUMBER'];
				regStr = this.regexps.dbnumber;
				break;
			/*数据库mnumber(8,3)类型可以为负*/
			case 'mnumber':
				regMessage = $.sdcui.resource.i18n['C_V_DBNUMBER'];
				regStr = this.regexps.mnumber;
				break;	
			/*系数*/
			case 'xis':
				regMessage = $.sdcui.resource.i18n['C_V_XIS'];
				regStr = this.regexps.xis;
				break;
			/*非负整数（适用于个数）*/
			case 'positive':
				regMessage = $.sdcui.resource.i18n['C_V_POSITIVE'];
				regStr = this.regexps.positive;
				break;
			/*仓库地址*/
			case 'warehouse':
				var currentwarehouse = options.currentwarehouse;
				regMessage = $.sdcui.resource.i18n['C_V_WAREHOUSE'];
				regStr = this.regexps.warehouse(currentwarehouse);
				break;
			/*固定长度英数字或“*”号*/
			case 'mask':
				var maskLength = options.maskLength;
				regStr = this.regexps.mask(maskLength);
				regMessage = $.sdcui.resource.i18n['C_V_MASK'](maskLength);
				break;
		    /*固定长度数字或“*”号*/
			case 'masknumber':
				var maskLength = options.maskLength;
				regStr = this.regexps.masknumber(maskLength);
				regMessage = $.sdcui.resource.i18n['C_V_MASKNUMBER'](maskLength);
				break;	
			/*固定长度数字*/
			case 'fixnumber':
				var length = options.limitedLength;
				regStr = this.regexps.fixnumber(length);
				regMessage = $.sdcui.resource.i18n['C_V_FIXNUMBER'](length);
				break;
			/*正整数*/
			case 'plusinteger':
				regStr = this.regexps.plusinteger;
				regMessage = $.sdcui.resource.i18n['C_V_PLUSINTEGER'];
				break;
			/*车牌号*/	
			case 'cheph':
				regStr = this.regexps.cheph;
				regMessage = $.sdcui.resource.i18n['C_V_CHEPH'];
				break;	
		    /*客户*/
			case 'keh':
				regStr = this.regexps.keh;
				regMessage = $.sdcui.resource.i18n['C_V_KEH'];
				break;
			/*出库C/E模式客户*/
			case 'cekeh':
				regStr = this.regexps.cekeh;
				regMessage = $.sdcui.resource.i18n['C_V_KEH'];
				break;
			/*消耗点客户*/
			case 'xkeh':
				regStr = this.regexps.xkeh;
				regMessage = $.sdcui.resource.i18n['C_V_KEH'];
				break;
			/*********单据类型，题头码+总长度**********/
			/*备货单号*/
			case 'beihdh':
				regMessage = $.sdcui.resource.i18n['C_V_BEIHDH'];				
				//regStr = this.regexps.prefix_letter_numeric('B','12','9');
				if(tobj && (fvalue=updateValue(value,sUC,9))){
					regStr = null;
					setUpdateValue(tobj,fvalue)
				}else{
					regStr = this.regexps.letter_numeric(9);
				}
				break;
			/*包装单元卡号*/
			case 'baozdykh':
				regMessage = $.sdcui.resource.i18n['C_V_BAOZDYKH'];
				//regStr = this.regexps.prefix_letter_numeric('Y','15','12');
				if(tobj && (fvalue=updateValue(value,sUC,12))){
					regStr = null;
					setUpdateValue(tobj,fvalue)
				}else{
					regStr = this.regexps.letter_numeric(12);
				}
				break;
			/*UL号*/
			case 'ulh':
			regMessage = $.sdcui.resource.i18n['C_V_ULH'];
			if(tobj && (fvalue=updateValue(value,sUC,9))){
				regStr = null;
				setUpdateValue(tobj,fvalue)
			}else{
				regStr = this.regexps.letter_numeric(9);
			}
			break;
				/*EL号*/
			case 'elh':
				regMessage = $.sdcui.resource.i18n['C_V_ELH'];
				if(tobj && (fvalue=updateValue(value,'0',9))){
					regStr = null;
					setUpdateValue(tobj,fvalue)
				}else{
					regStr = this.regexps.letter_numeric(9);
				}
				break;
				/*纠纷单号*/
			case 'jiufdh':
				regMessage = $.sdcui.resource.i18n['C_V_JIUFDH'];
				if(tobj && (fvalue=updateValue(value,sUC,7))){
					regStr = null;
					setUpdateValue(tobj,fvalue)
				}else{
					regStr = this.regexps.letter_numeric(7);
				}
				break;	
				/*容器调拨单号*/
			case 'rongqdbd':
				regMessage = $.sdcui.resource.i18n['C_V_DIAOBDH'];
				if(tobj && (fvalue=updateValue(value,sUC,9))){
					regStr = null;
					tobj.setValue(fvalue);
				}else{
					regStr = this.regexps.letter_numeric(9);
				}
				break;	
			/*指导包装单元卡装箱单号*/
			case 'zhidbzdykzxdh':
				regMessage = $.sdcui.resource.i18n['C_V_ZHIDBZDYKZXDH'];
				//regStr = this.regexps.prefix_letter_numeric('Z','12','9');
				if(tobj && (fvalue=updateValue(value,sUC,9))){
					regStr = null;
					setUpdateValue(tobj,fvalue)
				}else{
					regStr = this.regexps.letter_numeric(9);
				}
				break;
			/*UC号*/
			case 'uch':
				regMessage = $.sdcui.resource.i18n['C_V_UCH'];
				//regStr = this.regexps.prefix_letter_numeric('Y','12','9','15','12');
				/*if(tobj && (fvalue=updateValue(value,sUC,12))){
					regStr = null;
					setUpdateValue(tobj,fvalue)
				}else{
					regStr = this.regexps.letter_numeric(9,12);
				}*/
				regStr = this.regexps.letter_numeric(10,12);
				break;
			/*UA号*　Y开头/
			case 'uah':
				regMessage = $.sdcui.resource.i18n['C_V_UAH'];
				//regStr = this.regexps.prefix_letter_numeric('Y','12','9','15','12');
				/*if(tobj && (fvalue=updateValue(value,sUC,12))){
					regStr = null;
					setUpdateValue(tobj,fvalue)
				}else{
					regStr = this.regexps.letter_numeric(9,12);
				}*/
				regStr = this.regexps.letter_numeric(10,13);
				break;
				/*UA号1  A开头*/
			case 'uah1':
				regMessage = $.sdcui.resource.i18n['C_V_UAH'];
				//regStr = this.regexps.prefix_letter_numeric('Y','12','9','15','12');
				/*if(tobj && (fvalue=updateValue(value,sUC,12))){
					regStr = null;
					setUpdateValue(tobj,fvalue)
				}else{
					regStr = this.regexps.letter_numeric(9,12);
				}*/
				regStr = this.regexps.letter_numeric(9,10);
				break;
			/*库位地址*/
			case 'kuwdz':
				regMessage = $.sdcui.resource.i18n['C_V_KUWDZ'];
				regStr = this.regexps.letter_numeric(6,12);
				break;
			/*出库单号*/
			case 'chukdh':
				regMessage = $.sdcui.resource.i18n['C_V_CHUKDH'];
				//regStr = this.regexps.letter_numeric('9');
				if(tobj && (fvalue=updateValue(value,sUC,9))){
					regStr = null;
					setUpdateValue(tobj,fvalue)
				}else{
					regStr = this.regexps.letter_numeric(9);
				}
				break;
			/*质检技术报告单号*/
			case 'zhijjsbgdh':
				regMessage = $.sdcui.resource.i18n['C_V_ZHIJJSBGDH'];
				//regStr = this.regexps.prefix_letter_numeric('J','8','7');
				if(tobj && (fvalue=updateValue(value,sUC,7))){
					regStr = null;
					setUpdateValue(tobj,fvalue)
				}else{
					regStr = this.regexps.letter_numeric(7);
				}
				break;
			/*质检清单号*/
			case 'zhijqdh':
				regMessage = $.sdcui.resource.i18n['C_V_ZHIJQDH'];
				//regStr = this.regexps.prefix_letter_numeric('Q','8','7');
				if(tobj && (fvalue=updateValue(value,sUC,7))){
					regStr = null;
					setUpdateValue(tobj,fvalue)
				}else{
					regStr = this.regexps.letter_numeric(7);
				}
				break;
			/*返修单号*/
			case 'fanxdh':
				regMessage = $.sdcui.resource.i18n['C_V_FANXDH'];
				//regStr = this.regexps.prefix_letter_numeric('F','7','6');
				if(tobj && (fvalue=updateValue(value,sUC,6))){
					regStr = null;
					setUpdateValue(tobj,fvalue)
				}else{
					regStr = this.regexps.letter_numeric(6);
				}
				break;
			/*********/
			/*到货单号*/
			case 'daohdh':
				regMessage = $.sdcui.resource.i18n['C_V_DAOHDH'];
				//this.regexps.prefix_letter_numeric('T','10','9');
				if(tobj && (fvalue=updateValue(value,sUC,9))){
					regStr = null;
					setUpdateValue(tobj,fvalue)
				}else{
					regStr = this.regexps.letter_numeric(9);
				}
				break;
			/*拒收跟踪单号*/
			case 'jusgzdh':
				regMessage = $.sdcui.resource.i18n['C_V_JUSGZDH'];
				//regStr = this.regexps.prefix_letter_numeric('R','8','7');
				if(tobj && (fvalue=updateValue(value,sUC,7))){
					regStr = null;
					setUpdateValue(tobj,fvalue)
				}else{
					regStr = this.regexps.letter_numeric(7);
				}
				break;
			/*拒收单号*/
			case 'jusdh':
				regMessage = $.sdcui.resource.i18n['C_V_JUSDH'];
				//regStr = this.regexps.prefix_letter_numeric('X','8','7');
				if(tobj && (fvalue=updateValue(value,sUC,7))){
					regStr = null;
					setUpdateValue(tobj,fvalue)
				}else{
					regStr = this.regexps.letter_numeric(7);
				}
				break;
			/*US号*/
			case 'ush':
				regMessage = $.sdcui.resource.i18n['C_V_USH'];
				//regStr = this.regexps.prefix_letter_numeric('S','10','9');
				if(tobj && (fvalue=updateValue(value,sUC,10))){
					regStr = null;
					setUpdateValue(tobj,fvalue)
				}else{
					regStr = this.regexps.letter_numeric(10);
				}
				break;
			/*US号零时*/
			case 'ushls':
				regMessage = $.sdcui.resource.i18n['C_V_USH'];
				if(tobj && (fvalue=updateValue(value,sUC,10))){
					regStr = null;
					setUpdateValue(tobj,fvalue)
				}else{
					regStr = this.regexps.letter_numeric(10);
				}
				break;
			/*质检跟踪单号*/
			case 'zhijgzdh':
				regMessage = $.sdcui.resource.i18n['C_V_ZHIJGZDH'];
				//regStr = this.regexps.prefix_letter_numeric('G','8','7');
				if(tobj && (fvalue=updateValue(value,sUC,7))){
					regStr = null;
					setUpdateValue(tobj,fvalue)
				}else{
					regStr = this.regexps.letter_numeric(7);
				}
				break;
			/*改包装跟踪单号*/
			case 'gaibzgzdh':
				regMessage = $.sdcui.resource.i18n['C_V_GAIBZGZDH'];
				//regStr = this.regexps.prefix_letter_numeric('E','8','7');
				if(tobj && (fvalue=updateValue(value,sUC,7))){
					regStr = null;
					setUpdateValue(tobj,fvalue)
				}else{
					regStr = this.regexps.letter_numeric(7);
				}
				break;
			/*备货员编号*/
			case 'beihybh':
				regMessage = $.sdcui.resource.i18n['C_V_BEIHYBH'];
				//regStr = this.regexps.prefix_letter_numeric('G');
				break;
			/*用户编号*/
			case 'yonghbh':
				regMessage = $.sdcui.resource.i18n['C_V_YONGHBH'];
				//regStr = this.regexps.prefix_letter_numeric('G');
				break;
			/*调拨单号*/
			case 'diaobdh':
				regMessage = $.sdcui.resource.i18n['C_V_DIAOBDH'];
				//regStr = this.regexps.prefix_letter_numeric('D','10','9');
				if(tobj && (fvalue=updateValue(value,sUC,9))){
					regStr = null;
					setUpdateValue(tobj,fvalue)
				}else{
					regStr = this.regexps.letter_numeric(9);
				}
				break;
			/*容器维修单号*/
			case 'weixdh':
				regMessage = $.sdcui.resource.i18n['C_V_WEIXDH'];
				//regStr = this.regexps.prefix_letter_numeric('D','10','9');
				if(tobj && (fvalue=updateValue(value,sUC,4))){
					regStr = null;
					tobj.setValue(fvalue);
				}else{
					regStr = this.regexps.letter_numeric(4);
				}
				break;
			/*容器报废单号*/
			case 'baofdh':
				regMessage = $.sdcui.resource.i18n['C_V_BAOFDH'];
				//regStr = this.regexps.prefix_letter_numeric('D','10','9');
				if(tobj && (fvalue=updateValue(value,sUC,4))){
					regStr = null;
					tobj.setValue(fvalue);
				}else{
					regStr = this.regexps.letter_numeric(4);
				}
				break;
			/*容器接受单号*/
			case 'jiesdh':
				regMessage = $.sdcui.resource.i18n['C_V_BAOFDH'];
				//regStr = this.regexps.prefix_letter_numeric('D','10','9');
				if(tobj && (fvalue=updateValue(value,sUC,9))){
					regStr = null;
					tobj.setValue(fvalue);
				}else{
					regStr = this.regexps.letter_numeric(9);
				}
				break;
			/*容器返还单号*/
			case 'fanhdh':
				regMessage = $.sdcui.resource.i18n['C_V_FANHDH'];
				//regStr = this.regexps.prefix_letter_numeric('D','10','9');
				if(tobj && (fvalue=updateValue(value,sUC,9))){
					regStr = null;
					tobj.setValue(fvalue);
				}else{
					regStr = this.regexps.letter_numeric(9);
				}
				break;
			/*容器申报单号*/
			case 'shenbdh':
				regMessage = $.sdcui.resource.i18n['C_V_SHENBDH'];
				//regStr = this.regexps.prefix_letter_numeric('D','10','9');
				if(tobj && (fvalue=updateValue(value,sUC,9))){
					regStr = null;
					tobj.setValue(fvalue);
				}else{
					regStr = this.regexps.letter_numeric(9);
				}
				break;
			/*要货令号*/
			case 'yaohlh':
				regMessage = $.sdcui.resource.i18n['C_V_YAOHLH'];
				//regStr = this.regexps.prefix_letter_numeric('Y','12','9','15','12');
				/*if(tobj && (fvalue=updateValue(value,sUC,12))){
					regStr = null;
					setUpdateValue(tobj,fvalue)
				}else{
					regStr = this.regexps.letter_numeric(9,12);
				}*/
				regStr = this.regexps.letter_numeric(10,12);
				break;
				/*非同步要货令号*/
			case 'yaohlhnt':
				regMessage = $.sdcui.resource.i18n['C_V_YAOHLH'];
				//regStr = this.regexps.prefix_letter_numeric('Y','12','9');
				if(tobj && (fvalue=updateValue(value,sUC,10))){
					regStr = null;
					setUpdateValue(tobj,fvalue)
				}else{
					regStr = this.regexps.letter_numeric(10);
				}
				break;
			   /*uch  347*/
			case 'uch1':
				regMessage = $.sdcui.resource.i18n['C_V_UCH'];
				//regStr = this.regexps.prefix_letter_numeric('Y','12','9');
				if(tobj && (fvalue=updateValue(value,sUC,10))){
					regStr = null;
					setUpdateValue(tobj,fvalue)
				}else{
					regStr = this.regexps.letter_numeric(10);
				}
				break;	
				/*包装单元卡*/
			case 'baozdyk':
				regMessage = $.sdcui.resource.i18n['C_V_BAOZDYK'];
				//regStr = this.regexps.prefix_letter_numeric('Y','15','12');
				if(tobj && (fvalue=updateValue(value,sUC,12))){
					regStr = null;
					setUpdateValue(tobj,fvalue)
				}else{
					regStr = this.regexps.letter_numeric(12);
				}
				break;
			/*UC/US号*/
			case 'ucush':
				regMessage = $.sdcui.resource.i18n['C_V_UCUSH'];
				regStr = this.regexps.ucush;
				break;
			/*UT号*/	
			case 'uth':
				regMessage = $.sdcui.resource.i18n['C_V_UTH'];
				//regStr = this.regexps.prefix_letter_numeric('T','10','9');
				if(tobj && (fvalue=updateValue(value,sUC,9))){
					regStr = null;
					setUpdateValue(tobj,fvalue)
				}else{
					regStr = this.regexps.letter_numeric(9);
				}
				break;
			/*质检清单号/质检跟踪单号*/	
			case 'zhijqdgzd':
				regMessage = $.sdcui.resource.i18n['C_V_ZHIJQDGZD'];
				if(tobj && (fvalue=updateValue(value,sUC,7))){
					regStr = null;
					setUpdateValue(tobj,fvalue)
				}else{
					regStr = this.regexps.letter_numeric(7);
				}
				break;
			/*异常消耗单号*/	
			case 'yicxhdh':
				regMessage = $.sdcui.resource.i18n['C_V_YICXHDH'];
				if(tobj && (fvalue=updateValue(value,sUC,9))){
					regStr = null;
					setUpdateValue(tobj,fvalue)
				}else{
					regStr = this.regexps.letter_numeric(9);
				}
				break;
		    /*入库凭据号:异常消耗单号,质检报告单号,返修单,退货单*/	
			case 'rukpjh':
				regMessage = $.sdcui.resource.i18n['C_V_RUKPJH'];
				regStr = this.regexps.rukpjh;
				break;
			case 'gongys':
				regMessage = $.sdcui.resource.i18n['C_V_LETTER_NUMERIC'](10);
				regStr = this.regexps.maxlength(10);
				break;	
			case 'laiy':
				regStr = this.regexps.laiy;
				regMessage = $.sdcui.resource.i18n['C_V_LAIY'];
				break;
			case 'shuzzm':
				regStr = this.regexps.shuzzm;
				regMessage = $.sdcui.resource.i18n['C_V_SHUZZM'];
				break;
			case 'lsmdd':
				regStr = this.regexps.lsmdd;
				regMessage = $.sdcui.resource.i18n['C_V_LSMDD'];
				break;	
			case 'blh':
				regMessage = $.sdcui.resource.i18n['C_V_BLH'];
				regStr = this.regexps.maxlength(10);
				break;	
			//单据号单据类型
			
			/*验收单号*/
			case 'yansdh':
				regMessage = $.sdcui.resource.i18n['C_V_YANSDH'];
				if(tobj && (fvalue=updateValue(value,sUC,9))){
					regStr = null;
					setUpdateValue(tobj,fvalue)
				}else{
					regStr = this.regexps.letter_numeric(9);
				}
				break;
			/*返修入库单号*/
			case 'fanxrkdh':
				regMessage = $.sdcui.resource.i18n['C_V_FANXRKDH'];
				//regStr = this.regexps.prefix_letter_numeric('X','8','7');
				if(tobj && (fvalue=updateValue(value,sUC,6))){
					regStr = null;
					setUpdateValue(tobj,fvalue)
				}else{
					regStr = this.regexps.letter_numeric(6);
				}
				break;
			/*盘点单号*/
			case 'panddh':
				regMessage = $.sdcui.resource.i18n['C_V_PANDDDH'];
				//regStr = this.regexps.prefix_letter_numeric('X','8','7');
				if(tobj && (fvalue=updateValue(value,sUC,7))){
					regStr = null;
					setUpdateValue(tobj,fvalue)
				}else{
					regStr = this.regexps.letter_numeric(7);
				}
				break;
				/*退货单号*/
			case 'tuihdh':
				regMessage = $.sdcui.resource.i18n['C_V_TUIHDH'];
				//regStr = this.regexps.prefix_letter_numeric('X','8','7');
				if(tobj && (fvalue=updateValue(value,sUC,8))){
					regStr = null;
					setUpdateValue(tobj,fvalue)
				}else{
					regStr = this.regexps.letter_numeric(8);
				}
				break;
				/*销毁单号*/
			case 'xiaohdh':
				regMessage = $.sdcui.resource.i18n['C_V_XIAOHDH'];
				//regStr = this.regexps.prefix_letter_numeric('X','8','7');
				if(tobj && (fvalue=updateValue(value,sUC,6))){
					regStr = null;
					setUpdateValue(tobj,fvalue)
				}else{
					regStr = this.regexps.letter_numeric(6);
				}
				break;
				/*UCH2单号*/
			case 'uch2':
				regMessage = $.sdcui.resource.i18n['C_V_UCH'];
				//regStr = this.regexps.prefix_letter_numeric('X','8','7');
				if(tobj && (fvalue=updateValue(value,sUC,10))){
					regStr = null;
					setUpdateValue(tobj,fvalue)
				}else{
					regStr = this.regexps.letter_numeric(10);
				}
				break;	
				/*到货移库清单*/
			case 'daohykqd':
				regMessage = $.sdcui.resource.i18n['C_V_DAOHYKQDH'];
				//regStr = this.regexps.prefix_letter_numeric('T','10','9');
				if(tobj && (fvalue=updateValue(value,sUC,9))){
					regStr = null;
					setUpdateValue(tobj,fvalue)
				}else{
					regStr = this.regexps.letter_numeric(9);
				}
				break;
				/*移库单号*/
			case 'yikdh':
				regMessage = $.sdcui.resource.i18n['C_V_YIKDH'];
				//regStr = this.regexps.prefix_letter_numeric('T','10','9');
				if(tobj && (fvalue=updateValue(value,sUC,10))){
					regStr = null;
					setUpdateValue(tobj,fvalue)
				}else{
					regStr = this.regexps.letter_numeric(10);
				}
				break;

				/*移库备货单号*/
			case 'yikbhdh':
				regMessage = $.sdcui.resource.i18n['C_V_YIKBHDH'];
				//regStr = this.regexps.prefix_letter_numeric('T','10','9');
				if(tobj && (fvalue=updateValue(value,sUC,9))){
					regStr = null;
					setUpdateValue(tobj,fvalue)
				}else{
					regStr = this.regexps.letter_numeric(9);
				}
				break;
				/*仓库间移库清单号*/
			case 'cangkykqdh':
				regMessage = $.sdcui.resource.i18n['C_V_CKYKQDH'];
				//regStr = this.regexps.prefix_letter_numeric('T','10','9');
				if(tobj && (fvalue=updateValue(value,sUC,9))){
					regStr = null;
					setUpdateValue(tobj,fvalue)
				}else{
					regStr = this.regexps.letter_numeric(9);
				}
				break;
				/*单取库移库清单号*/
			case 'danqkykqdh':
				regMessage = $.sdcui.resource.i18n['C_V_DANQKQDH'];
				//regStr = this.regexps.prefix_letter_numeric('T','10','9');
				if(tobj && (fvalue=updateValue(value,sUC,10))){
					regStr = null;
					setUpdateValue(tobj,fvalue)
				}else{
					regStr = this.regexps.letter_numeric(10);
				}
				break;
			//V4_022
			case 'juanlh':
			   regMessage = $.sdcui.resource.i18n['C_V_JUANLH'];
			   regStr = this.regexps.juanlh;
			   break;	
			default:
				break;

		}
	}
	
	if(!regStr||!value)return true;
	//判断是否允许为负数
	if(options.dataType == "dbnumber" && options.isPlus == true){
		if (parseFloat(value) == 0){
			showMsg(regMessage);
			return false;
		}
	}
	//判断是否允许为O
	if(options.dataType == "mnumber" && options.isZero == false){
		if(parseFloat(value) == 0){
			showMsg(regMessage);
			return flase;
		}
	}
	var reg = new RegExp(regStr,'g');
	if(!reg.test(value)){
		showMsg(regMessage);
		return false;
	}else{
		return true;
	}
}

/***提示错误信息***/
function msgClear(){
	$('#prompt span').css('color','blue').text("");
}

function showMsg(msg){
	$('#prompt span').css('color','red').text(msg);
}

function showPromptMsg(color,msg){
	$('#prompt span').css('color',color).text(msg);
}

/***数据请求失败后错误消息显示***/
function showPromptRequestMsg(requestResults){
	var result;
	if (requestResults.result){
		result = requestResults.result;
	} else {
		result = requestResults;
	}
	if(result.response != "0000" && result.response != "C_1403" && result.response != "0001"){
		if($.sdcui.resource.i18n[result.response]){
			if (result.respdesc){
				showPromptMsg('red',$.sdcui.resource.i18n[result.response](result.respdesc));
			}else{
				showPromptMsg('red',$.sdcui.resource.i18n[result.response]);
			}
		}else{
			showPromptMsg('red',result.response);
		}
		return false;
	}else if (result.response == "C_1403"){
		if(result.respdesc){
			if ($.sdcui.resource.i18n[result.respdesc]){
				showPromptMsg('blue',$.sdcui.resource.i18n[result.respdesc]);
			}else{
				showPromptMsg('blue',result.respdesc);
			}
		}else{
			showPromptMsg('blue',$.sdcui.resource.i18n[result.response]);
		}
		return true;
	}else if(result.response == "0001"){
		if(result.respdesc){
			if ($.sdcui.resource.i18n[result.respdesc]){
				showPromptMsg('blue',$.sdcui.resource.i18n[result.respdesc]);
			}else{
				showPromptMsg('blue',result.respdesc);
			}
		}else{
			showPromptMsg('blue',$.sdcui.resource.i18n['C_Next']);
		}
		return true;
	}else{
		if(result.respdesc){
			if ($.sdcui.resource.i18n[result.respdesc]){
				showPromptMsg('blue',$.sdcui.resource.i18n[result.respdesc]);
			}else{
				showPromptMsg('blue',result.respdesc);
			}
		}else{
			showPromptMsg('blue',$.sdcui.resource.i18n['C_OperSuccess']);
		}
		return true;
	}
}

function rpArrProperty(params,property,value){
	params = params||[];
	for (var i=0;i < params.length; i++){
		if (params[i].indexOf(property)!= -1)
			{
				params[i]= property + '=' + value;
				break;
			}
	}
	return params;
}

function validRangeData(type, fromData, toData){
	var fromvalue,tvalue;
	if (fromData == ''|| toData == ''){
		return true;
	}
	
	if (type == 'integer'){
		fromvlaue = parseInt(fromData);
		tovlaue = parseInt(toData);
	} else if (type = 'date'){
		fromvlaue = parseInt(fromData.replace(/-/g,''));
		tovlaue = parseInt(toData.replace(/-/g,''));
	} else if (type = 'datetime'){
		fromvlaue = parseInt(fromData.replace(/-/g,'').replace(/:/g,'').replace(' ',''));
	    tovlaue = parseInt(toData.replace(/-/g,'').replace(/:/g,'').replace(' ',''));
	}

    if (fromvlaue > tovlaue){
    	showPromptMsg('red',$.sdcui.resource.i18n['C_fanwbf']);
    	return false;
    } else {
    	return true;
    }
}

function setUpdateValue(tobj, value){
	if (tobj.element){
		tobj.setValue(value);
	} else {
		tobj.val(value);
	}
}

//自动补齐单号
function updateValue(value,uc,len){
	if(value && uc && value.length<len){
		var sFix = '00000000000000000000';
		sFix = sFix.substr(0,len-value.length-1);
		return (uc+sFix+value);
	}else{
		return null;
	}
}	

/***所有正则表达式***/
//^ $ . * + ? = ! : | \ / () [] {} 
var regexps= {
	//整数\u4e00-\u9fa5
	integer:'^(0|-?[1-9]\\d*)$',
	//数字
	number:function(fractionLength){
		var regStr = '^-?([1-9]\\d*\\.\\d*|0\\.\\d*[1-9]\\d*|0?\\.0+|0)$';
		//fractionLength为最大小数位数
		if(fractionLength){
			regStr = '^-?(0|[1-9]*)+(\\.[0-9]{1,'+fractionLength+'})?$';
		}
		return regStr;
	},
	//匹配由数字、26个英文字母或者下划线组成的字符串
	text:'^\\w+$',
	laiy:'^([A-Z a-z0-9\u4E00-\u9FA5]*)$',
	shuzzm:'^[A-Z a-z0-9]+$',
	//email
	email:'\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*',
	//国内电话号码
	phone:'\\d{3}-\\d{8}|\\d{4}-\\d{7}',
	//完整的网址
	url	:'[a-zA-z]+:\/\/[^\\s]*',
	//日期格式   yyyyMMdd或yyyy-MM-dd
	//date:'^[0-9]{4}-?(((0[13578]|(10|12))-?(0[1-9]|[1-2][0-9]|3[0-1]))|(02-?(0[1-9]|[1-2][0-9]))|((0[469]|11)-?(0[1-9]|[1-2][0-9]|30)))$',
	date:'^(?:(?!0000)[0-9]{4}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-8])|(?:0[13-9]|1[0-2])-(?:29|30)|(?:0[13578]|1[02])-31)|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00)-02-29)$',
	//日期格式   yyyy-MM-dd HH:mm:ss
	datetime:'^(?:(?!0000)[0-9]{4}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-8])|(?:0[13-9]|1[0-2])-(?:29|30)|(?:0[13578]|1[02])-31)|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00)-02-29) ([0-1][0-9]|[2][0-3]):[0-5][0-9]:[0-5][0-9]$',
	//Y/N
	yesno:'^[YN]$',
	//Y
	yes:'^[Y]$',
	//N
	no:'^[N]$',
	//非负整数
	positive:'^(0|[1-9]\\d*)$',
	//正整数
	plusinteger:'^[1-9]\\d*$',
	//数字（9.3）最大6位整数，3位小数
	dbnumber:'^\\d{1,6}(\\.\\d{0,3})?$',
	//负数(9.3)最大6为整数,3位小数
	mnumber:'^-?\\d{1,6}(\\.\\d{0,3})?$',
	//数字（0.1~0.123）1~3位小数
	xis:'^0.\\d{0,3}$',
	//车牌号
	cheph:'^((WJ|[\u0391-\uFFE5]{1})[A-Z0-9]{6})$',
	//UC/US号
	ucush:'^([A-Za-z0-9]{9}|[A-Za-z0-9]{10}|[A-Za-z0-9]{12})$',
	//客户
	keh:'^([A-Za-z0-9]{3}|[A-Za-z0-9]{4}|[A-Za-z0-9]{5})$',
	//临时要货令目的地
	lsmdd:'^([A-Za-z0-9]{3}|[A-Za-z0-9]{9})$',
	//出库C/E模式客户
	cekeh:'^([A-Za-z0-9]{5}|[A-Za-z0-9]{9})$',
	//消耗点，客户
	xkeh:'^([A-Za-z0-9]{3}|[A-Za-z0-9]{5}|[A-Za-z0-9]{9}|[A-Za-z0-9]{13})$',
	//质检清单号/质检跟踪单号
	zhijqdgzd:'^([A-Za-z0-9]{7}|[A-Za-z0-9]{7})$',//'^(Q[A-Za-z0-9]{7}|G[A-Za-z0-9]{7})$',
	//入库凭据号:异常消耗单号9,质检报告单号J8,返修单F7,退货单8
	rukpjh:'^([A-Za-z0-9]{9}|[A-Za-z0-9]{7}|[A-Za-z0-9]{6}|[A-Za-z0-9]{8})$',//'^([A-Za-z0-9]{9}|J[A-Za-z0-9]{7}|F[A-Za-z0-9]{6}|[A-Za-z0-9]{8})$',
	//卷料号不能包含影响报文转义的特殊字符V4_022
	juanlh:'^[A-Za-z0-9]+[^\\"]*$',
	//固定长度数字
	fixnumber:function(limitedLength){
		regStr = '\\d{'+limitedLength +'}$';
		return regStr;
	},
	//currentwarehouse指定仓库
	warehouse:function(currentwarehouse){
		regStr = '^'+currentwarehouse+'(|[A-Za-z0-9]{3}|[A-Za-z0-9]{9})$';
		return regStr;
	},
	//指定长度的英数字
	letter_numeric:function(limitedLength,limitedLength2){
		if (limitedLength > 0 && limitedLength2 >0){
			regStr = '^([A-Za-z0-9 ]{'+limitedLength+'}|[A-Za-z0-9 ]{'+limitedLength2+'})$';//limitedLength指定长度
		}else if (limitedLength > 0){
			regStr = '^[A-Za-z0-9 ]{'+limitedLength+'}$';//limitedLength指定长度
		}
		return regStr;
	},
	//指定题头码和长度的英数字,可匹配0~2个长度参数
	prefix_letter_numeric:function(prefix,limitedLength,noTitleLength,limitedLength2,noTitleLength2){
		if(limitedLength > 0 && limitedLength2 > 0){
			//2个长度参数
			limitedLength = limitedLength -1;
			limitedLength2 = limitedLength2 -1
			regStr = '^('+ prefix +'([A-Za-z0-9]{'+limitedLength+'}|[A-Za-z0-9]{'+limitedLength2+'})|[A-Za-z0-9]{'+noTitleLength+'}|[A-Za-z0-9]{'+noTitleLength2+'})$';
		}else if(limitedLength > 0){
			//1个长度参数
			limitedLength = limitedLength -1;
			regStr = '^('+ prefix +'[A-Za-z0-9]{'+limitedLength+'}|[A-Za-z0-9]{'+noTitleLength+'})$';
		}else {
			//0个长度参数，只匹配题头码
			regStr = '^'+ prefix +'[A-Za-z0-9]+';
		}
		return regStr;
	},
	//*匹配类型
	mask:function(maskLength){
		regStr = '^([*]|[A-Za-z0-9]{'+maskLength+'})$';
		return regStr;
	},
	//*匹配数字类型
	masknumber:function(maskLength){
		regStr = '^([*]|[0-9]{'+maskLength+'})$';
		return regStr;
	},
	maxlength:function(length){
		regStr = '^([A-Za-z0-9]{1,'+length+'})$';
		return regStr;
	}	
}

