<?php

//ini_set('display_errors', 1);
error_reporting (E_ALL);
session_start();
include('./conecofor_login_class.php');
include('./conecofor_select_class.php');


$conecofor_login_obj = new conecofor_login_class();


if (!isset($_SESSION['conecofor_login_status'])){
	   	 	$_SESSION['conecofor_login_status'] = '2LOGIN';
	   	 	header("Location: ./conecofor_login.php");	
}
if ($_SESSION['conecofor_login_status']=='2LOGIN'){
	   	 	header("Location: ./conecofor_login.php");	
}


$conecofor_select_obj = new conecofor_select_class();

?>


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>CONECOFOR WEBDB</title>
<style type="text/css">
        #hor-minimalist-b
        {
            font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
            font-size: 10px;
            background: #fff;
            margin: 45px;
            width: 480px;
            border-collapse: collapse;
            text-align: left;
        }
        #hor-minimalist-b th
        {
            font-size: 12px;
            font-weight: bold;
            color: rgb(72, 81, 83);
            padding: 10px 8px;
            border-bottom: 2px solid rgb(72, 81, 83);
        }
        #hor-minimalist-b td
        {
            border-bottom: 1px solid #ccc;
            color: rgb(72, 81, 83);
            padding: 6px 8px;
            white-space: nowrap;
        }
        
        #hor-minimalist-b tbody tr:hover td
        {
            background-color: rgb(244, 244, 244);
        }
        
        
        #hor-zebra
        {
            font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
            font-size: 12px;
            margin: 45px;
            width: 80%;
            text-align: left;
            border-collapse: collapse;
        }
        #hor-zebra th
        {
            font-size: 14px;
            font-weight: bold;
            padding: 2px 2px;
            
            
        }
        #hor-zebra td
        {
            padding: 2px;
            color: rgb(72, 81, 83);
        }
        #hor-zebra .odd
        {
            background: rgb(244, 244, 244); 
        }


</style>
</head>
<body>
<table style="text-align: left; width: 100%;" border="0" cellpadding="0" cellspacing="0">
<tbody>
	<tr>
		<td rowspan="5" style="text-align: center; vertical-align: top; background-color: rgb(72, 81, 83); width: 50px; ">
			<img src="images/corner_ur.gif" alt="" style="width: 50px; height: 50px;">
		</td>
		<td colspan="4" style="text-align: right; height: 100px;">
            
			<img src="images/cfs.jpg" alt="" style="width: 150px; height: 100px;">
			<img src="images/conecofor_head.jpg" style=" height: 100px;" alt="">
		</td>
        <td>
        </td>
	</tr>
	<tr>
		<td colspan="5" style="height: 10px;">
			<img src="images/corner_ul.gif" alt="" style="width: 10px; height: 10px;">
		</td>
	</tr>
	<tr>
		<td colspan="3" style="width: 60px;vertical-align: top;  height: 40px; background-color: rgb(72, 81, 83);">
			<img src="images/corner_ul.gif" alt="" style="width: 40px; height: 40px;" align="top">
		</td>
		<td style="color: white; text-align: left; vertical-align: middle; background-color: rgb(72, 81, 83); height: 40px;">
			
		</td>
	</tr>
	<tr>
		<td style="width: 20px; background-color: rgb(72, 81, 83);">
			
		</td>
		<td colspan="2" style="width: 20px;vertical-align: top;  background-color: rgb(181, 201, 207);">
			<img src="images/corner_green_ul.gif" alt="" style="width: 20px; height: 20px;" align="top">
		</td>
		<td style="text-align: left; vertical-align: middle; background-color: rgb(181, 201, 207); height: 20px;  ">
			<?php $conecofor_select_obj->print_title(); ?>
		</td>

	</tr>
	<tr>
		<td style="width: 20px; background-color: rgb(72, 81, 83);">
			
		</td>
		<td style="width: 10px; background-color: rgb(181, 201, 207);">
			
		</td>
		<td style="width: 10px; vertical-align: top;">
			<img src="images/corner_gray_ul.gif" alt="" style="width: 10px; height: 10px;" align="top">
		</td>
		<td style="width: 100%; vertical-align: top;"><br>
			<?php $conecofor_select_obj->print_select_form(); ?>
		</td>
	</tr>
</tbody>
</table>
<br>
</body>
</html>



