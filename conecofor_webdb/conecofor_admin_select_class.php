<?php

error_reporting (E_ALL); // I use this only for testing

require('fpdf.php');

class PDF extends FPDF
{
	//Simple table
	function BasicTable($width,$header,$data,$indent)
	{
	    //Header
	    $this->Cell($indent);
	    $this->SetFont('','B');
	    for($i=0;$i<count($header);$i++){
	        $this->Cell($width[$i],5,$header[$i],1);
	    }
	    $this->Ln();
	    //Data
	    $this->SetFont('');
	    foreach($data as $row)
	    {
		    $col_i = 0;
		    $this->Cell($indent);
		    for($i=0;$i<count($row);$i++){
	        	if($col_i==0){
		        	$this->SetFont('','B');
		            $this->Cell($width[$i],6,$row[$i],1);
	        	}else{
		        	$this->SetFont('');
		    		$this->Cell($width[$i],6,$row[$i],1,0,'R');
		    	}
		    	$col_i = 1;
	    	}
	        $this->Ln();
	    }
	}
	
	function Footer()
	{
	    //Go to 1.5 cm from bottom
	    $this->SetY(-15);
	    //Select Arial italic 8
	    $this->SetFont('Arial','I',8);
	    //Print centered page number
	    $this->Cell(0,10,'Page '.$this->PageNo(),0,0,'C');
	}

}


class conecofor_admin_select_class {
	
	var $conn_str;
	var $dbh;
	
    function conecofor_admin_select_class(){
    	
    	
    	
    	$this->connect_db();
   		if(!isset($_SESSION['conecofor_select_status'])){
	   		$_SESSION['conecofor_select_status'] = "SELECT_AREA";
		}elseif(isset($_POST['conecofor_select_detail_area'])) {
			$_SESSION['conecofor_select_status'] = "DETAIL_AREA";
			$_SESSION['conecofor_select_idarea'] = $_POST['conecofor_select_detail_area'];
		}elseif(isset($_POST['conecofor_select_rich'])) {
			$_SESSION['conecofor_select_status'] = "RICH";
			$_SESSION['conecofor_select_idarea'] = $_POST['conecofor_select_rich'];
		}elseif(isset($_POST['conecofor_select_ridia'])) {
			$_SESSION['conecofor_select_status'] = "RIDIA";
			$_SESSION['conecofor_select_idarea'] = $_POST['conecofor_select_ridia'];
		}elseif(isset($_POST['conecofor_select_pdfreport'])) {
			$_SESSION['conecofor_select_status'] = "PDFREPORT";
			$_SESSION['conecofor_select_idarea'] = $_POST['conecofor_select_pdfreport'];
			$this->create_pdfreport($_POST['conecofor_select_pdfreport']); 
			$_SESSION['conecofor_select_status'] = "SELECT_AREA";
			$_SESSION['conecofor_select_idarea'] = "";
		}elseif(isset($_POST['conecofor_back_select_area'])) {
			$_SESSION['conecofor_select_status'] = "SELECT_AREA";
			$_SESSION['conecofor_select_idarea'] = "";
		}elseif(isset($_POST['conecofor_select_delete'])) {
			$_SESSION['conecofor_select_status'] = "CONFIRM_DELETE_AREA";
			$_SESSION['conecofor_select_idarea'] = $_POST['conecofor_select_delete'];
		}elseif(isset($_POST['confirm_delete_checkout'])) {
			if($_POST['confirm_delete_checkout']=='SI'){
				$_SESSION['conecofor_select_status'] = "EXECUTE_DELETE_AREA";
			} else {
				$_SESSION['conecofor_select_status'] = "SELECT_AREA";
				$_SESSION['conecofor_select_idarea'] = "";
			}
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
				$html_string = $html_string .  '<INPUT TYPE=HIDDEN NAME="conecofor_back_select_area" VALUE="true">';
				$html_string = $html_string .  '<INPUT type="image" src="images/previous.png" name="conecofor_next_image" style="width: 15px; height: 15px;"/>';
				$html_string = $html_string .  '</FORM>';
                break;	
    	}
    	
        $html_string = $html_string . '</td>';
		$html_string = $html_string . '<td align="left" style="text-align=left;">';
        switch ($_SESSION['conecofor_select_status']){
    		case 'SELECT_AREA';
    			$html_string = $html_string . '<b>Aree inserite nel web database</b>';
                break;
			case 'DETAIL_AREA';
    			$html_string = $html_string . '<b>Dettaglio AREA '.$_SESSION['conecofor_select_idarea'].'</b>';
                break;
            case 'RICH';
    			$html_string = $html_string . '<b>Rilievo chiome AREA '.$_SESSION['conecofor_select_idarea'].'</b>';
                break;
            case 'RIDIA';
    			$html_string = $html_string . '<b>Rilievo dendrometrico AREA '.$_SESSION['conecofor_select_idarea'].'</b>';
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
			case 'DETAIL_AREA';
    			$this->detail_area();
		        break;
            case 'RICH';
    			$this->rich();
		        break;
            case 'RIDIA';
    			$this->ridia();
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
    	$html_string = '';
    	$html_string = $html_string . '<table id="hor-zebra" summary="Lista aree">';
    	$html_string = $html_string . '<thead>';
    	$html_string = $html_string . '<tr>';
      	$html_string = $html_string . '<th  scope="col">';
      	$html_string = $html_string . 'IDAREA';
      	$html_string = $html_string . '</th>';
      	$html_string = $html_string . '<th  scope="col">';
      	$html_string = $html_string . 'IDSQUADRA';
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
      	$html_string = $html_string . '<th  scope="col">';
      	$html_string = $html_string . 'DATA RILIEVO';
      	$html_string = $html_string . '</th>';
      	$html_string = $html_string . '<th  scope="col">';
      	$html_string = $html_string . 'DATA UPLOAD';
      	$html_string = $html_string . '</th>';
		$html_string = $html_string . '<th  scope="col">';
      	$html_string = $html_string . 'DATI AREA';
      	$html_string = $html_string . '</th>';
        $html_string = $html_string . '<th  scope="col">';
      	$html_string = $html_string . 'RICH';
      	$html_string = $html_string . '</th>';
        $html_string = $html_string . '<th  scope="col">';
      	$html_string = $html_string . 'RIDIA';
      	$html_string = $html_string . '</th>';
      	$html_string = $html_string . '<th  scope="col">';
      	$html_string = $html_string . 'REPORT PDF';
      	$html_string = $html_string . '</th>';
        if ($_SESSION['conecofor_login_liv'] == 1){
            $html_string = $html_string . '<th  scope="col">';
            $html_string = $html_string . 'RIMUOVI AREA';
            $html_string = $html_string . '</th>';
        }
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
            
            //create array for completed area counts
            
            $sql_query = sprintf("SELECT REGIONE,Count(IDAREA)As N_AREE FROM conecofor_aree_tot GROUP BY REGIONE");
            $sth = $this->dbh->prepare($sql_query);
            $sth->execute();
            $sth_area_total_count = $sth->fetchAll(PDO::FETCH_COLUMN|PDO::FETCH_GROUP);
                        
            
            $sql_query = sprintf("SELECT REGIONE,Count(".DB_TABLE_CONECOFOR_AREE.".IDAREA)As N_AREE FROM conecofor_aree_tot LEFT JOIN ".DB_TABLE_CONECOFOR_AREE." ON conecofor_aree_tot.IDAREA = ".DB_TABLE_CONECOFOR_AREE.".IDAREA WHERE ANNO_RIL = ".$anno_rilievi." GROUP BY REGIONE");
		    $sth = $this->dbh->prepare($sql_query);
            $sth->execute();
            $sth_area_completed_count = $sth->fetchAll(PDO::FETCH_COLUMN|PDO::FETCH_GROUP);
            
            

            //
            
		    $sql_query = sprintf("SELECT * FROM ".DB_TABLE_CONECOFOR_AREE." JOIN conecofor_aree_tot ON ".DB_TABLE_CONECOFOR_AREE.".IDAREA = conecofor_aree_tot.IDAREA WHERE ANNO_RIL = ".$anno_rilievi." ORDER BY REGIONE,conecofor_aree_tot.IDAREA");
		    $odd = 1;
		    $current_regione = "";
            foreach ($this->dbh->query($sql_query, PDO::FETCH_ASSOC) as $row)
		    {
                //stampa la riga della regione se cambia
                $area_regione = $row['REGIONE'];
                if($area_regione!=$current_regione){
                	$html_string = $html_string . '<tr style="background: rgb(181, 201, 207);">';
                    if ($_SESSION['conecofor_login_liv'] == 1){
                        $html_string = $html_string . '<td colspan=12><b>';
                    } else {
                        $html_string = $html_string . '<td colspan=11><b>';
                    }
			      	$html_string = $html_string . 'Regione '.$row['REGIONE']." (aree completate ".$sth_area_completed_count[$row['REGIONE']][0]." su ".$sth_area_total_count[$row['REGIONE']][0].")";
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
		      	$html_string = $html_string . '<td><b>';
		      	$html_string = $html_string . $row['IDSQUADRA'];
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
		      	$html_string = $html_string . '<td>';
		      	$html_string = $html_string . $this->itaDate($row['DATARIL'],"-");
		      	$html_string = $html_string . '</td>';
		      	$html_string = $html_string . '<td>';
		      	$html_string = $html_string . $this->itaDate($row['DATAUP'],"-");
		      	$html_string = $html_string . '</td>';
				$html_string = $html_string . '<td>';
				$html_string = $html_string .  '<FORM name="conecofor_select_detail_area_'.$row['IDAREA'].'" enctype="multipart/form-data" action="'.$_SERVER['PHP_SELF'].'" method="post">';
				$html_string = $html_string .  '<INPUT TYPE=HIDDEN NAME="conecofor_select_detail_area" VALUE="'.$row['IDAREA'].'">';
				$html_string = $html_string .  '<INPUT type="image" src="images/document.png" name="conecofor_select_image" />';
				$html_string = $html_string .  '</FORM>';
		      	$html_string = $html_string . '</td>';
                $html_string = $html_string . '<td>';
				$html_string = $html_string .  '<FORM name="conecofor_select_rich_'.$row['IDAREA'].'" enctype="multipart/form-data" action="'.$_SERVER['PHP_SELF'].'" method="post">';
				$html_string = $html_string .  '<INPUT TYPE=HIDDEN NAME="conecofor_select_rich" VALUE="'.$row['IDAREA'].'">';
				$html_string = $html_string .  '<INPUT type="image" src="images/document.png" name="conecofor_select_image" />';
				$html_string = $html_string .  '</FORM>';
		      	$html_string = $html_string . '</td>';
                $html_string = $html_string . '<td>';
				$html_string = $html_string .  '<FORM name="conecofor_select_ridia_'.$row['IDAREA'].'" enctype="multipart/form-data" action="'.$_SERVER['PHP_SELF'].'" method="post">';
				$html_string = $html_string .  '<INPUT TYPE=HIDDEN NAME="conecofor_select_ridia" VALUE="'.$row['IDAREA'].'">';
				$html_string = $html_string .  '<INPUT type="image" src="images/document.png" name="conecofor_select_image" />';
				$html_string = $html_string .  '</FORM>';
		      	$html_string = $html_string . '</td>';
		      	$html_string = $html_string . '<td>';
				$html_string = $html_string .  '<FORM name="conecofor_pdf_report_'.$row['IDAREA'].'" enctype="multipart/form-data" action="'.$_SERVER['PHP_SELF'].'" method="post">';
				$html_string = $html_string .  '<INPUT TYPE=HIDDEN NAME="conecofor_select_pdfreport" VALUE="'.$row['IDAREA'].'">';
				$html_string = $html_string .  '<INPUT type="image" src="images/pdf.png" name="conecofor_select_image" />';
				$html_string = $html_string .  '</FORM>';
		      	$html_string = $html_string . '</td>';
                if ($_SESSION['conecofor_login_liv'] == 1){
                    $html_string = $html_string . '<td>';
                    $html_string = $html_string .  '<FORM name="conecofor_area_'.$row['IDAREA'].'_delete_form" enctype="multipart/form-data" action="'.$_SERVER['PHP_SELF'].'" method="post">';
                    $html_string = $html_string .  '<INPUT TYPE=HIDDEN NAME="conecofor_select_delete" VALUE="'.$row['IDAREA'].'">';
                    $html_string = $html_string .  '<INPUT type="image" src="images/recycle_bin.png" name="conecofor_area_delete" />';
                    $html_string = $html_string .  '</FORM>';
                    $html_string = $html_string . '<td>';
		      	}
		      	$html_string = $html_string . '</tr>';
		      	$odd = $odd+1;
		    }
            //inserisce riga conteggio totale
            $sql_query = sprintf("SELECT Count(IDAREA) As N_AREE FROM conecofor_aree_tot");
            $sth = $this->dbh->prepare($sql_query);
            $sth->execute();
            $sth_tot_area = $sth->fetchAll();
                        
            
            $sql_query = sprintf("SELECT Count(IDAREA) As N_AREE FROM ".DB_TABLE_CONECOFOR_AREE." WHERE ANNO_RIL = ".$anno_rilievi." ");
		    $sth = $this->dbh->prepare($sql_query);
            $sth->execute();
            $sth_tot_completed = $sth->fetchAll();
            
            $html_string = $html_string . '<tr style="background: rgb(181, 201, 207);">';
            if ($_SESSION['conecofor_login_liv'] == 1){
                $html_string = $html_string . '<td colspan=12><b>';
            } else {
                $html_string = $html_string . '<td colspan=11><b>';
            }
            $html_string = $html_string . 'TOTALE AREE CARICATE '.$sth_tot_completed[0][0]." su ".$sth_tot_area[0][0];
            $html_string = $html_string . '</b></td>';
            $html_string = $html_string . '</tr>';

		}
		catch(PDOException $e)
		{
		    echo 'Error: ' . $e->getMessage() . "\n";
		}
        $html_string = $html_string . '</tbody>';
        $html_string = $html_string . '</table>';
		echo $html_string;
    }
	
	function detail_area(){
    	$html_string = '';
    	$html_string = $html_string . '<table id="hor-minimalist-b" summary="Tabella dati area">';
    	$html_string = $html_string . '<thead>';
    	$html_string = $html_string . '<tr>';
      	$html_string = $html_string . '<th  scope="col">';
      	$html_string = $html_string . '<b>Attributo</b>';
      	$html_string = $html_string . '</th>';
      	$html_string = $html_string . '<th  scope="col">';
      	$html_string = $html_string . '<b>Valore</b>';
      	$html_string = $html_string . '</th>';
      	$html_string = $html_string . '</tr>';
        $html_string = $html_string . '<thead>';
        $html_string = $html_string . '<tbody>';
        try
		{
			$sql_query = "SELECT ANNO_RILIEVI FROM conecofor_general";
			$anno_rilievi = "";
            foreach ($this->dbh->query($sql_query, PDO::FETCH_ASSOC) as $row){
		    		$anno_rilievi = $row['ANNO_RILIEVI'];
		    }
		    $sql_query = sprintf("SELECT * FROM ".DB_TABLE_CONECOFOR_AREE." NATURAL LEFT JOIN tabdec_idoneita NATURAL LEFT JOIN tabdec_altitud NATURAL LEFT JOIN tabdec_esposiz NATURAL LEFT JOIN tabdec_disph2o NATURAL LEFT JOIN tabdec_t_humus NATURAL LEFT JOIN tabdec_etamedia NATURAL LEFT JOIN tabdec_catfor NATURAL LEFT JOIN tabdec_scatfor NATURAL LEFT JOIN tabdec_pic NATURAL LEFT JOIN tabdec_tras_pic WHERE (IDAREA = '".$_SESSION['conecofor_select_idarea']."' AND ANNO_RIL = ".$anno_rilievi.")");
		    foreach ($this->dbh->query($sql_query, PDO::FETCH_ASSOC) as $row)
		    {
		    	
		    
				
		    	
		    	$html_string = $html_string . '<tr>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . 'IDAREA';
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . $row['IDAREA'];
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '</tr>';
                
                $html_string = $html_string . '<tr>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . 'IDSQUADRA';
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . $row['IDSQUADRA'];
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '</tr>';
                
                $html_string = $html_string . '<tr>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . 'TIPOAREA';
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . $row['TIPOAREA'];
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '</tr>';
                
                $html_string = $html_string . '<tr>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . 'IDONEITA\'';
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . $row['dec_IDONEITA'];
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '</tr>';
                
                $html_string = $html_string . '<tr>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . 'PAESE';
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . $row['PAESE'];
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '</tr>';
                
                $html_string = $html_string . '<tr>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . 'PROVINCIA';
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . $row['PROVINCI'];
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '</tr>';
                
                $html_string = $html_string . '<tr>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . 'COMUNE';
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . $row['COMUNE'];
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '</tr>';
                
                $html_string = $html_string . '<tr>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . 'DATA RILIEVO IN CAMPO';
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . $this->itaDate($row['DATARIL'],"-");
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '</tr>';
                
                $html_string = $html_string . '<tr>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . 'DATA UPLOAD WEB';
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . $this->itaDate($row['DATAUP'],"-");
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '</tr>';
                
                $html_string = $html_string . '<tr>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . 'NORD NOMINALE UTM-WGS84';
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . $row['COORDN'];
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '</tr>';
                
                $html_string = $html_string . '<tr>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . 'EST NOMINALE UTM-WGS84';
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . $row['COORDE'];
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '</tr>';
                
                $html_string = $html_string . '<tr>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . 'ALTITUDINE';
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . $row['dec_ALTITUD'];
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '</tr>';
                
                $html_string = $html_string . '<tr>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . 'ESPOSIZIONE';
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . $row['dec_ESPOSIZ'];
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '</tr>';
                
                $html_string = $html_string . '<tr>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . "DISPONIBILITA' ACQUA";
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . $row['dec_DISPH2O'];
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '</tr>';
                
                $html_string = $html_string . '<tr>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . 'HUMUS';
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . $row['dec_T_HUMUS'];
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '</tr>';
                
                $html_string = $html_string . '<tr>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . 'ETA\' MEDIA';
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . $row['dec_ETAMEDIA'];
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '</tr>';
                
                $html_string = $html_string . '<tr>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . 'CATEGORIA FORESTALE';
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . $row['dec_CATFOR'];
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '</tr>';
                
                $html_string = $html_string . '<tr>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . 'SOTTOCATEGORIA FORESTALE';
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . $row['dec_SCATFOR'];
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '</tr>';
                
                $html_string = $html_string . '<tr>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . 'NORD GPS UTM WGS84';
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . $row['COORDN_C'];
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '</tr>';
                
                $html_string = $html_string . '<tr>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . 'EST GPS UTM WGS84';
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . $row['COORDE_C'];
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '</tr>';
                
                $html_string = $html_string . '<tr>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . 'FIX GPS';
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . $row['FIXGPS_C'];
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '</tr>';
                
                $html_string = $html_string . '<tr>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . 'RITROVATO PICCHETTO';
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . $row['dec_PIC'];
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '</tr>';
                
                $html_string = $html_string . '<tr>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . 'TRASLAZIONE NUOVO PICCHETTO';
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . $row['dec_TRAS_PIC'];
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '</tr>';
                
                $html_string = $html_string . '<tr>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . 'AZIMUT TRASLAZIONE PICCHETTO';
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . $row['T_PIC_AZ'];
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '</tr>';
                
                $html_string = $html_string . '<tr>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . 'DISTANZA TRASLAZIONE PICCHETTO';
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . $row['T_PIC_DS'];
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '</tr>';
		      	
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
    
    function rich(){
    	$html_string = '';
    	$html_string = $html_string . '<table id="hor-minimalist-b" summary="Tabella rilievo chiome">';
        $html_string = $html_string . '<thead>';
    	$html_string = $html_string . '<tr>';
      	$html_string = $html_string . '<th  scope="col">';
      	$html_string = $html_string . 'IDPIANTA';
      	$html_string = $html_string . '</th>';
      	$html_string = $html_string . '<th  scope="col">';
      	$html_string = $html_string . 'SPECIE';
      	$html_string = $html_string . '</th>';
      	$html_string = $html_string . '<th  scope="col">';
      	$html_string = $html_string . 'REM_MORT';
      	$html_string = $html_string . '</th>';
      	$html_string = $html_string . '<th  scope="col">';
      	$html_string = $html_string . 'ASS_CROWN';
      	$html_string = $html_string . '</th>';
      	$html_string = $html_string . '<th  scope="col">';
      	$html_string = $html_string . 'TRASPAR';
      	$html_string = $html_string . '</th>';
      	$html_string = $html_string . '<th  scope="col">';
      	$html_string = $html_string . 'FRUTTIF';
      	$html_string = $html_string . '</th>';
      	$html_string = $html_string . '<th  scope="col">';
      	$html_string = $html_string . 'DENDROT';
      	$html_string = $html_string . '</th>';
		$html_string = $html_string . '<th  scope="col">';
      	$html_string = $html_string . 'DIAM1';
      	$html_string = $html_string . '</th>';
        $html_string = $html_string . '<th  scope="col">';
      	$html_string = $html_string . 'DIAM2';
      	$html_string = $html_string . '</th>';
        $html_string = $html_string . '<th  scope="col">';
      	$html_string = $html_string . 'DIST';
      	$html_string = $html_string . '</th>';
        $html_string = $html_string . '<th  scope="col">';
      	$html_string = $html_string . 'AZIMUT';
      	$html_string = $html_string . '</th>';
      	$html_string = $html_string . '<th  scope="col">';
      	$html_string = $html_string . 'IDSINTOMO';
      	$html_string = $html_string . '</th>';
      	$html_string = $html_string . '<th  scope="col">';
      	$html_string = $html_string . 'IDPIANTA';
      	$html_string = $html_string . '</th>';
      	$html_string = $html_string . '<th  scope="col">';
      	$html_string = $html_string . 'SPECIE';
      	$html_string = $html_string . '</th>';
      	$html_string = $html_string . '<th  scope="col">';
      	$html_string = $html_string . 'PARTE';
      	$html_string = $html_string . '</th>';
      	$html_string = $html_string . '<th  scope="col">';
      	$html_string = $html_string . 'TIPOSINT';
      	$html_string = $html_string . '</th>';
      	$html_string = $html_string . '<th  scope="col">';
      	$html_string = $html_string . 'ETADANNO';
      	$html_string = $html_string . '</th>';
		$html_string = $html_string . '<th  scope="col">';
      	$html_string = $html_string . 'AGENTE';
      	$html_string = $html_string . '</th>';
        $html_string = $html_string . '<th  scope="col">';
      	$html_string = $html_string . 'AG_NOME';
      	$html_string = $html_string . '</th>';
        $html_string = $html_string . '<th  scope="col">';
      	$html_string = $html_string . 'AG_DIFF';
      	$html_string = $html_string . '</th>';
        $html_string = $html_string . '<th  scope="col">';
      	$html_string = $html_string . 'CHIOMA_V';
      	$html_string = $html_string . '</th>';
        $html_string = $html_string . '<th  scope="col">';
      	$html_string = $html_string . 'NOTE';
      	$html_string = $html_string . '</th>';
      	$html_string = $html_string . '</tr>';
        $html_string = $html_string . '</thead>';
        $html_string = $html_string . '<tbody>';
		try
		{
			$sql_query = "SELECT ANNO_RILIEVI FROM conecofor_general";
			$anno_rilievi = "";
            foreach ($this->dbh->query($sql_query, PDO::FETCH_ASSOC) as $row){
		    		$anno_rilievi = $row['ANNO_RILIEVI'];
		    }
            $sql_query= "";
            $sql_query = $sql_query ."SELECT ";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_PIANTE.".IDAREA,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_PIANTE.".IDPIANTA,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_PIANTE.".SPECIE,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_PIANTE.".REM_MORT,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_PIANTE.".ASS_CROWN,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_PIANTE.".TRASPAR,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_PIANTE.".FRUTTIF,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_PIANTE.".DENDROT,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_PIANTE.".DIAM1,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_PIANTE.".DIAM2,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_PIANTE.".DIST,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_PIANTE.".AZIMUT,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_SINTOMI.".IDSINTOMO,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_SINTOMI.".PARTE,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_SINTOMI.".TIPOSINT,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_SINTOMI.".ETADANNO,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_SINTOMI.".AGENTE,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_SINTOMI.".AG_NOME,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_SINTOMI.".AG_DIFF,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_SINTOMI.".CHIOMA_V,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_SINTOMI.".NOTE ";
            $sql_query = $sql_query ." FROM ".DB_TABLE_CONECOFOR_PIANTE. " LEFT JOIN ".DB_TABLE_CONECOFOR_SINTOMI." ";
            $sql_query = $sql_query ." ON (".DB_TABLE_CONECOFOR_PIANTE.".IDPIANTA = ".DB_TABLE_CONECOFOR_SINTOMI.".IDPIANTA) AND (".DB_TABLE_CONECOFOR_PIANTE.".IDAREA = ".DB_TABLE_CONECOFOR_SINTOMI.".IDAREA) AND (".DB_TABLE_CONECOFOR_PIANTE.".ANNO_RIL = ".DB_TABLE_CONECOFOR_SINTOMI.".ANNO_RIL)";
            $sql_query = $sql_query ." WHERE ( ( ".DB_TABLE_CONECOFOR_PIANTE.".IDAREA ='".$_SESSION['conecofor_select_idarea']."') AND ( ".DB_TABLE_CONECOFOR_PIANTE.".ANNO_RIL = ".$anno_rilievi." ) )";
            $sql_query = $sql_query ." ORDER BY  ".DB_TABLE_CONECOFOR_PIANTE.".IDPIANTA, ".DB_TABLE_CONECOFOR_SINTOMI.".IDSINTOMO ASC ;";
		    $last_idpianta ='';
            
            foreach ($this->dbh->query($sql_query, PDO::FETCH_ASSOC) as $row)
		    {
                $html_string = $html_string . '<tr>';
                $current_idpianta = $row['IDPIANTA'];
                if($current_idpianta==$last_idpianta){
                    $html_string = $html_string . '<td>';
                    $html_string = $html_string . '</td>';
                    $html_string = $html_string . '<td>';
                    $html_string = $html_string . '</td>';
                    $html_string = $html_string . '<td>';
                    $html_string = $html_string . '</td>';
                    $html_string = $html_string . '<td>';
                    $html_string = $html_string . '</td>';
                    $html_string = $html_string . '<td>';
                    $html_string = $html_string . '</td>';
                    $html_string = $html_string . '<td>';
                    $html_string = $html_string . '</td>';
                    $html_string = $html_string . '<td>';
                    $html_string = $html_string . '</td>';
                    $html_string = $html_string . '<td>';
                    $html_string = $html_string . '</td>';
                    $html_string = $html_string . '<td>';
                    $html_string = $html_string . '</td>';
                    $html_string = $html_string . '<td>';
                    $html_string = $html_string . '</td>';
                    $html_string = $html_string . '<td>';
                    $html_string = $html_string . '</td>';
                }else{
                    $last_idpianta=$current_idpianta;
                    $html_string = $html_string . '<td><b>';
                    $html_string = $html_string . $row['IDPIANTA'];
                    $html_string = $html_string . '</b></td>';
                    $html_string = $html_string . '<td>';
                    $html_string = $html_string . $row['SPECIE'];
                    $html_string = $html_string . '</td>';
                    $html_string = $html_string . '<td>';
                    $html_string = $html_string . $row['REM_MORT'];
                    $html_string = $html_string . '</td>';
                    $html_string = $html_string . '<td>';
                    $html_string = $html_string . $row['ASS_CROWN'];
                    $html_string = $html_string . '</td>';
                    $html_string = $html_string . '<td>';
                    $html_string = $html_string . $row['TRASPAR'];
                    $html_string = $html_string . '</td>';
                    $html_string = $html_string . '<td>';
                    $html_string = $html_string . $row['FRUTTIF'];
                    $html_string = $html_string . '</td>';
                    $html_string = $html_string . '<td>';
                    $html_string = $html_string . $row['DENDROT'];
                    $html_string = $html_string . '</td>';
                    $html_string = $html_string . '<td>';
                    $html_string = $html_string . $row['DIAM1'];
                    $html_string = $html_string . '</td>';
                    $html_string = $html_string . '<td>';
                    $html_string = $html_string . $row['DIAM2'];
                    $html_string = $html_string . '</td>';
                    $html_string = $html_string . '<td>';
                    $html_string = $html_string . $row['DIST'];
                    $html_string = $html_string . '</td>';
                    $html_string = $html_string . '<td>';
                    $html_string = $html_string . $row['AZIMUT'];
                    $html_string = $html_string . '</td>';
                }
                $html_string = $html_string . '<td><b>';
                $html_string = $html_string . $row['IDSINTOMO'];
                $html_string = $html_string . '</b></td>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . $row['IDPIANTA'];
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . $row['SPECIE'];
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . $row['PARTE'];
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . $row['TIPOSINT'];
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . $row['ETADANNO'];
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . $row['AGENTE'];
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . $row['AG_NOME'];
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . $row['AG_DIFF'];
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . $row['CHIOMA_V'];
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . $row['NOTE'];
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '<tr>';
                
		    }
            
			
		}
		catch(PDOException $e)
		{
		    echo 'Error: ' . $e->getMessage() . "\n";
		}
        $html_string = $html_string . '<tbody>';
        $html_string = $html_string . '</table>';
		echo $html_string;
    }   
    

        function ridia(){
    	$html_string = '';
    	$html_string = $html_string . '<table id="hor-minimalist-b" summary="Tabella rilievo dendrometrico">';
        $html_string = $html_string . '<thead>';
    	$html_string = $html_string . '<tr>';
      	$html_string = $html_string . '<th  scope="col">';
      	$html_string = $html_string . 'IDPIANTA';
      	$html_string = $html_string . '</th>';
      	$html_string = $html_string . '<th  scope="col">';
      	$html_string = $html_string . 'SPECIE';
      	$html_string = $html_string . '</th>';
      	$html_string = $html_string . '<th  scope="col">';
      	$html_string = $html_string . 'DIAM1';
      	$html_string = $html_string . '</th>';
      	$html_string = $html_string . '<th  scope="col">';
      	$html_string = $html_string . 'DIAM2';
      	$html_string = $html_string . '</th>';
      	$html_string = $html_string . '<th  scope="col">';
      	$html_string = $html_string . 'DENDROT';
      	$html_string = $html_string . '</th>';
		$html_string = $html_string . '<th  scope="col">';
      	$html_string = $html_string . 'RIL_H';
      	$html_string = $html_string . '</th>';
        $html_string = $html_string . '<th  scope="col">';
      	$html_string = $html_string . 'H';
      	$html_string = $html_string . '</th>';
      	$html_string = $html_string . '</tr>';
        $html_string = $html_string . '</thead>';
        $html_string = $html_string . '<tbody>';
		try
		{
			$sql_query = "SELECT ANNO_RILIEVI FROM conecofor_general";
			$anno_rilievi = "";
            foreach ($this->dbh->query($sql_query, PDO::FETCH_ASSOC) as $row){
		    		$anno_rilievi = $row['ANNO_RILIEVI'];
		    }
            $sql_query= "";
            $sql_query = $sql_query ."SELECT ";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_CAV.".IDAREA,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_CAV.".IDPIANTA,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_CAV.".SPECIE,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_CAV.".DIAM1,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_CAV.".DIAM2,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_CAV.".DENDROT,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_CAV.".RIL_H,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_CAV.".H ";
            
            $sql_query = $sql_query ." FROM ". DB_TABLE_CONECOFOR_CAV;
            $sql_query = $sql_query ." WHERE ( ( ".DB_TABLE_CONECOFOR_CAV.".IDAREA ='".$_SESSION['conecofor_select_idarea']."') AND ( ".DB_TABLE_CONECOFOR_CAV.".ANNO_RIL = ".$anno_rilievi." ) );";
		   
            foreach ($this->dbh->query($sql_query, PDO::FETCH_ASSOC) as $row)
		    {
                $html_string = $html_string . '<tr>';
                
                $html_string = $html_string . '<td><b>';
                $html_string = $html_string . $row['IDPIANTA'];
                $html_string = $html_string . '</b></td>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . $row['SPECIE'];
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . $row['DIAM1'];
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . $row['DIAM2'];
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . $row['DENDROT'];
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . $row['RIL_H'];
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . $row['H'];
                $html_string = $html_string . '</td>';
                
                $html_string = $html_string . '<tr>';
                
		    }
            
			
		}
		catch(PDOException $e)
		{
		    echo 'Error: ' . $e->getMessage() . "\n";
		}
        
        $html_string = $html_string . '<tbody>';
        $html_string = $html_string . '</table>';
		echo $html_string;
    }
       
       
    function create_pdfreport($id_area){
    	
    	$pdf_created = False;
		
		$pdf=new PDF();
				
		$pdf->SetFont('Arial','',10);
		
		//add first page
		$pdf->AddPage();
		
		//add header
		
		//Image Logo
	    //$pdf->Image('../images/intestazione.png',10,8,190);
	    
	     //Title
	    $pdf->SetFont('','B',12);
	    $pdf->Cell(35);
	    $pdf->Cell(120,10,'CONECOFOR REPORT AREA: '.$id_area,1,0,'C');
	    $pdf->SetFont('','',8);
	  
		//add area table	
		$pdf->Ln();
        $pdf->Ln();
        $pdf->Ln();
        $pdf->SetFont('','B',10);$pdf->Cell(15);
        $pdf->Cell(160,10,"Stampato in data: ".date("d-m-y"));
        $pdf->Ln();
        $pdf->Ln();
        $pdf->Cell(15);
		$pdf->Cell(160,10,"TABELLA DATI AREA");
		$pdf->SetFont('','',8);
		$pdf->Ln();
		
		$pdf_tablewidth=array(60,80);
		$pdf_tableheader=array('CAMPO','VALORE');
		$pdf_tabledata=array();
		try
		{
			$sql_query = "SELECT ANNO_RILIEVI FROM conecofor_general";
			$anno_rilievi = "";
            foreach ($this->dbh->query($sql_query, PDO::FETCH_ASSOC) as $row){
		    		$anno_rilievi = $row['ANNO_RILIEVI'];
		    }
		    //old with id squadra
		    //$sql_query = sprintf("SELECT * FROM %s NATURAL LEFT JOIN tabdec_idoneita NATURAL LEFT JOIN tabdec_altitud NATURAL LEFT JOIN tabdec_esposiz NATURAL LEFT JOIN tabdec_disph2o NATURAL LEFT JOIN tabdec_t_humus NATURAL LEFT JOIN tabdec_etamedia NATURAL LEFT JOIN tabdec_catfor NATURAL LEFT JOIN tabdec_scatfor NATURAL LEFT JOIN tabdec_pic NATURAL LEFT JOIN tabdec_tras_pic WHERE IDAREA = '%s' AND IDSQUADRA = '%s' ", $anno_rilievi."_".DB_TABLE_CONECOFOR_AREE, $_SESSION['conecofor_select_idarea'], $_SESSION['conecofor_login_idutente']);
		    
		    $sql_query = sprintf("SELECT * FROM ".DB_TABLE_CONECOFOR_AREE." NATURAL LEFT JOIN tabdec_idoneita NATURAL LEFT JOIN tabdec_altitud NATURAL LEFT JOIN tabdec_esposiz NATURAL LEFT JOIN tabdec_disph2o NATURAL LEFT JOIN tabdec_t_humus NATURAL LEFT JOIN tabdec_etamedia NATURAL LEFT JOIN tabdec_catfor NATURAL LEFT JOIN tabdec_scatfor NATURAL LEFT JOIN tabdec_pic NATURAL LEFT JOIN tabdec_tras_pic WHERE (IDAREA = '".$_SESSION['conecofor_select_idarea']."' AND ANNO_RIL = ".$anno_rilievi.")");
		    
		    
		    $query_result = $this->dbh->query($sql_query);
		    foreach ($this->dbh->query($sql_query, PDO::FETCH_ASSOC) as $row)
		    {
		    	
		    	
		    	
				$pdf_tabledata[]=array('IDAREA',$row['IDAREA']);
                $pdf_tabledata[]=array('IDSQUADRA',$row['IDSQUADRA']);
                $pdf_tabledata[]=array('TIPOAREA',$row['TIPOAREA']);
                $pdf_tabledata[]=array('IDONEITA\'',$row['dec_IDONEITA']);
                $pdf_tabledata[]=array('PAESE',$row['PAESE']);
                $pdf_tabledata[]=array('PROVINCIA',$row['PROVINCI']);
                $pdf_tabledata[]=array('COMUNE',$row['COMUNE']);
                $pdf_tabledata[]=array('DATA RILIEVO IN CAMPO',$this->itaDate($row['DATARIL'],"-"));
                $pdf_tabledata[]=array('DATA UPLOAD WEB',$this->itaDate($row['DATAUP'],"-"));
                $pdf_tabledata[]=array('NORD NOMINALE UTM-WGS84',$row['COORDN']);
                $pdf_tabledata[]=array('EST NOMINALE UTM-WGS84',$row['COORDE']);
                $pdf_tabledata[]=array('ALTITUDINE',$row['dec_ALTITUD']);
                $pdf_tabledata[]=array('ESPOSIZIONE',$row['dec_ESPOSIZ']);
                $pdf_tabledata[]=array("DISPONIBILITA' ACQUA",$row['dec_DISPH2O']);
                $pdf_tabledata[]=array('HUMUS',$row['dec_T_HUMUS']);
                $pdf_tabledata[]=array('ETA\' MEDIA',$row['dec_ETAMEDIA']);
                $pdf_tabledata[]=array('CATEGORIA FORESTALE',$row['dec_CATFOR']);
                $pdf_tabledata[]=array('SOTTOCATEGORIA FORESTALE',$row['dec_SCATFOR']);
                $pdf_tabledata[]=array('NORD GPS UTM WGS84',$row['COORDN_C']);
                $pdf_tabledata[]=array('EST GPS UTM WGS84',$row['COORDE_C']);
                $pdf_tabledata[]=array('FIX GPS',$row['FIXGPS_C']);
                $pdf_tabledata[]=array('RITROVATO PICCHETTO',$row['dec_PIC']);
                $pdf_tabledata[]=array('TRASLAZIONE NUOVO PICCHETTO',$row['dec_TRAS_PIC']);
                $pdf_tabledata[]=array('AZIMUT TRASLAZIONE PICCHETTO',$row['T_PIC_AZ']);
                $pdf_tabledata[]=array('DISTANZA TRASLAZIONE PICCHETTO',$row['T_PIC_DS']);
		    }
			
		}
		catch(PDOException $e)
		{
		    echo 'Error: ' . $e->getMessage() . "\n";
		}
		
		$pdf->BasicTable($pdf_tablewidth,$pdf_tableheader,$pdf_tabledata,15);
		
		
		//add area table	
		$pdf->AddPage('L');
		$pdf->Ln();
		$pdf->SetFont('','B',10);$pdf->Cell(15);
		$pdf->Cell(160,10,"TABELLA DATI PIANTE E SINTOMI CAMPIONE RILIEVO CHIOME");
		$pdf->SetFont('','',8);
		$pdf->Ln();
		
		$pdf->SetFont('','',6);
		
		
		$pdf_tablewidth=array(12,10,15,15,12,11,12,9,9,8,10,13,9,11,14,11,54,11,14);
      	$pdf_tableheader=array('IDPIANTA','SPECIE','REM_MORT','ASS_CROWN','TRASPAR','FRUTTIF','DENDROT','DIAM1','DIAM2','DIST','AZIMUT','IDSINTOMO','PARTE','TIPOSINT','ETADANNO','AGENTE','AG_NOME','AG_DIFF','CHIOMA_V');
		$pdf_tabledata=array();
		
		try
		{
			$sql_query = "SELECT ANNO_RILIEVI FROM conecofor_general";
			$anno_rilievi = "";
            foreach ($this->dbh->query($sql_query, PDO::FETCH_ASSOC) as $row){
		    		$anno_rilievi = $row['ANNO_RILIEVI'];
		    }
            $sql_query= "";
            $sql_query = $sql_query ."SELECT ";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_PIANTE.".IDAREA,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_PIANTE.".IDPIANTA,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_PIANTE.".SPECIE,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_PIANTE.".REM_MORT,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_PIANTE.".ASS_CROWN,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_PIANTE.".TRASPAR,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_PIANTE.".FRUTTIF,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_PIANTE.".DENDROT,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_PIANTE.".DIAM1,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_PIANTE.".DIAM2,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_PIANTE.".DIST,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_PIANTE.".AZIMUT,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_SINTOMI.".IDSINTOMO,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_SINTOMI.".PARTE,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_SINTOMI.".TIPOSINT,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_SINTOMI.".ETADANNO,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_SINTOMI.".AGENTE,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_SINTOMI.".AG_NOME,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_SINTOMI.".AG_DIFF,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_SINTOMI.".CHIOMA_V,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_SINTOMI.".NOTE ";
            $sql_query = $sql_query ." FROM ".DB_TABLE_CONECOFOR_PIANTE. " LEFT JOIN ".DB_TABLE_CONECOFOR_SINTOMI." ";
            $sql_query = $sql_query ." ON (".DB_TABLE_CONECOFOR_PIANTE.".IDPIANTA = ".DB_TABLE_CONECOFOR_SINTOMI.".IDPIANTA) AND (".DB_TABLE_CONECOFOR_PIANTE.".IDAREA = ".DB_TABLE_CONECOFOR_SINTOMI.".IDAREA) AND (".DB_TABLE_CONECOFOR_PIANTE.".ANNO_RIL = ".DB_TABLE_CONECOFOR_SINTOMI.".ANNO_RIL)";
            $sql_query = $sql_query ." WHERE ( ( ".DB_TABLE_CONECOFOR_PIANTE.".IDAREA ='".$_SESSION['conecofor_select_idarea']."') AND ( ".DB_TABLE_CONECOFOR_PIANTE.".ANNO_RIL = ".$anno_rilievi." ) )";
            $sql_query = $sql_query ." ORDER BY  ".DB_TABLE_CONECOFOR_PIANTE.".IDPIANTA, ".DB_TABLE_CONECOFOR_SINTOMI.".IDSINTOMO ASC ;";
            $last_idpianta ='';
            
            
            foreach ($this->dbh->query($sql_query, PDO::FETCH_ASSOC) as $row)
		    {
                
                $current_idpianta = $row['IDPIANTA'];
                if($current_idpianta==$last_idpianta){
                	$pdf_tabledata[]=array(' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',$row['IDSINTOMO'],$row['PARTE'],$row['TIPOSINT'],$row['ETADANNO'],$row['AGENTE'],$row['AG_NOME'],$row['AG_DIFF'],$row['CHIOMA_V']);
                }else{
                	$last_idpianta=$current_idpianta;
                    $pdf_tabledata[]=array($row['IDPIANTA'],$row['SPECIE'],$row['REM_MORT'],$row['ASS_CROWN'],$row['TRASPAR'],$row['FRUTTIF'],$row['DENDROT'],$row['DIAM1'],$row['DIAM2'],$row['DIST'],$row['AZIMUT'],$row['IDSINTOMO'],$row['PARTE'],$row['TIPOSINT'],$row['ETADANNO'],$row['AGENTE'],$row['AG_NOME'],$row['AG_DIFF'],$row['CHIOMA_V']);
                }
  		    }
            
			
		}
		catch(PDOException $e)
		{
		    echo 'Error: ' . $e->getMessage() . "\n";
		}
		
		$pdf->BasicTable($pdf_tablewidth,$pdf_tableheader,$pdf_tabledata,5);
		
		//add area table	
		$pdf->AddPage();
		$pdf->Ln();
		$pdf->SetFont('','B',10);$pdf->Cell(15);
		$pdf->Cell(160,10,"TABELLA DATI PIANTE CAVALLETTAMENTO");
		$pdf->SetFont('','',8);
		$pdf->Ln();
		
		$pdf->SetFont('','',6);
		
		
		$pdf_tablewidth=array(12,12,12,12,12,12,12);
      	$pdf_tableheader=array('IDPIANTA','SPECIE','DIAM1','DIAM2','DENDROT','RIL_H','H');
      	$pdf_tabledata=array();
		
		try
		{
			$sql_query = "SELECT ANNO_RILIEVI FROM conecofor_general";
			$anno_rilievi = "";
            foreach ($this->dbh->query($sql_query, PDO::FETCH_ASSOC) as $row){
		    		$anno_rilievi = $row['ANNO_RILIEVI'];
		    }
            $sql_query= "";
            $sql_query = $sql_query ."SELECT ";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_CAV.".IDAREA,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_CAV.".IDPIANTA,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_CAV.".SPECIE,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_CAV.".DIAM1,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_CAV.".DIAM2,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_CAV.".DENDROT,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_CAV.".RIL_H,";
            $sql_query = $sql_query .DB_TABLE_CONECOFOR_CAV.".H ";
            
            $sql_query = $sql_query ." FROM ". DB_TABLE_CONECOFOR_CAV;
            $sql_query = $sql_query ." WHERE ( ( ".DB_TABLE_CONECOFOR_CAV.".IDAREA ='".$_SESSION['conecofor_select_idarea']."') AND ( ".DB_TABLE_CONECOFOR_CAV.".ANNO_RIL = ".$anno_rilievi." ) );";
		   
		   
            foreach ($this->dbh->query($sql_query, PDO::FETCH_ASSOC) as $row)
		    {
                $pdf_tabledata[]=array($row['IDPIANTA'],$row['SPECIE'],$row['DIAM1'],$row['DIAM2'],$row['DENDROT'],$row['RIL_H'],$row['H']);                
		    }
            
			
		}
		catch(PDOException $e)
		{
		    echo 'Error: ' . $e->getMessage() . "\n";
		}

		
		$pdf->BasicTable($pdf_tablewidth,$pdf_tableheader,$pdf_tabledata,5);
				
	    
	    $pdf_created = True;
    	
    	if ($pdf_created){
			$pdf->Output($id_area.'_conecofor_report.pdf','D');		
		}
    
    }
    
    function confirm_delete_area(){
   		echo '<FORM name="conecofor_area_'.$_SESSION['conecofor_select_idarea'].'_confirm_delete_form" enctype="multipart/form-data" action="'.$_SERVER['PHP_SELF'].'" method="post">';
		echo 'Confermi la cancellazione dell\'area '.$_SESSION["conecofor_select_idarea"].'? <BR>';
		echo '<INPUT TYPE=SUBMIT NAME="confirm_delete_checkout" VALUE="SI">';
		echo '<INPUT TYPE=SUBMIT NAME="confirm_delete_checkout" VALUE="NO">';
		echo '</FORM>';
    }
    
    function execute_delete_area($verbose=true){
    	
	    echo  '<FORM name="conecofor_back" enctype="multipart/form-data" action="'.$_SERVER['PHP_SELF'].'" method="post" style="border: 0px; padding: 0px;">';
		echo  '<INPUT TYPE=HIDDEN NAME="conecofor_back_select_area" VALUE="true">';
		echo 'Torna alla lista aree inserite &nbsp;';
        echo  '<INPUT type="image" src="images/next.png" name="conecofor_next_image" style="width: 15px; height: 15px;"/>';
		echo  '</FORM>';
	    
		
		$sql_query = "SELECT ANNO_RILIEVI FROM conecofor_general";
		$anno_rilievi = "";
        foreach ($this->dbh->query($sql_query, PDO::FETCH_ASSOC) as $row){
	    		$anno_rilievi = $row['ANNO_RILIEVI'];
	    }
		
	    // cancellazione dei dati area
	    $sql_query = sprintf("DELETE FROM ".DB_TABLE_CONECOFOR_AREE." WHERE ( IDAREA ='".$_SESSION["conecofor_select_idarea"]."' AND ANNO_RIL =".$anno_rilievi." )");
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
	    $sql_query = sprintf("DELETE FROM ".DB_TABLE_CONECOFOR_PIANTE." WHERE ( IDAREA ='".$_SESSION["conecofor_select_idarea"]."' AND ANNO_RIL =".$anno_rilievi." )");   
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
	    $sql_query = sprintf("DELETE FROM ".DB_TABLE_CONECOFOR_SINTOMI." WHERE ( IDAREA ='".$_SESSION["conecofor_select_idarea"]."' AND ANNO_RIL =".$anno_rilievi." )");   
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
	    $sql_query = sprintf("DELETE FROM ".DB_TABLE_CONECOFOR_CAV." WHERE ( IDAREA ='".$_SESSION["conecofor_select_idarea"]."' AND ANNO_RIL =".$anno_rilievi." )" );   
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
