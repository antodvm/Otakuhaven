<?php 

namespace Anto\Models;


class BoutiqueModel extends DbModels
{
	
	  public function getProducts() {
		return $this->db->query("SELECT * FROM produits");
	  }

	  public function getProductById($id) {
		return $this->db->query("SELECT * FROM produits WHERE id = ?", [$id]);
	  }

	  public function getCategories() {
		return $this->db->query("SELECT * FROM categories ");
	  }

	  public function getSousCategories($id) {
		return $this->db->query("SELECT * FROM sous_categorie where id_cat = ?", [$id]);
	  }

	  public function getProductsSousCat($id) {
		return $this->db->query("SELECT * FROM produits where id_souscat = ?", [$id]);
	  }

	  public function Getprix($id)
	  {
		  return $this->db->query("SELECT prix FROM produits WHERE id = ?", [$id]);
	  }


	  public function ajouterProduit($id)
	  {
		  return $this->db->query("INSERT INTO panier (id_produit,prix_unitaire) VALUES (?,?)",[$id,$this->Getprix($id)]);
	  }

	  
	public function GetPanier() {
		return $this->db->query("SELECT panier.id as panierId, panier.id_produit as panierIDprod, panier.quantite as ProdQuantite, panier.prix_unitaire as prixUnitaire, produits.nom as nomProd, produits.prix as prixProd, produits.img as imgprod
		  FROM panier
		  INNER JOIN produits ON panier.id_produit = produits.id");
	  }
	  


}
