<?php

error_reporting (E_ALL); // I use this only for testing
require("/web/htdocs/www.f360.it/home/conecofor_webdb/db_config13fgt5467.php"); // this path works for me...

/************************************************************
DBF reader Class v0.04  by Faro K Rasyid (Orca)
orca75_at_dotgeek_dot_org
v0.05 by Nicholas Vrtis
vrtis_at_vrtisworks_dot_com
1) changed to not read in complete file at creation.
2) added function to read individual rows
3) added support for Memo fields in dbt files.
4) See: http://www.clicketyclick.dk/databases/xbase/format/dbf.html#DBF_STRUCT
   for some additional information on XBase structure...
5) NOTE: the whole file (and the memo file) is read in at once.  So this could
   take a lot of memory for large files.

Input		: name of the DBF( dBase III plus) file
Output	:	- dbf_num_rec, the number of records
			- dbf_num_field, the number of fields
			- dbf_names, array of field information ('name', 'len', 'type')

Usage	example:
$file= "your_file.dbf";//WARNING !!! CASE SENSITIVE APPLIED !!!!!
$dbf = new dbf_class($file);
$num_rec=$dbf->dbf_num_rec;
$num_field=$dbf->dbf_num_field;

for($i=0; $i<$num_rec; $i++){
    $row = $dbf->getRow($i);
	for($j=0; $j<$num_field; $j++){
		echo $row[$j].' ');
	}
	echo('<br>');
}

Thanks to :
- Willy
- Miryadi

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 
See the GNU  Lesser General Public License for more details.
  
**************************************************************/ 
class dbf_class {
		
    var $dbf_num_rec;           //Number of records in the file
    var $dbf_num_field;         //Number of columns in each row
    var $dbf_names = array();   //Information on each column ['name'],['len'],['type']
    //These are private....
    var $_raw;               //The raw input file
    var $_rowsize;           //Length of each row
    var $_hdrsize;           //Length of the header information (offset to 1st record)
    var $_memos;             //The raw memo file (if there is one).
    
    private $dbh;

    function dbf_class($filename) {
        if ( !file_exists($filename)) {
            echo 'Not a valid DBF file !!!'; exit;
        }
        $tail=substr($filename,-4);
        if (strcasecmp($tail, '.dbf')!=0) {
            echo 'Not a valid DBF file !!!'; exit;
        }
				
        //Read the File
        $handle = fopen($filename, "r");
        if (!$handle) { echo "Cannot read DBF file"; exit; }
        $filesize = filesize($filename);
        $this->_raw = fread ($handle, $filesize);
        fclose ($handle);
        //Make sure that we indeed have a dbf file...
        if(!(ord($this->_raw[0]) == 3 || ord($this->_raw[0]) == 131) && ord($this->_raw[$filesize]) != 26) {
            echo 'Not a valid DBF file !!!'; exit;
        }
        // 3= file without DBT memo file; 131 ($83)= file with a DBT.
        $arrHeaderHex = array();
        for($i=0; $i<32; $i++){
            $arrHeaderHex[$i] = str_pad(dechex(ord($this->_raw[$i]) ), 2, "0", STR_PAD_LEFT);
        }
        //Initial information
        $line = 32;//Header Size
        //Number of records
        $this->dbf_num_rec=  hexdec($arrHeaderHex[7].$arrHeaderHex[6].$arrHeaderHex[5].$arrHeaderHex[4]);
        $this->_hdrsize= hexdec($arrHeaderHex[9].$arrHeaderHex[8]);//Header Size+Field Descriptor
        //Number of fields
        $this->_rowsize = hexdec($arrHeaderHex[11].$arrHeaderHex[10]);
		$this->dbf_num_field = floor(($this->_hdrsize - $line ) / $line ) ;//Number of Fields
				
        //Field properties retrieval looping
        for($j=0; $j<$this->dbf_num_field; $j++){
            $name = '';
            $beg = $j*$line+$line;
            for($k=$beg; $k<$beg+11; $k++){
                if(ord($this->_raw[$k])!=0){
                    $name .= $this->_raw[$k];
                }
            }
            $this->dbf_names[$j]['name']= $name;//Name of the Field
            $this->dbf_names[$j]['len']= ord($this->_raw[$beg+16]);//Length of the field
            $this->dbf_names[$j]['type']= $this->_raw[$beg+11];
        }
        if (ord($this->_raw[0])==131) { //See if this has a memo file with it...
            //Read the File
            $tail=substr($tail,-1,1);   //Get the last character...
            if ($tail=='F'){            //See if upper or lower case
                $tail='T';              //Keep the case the same
            } else {
                $tail='t';
            }
            $memoname = substr($filename,0,strlen($filename)-1).$tail;
            $handle = fopen($memoname, "r");
            if (!$handle) { echo "Cannot read DBT file"; exit; }
            $filesize = filesize($memoname);
            $this->_memos = fread ($handle, $filesize);
            fclose ($handle);
        }
    }
    
    function getRow($recnum) {
        $memoeot = chr(26).chr(26);
        $rawrow = substr($this->_raw,$recnum*$this->_rowsize+$this->_hdrsize,$this->_rowsize);
        $rowrecs = array();
        $beg=1;
        if (ord($rawrow[0])==42) {
            return false;   //Record is deleted...
        }
        for ($i=0; $i<$this->dbf_num_field; $i++) {
            $col=trim(substr($rawrow,$beg,$this->dbf_names[$i]['len']));
            if ($this->dbf_names[$i]['type']!='M') {
                $rowrecs[]=$col;
            } else {
                $memobeg=$col*512;  //Find start of the memo block (0=header so it works)
                $memoend=strpos($this->_memos,$memoeot,$memobeg);   //Find the end of the memo
                $rowrecs[]=substr($this->_memos,$memobeg,$memoend-$memobeg);
            }
            $beg+=$this->dbf_names[$i]['len'];
        }
        return $rowrecs;
    }
    
    function getRowAssoc($recnum) {
        $rawrow = substr($this->_raw,$recnum*$this->_rowsize+$this->_hdrsize,$this->_rowsize);
        $rowrecs = array();
        $beg=1;
        if (ord($rawrow[0])==42) {
            return false;   //Record is deleted...
        }
        for ($i=0; $i<$this->dbf_num_field; $i++) {
            $col=trim(substr($rawrow,$beg,$this->dbf_names[$i]['len']));
            if ($this->dbf_names[$i]['type']!='M') {
                $rowrecs[$this->dbf_names[$i]['name']]=$col;
            } else {
                $memobeg=$col*512;  //Find start of the memo block (0=header so it works)
                $memoend=strpos($this->_memos,$memoeot,$memobeg);   //Find the end of the memo
                $rowrecs[$this->dbf_names[$i]['name']]=substr($this->_memos,$memobeg,$memoend-$memobeg);
            }
            $beg+=$this->dbf_names[$i]['len'];
        }
        return $rowrecs;
    }
}
//End of Class

class timerClass {
	var $startTime;
	var $started;
	function timerClass($start=true) {
		$this->started = false;
		if ($start)
			$this->start();
	}
	function start() {
		$startMtime = explode(' ',microtime());
		$this->startTime = (double)($startMtime[0])+(double)($startMtime[1]);
		$this->started = true;
	}
	function end($iterations=1) {
		$endMtime = explode(' ',microtime());
		if ($this->started) {
			$endTime = (double)($endMtime[0])+(double)($endMtime[1]);
			$dur = $endTime - $this->startTime;
			$avg = 1000*$dur/$iterations;
			$avg = round(1000*$avg)/1000;
			return "$avg milliseconds";
		} else {
			return "timer not started";
		}
	}
}
//End of Class

//file upload function
//check that we have a file

class conecofor_check_class {
	
	var $conn_str;

    function conecofor_check_class(){
    	
		if (isset($_POST['idarea_upload'])) {
			$_SESSION['conecofor_upload_status'] = "CONFIRM_UPLOAD_AREA";
			$_SESSION['conecofor_upload_idarea'] = $_POST['idarea_upload'];
		} elseif (isset($_POST['confirm_upload_checkout'])) {
			if($_POST['confirm_upload_checkout']=='SI'){
				$_SESSION['conecofor_upload_status'] = "EXECUTE_UPLOAD_AREA";
			} else {
				$_SESSION['conecofor_upload_status'] = "OK2CHECK";
				$_SESSION['conecofor_upload_idarea'] = "";
			}
		} elseif (isset($_POST['idarea_delete'])) {
			$_SESSION['conecofor_upload_status'] = "CONFIRM_DELETE_AREA";
			$_SESSION['conecofor_upload_idarea'] = $_POST['idarea_delete'];
		} elseif (isset($_POST['confirm_delete_checkout'])) {
			if($_POST['confirm_delete_checkout']=='SI'){
				$_SESSION['conecofor_upload_status'] = "EXECUTE_DELETE_AREA";
			} else {
				$_SESSION['conecofor_upload_status'] = "OK2CHECK";
				$_SESSION['conecofor_upload_idarea'] = "";
			}
		} elseif (isset($_POST['back_2_check'])) {
			$_SESSION['conecofor_upload_status'] = "OK2CHECK";
			$_SESSION['conecofor_upload_idarea'] = "";
		}
    	
    	echo 'IDSQUADRA '.$_SESSION['conecofor_idsquadra'];
    	
    	$this->connect_db();
    	
    	switch ($_SESSION['conecofor_upload_status']){
		    case 'OK2CHECK':
		        $this->ok2check();
		        break;
		    case 'CONFIRM_UPLOAD_AREA':
		    	$this->confirm_upload_area();
		     	break;
		    case 'EXECUTE_UPLOAD_AREA':
		    	$this->execute_upload_area();
		     	break;
		    case 'CONFIRM_DELETE_AREA':
		    	$this->confirm_delete_area();
		     	break;
		    case 'EXECUTE_DELETE_AREA':
		    	$this->execute_delete_area();
		     	break; 
    	}
	}
	
	function ok2check(){
      	
	    $aree_dbf = new dbf_class($_SESSION['conecofor_aree_dbf_filepath']);
	    $aree_num_rec=$aree_dbf->dbf_num_rec;
	    $aree_field_num=$aree_dbf->dbf_num_field;
	   
	    $piante_dbf = new dbf_class($_SESSION['conecofor_piante_dbf_filepath']);
	    $piante_num_rec=$piante_dbf->dbf_num_rec;
	    $piante_field_num=$piante_dbf->dbf_num_field;
	    
	    $sintomi_dbf = new dbf_class($_SESSION['conecofor_sintomi_dbf_filepath']);
	    $sintomi_num_rec=$sintomi_dbf->dbf_num_rec;
	    $sintomi_field_num=$sintomi_dbf->dbf_num_field;
	    
	    $cav_dbf = new dbf_class($_SESSION['conecofor_cav_dbf_filepath']);
	    $cav_num_rec=$cav_dbf->dbf_num_rec;
	    $cav_field_num=$cav_dbf->dbf_num_field;
	    
	    //print area table column names
	    echo('<table border=1 cellspacing=0>');
	    echo('<tr>');	
	    echo '<td>&nbsp;'.$aree_dbf->dbf_names[0]['name'].'&nbsp;</td>';
	    echo '<td>&nbsp;'.$aree_dbf->dbf_names[1]['name'].'&nbsp;</td>';
	    echo '<td>&nbsp;'.$aree_dbf->dbf_names[3]['name'].'&nbsp;</td>';
	    echo '<td>&nbsp;'.$aree_dbf->dbf_names[4]['name'].'&nbsp;</td>';
	    echo '<td>&nbsp;'.$aree_dbf->dbf_names[5]['name'].'&nbsp;</td>';
	    echo '<td>&nbsp;'.$aree_dbf->dbf_names[6]['name'].'&nbsp;</td>';
	    echo '<td>&nbsp;'.'N piante'.'&nbsp;</td>';
	    echo '<td>&nbsp;'.'N sintomi'.'&nbsp;</td>';
	    echo '<td>&nbsp;'.'N piante cav'.'&nbsp;</td>';
	    echo '<td>&nbsp;'.'Inserito'.'&nbsp;</td>';
	    echo '<td>&nbsp;'.'Azione'.'&nbsp;</td>';
	    echo '<td>&nbsp;'.'Note'.'&nbsp;</td>';
	    echo '</tr>';
	    //print area summary
	    for($i=0; $i<$aree_num_rec; $i++){
	        if ($row = $aree_dbf->getRow($i)) {
	        	// if area is valid (idonietà == 1)
	        	if($row[5]==1){
			        echo('<tr>');
			        echo '<td >'.htmlentities($row[0]).'&nbsp;</td>';
			        echo '<td >'.htmlentities($row[1]).'&nbsp;</td>';
			        echo '<td >'.htmlentities($row[3]).'&nbsp;</td>';
			        echo '<td >'.htmlentities($row[4]).'&nbsp;</td>';
			        echo '<td >'.htmlentities($row[5]).'&nbsp;</td>';
			        echo '<td >'.htmlentities($row[6]).'&nbsp;</td>';
			        //calculate the number of piante,sintomi,cav for current the area
			        $curr_idarea = $row[0];
			        $num_piante = 0;
			        for($i_piante=0; $i_piante<$piante_num_rec; $i_piante++){
				        if ($row_piante = $piante_dbf->getRow($i_piante)) {
	        				if($row_piante[0]==$curr_idarea){
	        					$num_piante = $num_piante +1;
	        				}
				        }
			        }
					echo '<td >'.htmlentities($num_piante).'&nbsp;</td>';
					
					$num_sintomi = 0;
			        for($i_sintomi=0; $i_sintomi<$sintomi_num_rec; $i_sintomi++){
				        if ($row_sintomi = $sintomi_dbf->getRow($i_sintomi)) {
	        				if($row_sintomi[0]==$curr_idarea){
	        					$num_sintomi = $num_sintomi +1;
	        				}
				        }
			        } 
					echo '<td >'.htmlentities($num_sintomi).'&nbsp;</td>';
					
					$num_cav = 0;
			        for($i_cav=0; $i_cav<$cav_num_rec; $i_cav++){
				        if ($row_cav = $cav_dbf->getRow($i_cav)) {
	        				if($row_cav[0]==$curr_idarea){
	        					$num_cav = $num_cav +1;
	        				}
				        }
			        }
					echo '<td >'.htmlentities($num_cav).'&nbsp;</td>';
					
					//determine if the area is already present in the upload table
					$sql_query = sprintf("SELECT IDAREA,IDSQUADRA FROM %s WHERE IDAREA = '%s' ", DB_TABLE_CONECOFOR_AREE, $curr_idarea);
					$query_result = $this->dbh->query($sql_query);
					$fetch_rows = $query_result->fetchAll();
					$fetch_numrows = count($fetch_rows);
					
					if ($fetch_numrows==1) {
						echo '<td ><img src="images/ok.png"></td>';
						if ($fetch_rows[0][1] == $_SESSION['conecofor_idsquadra']){
							echo '<td >';
							echo '<FORM name="conecofor_area_'.$curr_idarea.'_delete_form" enctype="multipart/form-data" action="'.$_SERVER['PHP_SELF'].'" method="post">';
							echo '<INPUT TYPE=HIDDEN NAME="idarea_delete" VALUE="'.$curr_idarea.'">';
							echo '<INPUT type="image" src="images/recycle_bin.png" name="conecofor_area_delete" />';
							echo '</FORM>';
							echo '</td >';
							echo '<td>&nbsp;</td>';
						} else {
							echo '<td >';
							echo '<img src="images/warning.png">';
							echo '</td>';
							echo '<td>L\'area è già stata inserita dalla squadra '.$fetch_rows[0][1].'</td>';
						}
								
					} else {
						echo '<td >&nbsp;</td>';
						echo '<td >';
						echo '<FORM name="conecofor_area_'.$curr_idarea.'_upload_form" enctype="multipart/form-data" action="'.$_SERVER['PHP_SELF'].'" method="post">';
						echo '<INPUT TYPE=HIDDEN NAME="idarea_upload" VALUE="'.$curr_idarea.'">';
						echo '<INPUT type="image" src="images/upload.png" name="conecofor_area_upload" />';
						echo '</FORM>';
						echo '</td>';		
						echo '</td >';
						echo '<td>&nbsp;</td>';

					}
					
					
					
		        	echo '</tr>';
	        	}
	        }
	    }
	    echo('</table>');
      	
    }
    
    function confirm_upload_area(){
   		echo '<FORM name="conecofor_area_'.$_SESSION['conecofor_upload_idarea'].'_confirm_upload_form" enctype="multipart/form-data" action="'.$_SERVER['PHP_SELF'].'" method="post">';
		echo 'Confermi l\'invio dell\'area '.$_SESSION["conecofor_upload_idarea"].'? <BR>';
		echo '<INPUT TYPE=SUBMIT NAME="confirm_upload_checkout" VALUE="SI">';
		echo '<INPUT TYPE=SUBMIT NAME="confirm_upload_checkout" VALUE="NO">';
		echo '</FORM>';
    }
    
    
    function execute_upload_area(){
    	echo '<FORM name="conecofor_area_uploaded_form" enctype="multipart/form-data" action="'.$_SERVER['PHP_SELF'].'" method="post">';
		echo '<INPUT TYPE=SUBMIT NAME="back_2_check" VALUE="Indietro">';
		echo '</FORM>';
		
	    $aree_dbf = new dbf_class($_SESSION['conecofor_aree_dbf_filepath']);
	    $aree_num_rec=$aree_dbf->dbf_num_rec;
	    $aree_field_num=$aree_dbf->dbf_num_field;
	   
	    $piante_dbf = new dbf_class($_SESSION['conecofor_piante_dbf_filepath']);
	    $piante_num_rec=$piante_dbf->dbf_num_rec;
	    $piante_field_num=$piante_dbf->dbf_num_field;
	    
	    $sintomi_dbf = new dbf_class($_SESSION['conecofor_sintomi_dbf_filepath']);
	    $sintomi_num_rec=$sintomi_dbf->dbf_num_rec;
	    $sintomi_field_num=$sintomi_dbf->dbf_num_field;
	    
	    $cav_dbf = new dbf_class($_SESSION['conecofor_cav_dbf_filepath']);
	    $cav_num_rec=$cav_dbf->dbf_num_rec;
	    $cav_field_num=$cav_dbf->dbf_num_field;
	    $sql_query = "";
	    
	    //insert table area
	   		
		//prepare question marks array and fieldname array
		$question_marks_array = array();
		$fieldname_array = array();
        for($j=0; $j<$aree_field_num; $j++){
            $question_marks_array[] = "?";
            $fieldname_array[] = $aree_dbf->dbf_names[$j]['name'];
        }
        //add IDSQUADRA e DATEUP fields
     	$question_marks_array[] = "?";
        $fieldname_array[] = "IDSQUADRA";
        $question_marks_array[] = "?";
        $fieldname_array[] = "DATAUP";
        
        //create the insert query
	    $sql = "INSERT INTO ".DB_TABLE_CONECOFOR_AREE." (" . implode(',', $fieldname_array) . ") VALUES (" . implode(',', $question_marks_array).");";
	    $stmt = $this->dbh->prepare($sql);
	    for($i=0; $i<$aree_num_rec; $i++){
	        if ($row = $aree_dbf->getRow($i)) {
	            // if idarea is selecetd to upload
	        	if($row[0]==$_SESSION["conecofor_upload_idarea"]) {	
					try {
						//add the IDSQUADRA e the current date of upload to the array of values
						$row[]=$_SESSION['conecofor_idsquadra'];
						$row[]=date("Ymd");
					    $stmt->execute($row);
					    
					} catch (PDOException $e){
						echo '<br> Upload dei dati area non riuscito';
					    echo $e->getMessage();
					    $this->execute_delete_area(false);
					}
	        	}
	        }
	    }
		echo '<br> Upload dei dati area completato';
		
		//insert piante area
		
		//prepare question marks array and fieldname array
		$question_marks_array = array();
		$fieldname_array = array();
        for($j=0; $j<$piante_field_num; $j++){
            $question_marks_array[] = "?";
            $fieldname_array[] = $piante_dbf->dbf_names[$j]['name'];
        }
        //create the insert query
	    $sql = "INSERT INTO ".DB_TABLE_CONECOFOR_PIANTE." (" . implode(',', $fieldname_array) . ") VALUES (" . implode(',', $question_marks_array).");";
	    $stmt = $this->dbh->prepare($sql);
	    for($i=0; $i<$piante_num_rec; $i++){
	        if ($row = $piante_dbf->getRow($i)) {
	            // if idarea is selecetd to upload
	        	if($row[0]==$_SESSION["conecofor_upload_idarea"]) {	
					try {
					    $stmt->execute($row);
					    
					} catch (PDOException $e){
						echo '<br> Upload dei dati piante non riuscito';
					    echo $e->getMessage();
					    $this->execute_delete_area(false);
					}
	        	}
	        }
	    }
	    echo '<br> Upload dei dati piante completato';
	    //insert sintomi area
		
		//prepare question marks array and fieldname array
		$question_marks_array = array();
		$fieldname_array = array();
        for($j=0; $j<$sintomi_field_num; $j++){
            $question_marks_array[] = "?";
            $fieldname_array[] = $sintomi_dbf->dbf_names[$j]['name'];
        }
        //create the insert query
	    $sql = "INSERT INTO ".DB_TABLE_CONECOFOR_SINTOMI." (" . implode(',', $fieldname_array) . ") VALUES (" . implode(',', $question_marks_array).");";
	    $stmt = $this->dbh->prepare($sql);
	    for($i=0; $i<$sintomi_num_rec; $i++){
	        if ($row = $sintomi_dbf->getRow($i)) {
	            // if idarea is selecetd to upload
	        	if($row[0]==$_SESSION["conecofor_upload_idarea"]) {	
					try {
					    $stmt->execute($row);
					    
					} catch (PDOException $e){
						echo '<br> Upload dei dati sintomi non riuscito';
					    echo $e->getMessage();
					    $this->execute_delete_area(false);
					}
	        	}
	        }
	    }
		echo '<br> Upload dei dati sintomi completato';
		//insert cav area
		
		//prepare question marks array and fieldname array
		$question_marks_array = array();
		$fieldname_array = array();
        for($j=0; $j<$cav_field_num; $j++){
            $question_marks_array[] = "?";
            $fieldname_array[] = $cav_dbf->dbf_names[$j]['name'];
        }
        //create the insert query
	    $sql = "INSERT INTO ".DB_TABLE_CONECOFOR_CAV." (" . implode(',', $fieldname_array) . ") VALUES (" . implode(',', $question_marks_array).");";
	    $stmt = $this->dbh->prepare($sql);
	    for($i=0; $i<$cav_num_rec; $i++){
	        if ($row = $cav_dbf->getRow($i)) {
	            // if idarea is selecetd to upload
	        	if($row[0]==$_SESSION["conecofor_upload_idarea"]) {	
					try {
					    $stmt->execute($row);
					    
					} catch (PDOException $e){
						echo '<br> Upload dei dati cav non riuscito';
					    echo $e->getMessage();
					    $this->execute_delete_area(false);
					}
	        	}
	        }
	    }		
		echo '<br> Upload dei dati cav completato';
    }
    
    function confirm_delete_area(){
   		echo '<FORM name="conecofor_area_'.$_SESSION['conecofor_upload_idarea'].'_confirm_delete_form" enctype="multipart/form-data" action="'.$_SERVER['PHP_SELF'].'" method="post">';
		echo 'Confermi la cancellazione dell\'area '.$_SESSION["conecofor_upload_idarea"].'? <BR>';
		echo '<INPUT TYPE=SUBMIT NAME="confirm_delete_checkout" VALUE="SI">';
		echo '<INPUT TYPE=SUBMIT NAME="confirm_delete_checkout" VALUE="NO">';
		echo '</FORM>';
    }
    
    function execute_delete_area($verbose=true){
    	
	    echo '<FORM name="conecofor_area_uploaded_form" enctype="multipart/form-data" action="'.$_SERVER['PHP_SELF'].'" method="post">';
		echo '<INPUT TYPE=SUBMIT NAME="back_2_check" VALUE="Indietro">';
		echo '</FORM>';	
	    
	    // cancellazione dei dati area
	    $sql_query = sprintf("DELETE FROM %s WHERE IDAREA ='%s'", DB_TABLE_CONECOFOR_AREE,$_SESSION["conecofor_upload_idarea"]);
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
	    $sql_query = sprintf("DELETE FROM %s WHERE IDAREA ='%s'", DB_TABLE_CONECOFOR_PIANTE,$_SESSION["conecofor_upload_idarea"]);   
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
	    $sql_query = sprintf("DELETE FROM %s WHERE IDAREA ='%s'", DB_TABLE_CONECOFOR_SINTOMI,$_SESSION["conecofor_upload_idarea"]);   
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
	    $sql_query = sprintf("DELETE FROM %s WHERE IDAREA ='%s'", DB_TABLE_CONECOFOR_CAV,$_SESSION["conecofor_upload_idarea"]);   
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
    	

}
//End of Class
?>
