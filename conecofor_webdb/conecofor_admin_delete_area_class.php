<?php

/**
 * Conecofor Delete Area Class
 *
 * Delete all data of a specific area in the current survey year
 *
 * PHP version 5
 *
 * @author     Effetreseizero srl <giacomo.colle@f360.it>
 * @copyright  2015 Effetreseizero srl
 * @version    SVN: 2.0.1
 */

error_reporting (E_ALL); // I use this only for testing




class conecofor_admin_delete_area_class {
	
	var $conn_str;
	var $dbh;
	
    function conecofor_admin_delete_area_class(){
    	
    	
    	
    	$this->connect_db();
   		if(!isset($_SESSION['conecofor_select_status'])){
	   		$_SESSION['conecofor_select_status'] = "SELECT_AREA";
	   		
		}elseif(isset($_POST['conecofor_delete_area_idarea'])) {
			$_SESSION['conecofor_select_status'] = "CONFIRM_DELETE_AREA";
			$_SESSION['conecofor_delete_area_idarea'] = $_POST['conecofor_delete_area_idarea'];
			
		}elseif(isset($_POST['confirm_delete_checkout'])) {
			if($_POST['confirm_delete_checkout']=='SI'){
				$_SESSION['conecofor_select_status'] = "EXECUTE_DELETE_AREA";
			} else {
				$_SESSION['conecofor_select_status'] = "SELECT_AREA";
				$_SESSION['conecofor_select_idarea'] = "";
			}
			
		}elseif(isset($_POST['conecofor_back_delete_area_area'])) {
			$_SESSION['conecofor_select_status'] = "SELECT_AREA";
			$_SESSION['conecofor_select_idarea'] = "";
			
		}
        
        
    	
    }
    
    function print_title(){
    	$html_string = '';
    	$html_string = $html_string . '<table width="100%" border="0" cellpadding="0" cellspacing="0" style="vertical-align: middle;">';
		$html_string = $html_string . '<tr>';
		$html_string = $html_string . '<td align="left" style="text-align=left;">';
        switch ($_SESSION['conecofor_select_status']){
    		case 'SELECT_AREA';
    			$html_string = $html_string . '<a href="conecofor_menu.php"><img src="images/previous.png" border="0" style="width: 15px; height: 15px;"></a>&nbsp;';
		        break;
			default;
    			$html_string = $html_string .  '<FORM name="conecofor_back" enctype="multipart/form-data" action="'.$_SERVER['PHP_SELF'].'" method="post" style="border: 0px; padding: 0px;">';
				$html_string = $html_string .  '<INPUT TYPE=HIDDEN NAME="conecofor_back_delete_area_area" VALUE="true">';
				$html_string = $html_string .  '<INPUT type="image" src="images/previous.png" name="conecofor_next_image" style="width: 15px; height: 15px;"/>';
				$html_string = $html_string .  '</FORM>';
                break;	
    	}
    	
        $html_string = $html_string . '</td>';
		$html_string = $html_string . '<td align="left" style="text-align=left;">';
        switch ($_SESSION['conecofor_select_status']){
    		case 'SELECT_AREA';
    			$html_string = $html_string . "<b>Digitare il codice dell'area da eliminare</b>";
                break;
    	}
    	
    	$html_string = $html_string . '</td>';
    	
		$html_string = $html_string . '</tr>';
		$html_string = $html_string . '</table>';
    	
    	echo $html_string;

    }
    
    function print_select_form(){
    	switch ($_SESSION['conecofor_select_status']){
    		case 'SELECT_AREA';
    			$this->select_area();
		        break;
            case 'CONFIRM_DELETE_AREA':
		    	$this->confirm_delete_area();
		     	break;
		    case 'EXECUTE_DELETE_AREA':
		    	$this->execute_delete_area();
		     	break; 
    	}
    }
    
    function select_area(){
    	$html_string = "";	
    	
        $html_string = $html_string . '<form name="conecofor_delete_area_form" enctype="multipart/form-data" action="';
        $html_string = $html_string . $_SERVER['PHP_SELF'];
        $html_string = $html_string . '" method="post">';
        $html_string = $html_string . '<table>';
        $html_string = $html_string . '<tr>';
        $html_string = $html_string . '<td>';
        $html_string = $html_string . "Inserisci il codice dell'area da eliminare (es. C0130)";
        $html_string = $html_string . '</td>';
        $html_string = $html_string . '<td>';
        $html_string = $html_string . '<input type="text" name="conecofor_delete_area_idarea" size="32" value="';
        //$html_string = $html_string . (isset($_SESSION['conecofor_delete_area_idarea']) ? $_SESSION['conecofor_delete_area_idarea'] : '');
        $html_string = $html_string . '">';
        $html_string = $html_string . '</td>';
        $html_string = $html_string . '</tr>';
        $html_string = $html_string . '<tr>';
        $html_string = $html_string . '<td>';
        $html_string = $html_string . "Elimina tutti i dati dell'area per l'anno di rilievo in corso";
        $html_string = $html_string . '</td>';
        $html_string = $html_string . '<td>';
        $html_string = $html_string . '<input type="submit" name="conecofor_delete_area_execute" value="Elimina"/>';
        $html_string = $html_string . '</td>';
        $html_string = $html_string . '</tr>';
        
        $html_string = $html_string . '</table>';
        $html_string = $html_string . '</form>';
		echo $html_string;
    }
	
	
    
    function confirm_delete_area(){
    
        $sql_query = "SELECT ANNO_RILIEVI FROM conecofor_general";
		$anno_rilievi = "";
        foreach ($this->dbh->query($sql_query, PDO::FETCH_ASSOC) as $row){
	    		$anno_rilievi = $row['ANNO_RILIEVI'];
	    }
    
        // count dati
        $sql_query = 'SELECT IDAREA FROM conecofor_aree WHERE IDAREA=\''.$_SESSION["conecofor_delete_area_idarea"].'\' AND ANNO_RIL='.$anno_rilievi.' ';
		$count_aree = 0;
        foreach ($this->dbh->query($sql_query, PDO::FETCH_ASSOC) as $row){
	    		$count_aree = $count_aree+1;
	    }
	    $sql_query = 'SELECT IDPIANTA FROM conecofor_piante WHERE IDAREA=\''.$_SESSION["conecofor_delete_area_idarea"].'\' AND ANNO_RIL='.$anno_rilievi.' ';
		$count_piante = 0;
        foreach ($this->dbh->query($sql_query, PDO::FETCH_ASSOC) as $row){
	    		$count_piante = $count_piante+1;
	    }
	    $sql_query = 'SELECT IDSINTOMO FROM conecofor_sintomi WHERE IDAREA=\''.$_SESSION["conecofor_delete_area_idarea"].'\' AND ANNO_RIL='.$anno_rilievi.' ';
		$count_sintomi = 0;
        foreach ($this->dbh->query($sql_query, PDO::FETCH_ASSOC) as $row){
	    		$count_sintomi = $count_sintomi+1;
	    }
	    $sql_query = 'SELECT IDPIANTA FROM conecofor_cav WHERE IDAREA=\''.$_SESSION["conecofor_delete_area_idarea"].'\' AND ANNO_RIL='.$anno_rilievi.' ';
		$count_cav = 0;
        foreach ($this->dbh->query($sql_query, PDO::FETCH_ASSOC) as $row){
	    		$count_cav = $count_cav+1;
	    }
	    
	    $count_tot = $count_aree+$count_piante+$count_sintomi+$count_cav;
    
   		echo '<FORM name="conecofor_area_'.$_SESSION['conecofor_delete_area_idarea'].'_confirm_delete_form" enctype="multipart/form-data" action="'.$_SERVER['PHP_SELF'].'" method="post">';
		echo "Per l'area ".$_SESSION["conecofor_delete_area_idarea"]." nel'anno di rilievo ".$anno_rilievi." sono presenti i seguenti dati nel web-database <BR>";
		echo 'Record presenti nella tabella aree: '.$count_aree.'<BR>';
		echo 'Record presenti nella tabella piante: '.$count_piante.'<BR>';
		echo 'Record presenti nella tabella sintomi: '.$count_sintomi.'<BR>';
		echo 'Record presenti nella tabella cav: '.$count_cav.'<BR>';
		if($count_tot>0){
		    echo 'Confermi la cancellazione dei dati dell\'area '.$_SESSION["conecofor_delete_area_idarea"].' per l\'anno di rilievo '.$anno_rilievi.' ? <BR>';
            echo '<INPUT TYPE=SUBMIT NAME="confirm_delete_checkout" VALUE="SI">';
            echo '<INPUT TYPE=SUBMIT NAME="confirm_delete_checkout" VALUE="NO">';
        }
		echo '</FORM>';
    }
    
    function execute_delete_area($verbose=true){
    	
	    echo  '<FORM name="conecofor_back" enctype="multipart/form-data" action="'.$_SERVER['PHP_SELF'].'" method="post" style="border: 0px; padding: 0px;">';
		echo  '<INPUT TYPE=HIDDEN NAME="conecofor_back_delete_area_area" VALUE="true">';
		echo 'Torna al menu precedente &nbsp;';
        echo  '<INPUT type="image" src="images/next.png" name="conecofor_next_image" style="width: 15px; height: 15px;"/>';
		echo  '</FORM>';
	    
		
		$sql_query = "SELECT ANNO_RILIEVI FROM conecofor_general";
		$anno_rilievi = "";
        foreach ($this->dbh->query($sql_query, PDO::FETCH_ASSOC) as $row){
	    		$anno_rilievi = $row['ANNO_RILIEVI'];
	    }
	    
	    //controllo esistenza di dati nel database
		
	    // cancellazione dei dati area
	    $sql_query = sprintf("DELETE FROM ".DB_TABLE_CONECOFOR_AREE." WHERE ( IDAREA ='".$_SESSION["conecofor_delete_area_idarea"]."' AND ANNO_RIL =".$anno_rilievi." )");
	    $sth = $this->dbh->prepare($sql_query);
   		try{
	   		$sth->execute ();
	   		if($verbose){
	   			echo '<br> Cancellazione dei dati area completata';
	   		}
		} catch (PDOException $e){
			echo '<br> Cancellazione dei dati area non riuscita';
		    echo $e->getMessage();
		}
   		
		// cancellazione dei dati pianta
	    $sql_query = sprintf("DELETE FROM ".DB_TABLE_CONECOFOR_PIANTE." WHERE ( IDAREA ='".$_SESSION["conecofor_delete_area_idarea"]."' AND ANNO_RIL =".$anno_rilievi." )");   
		$sth = $this->dbh->prepare($sql_query);
   		try{
	   		$sth->execute ();
	   		if($verbose){
	   			echo '<br> Cancellazione dei dati piante completata';
	   		}
		} catch (PDOException $e){
			echo '<br> Cancellazione dei dati area piante riuscita';
		    echo $e->getMessage();
		}
		
		// cancellazione dei dati sintomi
	    $sql_query = sprintf("DELETE FROM ".DB_TABLE_CONECOFOR_SINTOMI." WHERE ( IDAREA ='".$_SESSION["conecofor_delete_area_idarea"]."' AND ANNO_RIL =".$anno_rilievi." )");   
		$sth = $this->dbh->prepare($sql_query);
   		try{
	   		$sth->execute ();
	   		if($verbose){
	   			echo '<br> Cancellazione dei dati sintomi completata';
	   		}
		} catch (PDOException $e){
			echo '<br> Cancellazione dei dati sintomi non riuscita';
		    echo $e->getMessage();
		}
		
		// cancellazione dei dati cav
	    $sql_query = sprintf("DELETE FROM ".DB_TABLE_CONECOFOR_CAV." WHERE ( IDAREA ='".$_SESSION["conecofor_delete_area_idarea"]."' AND ANNO_RIL =".$anno_rilievi." )" );   
		$sth = $this->dbh->prepare($sql_query);
   		try{
	   		$sth->execute ();
	   		if($verbose){
	   			echo '<br> Cancellazione dei dati cav completata';
	   		}
		} catch (PDOException $e){
			echo '<br> Cancellazione dei dati cav non riuscita';
		    echo $e->getMessage();
		}

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
	
	function itaDate($dataEur,$delimiter){
		$rsl = explode ($delimiter,$dataEur);
		$rsl = array_reverse($rsl);
		return implode($rsl,'-');
	}
	
}
//End of Class
?>
