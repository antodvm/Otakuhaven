<?php
namespace Anto\controllers;

abstract class Controller
{

	//Chemin vers les vues
	private $chemin="../views/";
	private $template="../views/template/default.php";


	protected function render($view, $variables=[]){

		extract($variables);

		ob_start();
		require($this->chemin.$view.'.php');

		$contenu = ob_get_clean();

		require($this->chemin."/template/default.php");


	}

	
}

?>