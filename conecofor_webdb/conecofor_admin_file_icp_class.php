<?php

error_reporting (E_ALL); // I use this only for testing



class conecofor_file_icp_class {
    
    function conecofor_file_icp_class(){
    	if(!isset($_POST['conecofor_file_status'])) {
			$_SESSION['conecofor_file_status'] = "LIST_FILE";
		}
	    if (isset($_FILES['upload_file_path'])) {
			$filename = basename($_FILES['upload_file_path']['name']);
			$newname = dirname(__FILE__).'/icp_correct_files/'.$filename;
            move_uploaded_file($_FILES['upload_file_path']['tmp_name'],$newname);
		}elseif(isset($_POST['conecofor_file_delete'])) {
			$_SESSION['conecofor_file_status'] = "CONFIRM_DELETE";
			$_SESSION['conecofor_file_name'] = $_POST['conecofor_file_delete'];
		}elseif(isset($_POST['confirm_delete_checkout'])) {
			if($_POST['confirm_delete_checkout']=='SI'){
				$_SESSION['conecofor_file_status'] = "EXECUTE_DELETE";
			} else {
				$_SESSION['conecofor_file_status'] = "LIST_FILE";
				$_SESSION['conecofor_file_name'] = "";
			}
		}	
    }
    
    function print_title(){
    	$html_string = '';
    	$html_string = $html_string . '<table width="100%" border="0" cellpadding="0" cellspacing="0" style="vertical-align: top;">';
		$html_string = $html_string . '<tr>';
		
		$html_string = $html_string . '<td align="left" style="text-align=right;">';
    	$html_string = $html_string . '<a href="conecofor_menu.php"><img src="images/previous.png" border="0" style="width: 15px; height: 15px;"></a>&nbsp;';
    	$html_string = $html_string . '</td>';
		$html_string = $html_string . '<td align="left" style="text-align=left;">';
    	$html_string = $html_string . '<b>Gestisci i file ICP convalidati</b>';
    	$html_string = $html_string . '</td>';
   
		$html_string = $html_string . '</tr>';
		$html_string = $html_string . '</table>';
    	
    	echo $html_string;
    }
    
    function print_form(){
    	
    	switch ($_SESSION['conecofor_file_status']){
	    	case "LIST_FILE":
		    	$this->print_list();
				break;
			case 'CONFIRM_DELETE':
		    	$this->confirm_delete();
		     	break;
		    case 'EXECUTE_DELETE':
		    	$nome_file=$_SESSION['conecofor_file_name'];
				if (!file_exists($nome_file)) {
					echo "Spiacente, non posso trovare il file $nome_file";
				} else {
					if (!unlink($nome_file)) {
						echo "$PHP_SELF: Errore, impossibile cancellare il file $nome_file";
						echo "Controllalo!";
					} else {
					}
				}
		    	$_SESSION['conecofor_file_status'] = "LIST_FILE";
				$_SESSION['conecofor_file_name'] = "";
		    	$this->print_list();
		     	break; 
    	}
		
    }
    
    function print_list(){
	    $html_string='';
	    $files_dir = "icp_correct_files/";
		$web_path = dirname(__FILE__)."/".$files_dir;
		
		// Open the directory, and proceed to read its contents
		if (is_dir($web_path))
		{
		 
		 if ($dh = opendir($web_path))
		 {
		     while (($file = readdir($dh)) !== false) 
		     {
				
				if ($file == "." || $file == "..")
				{
				 continue;
				}
				
				$file_array[] = $file;
		     }
		     closedir($dh);
		 }
		}
		
		sort($file_array);
		switch ($_SESSION['conecofor_login_liv']){
    		case 10:
    			break;
    		case 5:
								
				$html_string = $html_string . '<table id="hor-zebra" summary="Lista files">';
				$odd = true;
				foreach ($file_array AS $file){
					if ($odd) {
						$html_string = $html_string . '<tr class="odd">';
						$odd = false;
					}else{
						$html_string = $html_string . '<tr >';
						$odd = true;
					}
					$html_string = $html_string . '<td>';
			    	$html_string = $html_string . $file;
			    	$html_string = $html_string . '</td>';
			    	$html_string = $html_string . '<td>';
			    	$html_string = $html_string . '<a href='.$files_dir.$file.' target="_blank"><img src="images/download.png" border="0"></a>';
					$html_string = $html_string . '</td>';
					
					$html_string = $html_string . '</tr>';
				}
				$html_string = $html_string . '</table>';
				break;
			case 1:
				
				$html_string = $html_string . '<table id="hor-zebra" summary="Lista files">';
				$odd = true;
				foreach ($file_array AS $file){
					if ($odd) {
						$html_string = $html_string . '<tr class="odd">';
						$odd = false;
					}else{
						$html_string = $html_string . '<tr >';
						$odd = true;
					}
					$html_string = $html_string . '<td>';
			    	$html_string = $html_string . $file;
			    	$html_string = $html_string . '</td>';
			    	$html_string = $html_string . '<td>';
			    	$html_string = $html_string . '<a href='.$files_dir.$file.' target="_blank"><img src="images/download.png" border="0"></a>';
					$html_string = $html_string . '</td>';
					$html_string = $html_string . '<td>';
			      	$html_string = $html_string .  '<FORM name="conecofor_'.$file.'_delete_form" enctype="multipart/form-data" action="'.$_SERVER['PHP_SELF'].'" method="post">';
					$html_string = $html_string .  '<INPUT TYPE=HIDDEN NAME="conecofor_file_delete" VALUE="'.$web_path.$file.'">';
					$html_string = $html_string .  '<INPUT type="image" src="images/recycle_bin.png" name="conecofor_file_delete" />';
					$html_string = $html_string .  '</FORM>';
					$html_string = $html_string . '<td>';
					$html_string = $html_string . '</tr>';
				}
				$html_string = $html_string . '</table>';
				
				$html_string = $html_string . '<form name="conecofor_file_icp_form" enctype="multipart/form-data" action="';
				$html_string = $html_string . $_SERVER['PHP_SELF'];
				$html_string = $html_string . '" method="post">';
		        $html_string = $html_string . 'Carica file:';
		        $html_string = $html_string . '<input name="upload_file_path" type="file" size="20"/>';
		        $html_string = $html_string . '<input type="submit" name="conecofor_dbf_check" value="Carica" />';
				$html_string = $html_string . '</form>';
		}
		
		echo $html_string;
	    
	}
    
    
    function confirm_delete(){
   		echo '<FORM name="conecofor_file_'.$_SESSION['conecofor_file_name'].'_confirm_delete_form" enctype="multipart/form-data" action="'.$_SERVER['PHP_SELF'].'" method="post">';
		echo 'Confermi la cancellazione del file '.$_SESSION['conecofor_file_name'].'? <BR>';
		echo '<INPUT TYPE=SUBMIT NAME="confirm_delete_checkout" VALUE="SI">';
		echo '<INPUT TYPE=SUBMIT NAME="confirm_delete_checkout" VALUE="NO">';
		echo '</FORM>';
    }
    
}
//End of Class
?>
