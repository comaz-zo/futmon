<?php
    //require_once('../PhpConsole.phar'); // autoload will be initialized automatically
    //$connector = PhpConsole\Connector::getInstance();
    //$handler = PhpConsole\Handler::getInstance();
    //$handler->start();
    //$handler->debug('start', 'CDBE.piante_read.php');

    require("./../../../../db_config13fgt5467.php");

    session_start(); // #2
    $anno_ril = 0;
    if($_POST['ANNO_RIL'])
        $anno_ril = $_POST['ANNO_RIL'];

    try{
         // create a PostgreSQL database connection
        $PDO_connection_string = "mysql:host=".DB_SERVER.";dbname=".DB_NAME;
        $db = new PDO($PDO_connection_string,DB_USER,DB_PASSWORD);


        $sql = "SELECT * FROM conecofor_piante WHERE ANNO_RIL = $anno_ril
                ORDER BY IDAREA,IDPIANTA" ; // #9
        $result = array(); // #10

        if ($resultdb = $db->query($sql)) { // #11

            while($record = $resultdb->fetch()){
                $result[]= $record;
            }

        } else {
            die("Error executing the query");
        }

        echo json_encode($result);
        //$handler->debug($result, 'CDBE');

    }catch (PDOException $e){
         // report error message
         echo $e->getMessage();
    }


?>
