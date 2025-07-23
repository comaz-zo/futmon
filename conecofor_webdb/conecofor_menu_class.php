<?php

/**
 * Conecofor Menu Class
 *
 * Manage menu choiches
 *
 * PHP version 5
 *
 * @author     Effetreseizero srl <giacomo.colle@f360.it>
 * @copyright  2015 Effetreseizero srl
 * @version    SVN: 2.0.1
 */


error_reporting (E_ALL); // I use this only for testing


class conecofor_menu_class {

    function conecofor_menu_class(){

    }

    function print_title(){
    	echo '<b> Menu principale </b>';
    }

    function print_menu_form(){
    	$html_string = '';

    	switch ($_SESSION['conecofor_login_liv']){
    		case 10:
		    	$html_string = $html_string . '<table id="hor-zebra" summary="Menu">';
				$html_string = $html_string . '<tr  class="odd">';
				$html_string = $html_string . '<td>';
		    	$html_string = $html_string . 'Visualizza le aree inserite';
		    	$html_string = $html_string . '</td>';
		    	$html_string = $html_string . '<td>';
		    	$html_string = $html_string . '<a href="conecofor_select.php"><img src="images/next.png" border="0"></a>';
				$html_string = $html_string . '</td>';
				$html_string = $html_string . '</tr>';
				$html_string = $html_string . '<tr>';
				$html_string = $html_string . '<td>';
		    	$html_string = $html_string . 'Inserisci nuove aree';
		    	$html_string = $html_string . '</td>';
		    	$html_string = $html_string . '<td>';
		    	$html_string = $html_string . '<a href="conecofor_upload.php"><img src="images/next.png" border="0"></a>';
		    	$html_string = $html_string . '</td>';
				$html_string = $html_string . '</tr>';
				$html_string = $html_string . '</table>';
				break;
			case 5:
				$html_string = $html_string . '<table id="hor-zebra" summary="Menu">';

				$html_string = $html_string . '<tr class="odd">';
				$html_string = $html_string . '<td>';
		    	$html_string = $html_string . 'Visualizza le aree inserite';
		    	$html_string = $html_string . '</td>';
		    	$html_string = $html_string . '<td>';
		    	$html_string = $html_string . '<a href="conecofor_admin_select.php"><img src="images/next.png" border="0"></a>';
				$html_string = $html_string . '</td>';
				$html_string = $html_string . '</tr>';

				$html_string = $html_string . '<tr>';
				$html_string = $html_string . '<td>';
		    	$html_string = $html_string . 'Visualizza le aree mancanti';
		    	$html_string = $html_string . '</td>';
		    	$html_string = $html_string . '<td>';
		    	$html_string = $html_string . '<a href="conecofor_admin_missing.php"><img src="images/next.png" border="0"></a>';
		    	$html_string = $html_string . '</td>';
				$html_string = $html_string . '</tr>';

				$html_string = $html_string . '<tr  class="odd">';
				$html_string = $html_string . '<td>';
				$html_string = $html_string . "Scarica le tabelle AREE,PIANTE,SINTOMI e CAV in formato CSV";
		    	$html_string = $html_string . '</td>';
		    	$html_string = $html_string . '<td>';
		    	$html_string = $html_string . '<a href="conecofor_admin_export_raw_data.php"><img src="images/next.png" border="0"></a>';
		    	$html_string = $html_string . '</td>';
				$html_string = $html_string . '</tr>';

				$html_string = $html_string . '</table>';
				break;
			case 1:
				$html_string = $html_string . '<table id="hor-zebra" summary="Menu">';

				$html_string = $html_string . '<tr class="odd">';
				$html_string = $html_string . '<td>';
		    	$html_string = $html_string . 'Visualizza le aree inserite';
		    	$html_string = $html_string . '</td>';
		    	$html_string = $html_string . '<td>';
		    	$html_string = $html_string . '<a href="conecofor_admin_select.php"><img src="images/next.png" border="0"></a>';
				$html_string = $html_string . '</td>';
				$html_string = $html_string . '</tr>';

				$html_string = $html_string . '<tr>';
				$html_string = $html_string . '<td>';
		    	$html_string = $html_string . 'Visualizza le aree mancanti';
		    	$html_string = $html_string . '</td>';
		    	$html_string = $html_string . '<td>';
		    	$html_string = $html_string . '<a href="conecofor_admin_missing.php"><img src="images/next.png" border="0"></a>';
		    	$html_string = $html_string . '</td>';
				$html_string = $html_string . '</tr>';

				$html_string = $html_string . '<tr  class="odd">';
				$html_string = $html_string . '<td>';
		    	$html_string = $html_string . 'Elimina tutti i dati di una specifica area';
		    	$html_string = $html_string . '</td>';
		    	$html_string = $html_string . '<td>';
		    	$html_string = $html_string . '<a href="conecofor_admin_delete_area.php"><img src="images/next.png" border="0"></a>';
		    	$html_string = $html_string . '</td>';
				$html_string = $html_string . '</tr>';

				$html_string = $html_string . '<tr>';
				$html_string = $html_string . '<td>';
				$html_string = $html_string . "Gestisci gli utenti";
		    	$html_string = $html_string . '</td>';
		    	$html_string = $html_string . '<td>';
		    	$html_string = $html_string . '<a href="conecofor_admin_manage_user.php"><img src="images/next.png" border="0"></a>';
		    	$html_string = $html_string . '</td>';
				$html_string = $html_string . '</tr>';

				$html_string = $html_string . '<tr  class="odd">';
				$html_string = $html_string . '<td>';
				$html_string = $html_string . "Gestione dell'anno di rilievo in corso";
		    	$html_string = $html_string . '</td>';
		    	$html_string = $html_string . '<td>';
		    	$html_string = $html_string . '<a href="conecofor_admin_year.php"><img src="images/next.png" border="0"></a>';
		    	$html_string = $html_string . '</td>';
				$html_string = $html_string . '</tr>';

				$html_string = $html_string . '<tr>';
				$html_string = $html_string . '<td>';
				$html_string = $html_string . "Scarica le tabelle PLO,TRE e TRF in formato ICP e CSV";
		    	$html_string = $html_string . '</td>';
		    	$html_string = $html_string . '<td>';
		    	$html_string = $html_string . '<a href="conecofor_admin_export_icp_data.php"><img src="images/next.png" border="0"></a>';
		    	$html_string = $html_string . '</td>';
				$html_string = $html_string . '</tr>';

//				$html_string = $html_string . '<tr>';
//				$html_string = $html_string . '<td>';
//				$html_string = $html_string . "Gestisci i file ICP convalidati";
//		    	$html_string = $html_string . '</td>';
//		    	$html_string = $html_string . '<td>';
//		    	$html_string = $html_string . '<a href="conecofor_admin_file_icp.php"><img src="images/next.png" border="0"></a>';
//		    	$html_string = $html_string . '</td>';
//				$html_string = $html_string . '</tr>';

				$html_string = $html_string . '<tr class="odd">';
				$html_string = $html_string . '<td>';
				$html_string = $html_string . "Scarica le tabelle AREE,PIANTE,SINTOMI e CAV in formato CSV";
		    	$html_string = $html_string . '</td>';
		    	$html_string = $html_string . '<td>';
		    	$html_string = $html_string . '<a href="conecofor_admin_export_raw_data.php"><img src="images/next.png" border="0"></a>';
		    	$html_string = $html_string . '</td>';
				$html_string = $html_string . '</tr>';

                $html_string = $html_string . '<tr>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . "Modifica i dati grezzi del webdatabase";
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '<td>';
                $html_string = $html_string . '<a href="conecofor_dbeditor/index.html"><img src="images/next.png" border="0"></a>';
                $html_string = $html_string . '</td>';
                $html_string = $html_string . '</tr>';

				$html_string = $html_string . '</table>';
				break;
    	}



		echo $html_string;
    }
}
//End of Class
?>
