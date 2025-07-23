<?php
    //require_once('../PhpConsole.phar'); // autoload will be initialized automatically
    //$connector = PhpConsole\Connector::getInstance();
    //$handler = PhpConsole\Handler::getInstance();
    //$handler->start();
    //$handler->debug('start', 'CDBE.sintomi_destroy.php');

    require("./../../../../db_config13fgt5467.php");

    session_start(); // #2

    try{
         // create a PostgreSQL database connection
        $PDO_connection_string = "mysql:host=".DB_SERVER.";dbname=".DB_NAME;
        $db = new PDO($PDO_connection_string,DB_USER,DB_PASSWORD);


        $json_arr = json_decode(file_get_contents('php://input'),true);

        //$handler->debug($json_arr, 'CDBE');

        $result = array();

        if (! empty($json_arr)) {
            foreach ($json_arr as $elem) {
                extract($elem);

                $resultdb   = array();

                $query = "DELETE FROM conecofor_sintomi"
                ." WHERE (ANNO_RIL = '$ANNO_RIL' AND IDAREA='$IDAREA' AND IDPIANTA=$IDPIANTA AND IDSINTOMO=$IDSINTOMO);";
                //$handler->debug($query, 'CDBE');

                $resultdb = $db->query($query);
                array_push($result,$resultdb);
            }
        }

        echo json_encode($result);
        //$handler->debug($result, 'CDBE');

    }catch (PDOException $e){
         // report error message
         echo $e->getMessage();
    }


?>
