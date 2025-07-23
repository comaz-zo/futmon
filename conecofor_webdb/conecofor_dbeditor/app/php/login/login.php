<?php
    //require_once('../PhpConsole.phar');  // autoload will be initialized automatically
    //$connector = PhpConsole\Connector::getInstance();
    //$handler = PhpConsole\Handler::getInstance();
    //$handler->start();
    //$handler->debug('start', 'CDBE.login.php');

    require("./../../../../db_config13fgt5467.php");

    session_start(); // #2

    try{
         // create a PostgreSQL database connection
         $PDO_connection_string = "mysql:host=".DB_SERVER.";dbname=".DB_NAME;
         $db = new PDO($PDO_connection_string,DB_USER,DB_PASSWORD);
         ////$handler->debug($db, 'CDBE');
         // display a message if connected to the PostgreSQL successfully
         /*if($db){
            $db->exec('SET search_path TO sif360');
        }*/

        $login = $_POST['login']; // #3
        $pwd = $_POST['pwd']; // #4

        $login = stripslashes($login); // #5
        //$pwd = md5(stripslashes($pwd));         // #6
        $password_sha1 = sha1($_POST['pwd'].DB_USER_PWD_SEED);
        //$sql = "SELECT * FROM utente WHERE login='$login' and pwd='$pwd'"; // #9
        $sql = "SELECT idutente,pwd,liv FROM conecofor_utenti WHERE idutente='$login' and pwd='$password_sha1'"; // #9
        //$handler->debug($sql, 'CDBE');
        $result = array(); // #10

        if ($resultdb = $db->query($sql)) { // #11

          //$result->setFetchMode(PDO::FETCH_ASSOC);


          $rowcount = $resultdb->rowCount() ; // #12


          if($rowcount==1){

            $result = $resultdb->fetch();

            if ($result['liv']==1){
                $result['success'] = true; // #15
                $result['msg'] = 'User authenticated!'; // #16
            } else {

              $result['success'] = false; // #17
              $result['msg'] = 'Incorrect user level'; // #18
            }

          } else {

            $result['success'] = false; // #17
            $result['msg'] = 'Incorrect user or password.'; // #18
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
