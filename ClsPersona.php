<?php
class ClsPersona extends ClsConexion
{
		function ClsPersona($cnx  = null  )
		{
				$this->conn = $cnx;
		}

		function get_Persona()
		{


			// $this->query = "CALL usp_Set_Persona( '$cPerNombre' ,  '$cPerApellidos' , '$dPerNacimiento' , $nPerTipo  , $nPerEstado )  ; ";
			$this->query = "SELECT * FROM persona ; ";
			$this->execute_query();
			$data = $this->rows ;
			return $data;
		}

	# Funcion insertar tabla persona ->  nPerTipo si es una persona  juridica(2) o natural(1).
		function Set_Persona($cPerNombre, $cPerApellidos, $dPerNacimiento, $nPerTipo, $nPerEstado ) {


			$this->query = "CALL usp_Set_Persona( '$cPerNombre' ,  '$cPerApellidos' , '$dPerNacimiento' , $nPerTipo  , $nPerEstado )  ; ";
			$this->execute_query();
			$data = $this->rows ;
			return $data;
		}
	# Funcion Actualizar  tabla persona
		function Upd_Persona($bean_persona )
		{
			$cPerCodigo     = $bean_persona->getcPerCodigo() ;
			$cPerNombre     = $bean_persona->getcPerNombre() ;
			$cPerApellidos  = $bean_persona->getcPerApellidos() ;
			$dPerNacimiento = $bean_persona->getdPerNacimiento() ;
			$nPerEstado     = $bean_persona->getnPerEstado() ;

			$this->query = "CALL usp_Upd_Persona( '$cPerCodigo' ,'$cPerNombre' ,  '$cPerApellidos' , '$dPerNacimiento' ,  $nPerEstado )  ; ";
			$this->execute_query();
			$data = $this->rows ;
			return $data;
		}
	# Buscar Persona cPerCodigo
		function Buscar_Persona_By_cPerCodigo($bean_persona )
		{
			$cPerCodigo     = $bean_persona->getcPerCodigo() ;

			$this->query = "CALL usp_Buscar_Persona_By_cPerCodigo( '$cPerCodigo' )  ; ";
			$this->execute_query();
			$data = $this->rows ;
			return $data;
		}





}

?>