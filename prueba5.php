<?php

require_once "ClsConexion.php";
require_once "ClsParametro.php";
require_once "ClsPersona.php";
require_once "ClsPerNatural.php";

# TRANSACCIONES PARA UNA SOLO CLASE
try {


# insertamos de la tabla planeatec_demos


	$objPersona    =  new ClsPersona() ;

	$objPersona->beginTransaction() ;

	$objPersona->Set_Persona( 'ARMANDO ENRIQUE ', 'PISFIL PUEMAPE 1', '2014-08-14', '2', '1' )  ;
	$objPersona->Set_Persona( 'ARMANDO ENRIQUE ', 'PISFIL PUEMAPE 2', '2014-08-14', '2', '1' )  ;
	$objPersona->Set_Persona( 'ARMANDO ENRIQUE ', 'PISFIL PUEMAPE 3', '2014-08-14', '2',"1" )  ; # AQUI VA A FALLAR


	$objPersona->commit() ;



}
catch (Exception $e) {
	$objPersona->rollback() ;
	echo $e->getMessage() ;
}



// $objPerNatural =  new ClsPerNatural() ;
// $objPersona->ClsPersona($cnx)  ;
