<?php
namespace Anto\Controllers;
use Anto\Models\BoutiqueModel;


class PanierController extends Controller 
{
    private $panier;


    public function __construct()
    {
        $this->panier = new BoutiqueModel();
    }
    
private function GetPanier()
{
        return $this->panier->GetPanier()->fetchall();
}


public function ajouterProduit($param1_url) {
        return $this->panier->ajouterProduit($param1_url);
  }

  
public function indexPanier()
    {
        $panier = $this->GetPanier();
       
        $this->render('panier', compact('panier'));
    }


}
