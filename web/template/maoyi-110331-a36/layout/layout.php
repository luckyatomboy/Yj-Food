
<?php 
if (!defined('IN_CONTEXT')) die('access violation error!');
//鍔犺浇椤甸潰澶撮儴
include_once('view/common/header.php');
?>
<div class="web_bg">
<div id="main_div1">
<div id="main_div">
<div id="top">
<div id="header">
		<div id="logo"><?php 
				if (Content::countModules('logo') > 0 || Toolkit::editMode()) {
					echo Content::loadModules('logo');
				} else { ?>
					<a href="/"><img src="<?php echo P_TPL_WEB; ?>/images/logo.jpg" border="0" /></a>
			<?php }?>
            </div>
<!-- 站点语言模块Start -->
<div class="switch_langbar">
<?php include_once(P_INC.'/language_switch.php');?>
</div>
<!-- 站点语言模块End -->            
           	</div>
            
    <div id="nav1">        
        <div id="nav">
	<?php if (Content::countModules('nav') > 0 || Toolkit::editMode()) Content::loadModules('nav'); ?>
 </div>  
 </div>
    
</div>
<div id="mainmain">
    <div id="banner">
	<?php 
		if (Content::countModules('banner') > 0 || Toolkit::editMode()) 
		{
			echo Content::loadModules('banner');
		} 
		else 
		{ ?>
		<img src="<?php echo P_TPL_WEB; ?>/images/banner.jpg" border="0" />
		<?php }?>
	</div>
  
	<div id="main_con">
    <div class="web_bg">
    <?php 
		//--------------棣栭〉鏍峰紡銆恠tart銆?------------------
		if($_flat_module_class_name == 'frontpage'){
		?>
         <div id="right">
		<?php if (Content::countModules('left') > 0 || Toolkit::editMode()) Content::loadModules('left'); ?>
		</div>
        <div id="left">
		<?php if (Content::countModules('right') > 0 || Toolkit::editMode()) Content::loadModules('right'); ?>
		</div>

 		<?php } 
		//--------------棣栭〉鏍峰紡銆恊nd銆?---------------------	
		//--------------鍐呴〉鏍峰紡銆恠tart銆?-------------------
		else 
		{?>
<div id="left">
		<?php include_once($_content_); ?>
		</div>
		
		<div id="right">
		<?php if (Content::countModules('left') > 0 || Toolkit::editMode()) Content::loadModules('left'); ?>
		</div>
        <?php 
		//--------------鍐呴〉鏍峰紡銆恊nd銆?---------------------
		}?>

        
        <div class="blankbar"></div>
 
	</div>
    </div>
  </div>
  </div>
  </div>
  </div>
 <div id="footermain">
<?php 
//鍔犺浇椤甸潰灏鹃儴
include_once('view/common/footer.php');
?>
</div>
