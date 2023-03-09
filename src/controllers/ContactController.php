<?php

namespace Anto\Controllers;

use index;


class ContactController extends Controller 
{

	private $contact;

	// public function __construct()
	// {
	// 	$this->contact = new ContactModel;
	// }

	
	private function getContact()
	{
		return $this->contact->getProducts(); 
	}



	public function index()
	{
		$this->render('bontact');
	} 

}

?>