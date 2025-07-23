    <?php


error_reporting (E_ALL); // I use this only for testing

require_once('pclzip.lib.php');
//require_once('./FirePHPCore/FirePHP.class.php');


class conecofor_export_icp_data_class {
    
    function conecofor_export_icp_data_class(){
    	
    	$this->connect_db();
    		
    	if(!isset($_SESSION['conecofor_export_icp_data_status'])){
	   		$_SESSION['conecofor_export_icp_data_status'] = "EXPORT_ICP_DATA";
		}
    	
    	
    	if (isset($_POST['conecofor_export_icp_data_nyear'])) {
    		//$_SESSION['conecofor_export_icp_data_status'] = "EXPORT_ICP_DATA_RESULT"; 
    		$_SESSION['conecofor_export_icp_data_nyear'] = $_POST['conecofor_export_icp_data_nyear'];
    		

			
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
    	$html_string = $html_string . '<b>Esporta le tabelle PLO TRE e TRF di un anno nel formato ICP e CSV</b>';
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
				switch ($_SESSION['conecofor_export_icp_data_status']){
		   			case "EXPORT_ICP_DATA":
						
						$html_string = $html_string . '<form name="conecofor_export_icp_data_form" enctype="multipart/form-data" action="';
						$html_string = $html_string . $_SERVER['PHP_SELF'];
						$html_string = $html_string . '" method="post">';
						$html_string = $html_string . '<table>';
				        $html_string = $html_string . '<tr>';
				        $html_string = $html_string . '<td>';
				        $html_string = $html_string . 'Scegli l\'anno da cui esportare le tabelle PLO,TRE e TRF';
				        $html_string = $html_string . '</td>';
				        $html_string = $html_string . '<td>';
				        $html_string = $html_string . '<SELECT NAME="conecofor_export_icp_data_nyear">';
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
				        $html_string = $html_string . '<input type="submit" name="conecofor_export_icp_data_execute" value="Esporta"/>';
				        $html_string = $html_string . '</td>';
				        $html_string = $html_string . '</tr>';
				        $html_string = $html_string . '</table>';
						$html_string = $html_string . '</form>';
						break;
						
					
					case "EXPORT_ICP_DATA_RESULT":
						
						$html_string = $html_string . 'Anno esportato.';
						$_SESSION['conecofor_export_icp_data_status'] = "EXPORT_ICP_DATA";
						break;
						
				}
				break;
    	}		
    	
		
		echo $html_string;
    }
    
    function export_zip(){
		try
		{
			$plo_icp_file_name = dirname(__FILE__)."/icp_data_repository/it".$_SESSION['conecofor_export_icp_data_nyear'].".plo";
			$tre_icp_file_name = dirname(__FILE__)."/icp_data_repository/it".$_SESSION['conecofor_export_icp_data_nyear'].".tre";
			$trf_icp_file_name = dirname(__FILE__)."/icp_data_repository/it".$_SESSION['conecofor_export_icp_data_nyear'].".trf";
			
			$plo_csv_file_name = dirname(__FILE__)."/icp_data_repository/it".$_SESSION['conecofor_export_icp_data_nyear']."_plo.csv";
			$tre_csv_file_name = dirname(__FILE__)."/icp_data_repository/it".$_SESSION['conecofor_export_icp_data_nyear']."_tre.csv";
			$trf_csv_file_name = dirname(__FILE__)."/icp_data_repository/it".$_SESSION['conecofor_export_icp_data_nyear']."_trf.csv";
			
 			$plo_icp_fieldline="!Sequence, country, plot, date, latitude, longitude, team_ID, water, humus, altitude, orientation, mean_age, other_observations";
 			$tre_icp_fieldline="!Sequence, plot, date, tree, tree_species, removal_mortality, defol, fruiting_assess, assessable_crown, other_observations";
 			$trf_icp_fieldline="!Sequence, plot, date, tree, affected_part, symptom, symptom_spec, crown_loc, damage_age, cause, cause_sc_name, extent, other_observations";
 			
 			$plo_csv_fieldline="Sequence;country;plot;date;latitude;longitude;team_ID;water;humus;altitude;orientation;mean_age;other_observations";
			$tre_csv_fieldline="Sequence;plot;date;tree;tree_species;removal_mortality;defol;fruiting_assess;assessable_crown;other_observations";
			$trf_csv_fieldline="Sequence;plot;date;tree;affected_part;symptom;symptom_spec;crown_loc;damage_age;cause;cause_sc_name;extent;other_observations";
			
 			$anno_ril = $_SESSION['conecofor_export_icp_data_nyear'];
            
 			//QUERY PLO icp2010,icp2011
			//$plo_query='SELECT Replace(PAESE,"0"," ") AS COUNTRY,RIGHT(CONCAT("    ", CAST(RIGHT ('.DB_TABLE_CONECOFOR_AREE.'.IDAREA , LENGTH('.DB_TABLE_CONECOFOR_AREE.'.IDAREA)-1) AS UNSIGNED) ) ,4) AS PLOT,CONCAT(RIGHT(CONCAT("0",DAY(DATARIL)),2),RIGHT(CONCAT("0",MONTH(DATARIL)),2),RIGHT(CONCAT("0",YEAR(DATARIL)),2)) AS DATE,'.DB_TABLE_CONECOFOR_AREE_TOT.'.COORD_ORIG_N AS LATITUDE,'.DB_TABLE_CONECOFOR_AREE_TOT.'.COORD_ORIG_E AS LONGITUDE,'.DB_TABLE_CONECOFOR_AREE.'.DISPH2O AS WATER,'.DB_TABLE_CONECOFOR_AREE.'.T_HUMUS AS HUMUS,RIGHT(CONCAT(" ",CAST('.DB_TABLE_CONECOFOR_AREE.'.ALTITUD AS UNSIGNED)),2) AS ALTITUDE,'.DB_TABLE_CONECOFOR_AREE.'.ESPOSIZ AS ORIENTATION,'.DB_TABLE_CONECOFOR_AREE.'.ETAMEDIA AS MEAN_AGE," " AS OTHER_OBSERVATIONS FROM '.DB_TABLE_CONECOFOR_AREE.' LEFT JOIN '.DB_TABLE_CONECOFOR_AREE_TOT.' ON '.DB_TABLE_CONECOFOR_AREE.'.IDAREA = '.DB_TABLE_CONECOFOR_AREE_TOT.'.IDAREA WHERE (IDONEITA=1 AND '.DB_TABLE_CONECOFOR_AREE.'.TIPOAREA="C") ORDER BY '.DB_TABLE_CONECOFOR_AREE.'.IDAREA';
			//QUERY PLO icp2012
			$plo_query='SELECT 
			            RIGHT(CONCAT("  ",Replace(PAESE,"0"," ")),2) AS COUNTRY,
			            RIGHT(CONCAT("      ", CAST(RIGHT ('.DB_TABLE_CONECOFOR_AREE.'.IDAREA , LENGTH('.DB_TABLE_CONECOFOR_AREE.'.IDAREA)-1) AS UNSIGNED) ) ,6) AS PLOT,
			            CONCAT(RIGHT(CONCAT("0",DAY(DATARIL)),2),RIGHT(CONCAT("0",MONTH(DATARIL)),2),RIGHT(CONCAT("0",YEAR(DATARIL)),2)) AS DATE,
			            RIGHT(CONCAT("       ",'.DB_TABLE_CONECOFOR_AREE_TOT.'.COORD_ORIG_N),7) AS LATITUDE,
			            RIGHT(CONCAT("       ",'.DB_TABLE_CONECOFOR_AREE_TOT.'.COORD_ORIG_E),7) AS LONGITUDE,
			            RIGHT(CONCAT("     ",'.DB_TABLE_CONECOFOR_AREE_TOT.'.REG_COD_ISTAT),5) AS TEAM_ID,
			            '.DB_TABLE_CONECOFOR_AREE.'.DISPH2O AS WATER,
			            '.DB_TABLE_CONECOFOR_AREE.'.T_HUMUS AS HUMUS,
			            RIGHT(CONCAT(" ",CAST('.DB_TABLE_CONECOFOR_AREE.'.ALTITUD AS UNSIGNED)),2) AS ALTITUDE,
			            '.DB_TABLE_CONECOFOR_AREE.'.ESPOSIZ AS ORIENTATION,
			            RIGHT(CONCAT("   ",'.DB_TABLE_CONECOFOR_AREE.'.ETAMEDIA),2) AS MEAN_AGE,
			            " " AS OTHER_OBSERVATIONS 
			            FROM '.DB_TABLE_CONECOFOR_AREE.' LEFT JOIN '.DB_TABLE_CONECOFOR_AREE_TOT.' ON '.DB_TABLE_CONECOFOR_AREE.'.IDAREA = '.DB_TABLE_CONECOFOR_AREE_TOT.'.IDAREA 
			            WHERE ( '.DB_TABLE_CONECOFOR_AREE.'.ANNO_RIL='.$anno_ril.' AND IDONEITA=1 AND '.DB_TABLE_CONECOFOR_AREE.'.TIPOAREA="C" ) 
			            ORDER BY '.DB_TABLE_CONECOFOR_AREE.'.IDAREA';
			
			$this->exportMysqlToICP("plo",$plo_icp_fieldline,$plo_query,$plo_icp_file_name," ");
 			$this->exportMysqlToICP("plo",$plo_csv_fieldline,$plo_query,$plo_csv_file_name,";");
 			
 			
			//QUERY TRE icp2010 
            //$tre_query='SELECT RIGHT(CONCAT("    ", CAST(RIGHT ('.DB_TABLE_CONECOFOR_AREE.'.IDAREA , LENGTH('.DB_TABLE_CONECOFOR_AREE.'.IDAREA)-1) AS UNSIGNED) ) ,4) AS PLOT,CONCAT(RIGHT(CONCAT("0",DAY(DATARIL)),2),RIGHT(CONCAT("0",MONTH(DATARIL)),2),RIGHT(CONCAT("0",YEAR(DATARIL)),2)) AS DATE,RIGHT(CONCAT("    ",CAST('.DB_TABLE_CONECOFOR_PIANTE.'.IDPIANTA AS UNSIGNED)),4) AS TREE,RIGHT(CONCAT("   ",CAST('.DB_TABLE_CONECOFOR_PIANTE.'.SPECIE AS UNSIGNED)),3) AS TREE_SPECIES,RIGHT(CONCAT("   ",CAST('.DB_TABLE_CONECOFOR_PIANTE.'.TRASPAR AS UNSIGNED)),3) AS DEFOL,IF((Q_ICP_TRE_DISCOLOURATION.DISCOL Is Null OR TRIM(Q_ICP_TRE_DISCOLOURATION.DISCOL) ="")," ",Q_ICP_TRE_DISCOLOURATION.DISCOL) AS DISCOL,IF(('.DB_TABLE_CONECOFOR_PIANTE.'.FRUTTIF Is Null OR TRIM('.DB_TABLE_CONECOFOR_PIANTE.'.FRUTTIF) ="")," ",'.DB_TABLE_CONECOFOR_PIANTE.'.FRUTTIF) AS FRUITING_ASSESS," " AS OTHER_OBSERVATIONS FROM (SELECT '.DB_TABLE_CONECOFOR_PIANTE.'.IDAREA,'.DB_TABLE_CONECOFOR_PIANTE.'.IDPIANTA,Q_ICP_TRE_DISCOLOURATION_B.SommaDiPERC,IF(Q_ICP_TRE_DISCOLOURATION_B.SommaDiPERC=0 Or Q_ICP_TRE_DISCOLOURATION_B.SommaDiPERC IS NULL, IF(CAST('.DB_TABLE_CONECOFOR_PIANTE.'.TRASPAR AS UNSIGNED)<100,"0"," "), IF(Q_ICP_TRE_DISCOLOURATION_B.SommaDiPERC>0 And Q_ICP_TRE_DISCOLOURATION_B.SommaDiPERC<=10,"0",IF(Q_ICP_TRE_DISCOLOURATION_B.SommaDiPERC>10 And Q_ICP_TRE_DISCOLOURATION_B.SommaDiPERC<=25,"1",IF(Q_ICP_TRE_DISCOLOURATION_B.SommaDiPERC>25 And Q_ICP_TRE_DISCOLOURATION_B.SommaDiPERC<=60,"2","3")))) AS DISCOL FROM (SELECT Q_ICP_TRE_DISCOLOURATION_A.IDAREA, Q_ICP_TRE_DISCOLOURATION_A.IDPIANTA, SUM(Q_ICP_TRE_DISCOLOURATION_A.PERC) AS SommaDiPERC FROM(SELECT IDAREA, IDPIANTA, TIPOSINT, CAST(AG_DIFF AS UNSIGNED) AS PERC FROM '.DB_TABLE_CONECOFOR_SINTOMI.' WHERE (((TIPOSINT)="02" Or (TIPOSINT)="03" Or (TIPOSINT)="04" Or (TIPOSINT)="05"))) AS Q_ICP_TRE_DISCOLOURATION_A GROUP BY Q_ICP_TRE_DISCOLOURATION_A.IDAREA, Q_ICP_TRE_DISCOLOURATION_A.IDPIANTA)AS Q_ICP_TRE_DISCOLOURATION_B RIGHT JOIN '.DB_TABLE_CONECOFOR_PIANTE.' ON (Q_ICP_TRE_DISCOLOURATION_B.IDAREA = '.DB_TABLE_CONECOFOR_PIANTE.'.IDAREA) AND (Q_ICP_TRE_DISCOLOURATION_B.IDPIANTA = '.DB_TABLE_CONECOFOR_PIANTE.'.IDPIANTA) GROUP BY '.DB_TABLE_CONECOFOR_PIANTE.'.IDAREA, '.DB_TABLE_CONECOFOR_PIANTE.'.IDPIANTA, Q_ICP_TRE_DISCOLOURATION_B.SommaDiPERC) AS Q_ICP_TRE_DISCOLOURATION RIGHT JOIN ('.DB_TABLE_CONECOFOR_AREE.' RIGHT JOIN '.DB_TABLE_CONECOFOR_PIANTE.' ON ('.DB_TABLE_CONECOFOR_AREE.'.IDAREA = '.DB_TABLE_CONECOFOR_PIANTE.'.IDAREA)) ON (Q_ICP_TRE_DISCOLOURATION.IDPIANTA = '.DB_TABLE_CONECOFOR_PIANTE.'.IDPIANTA) AND (Q_ICP_TRE_DISCOLOURATION.IDAREA = '.DB_TABLE_CONECOFOR_PIANTE.'.IDAREA) WHERE (TIPOAREA="C" AND IDONEITA="1" AND (CAMPNEW="1" OR CAMPNEW = "2")) ORDER BY '.DB_TABLE_CONECOFOR_PIANTE.'.IDAREA, '.DB_TABLE_CONECOFOR_PIANTE.'.IDPIANTA';
			//QUERY TRE icp2011
			//$tre_query='SELECT RIGHT(CONCAT("    ", CAST(RIGHT ('.DB_TABLE_CONECOFOR_AREE.'.IDAREA , LENGTH('.DB_TABLE_CONECOFOR_AREE.'.IDAREA)-1) AS UNSIGNED) ) ,4) AS PLOT, CONCAT(RIGHT(CONCAT("0",DAY(DATARIL)),2),RIGHT(CONCAT("0",MONTH(DATARIL)),2),RIGHT(CONCAT("0",YEAR(DATARIL)),2)) AS DATE, RIGHT(CONCAT("    ",CAST('.DB_TABLE_CONECOFOR_PIANTE.'.IDPIANTA AS UNSIGNED)),4) AS TREE, RIGHT(CONCAT("   ",CAST('.DB_TABLE_CONECOFOR_PIANTE.'.SPECIE AS UNSIGNED)),3) AS TREE_SPECIES, IF('.DB_TABLE_CONECOFOR_PIANTE.'.CAMPNEW="1",IF('.DB_TABLE_CONECOFOR_PIANTE.'.TRASPAR="100","39","01"),IF('.DB_TABLE_CONECOFOR_PIANTE.'.CAMPNEW="2","02",IF('.DB_TABLE_CONECOFOR_PIANTE.'.CAMPNEW="3","19",IF('.DB_TABLE_CONECOFOR_PIANTE.'.CAMPNEW="4","19","XX")))) AS REMOVAL_MORTALITY, IF((2011_conecofor_piante.TRASPAR Is Null OR TRIM(2011_conecofor_piante.TRASPAR) =""),"   ",RIGHT(CONCAT("   ",CAST('.DB_TABLE_CONECOFOR_PIANTE.'.TRASPAR AS UNSIGNED)),3)) AS DEFOL, IF(('.DB_TABLE_CONECOFOR_PIANTE.'.FRUTTIF Is Null OR TRIM('.DB_TABLE_CONECOFOR_PIANTE.'.FRUTTIF) =""),"   ",IF('.DB_TABLE_CONECOFOR_PIANTE.'.FRUTTIF="1","1.1",IF('.DB_TABLE_CONECOFOR_PIANTE.'.FRUTTIF="2","2.0",IF('.DB_TABLE_CONECOFOR_PIANTE.'.FRUTTIF="3","3.0","XXX")))) AS FRUITING_ASSESS, "4" AS ASSESSABLE_CROWN, " " AS OTHER_OBSERVATIONS FROM('.DB_TABLE_CONECOFOR_AREE.' RIGHT JOIN '.DB_TABLE_CONECOFOR_PIANTE.' ON ('.DB_TABLE_CONECOFOR_AREE.'.IDAREA = '.DB_TABLE_CONECOFOR_PIANTE.'.IDAREA)) WHERE (TIPOAREA="C" AND IDONEITA="1") ORDER BY '.DB_TABLE_CONECOFOR_PIANTE.'.IDAREA, CAST('.DB_TABLE_CONECOFOR_PIANTE.'.IDPIANTA AS UNSIGNED)';
            //QUERY TRE icp2012
			$tre_query='SELECT
			            RIGHT(CONCAT("      ", CAST(RIGHT ('.DB_TABLE_CONECOFOR_AREE.'.IDAREA , LENGTH('.DB_TABLE_CONECOFOR_AREE.'.IDAREA)-1) AS UNSIGNED) ) ,6) AS PLOT, 
			            CONCAT(RIGHT(CONCAT("0",DAY(DATARIL)),2),RIGHT(CONCAT("0",MONTH(DATARIL)),2),RIGHT(CONCAT("0",YEAR(DATARIL)),2)) AS DATE, 
			            RIGHT(CONCAT("    ",CAST('.DB_TABLE_CONECOFOR_PIANTE.'.IDPIANTA AS UNSIGNED)),4) AS TREE, 
			            RIGHT(CONCAT("   ",CAST('.DB_TABLE_CONECOFOR_PIANTE.'.SPECIE AS UNSIGNED)),3) AS TREE_SPECIES, 
			            RIGHT(CONCAT("  ",IF('.DB_TABLE_CONECOFOR_PIANTE.'.REM_MORT="902",2,CAST('.DB_TABLE_CONECOFOR_PIANTE.'.REM_MORT AS UNSIGNED))),2) AS REMOVAL_MORTALITY, 
			            IF(('.DB_TABLE_CONECOFOR_PIANTE.'.TRASPAR Is Null OR TRIM('.DB_TABLE_CONECOFOR_PIANTE.'.TRASPAR) =""),"   ",RIGHT(CONCAT("   ",CAST('.DB_TABLE_CONECOFOR_PIANTE.'.TRASPAR AS UNSIGNED)),3)) AS DEFOL, 
			            RIGHT(CONCAT("   ",'.DB_TABLE_CONECOFOR_PIANTE.'.FRUTTIF),3) AS FRUITING_ASSESS, 
			            RIGHT(CONCAT(" ",'.DB_TABLE_CONECOFOR_PIANTE.'.ASS_CROWN),1) AS ASSESSABLE_CROWN, 
			            " " AS OTHER_OBSERVATIONS 
			            FROM('.DB_TABLE_CONECOFOR_AREE.' RIGHT JOIN '.DB_TABLE_CONECOFOR_PIANTE.' ON ('.DB_TABLE_CONECOFOR_AREE.'.ANNO_RIL = '.DB_TABLE_CONECOFOR_PIANTE.'.ANNO_RIL AND '.DB_TABLE_CONECOFOR_AREE.'.IDAREA = '.DB_TABLE_CONECOFOR_PIANTE.'.IDAREA)) 
			            WHERE ( '.DB_TABLE_CONECOFOR_PIANTE.'.ANNO_RIL='.$anno_ril.' AND TIPOAREA="C" AND IDONEITA="1" AND REM_MORT<905 ) 
			            ORDER BY '.DB_TABLE_CONECOFOR_PIANTE.'.IDAREA, CAST('.DB_TABLE_CONECOFOR_PIANTE.'.IDPIANTA AS UNSIGNED)';
			
			
			
			//die($tre_query);
			             
            $this->exportMysqlToICP("tre",$tre_icp_fieldline,$tre_query,$tre_icp_file_name," ");
 			$this->exportMysqlToICP("tre",$tre_csv_fieldline,$tre_query,$tre_csv_file_name,";");
 			
 			//OLD TRF icp2010
            //$trf_query='SELECT RIGHT(CONCAT("    ", CAST(RIGHT ('.DB_TABLE_CONECOFOR_AREE.'.IDAREA , LENGTH('.DB_TABLE_CONECOFOR_AREE.'.IDAREA)-1) AS UNSIGNED) ) ,4) AS PLOT,CONCAT(RIGHT(CONCAT("0",DAY(DATARIL)),2),RIGHT(CONCAT("0",MONTH(DATARIL)),2),RIGHT(CONCAT("0",YEAR(DATARIL)),2)) AS DATE,IF(('.DB_TABLE_CONECOFOR_PIANTE.'.IDPIANTA Is Null OR TRIM('.DB_TABLE_CONECOFOR_PIANTE.'.IDPIANTA) =""),"    ",RIGHT(CONCAT("    ",CAST('.DB_TABLE_CONECOFOR_PIANTE.'.IDPIANTA AS UNSIGNED)),4)) AS TREE,IF((PARTE Is Null OR TRIM(PARTE) =""),"  ",RIGHT(CONCAT("  ",CAST(PARTE AS UNSIGNED)),2)) AS AFFECTED_PART,IF((TIPOSINT Is Null OR TRIM(TIPOSINT) =""),"  ",RIGHT(CONCAT("  ",CAST(TIPOSINT AS UNSIGNED)),2)) AS SYMPTOM,"  " AS SYMPTOM_SPEC," " AS CROWN_LOC,RIGHT(CONCAT(" ",ETADANNO),1) AS DAMAGE_AGE,IF((AGENTE Is Null Or AGENTE=""),"     ",IF(LEFT(AGENTE,1)="8" AND RIGHT(AGENTE,1)!="0",AGENTE,CONCAT("  ",LEFT(AGENTE,3)))) AS CAUSE,IF(AG_CODE Is Null,"       ",AG_CODE) AS CAUSE_SC_NAME,IF((AG_DIFF Is Null OR TRIM(AG_DIFF) = "")," ",IF(CAST(AG_DIFF AS UNSIGNED)=0,"0",IF(CAST(AG_DIFF AS UNSIGNED)>=1 And CAST(AG_DIFF AS UNSIGNED)<=10,"1",IF(CAST(AG_DIFF AS UNSIGNED)>=11 And CAST(AG_DIFF AS UNSIGNED)<=20,"2",IF(CAST(AG_DIFF AS UNSIGNED)>=21 And CAST(AG_DIFF AS UNSIGNED)<=40,"3",IF(CAST(AG_DIFF AS UNSIGNED)>=41 And CAST(AG_DIFF AS UNSIGNED)<=60,"4",IF(CAST(AG_DIFF AS UNSIGNED)>=61 And CAST(AG_DIFF AS UNSIGNED)<=80,"5",IF(CAST(AG_DIFF AS UNSIGNED)>=81 And CAST(AG_DIFF AS UNSIGNED)<=99,"6","7")))))))) AS EXTENT," " AS OTHER_OBSERVATIONS FROM (('.DB_TABLE_CONECOFOR_SINTOMI.' LEFT JOIN '.DB_TABLE_CONECOFOR_AREE.' ON ('.DB_TABLE_CONECOFOR_AREE.'.IDAREA = '.DB_TABLE_CONECOFOR_SINTOMI.'.IDAREA)) LEFT JOIN '.DB_TABLE_CONECOFOR_PIANTE.' ON ('.DB_TABLE_CONECOFOR_PIANTE.'.IDAREA = '.DB_TABLE_CONECOFOR_SINTOMI.'.IDAREA) AND ('.DB_TABLE_CONECOFOR_PIANTE.'.IDPIANTA = '.DB_TABLE_CONECOFOR_SINTOMI.'.IDPIANTA) ) NATURAL LEFT JOIN tabdec_cod_agente WHERE (TIPOAREA="C" AND IDONEITA="1" AND (CAMPNEW="1" OR CAMPNEW = "2")) ORDER BY '.DB_TABLE_CONECOFOR_SINTOMI.'.IDAREA, '.DB_TABLE_CONECOFOR_SINTOMI.'.IDPIANTA, '.DB_TABLE_CONECOFOR_SINTOMI.'.IDSINTOMO';
            //QUERY TRF icp2011,icp2012 
            $trf_query='SELECT 
                        RIGHT(CONCAT("      ", CAST(RIGHT ('.DB_TABLE_CONECOFOR_AREE.'.IDAREA , LENGTH('.DB_TABLE_CONECOFOR_AREE.'.IDAREA)-1) AS UNSIGNED) ) ,6) AS PLOT,
                        CONCAT(RIGHT(CONCAT("0",DAY(DATARIL)),2),RIGHT(CONCAT("0",MONTH(DATARIL)),2),RIGHT(CONCAT("0",YEAR(DATARIL)),2)) AS DATE,
                        IF(('.DB_TABLE_CONECOFOR_PIANTE.'.IDPIANTA Is Null OR TRIM('.DB_TABLE_CONECOFOR_PIANTE.'.IDPIANTA) =""),"    ",RIGHT(CONCAT("    ",CAST('.DB_TABLE_CONECOFOR_PIANTE.'.IDPIANTA AS UNSIGNED)),4)) AS TREE,
                        IF((PARTE Is Null OR TRIM(PARTE) =""),"  ",RIGHT(CONCAT("  ",CAST(PARTE AS UNSIGNED)),2)) AS AFFECTED_PART,
                        IF(PARTE="09" OR PARTE="00","-9",IF((TIPOSINT Is Null OR TRIM(TIPOSINT) =""),"  ",RIGHT(CONCAT("  ",CAST(TIPOSINT AS UNSIGNED)),2))) AS SYMPTOM,
                        "  " AS SYMPTOM_SPEC," " AS CROWN_LOC,RIGHT(CONCAT(" ",ETADANNO),1) AS DAMAGE_AGE,
                        IF((AGENTE Is Null Or AGENTE=""),"     ",IF(LEFT(AGENTE,1)="8" AND RIGHT(AGENTE,1)!="0",AGENTE,CONCAT("  ",LEFT(AGENTE,3)))) AS CAUSE,
                        IF(AG_CODE Is Null,"       ",AG_CODE) AS CAUSE_SC_NAME,
                        IF((AG_DIFF Is Null OR TRIM(AG_DIFF) = "")," ",IF(CAST(AG_DIFF AS UNSIGNED)=0,"0",IF(CAST(AG_DIFF AS UNSIGNED)>=1 And CAST(AG_DIFF AS UNSIGNED)<=10,"1",IF(CAST(AG_DIFF AS UNSIGNED)>=11 And CAST(AG_DIFF AS UNSIGNED)<=20,"2",IF(CAST(AG_DIFF AS UNSIGNED)>=21 And CAST(AG_DIFF AS UNSIGNED)<=40,"3",IF(CAST(AG_DIFF AS UNSIGNED)>=41 And CAST(AG_DIFF AS UNSIGNED)<=60,"4",IF(CAST(AG_DIFF AS UNSIGNED)>=61 And CAST(AG_DIFF AS UNSIGNED)<=80,"5",IF(CAST(AG_DIFF AS UNSIGNED)>=81 And CAST(AG_DIFF AS UNSIGNED)<=99,"6","7")))))))) AS EXTENT,
                        " " AS OTHER_OBSERVATIONS 
                        FROM (('.DB_TABLE_CONECOFOR_SINTOMI.' LEFT JOIN '.DB_TABLE_CONECOFOR_AREE.' ON ('.DB_TABLE_CONECOFOR_AREE.'.ANNO_RIL = '.DB_TABLE_CONECOFOR_SINTOMI.'.ANNO_RIL AND '.DB_TABLE_CONECOFOR_AREE.'.IDAREA = '.DB_TABLE_CONECOFOR_SINTOMI.'.IDAREA)) LEFT JOIN '.DB_TABLE_CONECOFOR_PIANTE.' ON ('.DB_TABLE_CONECOFOR_PIANTE.'.ANNO_RIL = '.DB_TABLE_CONECOFOR_SINTOMI.'.ANNO_RIL AND '.DB_TABLE_CONECOFOR_PIANTE.'.IDAREA = '.DB_TABLE_CONECOFOR_SINTOMI.'.IDAREA) AND ('.DB_TABLE_CONECOFOR_PIANTE.'.IDPIANTA = '.DB_TABLE_CONECOFOR_SINTOMI.'.IDPIANTA) ) NATURAL LEFT JOIN tabdec_cod_agente 
                        WHERE ( '.DB_TABLE_CONECOFOR_SINTOMI.'.ANNO_RIL='.$anno_ril.' AND TIPOAREA="C" AND IDONEITA="1"  AND REM_MORT<905 ) 
                        ORDER BY '.DB_TABLE_CONECOFOR_SINTOMI.'.IDAREA, '.DB_TABLE_CONECOFOR_SINTOMI.'.IDPIANTA, '.DB_TABLE_CONECOFOR_SINTOMI.'.IDSINTOMO';
                        
            $this->exportMysqlToICP("trf",$trf_icp_fieldline,$trf_query,$trf_icp_file_name," ");
 			$this->exportMysqlToICP("trf",$trf_csv_fieldline,$trf_query,$trf_csv_file_name,";");
 			
  			$backupFile = dirname(__FILE__)."/icp_data_repository/".$anno_ril."_CONECOFOR_ICP.zip";
  			//Se esiste già, lo cancello
  			if (file_exists($backupFile)) @unlink($backupFile);
            
                     
            $archive = new PclZip($backupFile);
  			//Una lista di nomi di files da comprimere
  			$listOfFilesToCompress=$plo_icp_file_name.','.$tre_icp_file_name.','.$trf_icp_file_name.','.$plo_csv_file_name.','.$tre_csv_file_name.','.$trf_csv_file_name;
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
	    
    
    function exportMysqlToICP($icp_file_type,$fieldline,$sql_query,$filename,$cvs_char)
		{
			try {
				$csv_terminated = "\r\n";
			    $csv_separator = $cvs_char;
			    $csv_enclosed = '';
			    $csv_escaped = "\\";
				
				
			    $column_names=array();
			    /*** fetch into an PDOStatement object ***/
			    $stmt = $this->dbh->query($sql_query);
			    $result = $stmt->fetch(PDO::FETCH_ASSOC);
			    foreach($result as $key=>$val)
			    {
			    	$column_names[] = $key;
			    }
	       				          
			    // Gets the data from the database
			   
			    $fields_cnt = count($column_names);
			 	 
			    $out = $fieldline;
			    $out .= $csv_terminated;
			    
			    //$pre_query="SET @cnt := 0";
				//$stmt = $this->dbh->prepare($pre_query);
	    		//$stmt->execute();
			    
			    			 
			    // Format the data
                
                // set starting sequence number
                $sequence = 1;
                
                // set dimension of sequence field
                switch ($icp_file_type){
                	case "plo":
                        $sequence_dim = 4;
                        break;
                    case "tre":
                        $sequence_dim = 5;
                        break;
                    case "trf":
                        $sequence_dim = 5;
                        break;
                }
                    
                    
			    foreach ($this->dbh->query($sql_query) as $row){
			        $schema_insert = '';
                    // add sequence number
                    $schema_insert .= substr("     ".$sequence,-$sequence_dim);
                    $schema_insert .= $csv_separator;
                    
			        for ($j = 0; $j < $fields_cnt; $j++)
			        {
                        //add sequence
                        
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
                    
                    //increase seq number
                    $sequence = $sequence +1;
                    
			    } // end foreach
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
