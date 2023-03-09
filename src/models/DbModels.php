<?php

namespace Anto\Models;

use Anto\App\Database;


class DbModels
{

    protected $db;

   
    public function __construct()
    {
        $this->db = new Database;
    }

}

?>