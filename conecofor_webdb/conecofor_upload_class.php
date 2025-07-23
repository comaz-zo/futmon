<?php

error_reporting (E_ALL); // I use this only for testing
//require("/web/htdocs/www.f360.it/home/conecofor_webdb/db_config13fgt5467.php"); // this path works for me...

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

    function dbf_class($filename) {
        if ( !file_exists($filename)) {
            echo $filename.' DBF file not exists!!!'; exit;
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

class conecofor_upload_class {
	
	var $conn_str;
	var $dbh;

    var $conecofor_aree_dbf_filepath;
    var $conecofor_piante_dbf_filepath;
    var $conecofor_sintomi_dbf_filepath;
    var $conecofor_cav_dbf_filepath;
    
    var $conecofor_aree_dbf_insert_flag;
    var $conecofor_piante_dbf_insert_flag;
    var $conecofor_sintomi_dbf_insert_flag;
    var $conecofor_cav_dbf_insert_flag;
    
    var $conecofor_aree_dbf_insert_msg;
    var $conecofor_piante_dbf_insert_msg;
    var $conecofor_sintomi_dbf_insert_msg;
    var $conecofor_cav_dbf_insert_msg;
    
    function conecofor_upload_class(){
    	
    	$this->connect_db();
    
    	$this->conecofor_aree_dbf_filepath="";
        $this->conecofor_piante_dbf_filepath="";
        $this->conecofor_sintomi_dbf_filepath="";
        $this->conecofor_cav_dbf_filepath="";
        
        $this->conecofor_aree_dbf_insert_flag=-1;
        $this->conecofor_piante_dbf_insert_flag=-1;
        $this->conecofor_sintomi_dbf_insert_flag=-1;
        $this->conecofor_cav_dbf_insert_flag=-1;
        
        $this->conecofor_aree_dbf_insert_msg="";
        $this->conecofor_piante_dbf_insert_msg="";
        $this->conecofor_sintomi_dbf_insert_msg="";
        $this->conecofor_cav_dbf_insert_msg="";
    	
	   	if(!isset($_SESSION['conecofor_upload_status'])){
	   		$_SESSION['conecofor_upload_status'] = "READY2CHECK";
		}
		
		if (isset($_POST['conecofor_dbf_check'])) {
			$this->conecofor_files_dbf_check($_POST,$_FILES);
		} elseif (isset($_POST['conecofor_dbf_checked'])) {
			$_SESSION['conecofor_upload_status'] = "READY2UPLOAD";
			$_SESSION['conecofor_upload_idarea'] = "";
		} elseif (isset($_POST['idarea_upload'])) {
			$_SESSION['conecofor_upload_status'] = "CONFIRM_UPLOAD_AREA";
			$_SESSION['conecofor_upload_idarea'] = $_POST['idarea_upload'];
		} elseif (isset($_POST['confirm_upload_checkout'])) {
			if($_POST['confirm_upload_checkout']=='SI'){
				$_SESSION['conecofor_upload_status'] = "EXECUTE_UPLOAD_AREA";
			} else {
				$_SESSION['conecofor_upload_status'] = "READY2UPLOAD";
				$_SESSION['conecofor_upload_idarea'] = "";
			}
		} elseif (isset($_POST['idarea_delete'])) {
			$_SESSION['conecofor_upload_status'] = "CONFIRM_DELETE_AREA";
			$_SESSION['conecofor_upload_idarea'] = $_POST['idarea_delete'];
		} elseif (isset($_POST['confirm_delete_checkout'])) {
			if($_POST['confirm_delete_checkout']=='SI'){
				$_SESSION['conecofor_upload_status'] = "EXECUTE_DELETE_AREA";
			} else {
				$_SESSION['conecofor_upload_status'] = "READY2UPLOAD";
				$_SESSION['conecofor_upload_idarea'] = "";
			}
		} elseif (isset($_POST['back_2_check'])) {
			$_SESSION['conecofor_upload_status'] = "READY2UPLOAD";
			$_SESSION['conecofor_upload_idarea'] = "";
		}
    	
    }
    
    function print_title(){
    	$html_string = '';
    	$html_string = $html_string . '<table width="100%" border="0" cellpadding="0" cellspacing="0" style="vertical-align: center;">';
		$html_string = $html_string . '<tr>';
		$html_string = $html_string . '<td align="left" style="text-align=right;">';
    	$html_string = $html_string . '<a href="conecofor_menu.php"><img src="images/previous.png" border="0" style="width: 15px; height: 15px;"></a>';
    	$html_string = $html_string . '</td>';
		$html_string = $html_string . '<td align="left" style="text-align=left;">';
    	$html_string = $html_string . '<b>Carica le aree dai file DBF nel web database</b>';
    	$html_string = $html_string . '</td>';
    	
		$html_string = $html_string . '</tr>';
		$html_string = $html_string . '</table>';
    	
    	echo $html_string;

    }
    
    function print_upload_form(){
    	switch ($_SESSION['conecofor_upload_status']){
    		case 'READY2CHECK';
    			$this->ready2check();
		        break;
		    case 'CHECKED';
    			$this->checked();
		        break;    
		    case 'READY2UPLOAD':
		        $this->ready2upload();
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
    function ready2check(){
        
        $sql_query = "SELECT ANNO_RILIEVI FROM conecofor_general";
        $anno_rilievi = "";
        foreach ($this->dbh->query($sql_query, PDO::FETCH_ASSOC) as $row){
            $anno_rilievi = $row['ANNO_RILIEVI'];
        }
        
    	$html_string = "";
		
		$html_string = $html_string . '<form name="conecofor_aree_dbf_upload_form" enctype="multipart/form-data" action="';
		$html_string = $html_string . $_SERVER['PHP_SELF'];
		$html_string = $html_string . '" method="post">';
        $html_string = $html_string . '<table id="hor-zebra">';
        $html_string = $html_string . '    <tbody>';		
        $html_string = $html_string . '        <tr class="odd">';
        $html_string = $html_string . '            <td >';
        $html_string = $html_string . '                Seleziona il file CONECOFOR_'.$anno_rilievi.'_AREE.DBF:';
        $html_string = $html_string . '            </td>';
        $html_string = $html_string . '            <td>';
        $html_string = $html_string . '            	<input name="conecofor_aree_dbf_upload_file" type="file" size="64"/>';
        $html_string = $html_string . '            </td>';
        $html_string = $html_string . '           <td >';
        if ($this->conecofor_aree_dbf_insert_flag == 1){
        	$html_string = $html_string . '<img src="images/ok.png">';
        }else{
        	if ($this->conecofor_aree_dbf_insert_flag == 0){
        		$html_string = $html_string .  '<img src="images/warning.png">';
        	}else{
        		$html_string = $html_string . '';
        	}
        }
        $html_string = $html_string . '            </td>';
        $html_string = $html_string . '            <td >';
        $html_string = $html_string . $this->conecofor_aree_dbf_insert_msg;   
        $html_string = $html_string . '            </td>';
        $html_string = $html_string . '        </tr>';
         $html_string = $html_string . '        <tr>';
        $html_string = $html_string . '            <td >';
        $html_string = $html_string . '                Seleziona il file CONECOFOR_'.$anno_rilievi.'_PIANTE.DBF:';
        $html_string = $html_string . '            </td>';
        $html_string = $html_string . '            <td >';
        $html_string = $html_string . '            	<input name="conecofor_piante_dbf_upload_file" type="file" size="64"/>';
        $html_string = $html_string . '            </td>';
        $html_string = $html_string . '           <td >';
        if ($this->conecofor_piante_dbf_insert_flag == 1){
        	$html_string = $html_string . '<img src="images/ok.png">';
        }else{
        	if ($this->conecofor_piante_dbf_insert_flag == 0){
        		$html_string = $html_string .  '<img src="images/warning.png">';
        	}else{
        		$html_string = $html_string . '';
        	}
        }
        $html_string = $html_string . '            </td>';
        $html_string = $html_string . '            <td >';
        $html_string = $html_string . $this->conecofor_piante_dbf_insert_msg;   
        $html_string = $html_string . '            </td>';
        $html_string = $html_string . '        </tr>';
         $html_string = $html_string . '        <tr class="odd">';
        $html_string = $html_string . '            <td >';
        $html_string = $html_string . '                Seleziona il file CONECOFOR_'.$anno_rilievi.'_SINTOMI.DBF:';
        $html_string = $html_string . '            </td>';
        $html_string = $html_string . '            <td >';
        $html_string = $html_string . '            	<input name="conecofor_sintomi_dbf_upload_file" type="file" size="64"/>';
        $html_string = $html_string . '            </td>';
        $html_string = $html_string . '           <td >';
        if ($this->conecofor_sintomi_dbf_insert_flag == 1){
        	$html_string = $html_string . '<img src="images/ok.png">';
        }else{
        	if ($this->conecofor_sintomi_dbf_insert_flag == 0){
        		$html_string = $html_string .  '<img src="images/warning.png">';
        	}else{
        		$html_string = $html_string . '';
        	}
        }
        $html_string = $html_string . '            </td>';
        $html_string = $html_string . '            <td >';
        $html_string = $html_string . $this->conecofor_sintomi_dbf_insert_msg;   
        $html_string = $html_string . '            </td>';
        $html_string = $html_string . '        </tr>';
        $html_string = $html_string . '        <tr>';
        $html_string = $html_string . '            <td >';
        $html_string = $html_string . '                Seleziona il file CONECOFOR_'.$anno_rilievi.'_CAV.DBF:';
        $html_string = $html_string . '            </td>';
        $html_string = $html_string . '            <td >';
        $html_string = $html_string . '            	<input name="conecofor_cav_dbf_upload_file" type="file" size="64"/>';
        $html_string = $html_string . '            </td>';
        $html_string = $html_string . '           <td >';
        if ($this->conecofor_cav_dbf_insert_flag == 1){
        	$html_string = $html_string . '<img src="images/ok.png">';
        }else{
        	if ($this->conecofor_cav_dbf_insert_flag == 0){
        		$html_string = $html_string .  '<img src="images/warning.png">';
        	}else{
        		$html_string = $html_string . '';
        	}
        }
        $html_string = $html_string . '            </td>';
        $html_string = $html_string . '            <td >';
        $html_string = $html_string . $this->conecofor_cav_dbf_insert_msg;   
        $html_string = $html_string . '            </td>';
        $html_string = $html_string . '        </tr>';
        $html_string = $html_string . '        <tr class="odd" align="center">';
        $html_string = $html_string . '            <td colspan="3">';
        $html_string = $html_string . '            	<input type="submit" name="conecofor_dbf_check" value="Procedi" />';
        $html_string = $html_string . '           	</td >';
        $html_string = $html_string . '        </tr>';
        $html_string = $html_string . '    </tbody>';
        $html_string = $html_string . '</table>';
		$html_string = $html_string . '</form>';
				
		echo $html_string;    
    }
    
    function checked(){
    	$html_string = "";
		
		$html_string = $html_string . '<form name="conecofor_aree_dbf_upload_form" enctype="multipart/form-data" action="';
		$html_string = $html_string . $_SERVER['PHP_SELF'];
		$html_string = $html_string . '" method="post">';
        $html_string = $html_string . 'I file DBF hanno una struttura corretta.<br><br> Carica le aree nel web database ';
        $html_string = $html_string . ' <input type="submit" name="conecofor_dbf_checked" value="Procedi" />';
		$html_string = $html_string . '</form>';
		
		echo $html_string;    
    }
    
    function conecofor_files_dbf_check($_POST,$_FILES){
    	
	    $_SESSION['conecofor_upload_status'] = "READY2CHECK";
	    
	    $this->conecofor_aree_dbf_filepath="";
        $this->conecofor_piante_dbf_filepath="";
        $this->conecofor_sintomi_dbf_filepath="";
        $this->conecofor_cav_dbf_filepath="";
        
        $this->conecofor_aree_dbf_insert_flag=0;
        $this->conecofor_piante_dbf_insert_flag=0;
        $this->conecofor_sintomi_dbf_insert_flag=0;
        $this->conecofor_cav_dbf_insert_flag=0;
        
        $this->conecofor_aree_dbf_insert_msg="";
        $this->conecofor_piante_dbf_insert_msg="";
        $this->conecofor_sintomi_dbf_insert_msg="";
        $this->conecofor_cav_dbf_insert_msg="";
        
		$this->conecofor_aree_dbf_upload($_POST,$_FILES);
	    $this->conecofor_piante_dbf_upload($_POST,$_FILES);
	    $this->conecofor_sintomi_dbf_upload($_POST,$_FILES);
	    $this->conecofor_cav_dbf_upload($_POST,$_FILES);
	    
	    
	  	if($this->conecofor_aree_dbf_insert_flag and $this->conecofor_piante_dbf_insert_flag and $this->conecofor_sintomi_dbf_insert_flag and $this->conecofor_cav_dbf_insert_flag){
			$_SESSION['conecofor_upload_status'] = "CHECKED";
			$_SESSION['conecofor_aree_dbf_filepath'] = $this->conecofor_aree_dbf_filepath;
        	$_SESSION['conecofor_piante_dbf_filepath'] = $this->conecofor_piante_dbf_filepath;
        	$_SESSION['conecofor_sintomi_dbf_filepath'] = $this->conecofor_sintomi_dbf_filepath;
        	$_SESSION['conecofor_cav_dbf_filepath'] = $this->conecofor_cav_dbf_filepath;
		}
	}
    
    function conecofor_aree_dbf_upload($_POST,$_FILES){
        $idsquadra = $_SESSION['conecofor_login_idutente'];
        if ($idsquadra != ""){
            try
            {		
                $sql_query = "SELECT ANNO_RILIEVI FROM conecofor_general";
                $anno_rilievi = "";
                foreach ($this->dbh->query($sql_query, PDO::FETCH_ASSOC) as $row){
                        $anno_rilievi = $row['ANNO_RILIEVI'];
                }	

            }
            catch(PDOException $e)
            { 
                echo 'Error: ' . $e->getMessage() . "\n";
            }
            
            if((!empty($_FILES["conecofor_aree_dbf_upload_file"])) && ($_FILES['conecofor_aree_dbf_upload_file']['error'] == 0)) {
                //Check if the file is DBF  and it's size is less than 1 MB (1024*1024*8 bit)
                $filename = basename($_FILES['conecofor_aree_dbf_upload_file']['name']);             
                $ext = substr($filename, strrpos($filename, '.') + 1);
                if (strtolower($filename) == "conecofor_".$anno_rilievi."_aree.dbf") {
                    if ($_FILES["conecofor_aree_dbf_upload_file"]["size"] < 1024*1024*8) {
                        //Determine the path to which we want to save this file
                        
                        $dbf_upload_date = date("ymd");
                        $newname =dirname(__FILE__).'/dbf_repository/'.$anno_rilievi."_".$idsquadra."_".$dbf_upload_date."_".$filename;
                        //Move the file to the repository
                        $move_result = move_uploaded_file($_FILES['conecofor_aree_dbf_upload_file']['tmp_name'],$newname);
                        if ($move_result ) {
                            //Check if the dbf structure is valid
                            $dbf_valid = true;
                            $timer = new timerClass();
                            $timer ->start();
                            $dbf = new dbf_class($newname);
                            $num_rec=$dbf->dbf_num_rec;
                            $field_num=$dbf->dbf_num_field;
                            $endexct = $timer->end();
                            $dbf_template = new dbf_class(dirname(__FILE__).'/dbf_repository/conecofor_aree_template.dbf');
                            If ($field_num != $dbf_template->dbf_num_field){
                                $dbf_valid = false;
                            } else {
                                for($j=0; $j<$field_num; $j++){
                                    if (($dbf->dbf_names[$j]['name'] != $dbf_template->dbf_names[$j]['name']) Or
                                        //($dbf->dbf_names[$j]['len'] != $dbf_template->dbf_names[$j]['len']) Or
                                        ($dbf->dbf_names[$j]['type'] != $dbf_template->dbf_names[$j]['type'])){
                                            $dbf_valid = false;
                                        }
                                }
                            }
                            If ($dbf_valid) {
                                $this->conecofor_aree_dbf_filepath = $newname;
                                $this->conecofor_aree_dbf_insert_flag = 1;
                                $this->conecofor_aree_dbf_insert_msg = "OK";
                            } else {
                                $this->conecofor_aree_dbf_filepath = "";
                                $this->conecofor_aree_dbf_insert_flag = 0;
                                $this->conecofor_aree_dbf_insert_msg = "La struttura del file conecofor_".$anno_rilievi."_aree.dbf non è corretta!";
                                unlink($newname);
                            }
                        } else {
                            $this->conecofor_aree_dbf_insert_flag = 0;
                            $this->conecofor_aree_dbf_insert_msg = "Error: A problem occurred during file upload!";
                        }
                    } else {
                        $this->conecofor_aree_dbf_insert_flag = 0;
                        $this->conecofor_aree_dbf_insert_msg = "La dimensione del file è superiore ad 1 MB";
                    }
                } else {
                    $this->conecofor_aree_dbf_insert_flag = 0;
                    $this->conecofor_aree_dbf_insert_msg = "Il nome del file non è conecofor_".$anno_rilievi."_aree.dbf";
                }
            } else {
                $this->conecofor_aree_dbf_insert_flag = 0;
                $this->conecofor_aree_dbf_insert_msg = "Nome file errato"; 
            }
        } else {
            $this->conecofor_aree_dbf_insert_flag = 0;
            $this->conecofor_aree_dbf_insert_msg = "Non è stato inserito un nome squadra";
        }
    }
    
    function conecofor_piante_dbf_upload($_POST,$_FILES){
        $idsquadra = $_SESSION['conecofor_login_idutente'];
        if ($idsquadra != ""){
            
            try
            {		
                $sql_query = "SELECT ANNO_RILIEVI FROM conecofor_general";
                $anno_rilievi = "";
                foreach ($this->dbh->query($sql_query, PDO::FETCH_ASSOC) as $row){
                        $anno_rilievi = $row['ANNO_RILIEVI'];
                }	

            }
            catch(PDOException $e)
            { 
                echo 'Error: ' . $e->getMessage() . "\n";
            }
            
            if((!empty($_FILES["conecofor_piante_dbf_upload_file"])) && ($_FILES['conecofor_piante_dbf_upload_file']['error'] == 0)) {
                //Check if the file is DBF  and it's size is less than 1 MB (1024*1024*8 bit)
                $filename = basename($_FILES['conecofor_piante_dbf_upload_file']['name']);
                $ext = substr($filename, strrpos($filename, '.') + 1);
                if (strtolower($filename) == "conecofor_".$anno_rilievi."_piante.dbf") {
                    if ($_FILES["conecofor_piante_dbf_upload_file"]["size"] < 1024*1024*8) {
                        //Determine the path to which we want to save this file
                        
                        $dbf_upload_date = date("ymd");
                        $newname =dirname(__FILE__).'/dbf_repository/'.$anno_rilievi."_".$idsquadra."_".$dbf_upload_date."_".$filename;
                        //Move the file to the repository
                        if ((move_uploaded_file($_FILES['conecofor_piante_dbf_upload_file']['tmp_name'],$newname))) {
                            //Check if the dbf structure is valid
                            $dbf_valid = true;
                            $timer = new timerClass();
                            $timer ->start();
                            $dbf = new dbf_class($newname);
                            $num_rec=$dbf->dbf_num_rec;
                            $field_num=$dbf->dbf_num_field;
                            $endexct = $timer->end();
                            $dbf_template = new dbf_class(dirname(__FILE__).'/dbf_repository/'."conecofor_piante_template.dbf");
                            If ($field_num != $dbf_template->dbf_num_field){
                                $dbf_valid = false;
                            } else {
                                for($j=0; $j<$field_num; $j++){
                                    if (($dbf->dbf_names[$j]['name'] != $dbf_template->dbf_names[$j]['name']) Or
                                        //($dbf->dbf_names[$j]['len'] != $dbf_template->dbf_names[$j]['len']) Or
                                        ($dbf->dbf_names[$j]['type'] != $dbf_template->dbf_names[$j]['type'])){
                                            $dbf_valid = false;
                                        }
                                }
                            }
                            If ($dbf_valid) {
                                $this->conecofor_piante_dbf_filepath = $newname;
                                $this->conecofor_piante_dbf_insert_flag = 1;
                                $this->conecofor_piante_dbf_insert_msg = "OK";
                            } else {
                                $this->conecofor_piante_dbf_filepath = "";
                                $this->conecofor_piante_dbf_insert_flag = 0;
                                $this->conecofor_piante_dbf_insert_msg = "La struttura del file conecofor_".$anno_rilievi."_piante.dbf non è corretta!";
                                unlink($newname);
                            }
                        } else {
                            $this->conecofor_piante_dbf_insert_flag = 0;
                            $this->conecofor_piante_dbf_insert_msg = "Error: A problem occurred during file upload!";
                        }
                    } else {
                        $this->conecofor_piante_dbf_insert_flag = 0;
                        $this->conecofor_piante_dbf_insert_msg = "La dimensione del file è superiore ad 1 MB";
                    }
                } else {
                    $this->conecofor_piante_dbf_insert_flag = 0;
                    $this->conecofor_piante_dbf_insert_msg = "Il nome del file non è conecofor_".$anno_rilievi."_piante.dbf";
                }
            } else {
                $this->conecofor_piante_dbf_insert_flag = 0;
                $this->conecofor_piante_dbf_insert_msg = "Nome file errato"; 
            }
        } else {
            $this->conecofor_piante_dbf_insert_flag = 0;
            $this->conecofor_piante_dbf_insert_msg = "Non è stato inserito un nome squadra";
        }
    }
    
    function conecofor_sintomi_dbf_upload($_POST,$_FILES){
        $idsquadra = $_SESSION['conecofor_login_idutente'];
        if ($idsquadra != ""){
            
            try
            {		
                $sql_query = "SELECT ANNO_RILIEVI FROM conecofor_general";
                $anno_rilievi = "";
                foreach ($this->dbh->query($sql_query, PDO::FETCH_ASSOC) as $row){
                        $anno_rilievi = $row['ANNO_RILIEVI'];
                }	

            }
            catch(PDOException $e)
            { 
                echo 'Error: ' . $e->getMessage() . "\n";
            }
            
            if((!empty($_FILES["conecofor_sintomi_dbf_upload_file"])) && ($_FILES['conecofor_sintomi_dbf_upload_file']['error'] == 0)) {
                //Check if the file is DBF  and it's size is less than 1 MB (1024*1024*8 bit)
                $filename = basename($_FILES['conecofor_sintomi_dbf_upload_file']['name']);
                $ext = substr($filename, strrpos($filename, '.') + 1);
                if (strtolower($filename) == "conecofor_".$anno_rilievi."_sintomi.dbf") {
                    if ($_FILES["conecofor_sintomi_dbf_upload_file"]["size"] < 1024*1024*8) {
                        //Determine the path to which we want to save this file
                        
                        $dbf_upload_date = date("ymd");
                        $newname =dirname(__FILE__).'/dbf_repository/'.$anno_rilievi."_".$idsquadra."_".$dbf_upload_date."_".$filename;
                        //Move the file to the repository
                        if ((move_uploaded_file($_FILES['conecofor_sintomi_dbf_upload_file']['tmp_name'],$newname))) {
                            //Check if the dbf structure is valid
                            $dbf_valid = true;
                            $timer = new timerClass();
                            $timer ->start();
                            $dbf = new dbf_class($newname);
                            $num_rec=$dbf->dbf_num_rec;
                            $field_num=$dbf->dbf_num_field;
                            $endexct = $timer->end();
                            $dbf_template = new dbf_class(dirname(__FILE__).'/dbf_repository/'."conecofor_sintomi_template.dbf");
                            If ($field_num != $dbf_template->dbf_num_field){
                                $dbf_valid = false;
                            } else {
                                for($j=0; $j<$field_num; $j++){
                                    if (($dbf->dbf_names[$j]['name'] != $dbf_template->dbf_names[$j]['name']) Or
                                        //($dbf->dbf_names[$j]['len'] != $dbf_template->dbf_names[$j]['len']) Or
                                        ($dbf->dbf_names[$j]['type'] != $dbf_template->dbf_names[$j]['type'])){
                                            $dbf_valid = false;
                                        }
                                }
                            }
                            If ($dbf_valid) {
                                $this->conecofor_sintomi_dbf_filepath = $newname;
                                $this->conecofor_sintomi_dbf_insert_flag = 1;
                                $this->conecofor_sintomi_dbf_insert_msg = "OK";
                            } else {
                                $this->conecofor_sintomi_dbf_filepath = "";
                                $this->conecofor_sintomi_dbf_insert_flag = 0;
                                $this->conecofor_sintomi_dbf_insert_msg = "La struttura del file conecofor_".$anno_rilievi."_sintomi.dbf non è corretta!";
                                unlink($newname);
                            }
                        } else {
                            $this->conecofor_sintomi_dbf_insert_flag = 0;
                            $this->conecofor_sintomi_dbf_insert_msg = "Error: A problem occurred during file upload!";
                        }
                    } else {
                        $this->conecofor_sintomi_dbf_insert_flag = 0;
                        $this->conecofor_sintomi_dbf_insert_msg = "La dimensione del file è superiore ad 1 MB";
                    }
                } else {
                    $this->conecofor_sintomi_dbf_insert_flag = 0;
                    $this->conecofor_sintomi_dbf_insert_msg = "Il nome del file non è conecofor_".$anno_rilievi."_sintomi.dbf";
                }
            } else {
                $this->conecofor_sintomi_dbf_insert_flag = 0;
                $this->conecofor_sintomi_dbf_insert_msg = "Nome file errato"; 
            }
        } else {
            $this->conecofor_sintomi_dbf_insert_flag = 0;
            $this->conecofor_sintomi_dbf_insert_msg = "Non è stato inserito un nome squadra";
        }
    }
    
    function conecofor_cav_dbf_upload($_POST,$_FILES){
        $idsquadra = $_SESSION['conecofor_login_idutente'];
        if ($idsquadra != ""){
            
            try
            {		
                $sql_query = "SELECT ANNO_RILIEVI FROM conecofor_general";
                $anno_rilievi = "";
                foreach ($this->dbh->query($sql_query, PDO::FETCH_ASSOC) as $row){
                        $anno_rilievi = $row['ANNO_RILIEVI'];
                }	

            }
            catch(PDOException $e)
            { 
                echo 'Error: ' . $e->getMessage() . "\n";
            }
            
            if((!empty($_FILES["conecofor_cav_dbf_upload_file"])) && ($_FILES['conecofor_cav_dbf_upload_file']['error'] == 0)) {
                //Check if the file is DBF  and it's size is less than 1 MB (1024*1024*8 bit)
                $filename = basename($_FILES['conecofor_cav_dbf_upload_file']['name']);
                $ext = substr($filename, strrpos($filename, '.') + 1);
                if (strtolower($filename) == "conecofor_".$anno_rilievi."_cav.dbf") {
                    if ($_FILES["conecofor_cav_dbf_upload_file"]["size"] < 1024*1024*8) {
                        //Determine the path to which we want to save this file
                        
                        $dbf_upload_date = date("ymd");
                        $newname =dirname(__FILE__).'/dbf_repository/'.$anno_rilievi."_".$idsquadra."_".$dbf_upload_date."_".$filename;
                        //Move the file to the repository
                        if ((move_uploaded_file($_FILES['conecofor_cav_dbf_upload_file']['tmp_name'],$newname))) {
                            //Check if the dbf structure is valid
                            $dbf_valid = true;
                            $timer = new timerClass();
                            $timer ->start();
                            $dbf = new dbf_class($newname);
                            $num_rec=$dbf->dbf_num_rec;
                            $field_num=$dbf->dbf_num_field;
                            $endexct = $timer->end();
                            $dbf_template = new dbf_class(dirname(__FILE__).'/dbf_repository/'."conecofor_cav_template.dbf");
                            If ($field_num != $dbf_template->dbf_num_field){
                                $dbf_valid = false;
                            } else {
                                for($j=0; $j<$field_num; $j++){
                                    if (($dbf->dbf_names[$j]['name'] != $dbf_template->dbf_names[$j]['name']) Or
                                        //($dbf->dbf_names[$j]['len'] != $dbf_template->dbf_names[$j]['len']) Or
                                        ($dbf->dbf_names[$j]['type'] != $dbf_template->dbf_names[$j]['type'])){
                                            $dbf_valid = false;
                                        }
                                }
                            }
                            If ($dbf_valid) {
                                $this->conecofor_cav_dbf_filepath = $newname;
                                $this->conecofor_cav_dbf_insert_flag = 1;
                                $this->conecofor_cav_dbf_insert_msg = "OK";
                            } else {
                                $this->conecofor_cav_dbf_filepath = "";
                                $this->conecofor_cav_dbf_insert_flag = 0;
                                $this->conecofor_cav_dbf_insert_msg = "La struttura del file conecofor_".$anno_rilievi."_cav.dbf non è corretta!";
                                unlink($newname);
                            }
                        } else {
                            $this->conecofor_cav_dbf_insert_flag = 0;
                            $this->conecofor_cav_dbf_insert_msg = "Error: A problem occurred during file upload!";
                        }
                    } else {
                        $this->conecofor_cav_dbf_insert_flag = 0;
                        $this->conecofor_cav_dbf_insert_msg = "La dimensione del file è superiore ad 1 MB";
                    }
                } else {
                    $this->conecofor_cav_dbf_insert_flag = 0;
                    $this->conecofor_cav_dbf_insert_msg = "Il nome del file non è conecofor_".$anno_rilievi."_cav.dbf";
                }
            } else {
                $this->conecofor_cav_dbf_insert_flag = 0;
                $this->conecofor_cav_dbf_insert_msg = "Nome file errato"; 
            }
        } else {
            $this->conecofor_cav_dbf_insert_flag = 0;
            $this->conecofor_cav_dbf_insert_msg = "Non è stato inserito un nome squadra";
        }
    }
    
    function ready2upload(){
      	
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
	    echo('<table id="hor-zebra">');
        echo('<thead>');
	    echo('<tr style="vertical-align:bottom" >');	
	    echo '<th  scope="col">&nbsp;'.$aree_dbf->dbf_names[0]['name'].'&nbsp;</th>';
	    echo '<th  scope="col">&nbsp;'.$aree_dbf->dbf_names[1]['name'].'&nbsp;</th>';
	    echo '<th  scope="col">&nbsp;'."PROVINCIA".'&nbsp;</th>';
	    echo '<th  scope="col">&nbsp;'.$aree_dbf->dbf_names[4]['name'].'&nbsp;</th>';
	    echo '<th  scope="col">&nbsp;'.$aree_dbf->dbf_names[5]['name'].'&nbsp;</th>';
	    echo '<th  scope="col">&nbsp;'."DATA RILIEVO".'&nbsp;</th>';
	    echo '<th  scope="col">&nbsp;'.'Totale piante rilievo chiome (RICH)'.'&nbsp;</th>';
	    echo '<th  scope="col">&nbsp;'.'N piante con sintomi presenti'.'&nbsp;</th>';
	    echo '<th  scope="col">&nbsp;'.'N piante con sintomi mancanti'.'&nbsp;</th>';
	    echo '<th  scope="col">&nbsp;'.'N piante scomparse o fuori campione'.'&nbsp;</th>';
	    echo '<th  scope="col">&nbsp;'.'Totale piante cavallettamento (CAV)'.'&nbsp;</th>';
	    echo '<th  scope="col">&nbsp;'.'CARICA AREA'.'&nbsp;</th>';
	    echo '<th  scope="col">&nbsp;'.'Note'.'&nbsp;</th>';
	    echo '</tr>';
        echo('</thead>');
        echo('<tbody>');
	    //print area summary
        $odd = 1;
	    for($i=0; $i<$aree_num_rec; $i++){
	        if ($dbf_row = $aree_dbf->getRow($i)) {
                if($odd % 2){
                    echo '<tr style="vertical-align:top " align="center" class="odd">';
                }else{
                    echo '<tr style="vertical-align:top" align="center" >';
                }
                
                echo '<td ><b>'.htmlentities($dbf_row[0]).'&nbsp;</b></td>';
                echo '<td >'.htmlentities($dbf_row[1]).'&nbsp;</td>';
                echo '<td >'.htmlentities($dbf_row[3]).'&nbsp;</td>';
                echo '<td >'.htmlentities($dbf_row[4]).'&nbsp;</td>';
                echo '<td >';
                switch ($dbf_row[5]){
                        //area idonea
                        case 1:
                            echo "Idonea";
                        break;
                        case 2:
                            echo "NON idonea";
                        break;
                        case 3:
                            echo "Idonea NON rilevabile"; 
                        break;
                }
                echo '</td>';
                $dbf_date = $dbf_row[6];
                $italy_date = substr($dbf_date,6,2)."-".substr($dbf_date,4,2)."-".substr($dbf_date,0,4);
                echo '<td >'.htmlentities($italy_date).'&nbsp;</td>';
                //calculate the number of piante,sintomi,cav for current the area
                $curr_idarea = $dbf_row[0];
                $num_piante = 0;
                $num_piante_senza_sintomi = 0;
                $num_piante_con_sintomi = 0;
                $num_piante_scomparse = 0;
                for($i_piante=0; $i_piante<$piante_num_rec; $i_piante++){
                    if ($row_piante = $piante_dbf->getRow($i_piante)) {
                        if($row_piante[0]==$curr_idarea){
                            $num_piante = $num_piante +1;
                            //cerco sintomi per la pianta
                            $curr_idpianta = $row_piante[1];
                            //se pianta ha rem_mort che non prevede sintomi
                            $pianta_con_sintomi = true;
                            switch ($row_piante[4]){
			                        //area idonea
			                        case 18:
			                        	$pianta_con_sintomi = true;
			                        	$num_piante_scomparse = $num_piante_scomparse +1;
				                    break;
			                        case 19:
			                        	$pianta_con_sintomi = true;
			                        	$num_piante_scomparse = $num_piante_scomparse +1;
				                    break;
			                        case 23:
			                        	$pianta_con_sintomi = true;
			                        	$num_piante_scomparse = $num_piante_scomparse +1;
				                    break;
			                        case 29:
			                        	$pianta_con_sintomi = true;
			                        	$num_piante_scomparse = $num_piante_scomparse +1;
				                    break;
			                        case 905:
			                        	$pianta_con_sintomi = true;
			                        	$num_piante_scomparse = $num_piante_scomparse +1;
				                    break;
			                        case 906:
			                        	$pianta_con_sintomi = true;
			                        	$num_piante_scomparse = $num_piante_scomparse +1;
				                    break;
									default;
										$pianta_con_sintomi = false;
			                        	for($i_sintomi=0; $i_sintomi<$sintomi_num_rec; $i_sintomi++){
						                    if ($row_sintomi = $sintomi_dbf->getRow($i_sintomi)) {
						                        if($row_sintomi[0]==$curr_idarea and $row_sintomi[1]==$curr_idpianta){
						                            $pianta_con_sintomi = true;
						                            $num_piante_con_sintomi = $num_piante_con_sintomi +1;
						                            break;
						                        }
						                    }
						                }
						                if (!$pianta_con_sintomi) {
						                	$num_piante_senza_sintomi = $num_piante_senza_sintomi +1;
						                }
			                        break;
			                }
                            
                        }
                    }
                }
                echo '<td >'.htmlentities($num_piante).'&nbsp;</td>';
                echo '<td >'.htmlentities($num_piante_con_sintomi).'&nbsp;</td>';
                echo '<td >'.htmlentities($num_piante_senza_sintomi).'&nbsp;</td>';
                echo '<td >'.htmlentities($num_piante_scomparse).'&nbsp;</td>';
                
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
                
                //determine the current year of campaign to select from current conecofor tables
                $sql_query = "SELECT ANNO_RILIEVI FROM conecofor_general";
                $anno_rilievi = "";
                foreach ($this->dbh->query($sql_query, PDO::FETCH_ASSOC) as $row){
                        $anno_rilievi = $row['ANNO_RILIEVI'];
                }

                $sql_query = sprintf("SELECT IDAREA,IDSQUADRA FROM ".DB_TABLE_CONECOFOR_AREE." WHERE ( ANNO_RIL = ".$anno_rilievi." AND IDAREA = '".$curr_idarea."' )");
                $query_result = $this->dbh->query($sql_query);
                $fetch_rows = $query_result->fetchAll();
                $area_present = count($fetch_rows);
                
                // se area presente nel DB
                if ($area_present==1) {
                    //se inserita dalla stessa squadra
                    if ($fetch_rows[0][1] == $_SESSION['conecofor_login_idutente']){
                        echo '<td style="vertical-align:top" align="center">';
                        echo '<img src="images/ok.png">';
                        // echo '<FORM name="conecofor_area_'.$curr_idarea.'_delete_form" enctype="multipart/form-data" action="'.$_SERVER['PHP_SELF'].'" method="post">';
                        //echo '<INPUT TYPE=HIDDEN NAME="idarea_delete" VALUE="'.$curr_idarea.'">';
                        //echo '<INPUT type="image" src="images/recycle_bin.png" name="conecofor_area_delete" />';
                        //echo '</FORM>';
                        echo '</td >';
                        echo '<td style="vertical-align:top">Area caricata nel web database.</td>';
                    //se inserita da altra squadra
                    } else {
                        switch ($dbf_row[5]){
                        //area idonea
                            case 1:
                                //se non rilevata dalla squadra (sintomi o piante non presenti)
                                if ($num_piante==0 Or $num_piante_con_sintomi==0){
                                    echo '<td >';
                                    echo '&nbsp;';
                                    echo '</td>';
                                    echo '<td>&nbsp;</td>';
                                //se rilevata (sintomi presenti)
                                }else{
                                    echo '<td style="vertical-align:top" align="center">';
                                    echo '<img src="images/warning.png">';
                                    echo '</td>';
                                    echo '<td style="vertical-align:top">L\'area è già stata inserita dalla squadra '.$fetch_rows[0][1].'!</td>';
                                }
                                break;
                            //area NON idonea
                            case 2:
                                echo '<td >';
                                echo '&nbsp;';
                                echo '</td>';
                                echo '<td style="vertical-align:top" >L\'area è già stata inserita dalla squadra '.$fetch_rows[0][1].'!</td>';
                      
                                break;
                            //area idonea NON RILEVABILE
                            case 3:
                                echo '<td style="vertical-align:top" align="center">';
                                echo '<img src="images/warning.png">';
                                echo '</td>';
                                echo '<td style="vertical-align:top">L\'area è già stata inserita dalla squadra '.$fetch_rows[0][1].'!</td>';
                                
                                break;
                        }
                    }
                // se NON presente nel DB   
                } else {
                    switch ($dbf_row[5]){
                        //area idonea
                        case 1:
                            //se area non rilevata
                            if ($num_piante==0 Or $num_piante_con_sintomi==0){
                                echo '<td >';
                                echo '&nbsp;';
                                echo '</td>';
                                echo '<td>&nbsp;</td>';
                            //se piante senza sintomi
                            }elseif($num_piante_senza_sintomi>0){
                                echo '<td style="vertical-align:top" align="center">';
                                echo '<img src="images/warning.png">';
                                echo '</td>';
                                echo '<td style="vertical-align:top">Alcune piante sono prive di sintomi!</td>';
                            }
                            else{
                                echo '<td style="vertical-align:top" align="center">';
                                echo '<FORM name="conecofor_area_'.$curr_idarea.'_upload_form" enctype="multipart/form-data" action="'.$_SERVER['PHP_SELF'].'" method="post">';
                                echo '<INPUT TYPE=HIDDEN NAME="idarea_upload" VALUE="'.$curr_idarea.'">';
                                echo '<INPUT type="image" src="images/upload.png" name="conecofor_area_upload" />';
                                echo '</FORM>';
                                echo '</td >';
                                echo '<td style="vertical-align:top">Carica area nel database.</td>';
                            }
                            break;
                        //area NON idonea
                        case 2:
                            echo '<td style="vertical-align:top" align="center">';
                            echo '<FORM name="conecofor_area_'.$curr_idarea.'_upload_form" enctype="multipart/form-data" action="'.$_SERVER['PHP_SELF'].'" method="post">';
                            echo '<INPUT TYPE=HIDDEN NAME="idarea_upload" VALUE="'.$curr_idarea.'">';
                            echo '<INPUT type="image" src="images/upload_warning.png" name="conecofor_area_upload" />';
                            echo '</FORM>';
                            echo '</td>';		
                            echo '</td >';
                            echo '<td style="vertical-align:top">Attenzione, area dichiarata NON idonea: verranno caricati solo i dati area!</td>';
                  
                            break;
                        //area idonea NON RILEVABILE
                        case 3:
                            echo '<td style="vertical-align:top" align="center">';
                            echo '<FORM name="conecofor_area_'.$curr_idarea.'_upload_form" enctype="multipart/form-data" action="'.$_SERVER['PHP_SELF'].'" method="post">';
                            echo '<INPUT TYPE=HIDDEN NAME="idarea_upload" VALUE="'.$curr_idarea.'">';
                            echo '<INPUT type="image" src="images/upload_warning.png" name="conecofor_area_upload" />';
                            echo '</FORM>';
                            echo '</td>';		
                            echo '</td >';
                            echo '<td style="vertical-align:top">Attenzione, area dichiarata idonea ma NON RILEVABILE: verranno caricati solo i dati area!</td>';
                            
                            break;
                    }
                }
                echo '</tr>';
                $odd = $odd+1;
	        }
	    }
        echo('</tbody>');
	    echo('</table>');
      	
    }
    
    function confirm_upload_area(){
   		echo '<FORM name="conecofor_area_'.$_SESSION['conecofor_upload_idarea'].'_confirm_upload_form" enctype="multipart/form-data" action="'.$_SERVER['PHP_SELF'].'" method="post">';
		echo 'Confermi il caricamento dei dati dell\'area '.$_SESSION["conecofor_upload_idarea"].'? <BR>';
		echo '<INPUT TYPE=SUBMIT NAME="confirm_upload_checkout" VALUE="SI">';
		echo '<INPUT TYPE=SUBMIT NAME="confirm_upload_checkout" VALUE="NO">';
        echo '<BR><br> N.b. per poter cancellare i dati caricati nel database dovrai contattare l\'amministratore del sito. <BR>';
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
        
        //determine the current year of campaign to select from current conecofor tables
		$sql = "SELECT ANNO_RILIEVI FROM conecofor_general";
		$anno_rilievi = "";
           foreach ($this->dbh->query($sql, PDO::FETCH_ASSOC) as $row){
	    		$anno_rilievi = $row['ANNO_RILIEVI'];
	    }
	    
	    //insert dati area
        
	    $sql = "INSERT INTO ".DB_TABLE_CONECOFOR_AREE." ( ANNO_RIL, " . implode(',', $fieldname_array) . ") VALUES ( ".$anno_rilievi.", " . implode(',', $question_marks_array).");";
	    $stmt = $this->dbh->prepare($sql);
        $idoneita_area = 1;
	    for($i=0; $i<$aree_num_rec; $i++){
	        if ($row = $aree_dbf->getRow($i)) {
	            // if idarea is selecetd to upload
	        	if($row[0]==$_SESSION["conecofor_upload_idarea"]) {	
					try {
						//add the IDSQUADRA e the current date of upload to the array of values
						$row[]=$_SESSION['conecofor_login_idutente'];
						$row[]=date("Ymd");
					    $stmt->execute($row);
                        
                        //get idoneita area
                        $idoneita_area = $row[5];
					    
					} catch (PDOException $e){
						echo '<br> Upload dei dati area non riuscito';
					    echo $e->getMessage();
					    $this->execute_delete_area(false);
					}
	        	}
	        }
	    }
		echo '<br> Caricamento dei dati area completato';
		//se area idonea inserisci piante, sintomi e cavallettamento
        if($idoneita_area == 1){
            //insert piante area
            if($piante_num_rec>0){
                //prepare question marks array and fieldname array
                $question_marks_array = array();
                $fieldname_array = array();
                for($j=0; $j<$piante_field_num; $j++){
                    $question_marks_array[] = "?";
                    $fieldname_array[] = $piante_dbf->dbf_names[$j]['name'];
                }
                //create the insert query
                $sql = "INSERT INTO ".DB_TABLE_CONECOFOR_PIANTE." ( ANNO_RIL, " . implode(',', $fieldname_array) . ") VALUES ( ".$anno_rilievi.", " . implode(',', $question_marks_array).");";
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
                echo '<br> Caricamento dei dati piante completato';
            } else {
                echo '<br> Nessun dato piante da inserire';
            }
            
            
            //insert sintomi area
            
            if($sintomi_num_rec>0){
                //prepare question marks array and fieldname array
                $question_marks_array = array();
                $fieldname_array = array();
                for($j=0; $j<$sintomi_field_num; $j++){
                    $question_marks_array[] = "?";
                    $fieldname_array[] = $sintomi_dbf->dbf_names[$j]['name'];
                }
                //create the insert query
                $sql = "INSERT INTO ".DB_TABLE_CONECOFOR_SINTOMI." ( ANNO_RIL, " . implode(',', $fieldname_array) . ") VALUES ( ".$anno_rilievi.", " . implode(',', $question_marks_array).");";
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
                echo '<br> Caricamento dei dati sintomi completato';
            } else {
                echo '<br> Nessun dato sintomi da inserire';
            }
            //insert cav area
            if($cav_num_rec>0){
                //prepare question marks array and fieldname array
                $question_marks_array = array();
                $fieldname_array = array();
                for($j=0; $j<$cav_field_num; $j++){
                    $question_marks_array[] = "?";
                    $fieldname_array[] = $cav_dbf->dbf_names[$j]['name'];
                }
                //create the insert query
                $sql = "INSERT INTO ".DB_TABLE_CONECOFOR_CAV." ( ANNO_RIL, " . implode(',', $fieldname_array) . ") VALUES ( ".$anno_rilievi.", " . implode(',', $question_marks_array).");";
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
                echo '<br> Caricamento dei dati cav completato';
            } else {
                echo '<br> Nessun dato cav da inserire';
            }
        }
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
        
        //determine the current year of campaign to select from current conecofor tables
		$sql = "SELECT ANNO_RILIEVI FROM conecofor_general";
		$anno_rilievi = "";
           foreach ($this->dbh->query($sql, PDO::FETCH_ASSOC) as $row){
	    		$anno_rilievi = $row['ANNO_RILIEVI'];
	    }
	    
	    // cancellazione dei dati area
	    $sql_query = sprintf("DELETE FROM ".DB_TABLE_CONECOFOR_AREE." WHERE ( ANNO_RIL = ".$anno_rilievi." AND IDAREA ='".$_SESSION["conecofor_upload_idarea"]."')");
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
        $sql_query = sprintf("DELETE FROM ".DB_TABLE_CONECOFOR_PIANTE." WHERE ( ANNO_RIL = ".$anno_rilievi." AND IDAREA ='".$_SESSION["conecofor_upload_idarea"]."')");
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
        $sql_query = sprintf("DELETE FROM ".DB_TABLE_CONECOFOR_SINTOMI." WHERE ( ANNO_RIL = ".$anno_rilievi." AND IDAREA ='".$_SESSION["conecofor_upload_idarea"]."')");
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
        $sql_query = sprintf("DELETE FROM ".DB_TABLE_CONECOFOR_CAV." WHERE ( ANNO_RIL = ".$anno_rilievi." AND IDAREA ='".$_SESSION["conecofor_upload_idarea"]."')");
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
