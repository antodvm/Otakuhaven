<?php
require '../vendor/autoload.php';

use Anto\Controllers\AccueilController;
use Anto\Controllers\ContactController;
use Anto\Controllers\BoutiqueController;





$url=($_GET['url'])??null;

$url=explode("/",filter_var($url,FILTER_SANITIZE_URL));


$ctrl_url=$url[0]??null;
$action_url=($url[1])??'index';
$param1_url=($url[2])??null;





if($ctrl_url=="contact"){

	$controller= new Anto\Controllers\ContactController();
	$controller->index();
}
elseif($ctrl_url=="boutique"){
	$controller= new Anto\Controllers\BoutiqueController();
	$controller->index($param1_url);
}
else
{
	$controller= new Anto\Controllers\AccueilController();
	$controller->index();
}
?>