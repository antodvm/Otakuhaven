<?php 

namespace Anto\Models;


class BoutiqueModel extends DbModels
{
	
	  public function getProducts() {
		return $this->db->query("SELECT * FROM produit");
	  }

	  public function getProductById($id) {
		return $this->db->query("SELECT * FROM produit WHERE id = ?", [$id]);
	  }

	  public function getCategories() {
		return $this->db->query("SELECT * FROM categorie ");
	  }

	  public function getSousCategories($id) {
		return $this->db->query("SELECT * FROM sous_categorie where categorie_id = ?", [$id]);
	  }

	  public function getProductsSousCat($id) {
		return $this->db->query("SELECT * FROM produit where sous_categorie_id = ?", [$id]);
	  }


	  

	  
}

?>



