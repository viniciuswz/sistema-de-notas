<?php
require_once('Config/Config.php');
require_once(SITE_ROOT.DS.'autoload.php');
use Core\Usuario;
use Core\Notas;
use Classes\ValidarCampos;
session_start();
try{    
    Usuario::verificarPermissoes(array('Professor'));   
    //$nomesCampos = array('CodDis','numeroPeriodo','codAluno'); // Nomes dos campos que receberei do formulario
    //$validar = new ValidarCampos($nomesCampos, $_POST); //Verificar se eles existem, se nao existir estoura um erro

    $nota = new Notas();
    $nota->setCodMatricula($_POST['codMatricula']);    
    echo  $nota->AdcionarNotaAluno($_POST['periodo'],$_POST['CodDis'],$_POST['notas']);    
}catch (Exception $exc){    
    echo $exc->getMessage();
}
    
   




