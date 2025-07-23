<?php

error_reporting (E_ALL); // I use this only for testing


class conecofor_admin_missing_class {
	
	var $conn_str;
	var $dbh;
	
    function conecofor_admin_missing_class(){
    	
    	
    	
    	$this->connect_db();
   		
     
        
    	
    }
    
    function print_title(){
    	$html_string = '';
    	$html_string = $html_string . '<table width="100%" border="0" cellpadding="0" cellspacing="0" style="vertical-align: center;">';
		$html_string = $html_string . '<tr>';
		$html_string = $html_string . '<td align="left" style="text-align=right;">';
       
  		$html_string = $html_string . '<a href="conecofor_menu.php"><img src="images/previous.png" border="0" style="width: 15px; height: 15px;"></a>&nbsp;';
		        
    	
        $html_string = $html_string . '</td>';
		$html_string = $html_string . '<td align="left" style="text-align=left;">';
        
    	$html_string = $html_string . '<b>Aree mancanti</b>';
                
    	
    	$html_string = $html_string . '</td>';
    	
		$html_string = $html_string . '</tr>';
		$html_string = $html_string . '</table>';
    	
    	echo $html_string;

    }
    
    function print_select_form(){
    	$html_string = '';
    	$html_string = $html_string . '<table id="hor-zebra" summary="Lista aree">';
    	$html_string = $html_string . '<thead>';
    	$html_string = $html_string . '<tr>';
      	$html_string = $html_string . '<th  scope="col">';
      	$html_string = $html_string . 'IDAREA';
      	$html_string = $html_string . '</th>';
      	$html_string = $html_string . '<th  scope="col">';
      	$html_string = $html_string . 'TIPOAREA';
      	$html_string = $html_string . '</th>';
      	$html_string = $html_string . '<th  scope="col">';
      	$html_string = $html_string . 'PROVINCIA';
      	$html_string = $html_string . '</th>';
      	$html_string = $html_string . '<th  scope="col">';
      	$html_string = $html_string . 'COMUNE';
      	$html_string = $html_string . '</th>';
      	$html_string = $html_string . '</tr>';
        $html_string = $html_string . '</thead>';
        $html_string = $html_string . '<tbody>';
		try
		{
			//determine the current year of campaign to select from current conecofor tables
			$sql_query = "SELECT ANNO_RILIEVI FROM conecofor_general";
			$anno_rilievi = "";
            foreach ($this->dbh->query($sql_query, PDO::FETCH_ASSOC) as $row){
		    		$anno_rilievi = $row['ANNO_RILIEVI'];
		    }
		    $sql_query = sprintf("SELECT conecofor_aree_tot.IDAREA,conecofor_aree_tot.TIPOAREA,conecofor_aree_tot.PROVINCI,conecofor_aree_tot.COMUNE,conecofor_aree_tot.REGIONE FROM conecofor_aree_tot LEFT JOIN ".DB_TABLE_CONECOFOR_AREE." ON conecofor_aree_tot.IDAREA = ".DB_TABLE_CONECOFOR_AREE.".IDAREA WHERE ( IDSQUADRA IS NULL ) ORDER BY REGIONE , conecofor_aree_tot.PROVINCI , conecofor_aree_tot.IDAREA ASC");
		    
            
            $sql_query= "";
            $sql_query = $sql_query ."SELECT ";
            $sql_query = $sql_query ."conecofor_aree_tot.IDAREA,conecofor_aree_tot.TIPOAREA,conecofor_aree_tot.PROVINCI,conecofor_aree_tot.COMUNE,conecofor_aree_tot.REGIONE ";
            $sql_query = $sql_query ."FROM conecofor_aree_tot ";
            $sql_query = $sql_query ."LEFT JOIN (SELECT * FROM conecofor_aree WHERE ANNO_RIL = ".$anno_rilievi.") AS aree_anno_ril ";
            $sql_query = $sql_query ."ON conecofor_aree_tot.IDAREA = aree_anno_ril.IDAREA ";
            $sql_query = $sql_query ."WHERE ANNO_RIL IS NULL ";
            $sql_query = $sql_query ."ORDER BY REGIONE , conecofor_aree_tot.PROVINCI , conecofor_aree_tot.IDAREA ASC";
            
		    $odd = 1;
		    $current_regione = "";
            foreach ($this->dbh->query($sql_query, PDO::FETCH_ASSOC) as $row)
		    {
               
                //stampa la riga della regione se cambia
                $area_regione = $row['REGIONE'];
                if($area_regione!=$current_regione){
                	$html_string = $html_string . '<tr style="background: rgb(181, 201, 207);">';
                	$html_string = $html_string . '<td colspan=10><b>';
			      	$html_string = $html_string . 'Regione '.$row['REGIONE'];
			      	$html_string = $html_string . '</b></td>';
			      	$html_string = $html_string . '</tr>';
			      	$current_regione=$area_regione;
                }
                if($odd%2){
                    $html_string = $html_string . '<tr class="odd">';
                }else{
                    $html_string = $html_string . '<tr>';
                } 
		      	$html_string = $html_string . '<td><b>';
		      	$html_string = $html_string . $row['IDAREA'];
		      	$html_string = $html_string . '</b></td>';
		      	$html_string = $html_string . '<td>';
		      	$html_string = $html_string . $row['TIPOAREA'];
		      	$html_string = $html_string . '</td>';
		      	$html_string = $html_string . '<td>';
		      	$html_string = $html_string . $row['PROVINCI'];
		      	$html_string = $html_string . '</td>';
		      	$html_string = $html_string . '<td>';
		      	$html_string = $html_string . $row['COMUNE'];
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
	
	function itaDate($dataEur,$delimiter){
		$rsl = explode ($delimiter,$dataEur);
		$rsl = array_reverse($rsl);
		return implode($rsl,'-');
	}
	
}
//End of Class
?>
