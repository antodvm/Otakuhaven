<?php
namespace Anto\Controllers;
use Anto\Models\BoutiqueModel;


class SingleProductController extends Controller 
{
    private $produitsId;


    public function __construct()
    {
        $this->produitsId = new BoutiqueModel();
    }
    
private function getProductById(int $id)
{
        return $this->produitsId->getProductById($id)->fetchall();

}



public function index($idProd=null)
    {
        $produitsId = $this->getProductById($idProd);
       
        $this->render('single-product', compact('produitsId'));
    }


}
