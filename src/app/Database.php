<?php
namespace Anto\app;

use PDO;

class Database
{

    private $dsn = "mysql:dbname=otakuhaven_fr;host=localhost;charset=utf8";
    private $login = "root";
    private $password = "";

    protected $pdo;

    public function __construct()
    {

        if ($this->pdo == null) {
            $this->pdo = new PDO($this->dsn, $this->login, $this->password);
            $this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $this->pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
            $this->pdo->setAttribute(PDO::MYSQL_ATTR_INIT_COMMAND, 'SET NAMES utf8');
        }

    }

    public function query($query, $params = null)
    {

        if ($params) {

            $req = $this->pdo->prepare($query);
            $req->execute($params);
        } else {

            $req = $this->pdo->query($query);

        }

        return $req;

    }

}
?>