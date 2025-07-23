<?php
    //require_once('../PhpConsole.phar'); // autoload will be initialized automatically
    //$connector = PhpConsole\Connector::getInstance();
    //$handler = PhpConsole\Handler::getInstance();
    //$handler->start();
    //$handler->debug('start', 'CDBEselectpiano.php');

    require("./../../../../db_config13fgt5467.php");

    session_start(); // #2

    try{
         // create a PostgreSQL database connection
         $PDO_connection_string = "mysql:host=".DB_SERVER.";dbname=".DB_NAME;
         $db = new PDO($PDO_connection_string,DB_USER,DB_PASSWORD);


        $sql = "SELECT ANNO_RIL FROM conecofor_aree GROUP BY ANNO_RIL"; // #9
        $result = array(); // #10

        if ($resultdb = $db->query($sql)) { // #11

            while($piano = $resultdb->fetch()){
                $result[]= $piano;
            }

        } else {
            die("Error executing the query login");
        }

        echo json_encode($result); // #21

        //$handler->debug($result, 'CDBE');


    }catch (PDOException $e){
         // report error message
         echo $e->getMessage();
    }



?>
