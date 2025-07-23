<?php
ini_set('display_errors', 1);
/*require_once('./PhpConsole.phar'); // autoload will be initialized automatically
$connector = PhpConsole\Connector::getInstance();
$handler = PhpConsole\Handler::getInstance();
$handler->start(); 	
$handler->debug('start', 'conecofor.login.php');
*/
session_start();


include('./conecofor_login_class.php');

$conecofor_login_obj = new conecofor_login_class();


?>


<html>
<head>
<meta content="text/html; charset=UTF-8"
http-equiv="Content-Type">
<title>CONECOFOR TEST UPLOAD</title>
</head>
<body>
<table style="text-align: left; width: 100%; border-spacing: 0px;  border-collapse: collapse;" border="0" cellpadding="0" cellspacing="0" >
<tbody> 
	<tr>
		<td rowspan="6" style="text-align: center; vertical-align: top; background-color: rgb(72, 81, 83); width: 50px; ">
			<img src="images/corner_ur.gif" alt="" style="width: 50px; height: 50px;">
		</td>
		<td colspan="4" style="text-align: right; height: 100px;">
			<a href="http://www.corpoforestale.it"><img src="images/cfs.jpg" alt="" style="width: 150px; height: 100px;"></a>
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
			<?php $conecofor_login_obj->print_logged_form(); ?>
		</td>
	</tr>
	<tr>
		<td style="width: 20px; background-color: rgb(72, 81, 83);">
			
		</td>
		<td colspan="2" style="width: 40px;vertical-align: top;  background-color: rgb(181, 201, 207);">
			<img src="images/corner_green_ul.gif" alt="" style="width: 20px; height: 20px;" align="top">
		</td>
		<td style="text-align: left; vertical-align: center; background-color: rgb(181, 201, 207); height: 20px;">
			<?php $conecofor_login_obj->print_title(); ?>
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
			<?php $conecofor_login_obj->print_2login_form(); ?>
		</td>
	</tr>
    <tr>
        <td style="width: 20px; background-color: rgb(72, 81, 83);">
			
		</td>
		<td style="width: 10px; background-color: rgb(181, 201, 207);">
			
		</td>
		<td style="width: 10px; vertical-align: top;">
			
		</td>
		<td style="vertical-align: top;"><br>
			<table style="text-align: left; width: 100%; border-spacing: 0px;  border-collapse: collapse;" border="0" cellpadding="0" cellspacing="0" >
            <tbody> 
                <tr>
                	<td colspan="5" style="text-align: right; height: 200px; background-color: white;">
                        <img src="images/corner_ul.gif" alt="" style="width: 1px; height: 200px;" align="top">
                    </td>
                </tr>
                
                
                <tr>
                    <td rowspan="3" style="text-align: center; vertical-align: top; ; width: 250px; ">
                        
                    </td>
                    <td colspan="2" style="text-align: right; height: 5px; background-color: rgb(181, 201, 207);">
                        <img src="images/corner_gray_ul.gif" alt="" style="width: 5px; height: 5px;" align="top">
                    </td>
                </tr>
                
                <tr>
                    <td style="text-align: center; vertical-align: top; ; width: 60px; ">
                        <a href="http://www.f360.it"><img src="images/logo_F360.png" alt="" style="width: 50px; border:5px solid white;" align="top"></a>
                    </td>
                    <td style="text-align: justify; height: 5px; background-color: white;">
                        Sviluppo e consulenza informatica<BR>EFFETRESEIZERO srl Spin-off CRA
                    </td>
                </tr>
            </tbody>
            </table>
		</td>
    </tr>
</tbody>
</table>
<br>
</body>
</html>



