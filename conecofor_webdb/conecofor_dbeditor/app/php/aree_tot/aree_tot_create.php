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


        $json_arr = json_decode(file_get_contents('php://input'),true);

        //$handler->debug($json_arr, 'CDBE');

        $result = array();

        if (! empty($json_arr)) {
            foreach ($json_arr as $elem) {
                extract($elem);

                $resultdb   = array();

                $query = "INSERT INTO conecofor_aree (ANNO_RIL,	IDAREA,	TIPOAREA,	PAESE,	PROVINCI,	COMUNE,	IDSQUADRA,	IDONEITA,	DATARIL,	COORDN,	COORDE,	ALTITUD,	ESPOSIZ,	DISPH2O,	T_HUMUS,	ETAMEDIA,	CATFOR,	SCATFOR,	COORDN_C,	COORDE_C,	FIXGPS_C,	PIC,	TRAS_PIC,	T_PIC_AZ,	T_PIC_DS,	DATAUP)"
                ." VALUES ('$ANNO_RIL','$IDAREA','$TIPOAREA','$PAESE','$PROVINCI','$COMUNE','$IDSQUADRA','$IDONEITA','$DATARIL',$COORDN,$COORDE,'$ALTITUD','$ESPOSIZ','$DISPH2O','$T_HUMUS','$ETAMEDIA','$CATFOR','$SCATFOR',$COORDN_C,$COORDE_C,$FIXGPS_C,'$PIC','$TRAS_PIC',$T_PIC_AZ,$T_PIC_DS,'$DATAUP');";
                //$handler->debug($query, 'CDBE');

                $resultdb = $db->query($query);
                //$handler->debug($resultdb, 'CDBE');
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
