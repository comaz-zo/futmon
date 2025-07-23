<?php

error_reporting (E_ALL); // I use this only for testing


class conecofor_manage_class {
    
    function conecofor_manage_class(){
    	
    	$this->connect_db();
    	
    	
    	if(!isset($_SESSION['conecofor_manage_status'])){
	   		$_SESSION['conecofor_manage_status'] = "LIST_SELECT";
		}
    	
    	if (isset($_POST['conecofor_manage_select'])) {
    		switch ($_POST['conecofor_manage_select']){
    			case "conecofor_manage_list_user":
			   		$_SESSION['conecofor_manage_status'] = "LIST_USER";
					break;
	    		case "conecofor_manage_add_user":
			   		$_SESSION['conecofor_manage_status'] = "ADD_USER";
					break;
				case "conecofor_manage_remove_user":
			   		$_SESSION['conecofor_manage_status'] = "REMOVE_USER";
					break;
				case "conecofor_manage_change_pwd":
			   		$_SESSION['conecofor_manage_status'] = "CHANGE_PWD";
					break;
		   	}
    	}
	    if (isset($_POST['conecofor_back_select'])) {
    		switch ($_POST['conecofor_back_select']){
	    		case "conecofor_back_menu":
	    			$_SESSION['conecofor_manage_status'] = "LIST_SELECT";
			   		header("Location: ./conecofor_menu.php");
					break;
				case "conecofor_manage_list":
			   		$_SESSION['conecofor_manage_status'] = "LIST_SELECT";
					break;
		    }
    	}
    	
    	if (isset($_POST['conecofor_add_user_idutente'])) {
    		$_SESSION['conecofor_manage_status'] = "ADD_USER_RESULT";   		
		}
		if (isset($_POST['conecofor_remove_user_idutente'])) {
    		$_SESSION['conecofor_manage_status'] = "REMOVE_USER_RESULT";   		
		}
		if (isset($_POST['conecofor_change_pwd_idutente'])) {
    		$_SESSION['conecofor_manage_status'] = "CHANGE_PWD_RESULT";   		
		}
 
    }
    
    function print_title(){
    	$html_string = '';
    	$html_string = $html_string . '<table width="100%" border="0" cellpadding="0" cellspacing="0" style="vertical-align: top;">';
		$html_string = $html_string . '<tr>';
		$html_string = $html_string . '<td align="left" style="text-align=right;">';
    	switch ($_SESSION['conecofor_manage_status']){
    		case "LIST_SELECT":
		    	
		    	$html_string = $html_string . '<FORM name="conecofor_back" enctype="multipart/form-data" action="'.$_SERVER['PHP_SELF'].'" method="post" style="border: 0px; padding: 0px;">';
				$html_string = $html_string .  '<INPUT TYPE=HIDDEN NAME="conecofor_back_select" VALUE="conecofor_back_menu">';
				$html_string = $html_string .  '<INPUT type="image" src="images/previous.png" name="next" style="width: 15px; height: 15px;"/>';
				$html_string = $html_string .  '</FORM>';
				break;
			default:
				
		    	$html_string = $html_string . '<FORM name="conecofor_back" enctype="multipart/form-data" action="'.$_SERVER['PHP_SELF'].'" method="post" style="border: 0px; padding: 0px;">';
				$html_string = $html_string .  '<INPUT TYPE=HIDDEN NAME="conecofor_back_select" VALUE="conecofor_manage_list">';
				$html_string = $html_string .  '<INPUT type="image" src="images/previous.png" name="next" style="width: 15px; height: 15px;"/>';
				$html_string = $html_string .  '</FORM>';
				break;
    	}
    	$html_string = $html_string . '</td>';
		$html_string = $html_string . '<td align="left" style="text-align=left;">';
    	$html_string = $html_string . '<b>Gestione utenti</b>';
    	$html_string = $html_string . '</td>';
    	
		$html_string = $html_string . '</tr>';
		$html_string = $html_string . '</table>';
    	
    	echo $html_string;
    }
    
    function print_form(){
    	$html_string = '';
    	
    	switch ($_SESSION['conecofor_login_liv']){
	   		case 10:
		   		$html_string = '';
				break;
			case 1:
				switch ($_SESSION['conecofor_manage_status']){
		   			case "LIST_SELECT":
						$html_string = $html_string . '<table id="hor-zebra" summary="Menu">';
						$html_string = $html_string . '<tr class="odd">';
						$html_string = $html_string . '<td>';
				    	$html_string = $html_string . 'Lista utenti';
				    	$html_string = $html_string . '</td>';
				    	$html_string = $html_string . '<td>';
				    	$html_string = $html_string . '<FORM name="conecofor_manage_list_user" enctype="multipart/form-data" action="'.$_SERVER['PHP_SELF'].'" method="post">';
						$html_string = $html_string .  '<INPUT TYPE=HIDDEN NAME="conecofor_manage_select" VALUE="conecofor_manage_list_user">';
						$html_string = $html_string .  '<INPUT type="image" src="images/next.png" name="next" />';
						$html_string = $html_string .  '</FORM>';
						$html_string = $html_string . '</td>';
						$html_string = $html_string . '</tr>';
						$html_string = $html_string . '<tr>';
						$html_string = $html_string . '<td>';
				    	$html_string = $html_string . 'Aggiungi un utente';
				    	$html_string = $html_string . '</td>';
				    	$html_string = $html_string . '<td>';
				    	$html_string = $html_string . '<FORM name="conecofor_manage_add_user" enctype="multipart/form-data" action="'.$_SERVER['PHP_SELF'].'" method="post">';
						$html_string = $html_string .  '<INPUT TYPE=HIDDEN NAME="conecofor_manage_select" VALUE="conecofor_manage_add_user">';
						$html_string = $html_string .  '<INPUT type="image" src="images/next.png" name="next" />';
						$html_string = $html_string .  '</FORM>';
						$html_string = $html_string . '</td>';
						$html_string = $html_string . '</tr>';
						$html_string = $html_string . '<tr class="odd">';
						$html_string = $html_string . '<td>';
				    	$html_string = $html_string . 'Rimuovi un utente';
				    	$html_string = $html_string . '</td>';
				    	$html_string = $html_string . '<td>';
				    	$html_string = $html_string . '<FORM name="conecofor_manage_remove_user" enctype="multipart/form-data" action="'.$_SERVER['PHP_SELF'].'" method="post">';
						$html_string = $html_string .  '<INPUT TYPE=HIDDEN NAME="conecofor_manage_select" VALUE="conecofor_manage_remove_user">';
						$html_string = $html_string .  '<INPUT type="image" src="images/next.png" name="next" />';
						$html_string = $html_string .  '</FORM>';
						$html_string = $html_string . '</td>';
						$html_string = $html_string . '</tr>';
						$html_string = $html_string . '<tr >';
						$html_string = $html_string . '<td>';
						$html_string = $html_string . "Cambia la password ad un utente";
				    	$html_string = $html_string . '</td>';
				    	$html_string = $html_string . '<td>';
				    	$html_string = $html_string . '<FORM name="conecofor_manage_change_pwd" enctype="multipart/form-data" action="'.$_SERVER['PHP_SELF'].'" method="post">';
						$html_string = $html_string .  '<INPUT TYPE=HIDDEN NAME="conecofor_manage_select" VALUE="conecofor_manage_change_pwd">';
						$html_string = $html_string .  '<INPUT type="image" src="images/next.png" name="next" />';
						$html_string = $html_string .  '</FORM>';
						$html_string = $html_string . '</td>';
				    	$html_string = $html_string . '</td>';
						$html_string = $html_string . '</tr>';
						$html_string = $html_string . '</table>';
						break;
					case "LIST_USER":
				    	$html_string = $html_string . '<table id="hor-zebra" summary="Lista utenti">';
				    	$html_string = $html_string . '<thead>';
				    	$html_string = $html_string . '<tr>';
				      	$html_string = $html_string . '<th  scope="col">';
				      	$html_string = $html_string . 'ID UTENTE';
				      	$html_string = $html_string . '</th>';
				      	$html_string = $html_string . '<th  scope="col">';
				      	$html_string = $html_string . 'LIVELLO';
				      	$html_string = $html_string . '</th>';
				      	try
						{			
							$sql_query = sprintf("SELECT idutente,liv  FROM %s WHERE liv!=1 ORDER BY liv,idutente ", DB_TABLE_CONECOFOR_UTENTI);
						    $odd = 1;
				            foreach ($this->dbh->query($sql_query, PDO::FETCH_ASSOC) as $row)
						    {
				                if($odd%2){
				                    $html_string = $html_string . '<tr class="odd">';
				                }else{
				                    $html_string = $html_string . '<tr>';
				                } 
						      	$html_string = $html_string . '<td><b>';
						      	$html_string = $html_string . $row['idutente'];
						      	$html_string = $html_string . '</b></td>';
						      	$html_string = $html_string . '<td>';
						      	if($row['liv']==5){
						      		$html_string = $html_string . '<b>Monitoraggio</b>';
					      		}else{
						      		$html_string = $html_string . 'Squadra rilievi';
						      	}
						      	$html_string = $html_string . '</td>';
						      	$html_string = $html_string . '</tr>';
								$odd = $odd+1;
							}			
						}
						catch(PDOException $e)
						{
						    echo 'Error: ' . $e->getMessage() . "\n";
						}
				        $html_string = $html_string . '</tbody>';
				        $html_string = $html_string . '</table>';
						break;
						
					case "ADD_USER":
						$html_string = "";	
    	
						$html_string = $html_string . '<form name="conecofor_add_user_form" enctype="multipart/form-data" action="';
						$html_string = $html_string . $_SERVER['PHP_SELF'];
						$html_string = $html_string . '" method="post">';
						$html_string = $html_string . '<table>';
						$html_string = $html_string . '<tr>';
						$html_string = $html_string . '<td>';
				        $html_string = $html_string . 'Inserisci l\'id utente (es. LA09)';
				        $html_string = $html_string . '</td>';
				        $html_string = $html_string . '<td>';
				        $html_string = $html_string . '<input type="text" name="conecofor_add_user_idutente" size="32" value="';
				        $html_string = $html_string . (isset($_POST['idutente']) ? $_POST['idutente'] : '');
				        $html_string = $html_string . '">';
				        $html_string = $html_string . '</td>';
				        $html_string = $html_string . '</tr>';
				        $html_string = $html_string . '<tr>';
				        $html_string = $html_string . '<td>';
				        $html_string = $html_string . 'Imposta il livello di accesso dell\'utente';
				        $html_string = $html_string . '</td>';
				        $html_string = $html_string . '<td>';
				        $html_string = $html_string . '<SELECT NAME="conecofor_add_user_livello">';
				        $html_string = $html_string . '<OPTION VALUE="10">10 - Squadra rilievi';
				        $html_string = $html_string . '<OPTION VALUE="5">5 - monitoraggio';
				        $html_string = $html_string . '</SELECT>';
				        $html_string = $html_string . '</td>';
				        $html_string = $html_string . '</tr>';
				        $html_string = $html_string . '<tr>';
				        $html_string = $html_string . '<td>';
				        $html_string = $html_string . 'Inserisci la sua password iniziale';
				        $html_string = $html_string . '</td>';
				        $html_string = $html_string . '<td>';
				        $html_string = $html_string . '<input type="text" name="conecofor_add_user_password" size="32">';
				        $html_string = $html_string . '</td>';
				        $html_string = $html_string . '</tr>';
				        $html_string = $html_string . '<tr>';
				        $html_string = $html_string . '<td>';
				        $html_string = $html_string . 'Crea il nuovo utente';
				        $html_string = $html_string . '</td>';
				        $html_string = $html_string . '<td>';
				        $html_string = $html_string . '<input type="submit" name="conecofor_add_user_execute" value="Crea"/>';
				        $html_string = $html_string . '</td>';
				        $html_string = $html_string . '</tr>';
				        
				        $html_string = $html_string . '</table>';
						$html_string = $html_string . '</form>';
						break;
					case "ADD_USER_RESULT":
						try
						{
							$password_enc = sha1($_POST['conecofor_add_user_password'].DB_USER_PWD_SEED);
							
							$sql_query = sprintf("INSERT INTO %s (idutente, pwd, liv) VALUES('%s','%s',%s) ", DB_TABLE_CONECOFOR_UTENTI,$_POST['conecofor_add_user_idutente'],$password_enc,$_POST['conecofor_add_user_livello']);
							
							$stmt = $this->dbh->prepare($sql_query);
							$stmt->execute();
							
							$html_string = $html_string . "Utente ".$_POST['conecofor_add_user_idutente']. " inserito.";
							
													    
							
						}
						catch(PDOException $e)
						{
						    echo 'Error: ' . $e->getMessage() . "\n";
						    
						}
						
						break;
					case "REMOVE_USER":
						$html_string = $html_string . '<form name="conecofor_remove_user_form" enctype="multipart/form-data" action="';
						$html_string = $html_string . $_SERVER['PHP_SELF'];
						$html_string = $html_string . '" method="post">';
						$html_string = $html_string . '<table>';
				        $html_string = $html_string . '<tr>';
				        $html_string = $html_string . '<td>';
				        $html_string = $html_string . 'Scegli l\'utente da rimuove';
				        $html_string = $html_string . '</td>';
				        $html_string = $html_string . '<td>';
				        $html_string = $html_string . '<SELECT NAME="conecofor_remove_user_idutente">';
				        try
						{			
							$sql_query = sprintf("SELECT idutente,liv FROM %s  WHERE liv!=1 ORDER BY idutente", DB_TABLE_CONECOFOR_UTENTI);
				            foreach ($this->dbh->query($sql_query, PDO::FETCH_ASSOC) as $row)
						    {
				                $html_string = $html_string . '<OPTION VALUE="'.$row['idutente'].'">'.$row['idutente'];
							}			
						}
						catch(PDOException $e)
						{
						    echo 'Error: ' . $e->getMessage() . "\n";
						}				    
				        $html_string = $html_string . '</SELECT>';
				        $html_string = $html_string . '</td>';
				        $html_string = $html_string . '</tr>';				        
				        $html_string = $html_string . '<tr>';
				        $html_string = $html_string . '<td>';
				        $html_string = $html_string . 'Cancella l\'utente';
				        $html_string = $html_string . '</td>';
				        $html_string = $html_string . '<td>';
				        $html_string = $html_string . '<input type="submit" name="conecofor_remove_user_execute" value="Cancella"/>';
				        $html_string = $html_string . '</td>';
				        $html_string = $html_string . '</tr>';
				        $html_string = $html_string . '</table>';
						$html_string = $html_string . '</form>';
						$html_string = $html_string . '<br><br><b>Attenzione<b>: Cancellare l\'utente non comporterà la cancellazione delle aree da lui inserite!';
						break;
					case "REMOVE_USER_RESULT":
						try
						{
														
							$sql_query = sprintf("DELETE FROM %s WHERE idutente = '%s'", DB_TABLE_CONECOFOR_UTENTI,$_POST['conecofor_remove_user_idutente']);
							
							$stmt = $this->dbh->prepare($sql_query);
							$stmt->execute();
							
							$html_string = $html_string . "Utente ".$_POST['conecofor_remove_user_idutente']. " rimosso.";
							
													    
							
						}
						catch(PDOException $e)
						{
						    echo 'Error: ' . $e->getMessage() . "\n";
						    
						}
						
						break;
					case "CHANGE_PWD":
							
						$html_string = $html_string . '<form name="conecofor_change_pwd_form" enctype="multipart/form-data" action="';
						$html_string = $html_string . $_SERVER['PHP_SELF'];
						$html_string = $html_string . '" method="post">';
						$html_string = $html_string . '<table>';
				        $html_string = $html_string . '<tr>';
				        $html_string = $html_string . '<td>';
				        $html_string = $html_string . 'Scegli l\'utente';
				        $html_string = $html_string . '</td>';
				        $html_string = $html_string . '<td>';
				        $html_string = $html_string . '<SELECT NAME="conecofor_change_pwd_idutente">';
				        try
						{			
							$sql_query = sprintf("SELECT idutente,liv FROM %s ORDER BY idutente", DB_TABLE_CONECOFOR_UTENTI);
				            foreach ($this->dbh->query($sql_query, PDO::FETCH_ASSOC) as $row)
						    {
				                $html_string = $html_string . '<OPTION VALUE="'.$row['idutente'].'">'.$row['idutente'];
							}			
						}
						catch(PDOException $e)
						{
						    echo 'Error: ' . $e->getMessage() . "\n";
						}				    
				        $html_string = $html_string . '</SELECT>';
				        $html_string = $html_string . '</td>';
				        $html_string = $html_string . '</tr>';
				        $html_string = $html_string . '<tr>';
				        $html_string = $html_string . '<td>';
				        $html_string = $html_string . 'Inserisci la nuova password';
				        $html_string = $html_string . '</td>';
				        $html_string = $html_string . '<td>';
				        $html_string = $html_string . '<input type="text" name="conecofor_change_pwd_password_new" size="32">';
				        $html_string = $html_string . '</td>';
				        $html_string = $html_string . '</tr>';				        
				        $html_string = $html_string . '<tr>';
				        $html_string = $html_string . '<td>';
				        $html_string = $html_string . 'Cambia la password';
				        $html_string = $html_string . '</td>';
				        $html_string = $html_string . '<td>';
				        $html_string = $html_string . '<input type="submit" name="conecofor_change_pwd_execute" value="Cambia"/>';
				        $html_string = $html_string . '</td>';
				        $html_string = $html_string . '</tr>';
				        $html_string = $html_string . '</table>';
						$html_string = $html_string . '</form>';
						break;
					case "CHANGE_PWD_RESULT":
						try
						{	
							
							$password_enc = sha1($_POST['conecofor_change_pwd_password_new'].DB_USER_PWD_SEED);
							$sql_query = sprintf("UPDATE %s SET pwd = '%s' WHERE idutente = '%s'", DB_TABLE_CONECOFOR_UTENTI,$password_enc,$_POST['conecofor_change_pwd_idutente']);
							
							$stmt = $this->dbh->prepare($sql_query);
							$stmt->execute();
							
							$html_string = $html_string . "La nuova password per l'utente ".$_POST['conecofor_change_pwd_idutente']. " è: ".$_POST['conecofor_change_pwd_password_new'];	
						}
						catch(PDOException $e)
						{
						    echo 'Error: ' . $e->getMessage() . "\n";
						    
						}
						
						break;
	
				}
				break;
    	}		
    	
		
		echo $html_string;
    }
    
       
    function connect_db() {
		try{
			$PDO_connection_string = "mysql:host=".DB_SERVER.";dbname=".DB_NAME;
			$this->dbh = new PDO($PDO_connection_string,DB_USER,DB_PASSWORD);
			$this->dbh->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );  
		}
		catch (PDOException $e) {  
			echo $e->getMessage();  
		}  
	}
}
//End of Class
?>
