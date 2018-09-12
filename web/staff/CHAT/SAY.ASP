<%
oabusyname=Session("ManageName")
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<script language="javascript">
<!--
function quit()
{parent.location.href="exit.asp";
}
function checksays()
{if (document.say.says.value=="") {alert("请输入内容，不准发表空白言论！");return false;}
document.say.says.focus()
document.say.addsign.options[0].selected=true;;

}
function clsay()
{document.say.says.value="";
}
function bs(colo){document.say.says.style.color=colo;}
function bs2(colo){document.say.from.style.color=colo;}
function dj(){document.say.towho.value="大家";
document.say.towho.value;
}
function rc(list){if(list!="0"){document.say.says.value=list;document.say.addsign.focus();}}
//-->
</script>
<style type="text/css">
<!--
body {
	font-size: 14px;
}
.input {font-size: 12px; color: #660099; background-color: #FFFFFF; border: 1px solid #000000; }
-->
</style>
</head>
<body bgcolor="#B2CCE5" topmargin="0">
<form method="post" action="list.asp" name="say" target="list" onsubmit='return(checksays());'>
  <p> 选择您名字的颜色：    
    <select name='addwordcolor' class="input" onChange="bs2(document.say.addwordcolor.value)">
      <option style="background-color:008888;color:008888" value="008888" selected>默认</option>
      <option style="background-color:000000;color:000000" value="000000">黑色</option>
      <option style="background-color:0088FF;color:0088FF" value="0088FF">海蓝</option>
      <option style="background-color:0000FF;color:0000FF" value="0000FF">亮蓝</option>
      <option style="background-color:000088;color:000088" value="000088">深蓝</option>
      <option style="background-color:888800;color:888800" value="888800">黄绿</option>
      <option style="background-color:008888;color:008888" value="008888">蓝绿</option>
      <option style="background-color:008800;color:008800" value="008800">橄榄</option>
      <option style="background-color:8888FF;color:8888FF" value="8888FF">淡紫</option>
      <option style="background-color:AA00CC;color:AA00CC" value="AA00CC">紫色</option>
      <option style="background-color:8800FF;color:8800FF" value="8800FF">蓝紫</option>
      <option style="background-color:888888;color:888888" value="888888">灰色</option>
      <option style="background-color:CCAA00;color:CCAA00" value="CCAA00">土黄</option>
      <option style="background-color:FF8800;color:FF8800" value="FF8800">金黄</option>
      <option style="background-color:CC3366;color:CC3366" value="CC3366">暗红</option>
      <option style="background-color:FF00FF;color:FF00FF" value="FF00FF">紫红</option>
      <option style="background-color:3366CC;color:3366CC" value="3366CC">蓝黑</option>
    </select>
    <input name="from" value="<%=oabusyname%>" readonly class=input size=9 maxlength=10 style="text-align: center">   
    发言内容：    
    <input name="says" type="text" class="input" onFocus="parent.say.clsay()" size="50">
    <input type="submit" value="会议发言" name="speak" >   
    <br>
    选择您发言的颜色：    
    <select name='sayscolor' class="input" onChange="bs(document.say.sayscolor.value)">
      <option style="background-color:660099;color:660099" value="660099" selected>默认</option>
      <option style="background-color:000000;color:000000" value="000000">黑色</option>
      <option style="background-color:0088FF;color:0088FF" value="0088FF">海蓝</option>
      <option style="background-color:0000FF;color:0000FF" value="0000FF">亮蓝</option>
      <option style="background-color:000088;color:000088" value="000088">深蓝</option>
      <option style="background-color:888800;color:888800" value="888800">黄绿</option>
      <option style="background-color:008888;color:008888" value="008888">蓝绿</option>
      <option style="background-color:008800;color:008800" value="008800">橄榄</option>
      <option style="background-color:8888FF;color:8888FF" value="8888FF">淡紫</option>
      <option style="background-color:AA00CC;color:AA00CC" value="AA00CC">紫色</option>
      <option style="background-color:8800FF;color:8800FF" value="8800FF">蓝紫</option>
      <option style="background-color:888888;color:888888" value="888888">灰色</option>
      <option style="background-color:CCAA00;color:CCAA00" value="CCAA00">土黄</option>
      <option style="background-color:FF8800;color:FF8800" value="FF8800">金黄</option>
      <option style="background-color:CC3366;color:CC3366" value="660099">暗红</option>
      <option style="background-color:FF00FF;color:FF00FF" value="FF00FF">紫红</option>
      <option style="background-color:3366CC;color:3366CC" value="3366CC">蓝黑</option>
    </select>
    <input type=text name='towho' value="大家" readonly class=input size=9 maxlength=10 style="text-align: center" onClick=dj()>   
    <select class=select name='addsign' onChange="rc(this.value);">   
      <option value="0" selected>动作</option>
      <option value="//蹑手蹑脚地溜到%%背后，掏出一把大锤子，嘿嘿......">偷偷</option>
      <option value="//对着%%狠狠的一锤当头敲下，微笑道：“%%，你给我发呆去吧！”">锤子</option>
      <option value="//从天上召来一道闪电把%%化为一堆灰烬。">灰烬</option>
      <option value="//结结巴巴地跟%%道歉：“实在是对不住，我下次再也不敢了。”">道歉</option>
      <option value="//和%%正邪恶地笑着，八成同时想到什么坏事头上。">坏事</option>
      <option value="//对%%小声嘀咕着：“君子报仇，十年不晚，五年后再来找你。”">报仇</option>
      <option value="//看着%%偷偷直乐，幸灾乐祸地想：活该。">活该</option>
      <option value="//笑呵呵地对%%抱拳打揖：“久仰阁下大名，如雷灌耳，今日相见，三生有幸！”">久仰</option>
      <option value="//热情地地向%%叫了声“嗨，你好”">招呼 
      <option value="//依依不舍地对%%说道：“各位，我有事要先走了，咱们后会有期！”">离开 
      <option value="//对着%%拍手叫好。">叫好 
      <option value="//迎风傲立船首，望滚滚江水东逝，仰天长啸：“古往今来多英杰，中游击橹几轮回？”">长啸 
      <option value="//不由得十分佩服地叹道：“普天之下，茫茫苍穹，还有谁能与%%争锋啊？”">佩服 
      <option value="//觉得天下英雄舍我其谁？">英雄 
      <option value="//非常同意%%的讲法！">同意 
      <option value="//的眼光从在场每个人身上扫过，然后停在%%脸上，问道：是不是阁下在造谣？如果是请不要再瞎折腾了。">造谣 
      <option value="//对%%附耳道：好汉不吃眼前亏，还是赶紧溜吧。">逃跑 
      <option value="//对着%%大喝一声：小王八蛋，哪里逃！">别跑 
      <option value="//急得象热锅上的蚂蚁，不停地大叫：快点！快点！怎麽比猪还慢？！">太慢 
      <option value="//吓得躲在角落直发抖！">害怕 
      <option value="//躲在一旁偷偷地笑%%。">偷笑 
      <option value="//看着%%，很无奈地耸耸肩。">无奈 
      <option value="//对着%%深深一躬，说道：小人有眼不识泰山，大人您宰相肚里能撑船，可别跟小人一般见识啊！">包函 
      <option value="//挤出人群，大声道：“我，我支持%%！！！”">支持 
      <option value="//对着%%大喝一声：好你个小王八蛋，想搞破坏！">害虫 
      <option value="//很疑惑地看着%%。">疑惑 
      <option value="//一声大喊：“此山是我开，此树是我栽，若要从此过，留下买路财！” ">山贼 
      <option value="//抱住%%的两腿，一把鼻涕一把泪地说：“这位大侠，您行行好，帮帮俺吧！”">乞讨 
      <option value="//哈哈大笑，对%%一拱手道：阁下过奖了，大家彼此彼此。">彼此 
      <option value="//高举右拳，咬牙切齿地高呼：“打倒%%！”">打倒 
      <option value="//举起好大好大的铁锤往%%头上用力一敲！***『锵！』*** %%表情呆滞！从他的眼神你彷佛看到。。。****5000000000Pt****">锤子 
      <option value="//很生气地看着%%。">生气 
      <option value="//很不好意思地向%%行礼致歉。">道歉 
      <option value="//对%%大叫：救命哪！救救我啊！">救命 
      <option value="//和%%正邪恶地笑着，八成同时想到什么坏事头上。">坏事 
      <option value="//对%%小声嘀咕着：“君子报仇，十年不晚，五年后再来找你。”">报仇 
      <option value="//看都不看%%一眼，哼了一声，高高的把头扬了起来………不理你………">不理 
      <option value="//拱手作揖。很有礼貌地对%%说：在下%1，请多指教！">拱手 
      <option value="//痴痴地望着%%的身影，不禁呆了……">痴痴 
      <option value="//对%%一拱手道：原来小兄弟竟是志在天下。在下五体投地。">感叹 
      <option value="//将指节咔地一捏，伸手在%%的歪脑门上敲了一个双响脆毛栗子。">毛栗 
      <option value="//不怀好意地绕着%%打转，嘴巴里不知在嘀咕些什么。">打转 
      <option value="//大声地对%%喊道：“不许在这里做儿童不宜的动作！”">不许 
      <option value="//对%%赞道：阁下运筹于什么什么之中，决算于什么什么之外，那个那个。。。世人难及，世人难及呀！">佩服 
      <option value="//单腿下跪，脉脉含情的看着%%，虔诚说出了世界上最感人的三个字。。。">深情 
      <option value="//狠狠掴了%%几个大耳光，打得他眼冒金星。">耳光 
      <option value="//想到就能娶%%做老婆了，兴奋的几天睡不着觉。">想娶 
      <option value="//开始梦想什么时候能够嫁给%%。。。兴奋得满脸通红。">想嫁 
      <option value="//对着%%大声惊呼：“天呐，瞧瞧你都干了些什么？！”">惊叫 
      <option value="//对%%哼道：咱们骑驴看帐本，走着瞧。">威胁 
      <option value="//恶狠狠地威胁道：%%，你个小王八蛋！给我闭嘴！">闭嘴 
      <option value="//对%%：我原以为只有螃蟹才这么走路，没想到小兄弟也喜欢横行，失敬失敬！">横行 
      <option value="//「唰」的一声抽出一柄宝剑握在手中，顿时全身凉飕飕地只感寒气逼人。">拨剑 
    </select>
    <select class=select name='addsays' onChange="document.say.says.focus();">   
      <option value="" selected>表情</option>
      <option value="微微笑">微笑</option>
      <option value="温柔地">温柔</option>
      <option value="红着脸">脸红</option>
      <option value="摇头晃脑得意地">得意</option>
      <option value="哈！哈！哈！笑着">大笑</option>
      <option value="神秘兮兮地">神秘</option>
      <option value="战战兢兢地">战兢</option>
      <option value="毛手毛脚地">毛手</option>
      <option value="嘟着嘴地">嘟嘴</option>
      <option value="慢条斯理地">慢条</option>
      <option value="同情地">同情</option>
      <option value="幸灾乐祸地">乐祸</option>
      <option value="快要哭地">快哭</option>
      <option value="哭着">哭</option>
      <option value="拳打脚踢地">拳打</option>
      <option value="不怀好意地">坏意</option>
      <option value="遗憾地">遗憾</option>
      <option value="幸福地">幸福</option>
      <option value="翻箱倒柜地">翻箱</option>
      <option value="悲痛地">悲痛</option>
      <option value="正义凛然地">正义</option>
      <option value="严肃地">严肃</option>
      <option value="生气地">生气</option>
      <option value="大声地">大声</option>
      <option value="傻乎乎地">傻</option>
      <option value="很满足地">满足</option>
      <option value="手足无措地">无措</option>
      <option value="很无辜地">无辜</option>
      <option value="喃喃自语地">自语</option>
      <option value="恶狠狠地瞪着眼">瞪眼</option>
      <option value="快要吐地">想吐</option>
      <option value="无精打采地">无采</option>
      <option value="依依不舍地">不舍</option>
      <option value="口吐白沫">白沫</option>
      <option value="有气无力地">无力</option>
      <option value="无可奈何地">无奈</option>
      <option value="可怜兮兮地">可怜</option>
    </select>
    <input type=checkbox name='towhoway' value='1' accesskey='s' onclick="document.say.says.focus();" class=checkbox>   
      
    <input accesskey="a" type="checkbox" name="as" checked onClick="parent.talk.scrollit();parent.talk.scrollit();document.say.says.focus();">   
    <a  onClick=moveself(); title=" “激活/禁止”对话区自动滚屏（Alt+A）！">滚屏</a>    
    <input type="button" value="离开会议" name="go" onClick="quit();">   
  </p>
</form>
<font color="#FFFFFF">
<br>
</font>
</body>
</html>
