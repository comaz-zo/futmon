<?php


session_start();
include('./conecofor_login_class.php');
include('./conecofor_upload_class.php');

$conecofor_login_obj = new conecofor_login_class();


if (!isset($_SESSION['conecofor_login_status'])){
	   	 	$_SESSION['conecofor_login_status'] = '2LOGIN';
	   	 	header("Location: ./conecofor_login.php");	
}
if ($_SESSION['conecofor_login_status']=='2LOGIN'){
	   	 	header("Location: ./conecofor_login.php");	
}


$conecofor_upload_obj = new conecofor_upload_class();

?>


<html>
<head>
<meta content="text/html; charset=UTF-8"
http-equiv="Content-Type">
<title>CONECOFOR WEBDB</title>
<style type="text/css">
        
        #hor-zebra
        {
            font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
            font-size: 12px;
            margin: 45px;
            width: 1000px;
            text-align: left;
            border-collapse: collapse;
        }
        #hor-zebra th
        {
            font-size: 14px;
            font-weight: bold;
            padding: 4px 4px;
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
		<td rowspan="5" style="text-align: center; vertical-align: top; background-color: rgb(72, 81, 83); width: 50px;">
			<img src="images/corner_ur.gif" alt="" style="width: 50px; height: 50px;">
		</td>
		<td colspan="4" style="text-align: right; height: 100px;">
			<img src="images/cfs.jpg" alt="" style="width: 150px; height: 100px;">
			<img src="images/conecofor_head.jpg" style=" height: 100px;" alt="">
		</td>
	</tr>
	<tr>
		<td colspan="4" style="height: 10px;">
			<img src="images/corner_ul.gif" alt="" style="width: 10px; height: 10px;">
		</td>
	</tr>
	<tr>
		<td colspan="3" style="width: 60px;vertical-align: top;  height: 40px; background-color: rgb(72, 81, 83);">
			<img src="images/corner_ul.gif" alt="" style="width: 40px; height: 40px;" align="top">
		</td>
		<td style="color: white; text-align: right; vertical-align: center; background-color: rgb(72, 81, 83); height: 40px;">
			
		</td>
	</tr>
	<tr>
		<td style="width: 20px; background-color: rgb(72, 81, 83);">
			
		</td>
		<td colspan="2" style="width: 40px; vertical-align: top; background-color: rgb(181, 201, 207);">
			<img src="images/corner_green_ul.gif" alt="" style="width: 20px; height: 20px;" align="top">
		</td>
		<td style="text-align: left; vertical-align: center; background-color: rgb(181, 201, 207); height: 20px;">
			<?php $conecofor_upload_obj->print_title(); ?>
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
		<td style="vertical-align: top;"><br>
			<?php $conecofor_upload_obj->print_upload_form(); ?>
		</td>
	</tr>
</tbody>
</table>
<br>
</body>
</html>



