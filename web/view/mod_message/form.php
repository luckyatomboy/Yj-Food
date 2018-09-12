<?php
if (!defined('IN_CONTEXT')) die('access violation error!');
$id_seed = Toolkit::randomStr();
$id_seed = preg_replace("/\d/",'',$id_seed);
?>
<script src="script/jquery.validate.js"></script>
<script src="script/popup/datepicker.js"></script>
<link rel="stylesheet" type="text/css" href="script/popup/theme/datepicker.css"/>
<style>
	#regform_table .fieldtype3,#regform_table .fieldtype4{width:auto;}
	#regform_table .fieldtype2{width:200px;}
	#regform_table label.error{color:red;}
	#regform_table span.required {color:red;}
</style>
<script>
	window._addDatePicker=function(dom){
		dom.jdPicker({
			start_of_week:0,
			date_format: "YYYY-mm-dd"
		});
	 }
	 $(document).ready(function(){
	 	$("#mess_email_").blur(function(){
			if (!isemail($(this).val())) {
                alert('<?php _e("Invalid email address!");?>')
				$("#sub").attr('disabled','disabled');
            }else{
				$("#sub").attr('disabled','');
			}
		})
		$("#mess_tele_").blur(function(){
			if (!tel_body($(this).val())) {
                alert('<?php _e("Invalid telephone number!");?>')
				$("#sub").attr('disabled','disabled');
            }else{
				$("#sub").attr('disabled','');
			}
		})
	 })
	 function isemail(str) { 
		var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/; 
		return reg.test(str); 
	}
	function tel_body(str) {
        var reg = /([0-9]{7,12})$/;
        return reg.test(str);

    }
</script>

<script type="text/javascript" language="javascript">
<!--
function on_msg_success(response) {
    var o_result = _eval_json(response);
    if (!o_result) {
        return on_failure(response);
    }
    
    var stat = document.getElementById("messfrm_stat");
    if (o_result.result == "ERROR") {
        document.forms["messform"].reset();
        msg_reload_captcha("<?php echo $id_seed; ?>");
        stat.innerHTML = o_result.errmsg;
        return false;
    } else if (o_result.result == "OK" || o_result.forward == "index.php?_m=mod_message&_a=form") {
	    stat.style.display = "none";
        alert("<?php _e('Thank you! Your message has been submitted successfully!'); ?>");
        // reload
        reloadPage();
    } else {
        return on_failure(response);
    }
}

function on_failure(response) {
    document.forms["messform"].reset();
    msg_reload_captcha("<?php echo $id_seed; ?>");
    document.getElementById("messfrm_stat").innerHTML = "<?php _e('Request failed!'); ?>";
    return false;
}

function msg_reload_captcha(<?php echo $id_seed; ?>) {
    var captcha = document.getElementById("msg_captcha<?php echo $id_seed; ?>");
    if (captcha) {
        captcha.src = "captcha.php?s=" + random_str(6);
    }
}
<?php 
if(SessionHolder::get('page/status', 'view') == 'edit')
{
	echo <<<JS
function message_edit()
{
	$('#tb_mb_message1').css('display','block');
}

function message_cancel()
{
	$('#tb_mb_message1').css('display','none');
}
JS;
}
?>
//-->
</script>


<div class="art_list1">
	<!-- 编辑时动态触发 【start】-->
	<!--
	<div class="art_list1" <?php if(SessionHolder::get('page/status', 'view') == 'edit') echo "style='position:relative;' onmouseover='message_edit();' onmouseout='message_cancel();'";?>>
	<div class="mod_toolbar" id="tb_mb_message1" style="display: none; height: 28px; position: absolute; right: 2px; background: none repeat scroll 0% 0% rgb(247, 182, 75); width: 70px;">
		<a onclick="popup_window('admin/index.php?_m=mod_message&_a=admin_list','<?php //echo _e('Message');?>&nbsp;&nbsp;<?php //echo _e('Edit Content');?>',false,false,true);return false;" title="<?php //echo _e('Edit Content');?>" href="#"><img border="0" alt="<?php //echo _e('Edit Content');?>" src="images/edit_content.gif">&nbsp;<?php //echo _e('Edit Content');?></a>
	</div>
	-->
	<!-- 编辑时动态触发 【end】-->
<?php
$act =& ParamHolder::get('_m');
if (($act != 'frontpage') && !empty($act)) {
?>
	<div class="art_list_title"><?php echo $page_cat; ?></div>
<?php }?>
	<span id="messfrm_stat" class="status" style="display:none;"></span>
<?php
$mess_form = new Form('index.php', 'messform', 'check_mess_info');
$mess_form->p_open('mod_message', 'messInsert', '_ajax');

?>
<!--mess_main-->
<div id="mess_main">

<?php
foreach($user_fields as $fieldinfo){ 
?>
<div class="mess_list">
	<div class="mess_title"><?php echo MsgField::getUserDefineLabel($fieldinfo); ?></div>
	<?php if($fieldinfo['label']=='message' || $fieldinfo['field_type']=='2'){ ?>
	<div class="mess_textarea"><?php echo MsgField::getUserCustomComponent($fieldinfo,array(),$userparams);?></div>
	<?php }elseif($fieldinfo['field_type']=='3' || $fieldinfo['field_type']=='4'){ ?>
	<?php echo MsgField::getUserCustomComponent($fieldinfo,array(),$userparams);?>
	<?php }else{ ?>
	<div class="mess_input"> 
	<?php echo MsgField::getUserCustomComponent($fieldinfo,array(),$userparams);?></div>
	<?php } ?>
</div>
		
<?php }?>

<div class="mess_list">
<div class="mess_submit">
<input type="hidden" name="token" id="token" value="<?php echo $token;?>">
<input name="sub" type="submit" class="subd" id="sub" value="<?php _e('Submit');?>" disabled="disabled" /></div>
</div>
<div class="message_bg"></div>
</div>
<!--mess_main end-->
<div class="list_bot"></div>
</div>
<?php
$mess_form->close();
$running_msg = __('Saving message...');
$custom_js = <<<JS
$("#messfrm_stat").css({"display":"block"});
$("#messfrm_stat").html("$running_msg");
_ajax_submit(thisForm, on_msg_success, on_failure);
return false;

JS;
$mess_form->addCustValidationJs($custom_js);
$mess_form->writeValidateJs();
?>