<?php
    //require_once('./PhpConsole.phar');
    require("./../../../db_config13fgt5467.php");

    /*$connector = PhpConsole\Connector::getInstance();
    $handler = PhpConsole\Handler::getInstance();
    $handler->start();
    $handler->debug('start', 'CDBE.db_con.php');*/

    $PDO_connection_string = "mysql:host=".DB_SERVER.";dbname=".DB_NAME;

    //$handler->debug($PDO_connection_string, 'CDBE');

    try{
     // create a PostgreSQL database connection
     $db = new PDO($PDO_connection_string,DB_USER,DB_PASSWORD);
     //$handler->debug($db, 'CDBE');
     // display a message if connected to the PostgreSQL successfully
     /*if($db){
        $db->exec('SET search_path TO sif360');
    }*/
    }catch (PDOException $e){
     // report error message
     echo $e->getMessage();
    }


?>
