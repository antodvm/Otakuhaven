<?php

namespace Anto\Controllers;

use Anto\Models\BoutiqueModel;

class BoutiqueController extends Controller 
{
    private $boutique;

    public function __construct()
    {
        $this->boutique = new BoutiqueModel();
    }



    private function getProducts($idSouscat)
    {
		if($idSouscat){
			return $this->boutique->getProductsSousCat($idSouscat)->fetchAll(); 
		}
		else{
			return $this->boutique->getProducts()->fetchAll();
		}
    }



    private function getCategories()
    {
        return $this->boutique->getCategories()->fetchAll();
    }



    private function getSousCategories(int $id)
    {
        return $this->boutique->getSousCategories($id)->fetchAll();
    }



	private function GetListeCatSousCat(){

		$categories = $this->getCategories();

		foreach ($categories as $categorie):
			$categorie['souscat'] = $this->getSousCategories($categorie['id']);
			
            $tab_cat_souscat[] = $categorie;

		endforeach;


		return $tab_cat_souscat;
	}


    // private function AddProdCard(){
    //     return $this->boutique->AddProdCard()->fetchAll();
    // }

    private function GetPanier(){
        return $this->boutique->GetPanier()->fetchAll();
    }


    public function index($idSouscat=null)
    {
        $produits = $this->getProducts($idSouscat);

        $panier = $this->GetPanier();

		$tab_cat_souscat = $this-> GetListeCatSousCat();
       
        $this->render('boutique', compact('produits','tab_cat_souscat'));
    }
}

?>