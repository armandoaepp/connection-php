<?php

require_once "ClsConexion.php";
require_once "ClsParametro.php";
require_once "ClsPersona.php";
require_once "ClsPerNatural.php";

# muliples BD
try {


# insertamos de la tabla planeatec_demos

	$objParametro  =  new ClsParametro() ;
	$cnx = $objParametro->get_connection() ;

	$objPersona    =  new ClsPersona($cnx) ;

	$objParametro->beginTransaction() ;

	$objPersona->Set_Persona( 'ARMANDO ENRIQUE ', 'PISFIL PUEMAPE ', '2014-08-14', '2', '1' )  ;
	// $objPersona->Set_Persona( 'ARMANDO ENRIQUE ', 'PISFIL PUEMAPE ', '2014-08-14', '2' )  ; # AQUI VA A FALLAR

	$objParametro->Set_Parametro(3000, 'cParNombre 1',' cParDescripcion 1' ) ;
	$objParametro->Set_Parametro(3000, 'cParNombre 2',' cParDescripcion 2' ) ;

	$objParametro->commit() ;

	# extraermos de la BD paneatec_Sa
	$objPerNatural =  new ClsPerNatural() ;
	$data = $objPerNatural->get_PerNatural() ;

	var_dump($data );

}
catch (Exception $e) {
	$objParametro->rollback() ;
	// echo $e->getMessage() ;
}



// $objPerNatural =  new ClsPerNatural() ;
// $objPersona->ClsPersona($cnx)  ;
