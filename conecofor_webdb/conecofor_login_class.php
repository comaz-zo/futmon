<?php
ini_set('display_errors', 1);
require_once('./PhpConsole.phar'); // autoload will be initialized automatically
$connector = PhpConsole\Connector::getInstance();
$handler = PhpConsole\Handler::getInstance();
$handler->start();
$handler->debug('start', 'conecofor.loginclass.php');

error_reporting (E_ALL); 


require("./db_config13fgt5467.php");

class conecofor_login_class {


    function conecofor_login_class(){
	     $_SESSION['conecofor_login_err_message']="";
    	 if (!isset($_SESSION['conecofor_login_status'])){
    	 	$_SESSION['conecofor_login_status'] = '2LOGIN';		
    	 }
    	 if (isset($_POST['conecofor_logout_execute'])) {
			//$this->conecofor_logout_execute($_POST); 
			$this->conecofor_logout_execute();
		 }
		 if (isset($_POST['conecofor_login_execute'])) {
			//$this->conecofor_logout_execute($_POST); 
			$this->conecofor_login_execute();
		}     
    }
    
    function print_logged_form(){
    	
    	switch ($_SESSION['conecofor_login_status']){
		    case '2LOGIN':
		        $PDO_connection_string = "mysql:host=".DB_SERVER.";dbname=".DB_NAME;
				$handler->debug($PDO_connection_string, 'conecofor.loginclass.php');
                $dbh = new PDO($PDO_connection_string,DB_USER,DB_PASSWORD);
                $dbh->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
                $sql_query = sprintf("SELECT anno_rilievi FROM conecofor_general");
                $query_result = $dbh->query($sql_query);
                $fetch_rows = $query_result->fetchAll();
                echo '<h3 align="left">Anno rilievi: '. $fetch_rows[0][0].'</h3>';
                break;
    		case 'LOGGED':
    			$html_string = '';
	    		$html_string = $html_string . '<form name="conecofor_logout_form" enctype="multipart/form-data" action="';
				$html_string = $html_string . $_SERVER['PHP_SELF'];
				$html_string = $html_string . '" method="post">';
				$html_string = $html_string . '<b> Benvenuto '.$_SESSION["conecofor_login_idutente"].'    </b>';
		        $html_string = $html_string . '<input type="submit" name="conecofor_logout_execute" value="Logout"/>';
				$html_string = $html_string . '</form>';
				echo $html_string;
				break;	
    	}
    }

    
    
    function print_2login_form(){
    	
    	switch ($_SESSION['conecofor_login_status']){
		    case '2LOGIN':
		        $html_string = "";	
    	
				$html_string = $html_string . '<form name="conecofor_2login_form" enctype="multipart/form-data" action="';
				$html_string = $html_string . $_SERVER['PHP_SELF'];
				$html_string = $html_string . '" method="post">';
				$html_string = $html_string . '<table>';
				$html_string = $html_string . '<tr>';
				$html_string = $html_string . '<td>';
		        $html_string = $html_string . 'Inserisci il nome utente';
		        $html_string = $html_string . '</td>';
		        $html_string = $html_string . '<td>';
		        $html_string = $html_string . '<input tabindex="1" type="text" name="idutente" size="32" value="';
		        $html_string = $html_string . (isset($_POST['idutente']) ? $_POST['idutente'] : '');
		        $html_string = $html_string . '">';
		        $html_string = $html_string . '</td>';
		        $html_string = $html_string . '<td rowspan="2">';
		        $html_string = $html_string . '<input tabindex="3" type="submit" name="conecofor_login_execute" value="Login"/>';
		        $html_string = $html_string . '</td>';
		        $html_string = $html_string . '</tr>';
		        $html_string = $html_string . '<tr>';
		        $html_string = $html_string . '<td>';
		        $html_string = $html_string . 'Inserisci la password';
		        $html_string = $html_string . '</td>';
		        $html_string = $html_string . '<td>';
		        $html_string = $html_string . '<input tabindex="2" type="password" name="password" size="32">';
		        $html_string = $html_string . '</td>';
		        $html_string = $html_string . '</tr>';
		        $html_string = $html_string . '</table>';
		        $html_string = $html_string . '<br><br><b>'.$_SESSION['conecofor_login_err_message'].'</b>';
				$html_string = $html_string . '</form>';
				
				echo $html_string;  
		        break;
		    case 'LOGGED':
		    	header("Location: ./conecofor_menu.php");
		     	break; 
    	}
    }
    
    function print_title(){
		echo 'Login utente';
    }

    //function conecofor_login_execute($_POST){
    function conecofor_login_execute(){
    	try{
			$PDO_connection_string = "mysql:host=".DB_SERVER.";dbname=".DB_NAME;
			$dbh = new PDO($PDO_connection_string,DB_USER,DB_PASSWORD);
			$dbh->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
			$sql_query = sprintf("SELECT idutente,pwd,liv FROM %s WHERE IDUTENTE = '%s'", DB_TABLE_CONECOFOR_UTENTI, $_POST['idutente']);
			$query_result = $dbh->query($sql_query);
			$fetch_rows = $query_result->fetchAll();
			
			if (count($fetch_rows)==1){
				$password_sha1 = sha1($_POST['password'].DB_USER_PWD_SEED);
				
				if ($password_sha1 == $fetch_rows[0][1]){
						$_SESSION['conecofor_login_status'] = 'LOGGED';
						$_SESSION['conecofor_login_idutente'] = $fetch_rows[0][0];
						$_SESSION['conecofor_login_liv'] = $fetch_rows[0][2];
				} else {
					$_SESSION['conecofor_login_err_message'] = 'Nome utente o password errati !';
					$_SESSION['conecofor_login_status'] = '2LOGIN';
					$_SESSION['conecofor_login_idutente'] = '';
					$_SESSION['conecofor_login_liv'] = '';
				}
			} else {
					$_SESSION['conecofor_login_err_message'] = 'Il nome utente inserito non esiste!';
					$_SESSION['conecofor_login_status'] = '2LOGIN';
					$_SESSION['conecofor_login_idutente'] = '';
					$_SESSION['conecofor_login_liv'] = '';
			}
			
		}
		catch (PDOException $e) {  
			echo $e->getMessage();  
		}  

    }
	
    //function conecofor_logout_execute($_POST)
    function conecofor_logout_execute(){
    	session_unset();
		$_SESSION['conecofor_login_status'] = '2LOGIN';
		$_SESSION['conecofor_login_idutente'] = '';
		$_SESSION['conecofor_login_liv'] = '';
		header("Location: ./conecofor_login.php");
    }

}
//End of Class
?>
