<?php

error_reporting (E_ALL); // I use this only for testing


class conecofor_year_class {
    
    function conecofor_year_class(){
    	
    	$this->connect_db();
    	
    	
    	if(!isset($_SESSION['conecofor_year_status'])){
	   		$_SESSION['conecofor_year_status'] = "LIST_SELECT";
		}
    	
    	if (isset($_POST['conecofor_year_select'])) {
    		switch ($_POST['conecofor_year_select']){
    			case "conecofor_year_list_year":
			   		$_SESSION['conecofor_year_status'] = "LIST_YEAR";
					break;
				case "conecofor_year_select_year":
			   		$_SESSION['conecofor_year_status'] = "SELECT_YEAR";
					break;	
	    		case "conecofor_year_add_year":
			   		$_SESSION['conecofor_year_status'] = "ADD_YEAR";
					break;
				case "conecofor_year_remove_year":
			   		$_SESSION['conecofor_year_status'] = "REMOVE_YEAR";
					break;
		   	}
    	}
	    if (isset($_POST['conecofor_back_select'])) {
    		switch ($_POST['conecofor_back_select']){
	    		case "conecofor_back_menu":
	    			$_SESSION['conecofor_year_status'] = "LIST_SELECT";
			   		header("Location: ./conecofor_menu.php");
					break;
				case "conecofor_year_list":
			   		$_SESSION['conecofor_year_status'] = "LIST_SELECT";
			   		$_SESSION['conecofor_add_year_nyear'] = "";
			   		$_SESSION['conecofor_remove_year_nyear'] = "";
			   		$_SESSION['conecofor_remove_year_password'] = "";
					break;
		    }
    	}
    	if (isset($_POST['conecofor_select_year_nyear'])) {
    		$_SESSION['conecofor_year_status'] = "SELECT_YEAR_CONFIRM";
    		$_SESSION['conecofor_select_year_nyear'] = $_POST['conecofor_select_year_nyear'];  		
		}
		if (isset($_POST['conecofor_select_year_password'])) {
    		$_SESSION['conecofor_year_status'] = "SELECT_YEAR_RESULT"; 
    		$_SESSION['conecofor_select_year_password'] = $_POST['conecofor_select_year_password']; 
		}
    	
    	if (isset($_POST['conecofor_add_year_nyear'])) {
    		$_SESSION['conecofor_year_status'] = "ADD_YEAR_RESULT";
    		$_SESSION['conecofor_add_year_nyear'] = $_POST['conecofor_add_year_nyear'];		
		}
		if (isset($_POST['conecofor_remove_year_nyear'])) {
    		$_SESSION['conecofor_year_status'] = "REMOVE_YEAR_CONFIRM";
    		$_SESSION['conecofor_remove_year_nyear'] = $_POST['conecofor_remove_year_nyear'];  		
		}
		if (isset($_POST['conecofor_remove_year_password'])) {
    		$_SESSION['conecofor_year_status'] = "REMOVE_YEAR_RESULT"; 
    		$_SESSION['conecofor_remove_year_password'] = $_POST['conecofor_remove_year_password']; 
		}
 
    }
    
    function print_title(){
    	$html_string = '';
    	$html_string = $html_string . '<table width="100%" border="0" cellpadding="0" cellspacing="0" style="vertical-align: center;">';
		$html_string = $html_string . '<tr>';
		
		$html_string = $html_string . '<td align="left" style="text-align=right; vertical-align: center;">';
    	switch ($_SESSION['conecofor_year_status']){
    		case "LIST_SELECT":
		    	
		    	$html_string = $html_string . '<FORM name="conecofor_back" enctype="multipart/form-data" action="'.$_SERVER['PHP_SELF'].'" method="post" style="border: 0px; padding: 0px;">';
				$html_string = $html_string .  '<INPUT TYPE=HIDDEN NAME="conecofor_back_select" VALUE="conecofor_back_menu">';
				$html_string = $html_string .  '<INPUT type="image" src="images/previous.png" name="next" style="width: 15px; height: 15px;"/>';
				$html_string = $html_string .  '</FORM>';
				break;
			default:
				
		    	$html_string = $html_string . '<FORM name="conecofor_back" enctype="multipart/form-data" action="'.$_SERVER['PHP_SELF'].'" method="post" style="border: 0px; padding: 0px;">';
				$html_string = $html_string .  '<INPUT TYPE=HIDDEN NAME="conecofor_back_select" VALUE="conecofor_year_list">';
				$html_string = $html_string .  '<INPUT type="image" src="images/previous.png" name="next" style="width: 15px; height: 15px;"/>';
				$html_string = $html_string .  '</FORM>';
				break;
    	}
    	$html_string = $html_string . '</td>';
		
		$html_string = $html_string . '<td align="left" style="text-align=left;">';
    	$html_string = $html_string . '<b>Gestione dell\'anno di rilievo in corso</b>';
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
				switch ($_SESSION['conecofor_year_status']){
		   			case "LIST_SELECT":
                        $html_string = $html_string . '<p><b>Anno rilievi in corso: ';
                        $sql_query = sprintf("SELECT ANNO_RILIEVI FROM %s ", DB_TABLE_CONECOFOR_GENERAL);
                        foreach ($this->dbh->query($sql_query) as $row)
						{
				            $html_string = $html_string . $row[0];
                        }
                        $html_string = $html_string . '</b></p>';
						$html_string = $html_string . '<table id="hor-zebra" summary="Menu">';
						$html_string = $html_string . '<tr class="odd">';
						$html_string = $html_string . '<td>';
				    	$html_string = $html_string . 'Lista anni di rilievo';
				    	$html_string = $html_string . '</td>';
				    	$html_string = $html_string . '<td>';
				    	$html_string = $html_string . '<FORM name="conecofor_year_list_year" enctype="multipart/form-data" action="'.$_SERVER['PHP_SELF'].'" method="post">';
						$html_string = $html_string .  '<INPUT TYPE=HIDDEN NAME="conecofor_year_select" VALUE="conecofor_year_list_year">';
						$html_string = $html_string .  '<INPUT type="image" src="images/next.png" name="next" />';
						$html_string = $html_string .  '</FORM>';
						$html_string = $html_string . '</td>';
						$html_string = $html_string . '</tr>';
						$html_string = $html_string . '<tr >';
						$html_string = $html_string . '<td>';
				    	$html_string = $html_string . 'Seleziona un diverso anno di rilievo';
				    	$html_string = $html_string . '</td>';
				    	$html_string = $html_string . '<td>';
				    	$html_string = $html_string . '<FORM name="conecofor_year_select_year" enctype="multipart/form-data" action="'.$_SERVER['PHP_SELF'].'" method="post">';
						$html_string = $html_string .  '<INPUT TYPE=HIDDEN NAME="conecofor_year_select" VALUE="conecofor_year_select_year">';
						$html_string = $html_string .  '<INPUT type="image" src="images/next.png" name="next" />';
						$html_string = $html_string .  '</FORM>';
						$html_string = $html_string . '</td>';
						$html_string = $html_string . '</tr>';
						$html_string = $html_string . '<tr class="odd">';
						$html_string = $html_string . '<td>';
				    	$html_string = $html_string . 'Crea un nuovo anno di rilievo';
				    	$html_string = $html_string . '</td>';
				    	$html_string = $html_string . '<td>';
				    	$html_string = $html_string . '<FORM name="conecofor_year_add_year" enctype="multipart/form-data" action="'.$_SERVER['PHP_SELF'].'" method="post">';
						$html_string = $html_string .  '<INPUT TYPE=HIDDEN NAME="conecofor_year_select" VALUE="conecofor_year_add_year">';
						$html_string = $html_string .  '<INPUT type="image" src="images/next.png" name="next" />';
						$html_string = $html_string .  '</FORM>';
						$html_string = $html_string . '</td>';
						$html_string = $html_string . '</tr>';
						$html_string = $html_string . '<tr >';
						$html_string = $html_string . '<td>';
				    	$html_string = $html_string . 'Rimuovi un anno di rilievo';
				    	$html_string = $html_string . '</td>';
				    	$html_string = $html_string . '<td>';
				    	$html_string = $html_string . '<FORM name="conecofor_year_remove_year" enctype="multipart/form-data" action="'.$_SERVER['PHP_SELF'].'" method="post">';
						$html_string = $html_string .  '<INPUT TYPE=HIDDEN NAME="conecofor_year_select" VALUE="conecofor_year_remove_year">';
						$html_string = $html_string .  '<INPUT type="image" src="images/next.png" name="next" />';
						$html_string = $html_string .  '</FORM>';
						$html_string = $html_string . '</td>';
						$html_string = $html_string . '</tr>';
						$html_string = $html_string . '</table>';
						break;
					case "LIST_YEAR":
				    	$html_string = $html_string . '<table id="hor-zebra" summary="Lista anni di rilievo">';
				    	$html_string = $html_string . '<thead>';
				    	$html_string = $html_string . '<tr>';
				      	$html_string = $html_string . '<th  scope="col">';
				      	$html_string = $html_string . 'ANNO';
				      	$html_string = $html_string . '</th>';
				      	try
						{			
							$sql_query = sprintf("SELECT ANNO_RIL FROM %s GROUP BY ANNO_RIL", DB_TABLE_CONECOFOR_AREE);
						    $odd = 1;
				            foreach ($this->dbh->query($sql_query) as $row)
						    {
				            
                                if($odd%2){
                                    $html_string = $html_string . '<tr class="odd">';
                                }else{
                                    $html_string = $html_string . '<tr>';
                                } 

                                $html_string = $html_string . '<td><b>';
                                $html_string = $html_string . $row[0];
                                $html_string = $html_string . '</b></td>';
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
					
					case "SELECT_YEAR":
						$html_string = $html_string . '<form name="conecofor_remove_year_form" enctype="multipart/form-data" action="';
						$html_string = $html_string . $_SERVER['PHP_SELF'];
						$html_string = $html_string . '" method="post">';
						$html_string = $html_string . '<table>';
				        $html_string = $html_string . '<tr>';
				        $html_string = $html_string . '<td>';
				        $html_string = $html_string . 'Seleziona l\'anno rilievi';
				        $html_string = $html_string . '</td>';
				        $html_string = $html_string . '<td>';
				        $html_string = $html_string . '<SELECT NAME="conecofor_select_year_nyear">';
				        try
						{
							$sql_query = sprintf("SELECT ANNO_RIL FROM %s GROUP BY ANNO_RIL", DB_TABLE_CONECOFOR_AREE);
						  	foreach ($this->dbh->query($sql_query) as $row)
						    {
					                $html_string = $html_string . '<OPTION VALUE="'.$row[0].'">'.$row[0];
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
				        $html_string = $html_string . 'Seleziona l\'anno rilievi';
				        $html_string = $html_string . '</td>';
				        $html_string = $html_string . '<td>';
				        $html_string = $html_string . '<input type="submit" name="conecofor_select_year_execute" value="Seleziona"/>';
				        $html_string = $html_string . '</td>';
				        $html_string = $html_string . '</tr>';
				        $html_string = $html_string . '</table>';
						$html_string = $html_string . '</form>';
						$html_string = $html_string . '<br><br><b>Attenzione</b>: i nuovi upload anranno nelle tabelle dell\'anno specificato !';
						break;
					case "SELECT_YEAR_CONFIRM":
						$html_string = $html_string . '<form name="conecofor_select_year_form" enctype="multipart/form-data" action="';
						$html_string = $html_string . $_SERVER['PHP_SELF'];
						$html_string = $html_string . '" method="post">';
						$html_string = $html_string . '<table>';
				        $html_string = $html_string . '<tr>';
				        $html_string = $html_string . '<td>';
				        $html_string = $html_string . 'Inserisci la password amministratore per confermare!';
				        $html_string = $html_string . '</td>';
				        $html_string = $html_string . '<td>';
				        $html_string = $html_string . '<input type="password" name="conecofor_select_year_password" size="32"';
				        $html_string = $html_string . '</td>';
				        $html_string = $html_string . '</tr>';				        
				        $html_string = $html_string . '<tr>';
				        $html_string = $html_string . '<td>';
				        $html_string = $html_string . 'Conferma la selezione dell\'anno rilievi '.$_SESSION['conecofor_select_year_nyear'];
				        $html_string = $html_string . '</td>';
				        $html_string = $html_string . '<td>';
				        $html_string = $html_string . '<input type="submit" name="conecofor_select_year_confirm" value="Seleziona"/>';
				        $html_string = $html_string . '</td>';
				        $html_string = $html_string . '</tr>';
				        $html_string = $html_string . '</table>';
						$html_string = $html_string . '</form>';
						$html_string = $html_string . '<br><br><b>Attenzione</b>: i nuovi upload andranno nelle tabelle dell\'anno specificato!';
						break;	
					case "SELECT_YEAR_RESULT":
						try
						{
							$sql_query = sprintf("SELECT idutente,pwd FROM %s WHERE IDUTENTE = 'admin'", DB_TABLE_CONECOFOR_UTENTI);
							$query_result = $this->dbh->query($sql_query);
							$fetch_rows = $query_result->fetchAll();
							
							$password_sha1 = sha1($_SESSION['conecofor_select_year_password'].DB_USER_PWD_SEED);
							
							if ($password_sha1 == $fetch_rows[0][1]){						
								$sql_query = sprintf("UPDATE %s SET ANNO_RILIEVI=%s ", DB_TABLE_CONECOFOR_GENERAL,$_SESSION['conecofor_select_year_nyear']);
								
								$stmt = $this->dbh->prepare($sql_query);
								$stmt->execute();
								
								$html_string = $html_string . "Anno rilievi ".$_SESSION['conecofor_select_year_nyear']. " impostato come anno corrente.";
								
							}else{
								$html_string = $html_string . "Password amministratore errata!";
							}
													    
							
						}
						catch(PDOException $e)
						{
						    echo 'Error: ' . $e->getMessage() . "\n";
						    
						}
						
						break;
					
					case "ADD_YEAR":
						$html_string = "";	
    	
						$html_string = $html_string . '<form name="conecofor_add_year_form" enctype="multipart/form-data" action="';
						$html_string = $html_string . $_SERVER['PHP_SELF'];
						$html_string = $html_string . '" method="post">';
						$html_string = $html_string . '<table>';
						$html_string = $html_string . '<tr>';
						$html_string = $html_string . '<td>';
				        $html_string = $html_string . 'Inserisci il nuovo anno di rilievo (es. 2011)';
				        $html_string = $html_string . '</td>';
				        $html_string = $html_string . '<td>';
				        $html_string = $html_string . '<input type="text" name="conecofor_add_year_nyear" size="32" value="';
				        $html_string = $html_string . (isset($_POST['nyear']) ? $_POST['nyear'] : '');
				        $html_string = $html_string . '">';
				        $html_string = $html_string . '</td>';
				        $html_string = $html_string . '</tr>';
				        $html_string = $html_string . '<tr>';
				        $html_string = $html_string . '<td>';
				        $html_string = $html_string . 'Crea il nuovo anno di rilievo';
				        $html_string = $html_string . '</td>';
				        $html_string = $html_string . '<td>';
				        $html_string = $html_string . '<input type="submit" name="conecofor_add_year_execute" value="Crea"/>';
				        $html_string = $html_string . '</td>';
				        $html_string = $html_string . '</tr>';
				        
				        $html_string = $html_string . '</table>';
						$html_string = $html_string . '</form>';
						break;
					
					
					case "ADD_YEAR_RESULT":
						try
						{
							
							
							$nyear = $_SESSION['conecofor_add_year_nyear'];
							
							$year_existing=false;
							
							$sql_query = sprintf("SELECT ANNO_RIL FROM %s GROUP BY ANNO_RIL", DB_TABLE_CONECOFOR_AREE);
				            foreach ($this->dbh->query($sql_query) as $row)
						    {
				                if($row[0]==$nyear){
					                $year_existing=true;
				                }
							}
							
							if($year_existing){
								$html_string = $html_string . "Anno rilievi ".$nyear. " è già presente !";
							}else{
							
								/*$sql_query = sprintf("CREATE TABLE %s_conecofor_aree like template_conecofor_aree",$nyear);
								$stmt = $this->dbh->prepare($sql_query);
								$stmt->execute();
								
								$sql_query = sprintf("CREATE TABLE %s_conecofor_piante like template_conecofor_piante",$nyear);
								$stmt = $this->dbh->prepare($sql_query);
								$stmt->execute();
								
								$sql_query = sprintf("CREATE TABLE %s_conecofor_sintomi like template_conecofor_sintomi",$nyear);
								$stmt = $this->dbh->prepare($sql_query);
								$stmt->execute();
								
								$sql_query = sprintf("CREATE TABLE %s_conecofor_cav like template_conecofor_cav",$nyear);
								$stmt = $this->dbh->prepare($sql_query);
								$stmt->execute();*/
								
								$sql_query = sprintf("UPDATE %s SET ANNO_RILIEVI=%s ", DB_TABLE_CONECOFOR_GENERAL,$nyear);
								
								$stmt = $this->dbh->prepare($sql_query);
								$stmt->execute();
								
								$html_string = $html_string . "Nuovo anno rilievi ".$nyear. " inserito ed impostato come anno corrente di rilievi.";
							}
													    
							
						}
						catch(PDOException $e)
						{
						    echo 'Error: ' . $e->getMessage() . "\n";
						    
						}
						
						break;
					case "REMOVE_YEAR":
						$html_string = $html_string . '<form name="conecofor_remove_year_form" enctype="multipart/form-data" action="';
						$html_string = $html_string . $_SERVER['PHP_SELF'];
						$html_string = $html_string . '" method="post" style="border: 6px solid red; padding: 5px">';
						$html_string = $html_string . '<table>';
				        $html_string = $html_string . '<tr>';
				        $html_string = $html_string . '<td>';
				        $html_string = $html_string . 'Scegli l\'anno rilievi da rimuovere';
				        $html_string = $html_string . '</td>';
				        $html_string = $html_string . '<td>';
				        $html_string = $html_string . '<SELECT NAME="conecofor_remove_year_nyear">';
				        try
						{
							$sql_query = sprintf("SELECT ANNO_RIL FROM %s GROUP BY ANNO_RIL", DB_TABLE_CONECOFOR_AREE);
						  	foreach ($this->dbh->query($sql_query) as $row)
						    {
					               $html_string = $html_string . '<OPTION VALUE="'.$row[0].'">'.$row[0];
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
				        $html_string = $html_string . 'Rimuovi l\'anno rilievi';
				        $html_string = $html_string . '</td>';
				        $html_string = $html_string . '<td>';
				        $html_string = $html_string . '<input type="submit" name="conecofor_remove_year_execute" value="Rimuovi"/>';
				        $html_string = $html_string . '</td>';
				        $html_string = $html_string . '</tr>';
				        $html_string = $html_string . '</table>';
						
						$html_string = $html_string . '<br><br><b>Attenzione<b>: Rimuovere l\'anno rilievi comporterà la perdia di tutti i dati delle aree inserite in quell\'anno!';
						$html_string = $html_string . '</form>';
						break;
					case "REMOVE_YEAR_CONFIRM":
                        $sql_query = sprintf("SELECT ANNO_RILIEVI FROM %s ", DB_TABLE_CONECOFOR_GENERAL);
                        foreach ($this->dbh->query($sql_query) as $row)
						{
				            $actual_year = $row[0];
                        }
                        
                        if ($actual_year == $_SESSION['conecofor_remove_year_nyear']){
                            $html_string = $html_string . 'Non si può rimuovere l\'anno rilievi in corso !';
                        }else{
                            $html_string = $html_string . '<form name="conecofor_remove_year_form" enctype="multipart/form-data" action="';
                            $html_string = $html_string . $_SERVER['PHP_SELF'];
                            $html_string = $html_string . '" method="post" style="border: 6px solid red; padding: 5px">';
                            $html_string = $html_string . '<table>';
                            $html_string = $html_string . '<tr>';
                            $html_string = $html_string . '<td>';
                            $html_string = $html_string . 'Inserisci la password amministratore per confermare!';
                            $html_string = $html_string . '</td>';
                            $html_string = $html_string . '<td>';
                            $html_string = $html_string . '<input type="password" name="conecofor_remove_year_password" size="32"';
                            $html_string = $html_string . '</td>';
                            $html_string = $html_string . '</tr>';				        
                            $html_string = $html_string . '<tr>';
                            $html_string = $html_string . '<td>';
                            $html_string = $html_string . 'Conferma la rimozione dell\'anno rilievi ';
                            $html_string = $html_string . '<span style="color:red;font-weight:bold">'.$_SESSION['conecofor_remove_year_nyear'].'</span>';

                            $html_string = $html_string . '</td>';
                            $html_string = $html_string . '<td>';
                            $html_string = $html_string . '<input type="submit" name="conecofor_remove_year_confirm" value="Rimuovi"/>';
                            $html_string = $html_string . '</td>';
                            $html_string = $html_string . '</tr>';
                            $html_string = $html_string . '</table>';
                            $html_string = $html_string . '<br><br><b>Attenzione<b>: Rimuovere l\'anno rilievi comporterà la perdia di tutti i dati delle aree inserite in quell\'anno!';
                            $html_string = $html_string . '</form>';
                        }
						break;	
					case "REMOVE_YEAR_RESULT":
						try
						{
							$sql_query = sprintf("SELECT idutente,pwd FROM %s WHERE IDUTENTE = 'admin'", DB_TABLE_CONECOFOR_UTENTI);
							$query_result = $this->dbh->query($sql_query);
							$fetch_rows = $query_result->fetchAll();
							
							$password_sha1 = sha1($_SESSION['conecofor_remove_year_password'].DB_USER_PWD_SEED);
							
							if ($password_sha1 == $fetch_rows[0][1]){	
                                //remove CONECOFOR AREE ENTRY 
								$sql_query = sprintf("DELETE FROM %s WHERE ANNO_RIL = %s ",DB_TABLE_CONECOFOR_AREE,$_SESSION['conecofor_remove_year_nyear']);
								$stmt = $this->dbh->prepare($sql_query);
								$stmt->execute();
                                //remove CONECOFOR PIANTE ENTRY
                                $sql_query = sprintf("DELETE FROM %s WHERE ANNO_RIL = %s ",DB_TABLE_CONECOFOR_PIANTE,$_SESSION['conecofor_remove_year_nyear']);
								$stmt = $this->dbh->prepare($sql_query);
								$stmt->execute();
                                //remove CONECOFOR SINOTMI ENTRY
                                $sql_query = sprintf("DELETE FROM %s WHERE ANNO_RIL = %s ",DB_TABLE_CONECOFOR_SINTOMI,$_SESSION['conecofor_remove_year_nyear']);
								$stmt = $this->dbh->prepare($sql_query);
								$stmt->execute();
                                //remove CONECOFOR CAV ENTRY
                                $sql_query = sprintf("DELETE FROM %s WHERE ANNO_RIL = %s ",DB_TABLE_CONECOFOR_CAV,$_SESSION['conecofor_remove_year_nyear']);
								$stmt = $this->dbh->prepare($sql_query);
								$stmt->execute();
								
								$html_string = $html_string . "Anno rilievi ".$_SESSION['conecofor_remove_year_nyear']. " rimosso dal web database.<br>";
								$html_string = $html_string . "ATTENZIONE! E' possibile recuperare i dati dai file DBF presenti nella cartella dbf_repository.";
							}else{
								$html_string = $html_string . "Password amministratore errata!";
							}
													    
							
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
				        $html_string = $html_string . '<SELECT NAME="conecofor_change_pwd_nyear">';
				        try
						{			
							$sql_query = sprintf("SELECT nyear,liv FROM %s ORDER BY nyear", DB_TABLE_CONECOFOR_UTENTI);
				            foreach ($this->dbh->query($sql_query, PDO::FETCH_ASSOC) as $row)
						    {
				                $html_string = $html_string . '<OPTION VALUE="'.$row['nyear'].'">'.$row['nyear'];
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
							
							$password_enc = sha1($_POST['conecofor_change_pwd_password_new'].DB_YEAR_PWD_SEED);
							$sql_query = sprintf("UPDATE %s SET pwd = '%s' WHERE nyear = '%s'", DB_TABLE_CONECOFOR_UTENTI,$password_enc,$_POST['conecofor_change_pwd_nyear']);
							
							$stmt = $this->dbh->prepare($sql_query);
							$stmt->execute();
							
							$html_string = $html_string . "La nuova password per l'utente ".$_POST['conecofor_change_pwd_nyear']. " è: ".$_POST['conecofor_change_pwd_password_new'];	
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
