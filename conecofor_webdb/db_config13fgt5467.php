<?php 
// use this pathes and/or define the pathes for the "standard" pages
define("CLASS_PATH", "path" ); // the location where the class is executed
$sec_path = "path"; // a second location where the scripts should be 
define("APPLICATION_PATH", $sec_path);

// modify these constants to fit your environment
define("DB_SERVER", "2.224.132.78");
define("DB_NAME", "conecofor");
define("DB_USER", "a4l_admin");
define("DB_PASSWORD", "alforlab"); 
define("DB_USER_PWD_SEED", "FEWSDWEGHRSDAW");
 
//list of tables

define("DB_TABLE_CONECOFOR_AREE", "conecofor_aree");
define("DB_TABLE_CONECOFOR_PIANTE", "conecofor_piante");
define("DB_TABLE_CONECOFOR_SINTOMI", "conecofor_sintomi");
define("DB_TABLE_CONECOFOR_CAV", "conecofor_cav");
define("DB_TABLE_CONECOFOR_AREE_TOT", "conecofor_aree_tot");
define("DB_TABLE_CONECOFOR_UTENTI", "conecofor_utenti");
define("DB_TABLE_CONECOFOR_GENERAL", "conecofor_general");
?>