<?php

error_reporting (E_ALL); // I use this only for testing

require_once('pclzip.lib.php');
//require_once("./phpconsole_init.php");

class conecofor_export_raw_data_class {
    
    function conecofor_export_raw_data_class(){
    	
    	$this->connect_db();
    	
    	
    	if(!isset($_SESSION['conecofor_export_raw_data_status'])){
	   		$_SESSION['conecofor_export_raw_data_status'] = "EXPORT_RAW_DATA";
		}
    	
    	
    	if (isset($_POST['conecofor_export_raw_data_nyear'])) {
    		//$_SESSION['conecofor_export_raw_data_status'] = "EXPORT_RAW_DATA_RESULT"; 
    		$_SESSION['conecofor_export_raw_data_nyear'] = $_POST['conecofor_export_raw_data_nyear'];
    		$this->export_zip(); 		
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
    	$html_string = $html_string . '<b>Esporta i dati grezzi di un anno in formato CSV</b>';
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
			
			case 5:
			case 1:
				switch ($_SESSION['conecofor_export_raw_data_status']){
		   			case "EXPORT_RAW_DATA":
						
						$html_string = $html_string . '<form name="conecofor_export_raw_data_form" enctype="multipart/form-data" action="';
						$html_string = $html_string . $_SERVER['PHP_SELF'];
						$html_string = $html_string . '" method="post">';
						$html_string = $html_string . '<table>';
				        $html_string = $html_string . '<tr>';
				        $html_string = $html_string . '<td>';
				        $html_string = $html_string . 'Scegli l\'anno di cui esportare i dati';
				        $html_string = $html_string . '</td>';
				        $html_string = $html_string . '<td>';
				        $html_string = $html_string . '<SELECT NAME="conecofor_export_raw_data_nyear">';
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
				        $html_string = $html_string . 'Esporta l\'anno selezionato';
				        $html_string = $html_string . '</td>';
				        $html_string = $html_string . '<td>';
				        $html_string = $html_string . '<input type="submit" name="conecofor_export_raw_data_execute" value="Esporta"/>';
				        $html_string = $html_string . '</td>';
				        $html_string = $html_string . '</tr>';
				        $html_string = $html_string . '</table>';
						$html_string = $html_string . '</form>';
						break;
						
					
					case "EXPORT_RAW_DATA_RESULT":
						
						$html_string = $html_string . 'Anno esportato.';
						$_SESSION['conecofor_export_raw_data_status'] = "EXPORT_RAW_DATA";
						break;
						
				}
				break;
    	}		
    	
		
		echo $html_string;
    }
        
    function export_zip(){
		try
		{
            $anno_ril = $_SESSION['conecofor_export_raw_data_nyear'];
            
            
            
			$aree_csv_file_name = dirname(__FILE__)."/raw_data_repository/".$anno_ril."_CONECOFOR_AREE.csv";
			$piante_csv_file_name = dirname(__FILE__)."/raw_data_repository/".$anno_ril."_CONECOFOR_PIANTE.csv";
			$sintomi_csv_file_name = dirname(__FILE__)."/raw_data_repository/".$anno_ril."_CONECOFOR_SINTOMI.csv";
			$cav_csv_file_name = dirname(__FILE__)."/raw_data_repository/".$anno_ril."_CONECOFOR_CAV.csv"; 
			
			
	
			$this->exportMysqlToCsv(DB_TABLE_CONECOFOR_AREE,$aree_csv_file_name,true,"ANNO_RIL",$anno_ril);
			$this->exportMysqlToCsv(DB_TABLE_CONECOFOR_PIANTE,$piante_csv_file_name,true,"ANNO_RIL",$anno_ril);
			$this->exportMysqlToCsv(DB_TABLE_CONECOFOR_SINTOMI,$sintomi_csv_file_name,true,"ANNO_RIL",$anno_ril);
			$this->exportMysqlToCsv(DB_TABLE_CONECOFOR_CAV,$cav_csv_file_name,true,"ANNO_RIL",$anno_ril);
				
										
			$backupFile = dirname(__FILE__)."/raw_data_repository/".$anno_ril."_CONECOFOR_RAW.zip";
			//Se esiste già, lo cancello
			if (file_exists($backupFile)) @unlink($backupFile);
            
            //Includo la libreria e genero l'oggetto zip
			$archive = new PclZip($backupFile);
			//Una lista di nomi di files da comprimere
			$listOfFilesToCompress=$aree_csv_file_name.','.$piante_csv_file_name.','.$sintomi_csv_file_name.','.$cav_csv_file_name;
			//Aggiungo i files all'archivio
			$v_list = $archive->add($listOfFilesToCompress,PCLZIP_OPT_REMOVE_ALL_PATH);
			if ($v_list == 0) {
				die("Error : ".$archive->errorInfo(true));
			}
            
    
            if (headers_sent()) {
                echo 'HTTP header already sent';
            } else {
                if (!is_file($backupFile)) {
                    header($_SERVER['SERVER_PROTOCOL'].' 404 Not Found');
                    echo 'File not found';
                } else if (!is_readable($backupFile)) {
                    header($_SERVER['SERVER_PROTOCOL'].' 403 Forbidden');
                    echo 'File not readable';
                } else {
                    header($_SERVER['SERVER_PROTOCOL'].' 200 OK');
                    header("Content-Type: application/zip");
                    header("Content-Transfer-Encoding: Binary");
                    //header("Content-Length: ".filesize($backupFile));
                    header("Content-Disposition: attachment; filename=\"".basename($backupFile)."\"");
                    ob_end_clean();
                    readfile($backupFile);
                    exit;
                }
            }
			
		}
		catch(PDOException $e)
		{
		    echo 'Error: ' . $e->getMessage() . "\n";
		    
		}
	    	
	}
	    
    
    function exportMysqlToCsv($table,$filename,$filter,$field,$field_value)
		{
			try {
				
				$csv_terminated = "\n";
			    $csv_separator = ";";
			    $csv_enclosed = '';
			    $csv_escaped = "\\";
				
				$sql_query = 'SHOW COLUMNS FROM ' . $table;
			    $column_names=array();
	       		$stmt = $this->dbh->prepare($sql_query);   
	            if($stmt->execute()){
	                $raw_column_data = $stmt->fetchAll();
	                
	                foreach($raw_column_data as $outer_key => $array){
	                    foreach($array as $inner_key => $value){
	                            
	                        if ($inner_key === 'Field'){
	                                if (!(int)$inner_key){
	                                    $column_names[] = $value;
	                                }
	                            }
	                    }
	                }        
	            }
		        
		          
			    // Gets the data from the database
			   
			    $fields_cnt = count($column_names);
			 
			 
			    $schema_insert = '';
			 
			    for ($i = 0; $i < $fields_cnt; $i++)
			    {
			        $l = $csv_enclosed . str_replace($csv_enclosed, $csv_escaped . $csv_enclosed, stripslashes($column_names[$i])).$csv_enclosed;
			        $schema_insert .= $l;
			        $schema_insert .= $csv_separator;
			    } // end for
			 
			    $out = trim(substr($schema_insert, 0, -1));
			    $out .= $csv_terminated;
			    if($filter){
                    $sql_query = "select * from ".$table." where ".$field." = ".$field_value;
                }else{    
			        $sql_query = "select * from ".$table;
                }
                
                
			    // Format the data
			    foreach ($this->dbh->query($sql_query) as $row){
			        $schema_insert = '';
			        for ($j = 0; $j < $fields_cnt; $j++)
			        {
			            if ($row[$j] == '0' || $row[$j] != '')
			            {
			 
			                if ($csv_enclosed == '')
			                {
			                    $schema_insert .= $row[$j];
			                } else
			                {
			                    $schema_insert .= $csv_enclosed . 
								str_replace($csv_enclosed, $csv_escaped . $csv_enclosed, $row[$j]) . $csv_enclosed;
			                }
			            } else
			            {
			                $schema_insert .= '';
			            }
			 
			            if ($j < $fields_cnt - 1)
			            {
			                $schema_insert .= $csv_separator;
			            }
			        } // end foreach
			 
			        $out .= $schema_insert;
			        $out .= $csv_terminated;
			    } // end while
			 	if (file_exists($filename)) {
				    unlink($filename);
				}
                         
			    $file = fopen ($filename, 'w');
				fputs ($file, $out);
				fclose ($file);  
			    //echo $out;
		    } catch (Exception $e){
	                return $e->getMessage(); //return exception
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