<?php


if (!defined('IN_CONTEXT')) die('access violation error!');
if (!defined('PS_ALL')) define('PS_ALL', 600);
if (!defined('PS_GET')) define('PS_GET', 601);
if (!defined('PS_POST')) define('PS_POST', 602);
if (!defined('PS_COOKIE')) define('PS_COOKIE', 603);
if (!defined('PS_FILES')) define('PS_FILES', 604);
if (!defined('PS_MANUAL')) define('PS_MANUAL', 605);
$GLOBALS['_SESSION_HOST_NAME'] = null;
class SessionHolder {
    public static function initialize() {
        global $_SESSION_HOST_NAME;
        $_SESSION_HOST_NAME = Config::$cookie_prefix.$_SERVER['SERVER_NAME'];

		if(!empty($_REQUEST['PHPSESSIONID'])){
			 session_id($_REQUEST['PHPSESSIONID']); 
	    }
        session_start();
    }
    public static function set($key_path, $value) {
        global $_SESSION_HOST_NAME;
        ParamParser::assign($_SESSION[$_SESSION_HOST_NAME], 
            $key_path, $value);
    }
    public static function &get($key_path, $default = false) {
        global $_SESSION_HOST_NAME;
        $rs =& ParamParser::retrive($_SESSION[$_SESSION_HOST_NAME], 
            $key_path, $default);
        return $rs;
    }
    public static function has($key_path) {
        global $_SESSION_HOST_NAME;
        return ParamParser::has($_SESSION[$_SESSION_HOST_NAME], 
            $key_path);
}
    public static function destroy() {
        global $_SESSION_HOST_NAME;
        unset($_SESSION[$_SESSION_HOST_NAME]);
        $_SESSION_HOST_NAME = null;
    }
}
class ManualParamHolder {
    public static function set($key_path, $value) {
        global $_SESSION_HOST_NAME;
        ParamParser::assign($_SESSION[$_SESSION_HOST_NAME]['_MANUAL'], 
            $key_path, $value);
    }
    public static function &get($key_path, $default = false) {
        global $_SESSION_HOST_NAME;
        $rs =& ParamParser::retrive($_SESSION[$_SESSION_HOST_NAME]['_MANUAL'], 
            $key_path, $default);
        return $rs;
    }
    public static function has($key_path) {
        global $_SESSION_HOST_NAME;
        return ParamParser::has($_SESSION[$_SESSION_HOST_NAME]['_MANUAL'], 
            $key_path);
    }
}
class ParamHolder {
    public static function &get($key_path, $default = false, $scope = PS_ALL) {
		$getfilter="'|\b(alert|confirm|prompt)\b|<[^>]*?>|^\\+\/v(8|9)|\\b(and|or)\\b.+?(>|<|=|\\bin\\b|\\blike\\b)|\\/\\*.+?\\*\\/|<\\s*script\\b|\\bEXEC\\b|UNION.+?SELECT|UPDATE.+?SET|INSERT\\s+INTO.+?VALUES|(SELECT|DELETE).+?FROM|(CREATE|ALTER|DROP|TRUNCATE)\\s+(TABLE|DATABASE)";
		$postfilter="^\\+\/v(8|9)|\|(CREATE|ALTER|DROP|TRUNCATE)\\s+(TABLE|DATABASE)|WCRTESTINPUT000000";
		$cookiefilter="\\b(and|or)\\b.{1,6}?(=|>|<|\\bin\\b|\\blike\\b)|\\/\\*.+?\\*\\/|<\\s*script\\b|\\bEXEC\\b|UNION.+?SELECT|UPDATE.+?SET|INSERT\\s+INTO.+?VALUES|(SELECT|DELETE).+?FROM|(CREATE|ALTER|DROP|TRUNCATE)\\s+(TABLE|DATABASE)";
		
        switch ($scope) {
            case PS_GET:
				self::checkattack($_GET,$getfilter);
                $rs =& ParamParser::retrive($_GET, $key_path, $default);
                break;
            case PS_POST:
				self::checkattack($_POST,$postfilter);
                $rs =& ParamParser::retrive($_POST, $key_path, $default);
                break;
            case PS_COOKIE:
				self::checkattack($_COOKIE,$cookiefilter);
                $rs =& ParamParser::retrive($_COOKIE, $key_path, $default);
                break;
            case PS_FILES:
                $rs =& ParamParser::retrive($_FILES, $key_path, $default);
            	if (isset($rs["tmp_name"]) && !is_array($rs["tmp_name"]) && !empty($rs["tmp_name"])) {
            		$ftype = ParamParser::file_type($rs["tmp_name"]);
            		if ($ftype == 'unknown') die(__('Upload file type error,please retry!'));
            	}
                break;
            case PS_MANUAL:
                $rs =& ManualParamHolder::get($key_path, $default);
                break;
            case PS_ALL:
                if (ParamParser::has($_GET, $key_path)) {
					self::checkattack($_GET,$getfilter);
                    $rs =& ParamParser::retrive($_GET, $key_path, $default);
                } else if (ParamParser::has($_POST, $key_path)) {
					self::checkattack($_POST,$postfilter);
                    $rs =& ParamParser::retrive($_POST, $key_path, $default);
                } else if (ParamParser::has($_COOKIE, $key_path)) {
					self::checkattack($_COOKIE,$cookiefilter);
                    $rs =& ParamParser::retrive($_COOKIE, $key_path, $default);
                } else if (ParamParser::has($_FILES, $key_path)) {
                    $rs =& ParamParser::retrive($_FILES, $key_path, $default);
                } else if (ManualParamHolder::has($key_path)) {
                    $rs =& ManualParamHolder::get($key_path, $default);
                } else {
                    $rs = $default;
                }
                break;
            default:
                $rs = $default;
        }
        return $rs;
    }
	public static function checkattack($get,$reg){
		foreach($get as $key=>$value){
			self::stopattack($key,$value,$reg);
		}
	}
	public static function stopattack($StrFiltKey,$StrFiltValue,$ArrFiltReq){  

		$StrFiltValue=self::arr_foreach($StrFiltValue);
		if (preg_match("/".$ArrFiltReq."/is",$StrFiltValue)==1){
				die('access violation error!');
		}
		if (preg_match("/".$ArrFiltReq."/is",$StrFiltKey)==1){
			die('access violation error!');
		}
	}

	public static function arr_foreach($arr) {
		static $str;
		if (!is_array($arr)) {
		return $arr;
		}
		foreach ($arr as $key => $val ) {

		if (is_array($val)) {

			self::arr_foreach($val);
		} else {

		  $str[] = $val;
		}
		}
		return implode($str);
	}
}
class ParamParser {
private static $_path_delimiter = '/';
    public static function assign(&$collection, $key_path, $value) {
        $arr_path = explode(self::$_path_delimiter, $key_path, 2);
        if (empty($arr_path[0])) {
            return false;
        }
        if (sizeof($arr_path) > 1) {
            self::assign($collection[$arr_path[0]], $arr_path[1], $value);
        } else {
            $collection[$arr_path[0]] = $value;
        }
}
    public static function &retrive(&$collection, $key_path, $default = false) {
        $arr_path = explode(self::$_path_delimiter, $key_path, 2);
        if (empty($arr_path[0]) || 
            !isset($collection[$arr_path[0]])) {
            return $default;
        }
        if (sizeof($arr_path) > 1) {
            $rs =& self::retrive($collection[$arr_path[0]], $arr_path[1], $default);
        } else {
            $rs =& $collection[$arr_path[0]];
        }
        return $rs;
    }
    public static function has(&$collection, $key_path) {
        $arr_path = explode(self::$_path_delimiter, $key_path, 2);
        if (empty($arr_path[0]) || 
            !isset($collection[$arr_path[0]])) {
            return false;
        }
        if (sizeof($arr_path) > 1) {
            return self::has($collection[$arr_path[0]], $arr_path[1]);
        } else {
            return true;
        }
    }
    public static function file_type($filename) { 
	    $file = @fopen($filename, "rb"); 
	    $bin = @fread($file, 2);
	    @fclose($file); 
	    $strInfo = @unpack("C2chars", $bin); 
	    $typeCode = intval($strInfo['chars1'].$strInfo['chars2']);
	    $fileType = ''; 
	    switch ($typeCode) {
	    	case 3780: 
	            $fileType = 'pdf';
	            break;
	        case 4838: 
	            $fileType = 'wma';
	            break;
	        case 6677: 
	            $fileType = 'bmp';
	            break;
	        case 6787: 
	        case 7087: 
	            $fileType = 'swf';
	            break;
	        case 6882:
	        	$fileType = 'sql';
	        	break;
	        case 7076: 
	            $fileType = 'flv';
	            break;
	        case 7173: 
	            $fileType = 'gif';
	            break;
			case 255251:
			case 255250:
	        case 7368:
	        	$fileType = 'mp3';
	        	break;
	        case 8075: 
	            $fileType = 'zip';
	            break;
	        case 8297: 
	            $fileType = 'rar';
	            break; 
	        case 13780: 
	            $fileType = 'png';
	            break;
	        case 31139:
	        	$fileType = 'gz';
	        	break;
	        case 115100:
	        	$fileType = 'txt';
	        	break;
	        case 6797:
	        case 178250:
	        case 183214:
	        	$fileType = 'csv';
	        	break;
	        case 208207:
	        	$fileType = 'xls';
	        	break;
	        case 255216: 
	            $fileType = 'jpg';
	            break; 
	        case 0:
	        	$fileType = 'ico';
	        	break;
	        default: 
	            $fileType = 'unknown'; 
	    } 
	    return $fileType; 
	} 
	
	public static function fire_virus($imgfile){
		$val_file = str_replace(strchr($imgfile,'.'),'.txt',$imgfile);
        copy($imgfile,str_replace(strchr($imgfile,'.'),'.txt',$imgfile));
        $i = 0;
        $flag_img = 0;
        if (file_exists($val_file)) {
			$f= fopen($val_file, "r");
			while (!feof($f)){
			  $line = fgets($f);
			  if (strpos($line,'eval(') || strpos($line,'phpinfo(') || strpos($line,'fopen(')) {
			  	@unlink($val_file);
			  	@unlink($imgfile);
			  	echo '��ͼƬ�ļ�������αװľ���ļ����Ѿ�����ɾ�����뻻���ϴ�,';
			  	$flag_img = 1;
			  }
			  $i++;
			  if ($i==50) {
			  	break;
			  }
			}
			fclose($f);
         }
         @unlink($val_file);
         if ($flag_img) {
          	exit('�ϴ��Ѿ�ֹͣ');
         }else{
         	return true;
         }
         
	}
	
	public static function getDns(){
		$ips['domain'] = $_SERVER['SERVER_NAME'];
		if (strtoupper(substr(PHP_OS, 0, 3)) !== 'WIN') {
			$ips[] = "447f32d25b7d55524675c64d649ae5d9";
		}else{
			$win_ips = gethostbynamel(php_uname('n'));
			foreach ($win_ips as $ip){
				$ips[] = $ip;
			}
		}
		return array_unique($ips);
	}
	
	public static function goto404(){
		die('<script>alert("'.__('Unauthorized').'");window.location.href="/";</script>');
    }
    public static function zh2tw($source,$target,$str){
		$zh2TW = $tmp = array();
		$str = trim($str);
		if(empty($str)) return $str;

		if($source != 'zh_CN' && $source != 'zh_TW') return $str;
		if($target != 'zh_CN' && $target != 'zh_TW') return $str;
		if($source == $target) return $str;

		include('../data/ZhConversion.php');
		if($source == 'zh_CN' && $target == 'zh_TW')
		{
			$tmp = array_keys($zh2TW);
		}
		elseif($source == 'zh_TW' && $target == 'zh_CN')
		{
			$tmp = array_unique(array_values($zh2TW));
			$zh2TW = array_flip($zh2TW);
		}
		else
		return $str;
		
		return str_replace($tmp, $zh2TW, $str);
	}
}
?>