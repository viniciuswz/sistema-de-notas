<?php
require_once('Config/Config.php');
require_once(SITE_ROOT.DS.'autoload.php');
use Core\Usuario;
use Core\Atividade;
use Classes\ValidarCampos;
session_start();
try{    
    Usuario::verificarPermissoes(array('Professor'));   
    $nomesCampos = array('CodDis','numeroPeriodo','codAluno'); // Nomes dos campos que receberei do formulario
    $validar = new ValidarCampos($nomesCampos, $_POST); //Verificar se eles existem, se nao existir estoura um erro

    $atividade = new Atividade();
    $atividade->setCodTurmaAtividade($_POST['CodDis']);    
    $dadosAtividade = $atividade->getAtividadesAluno($_POST['codAluno'],$_POST['numeroPeriodo']);    
    echo json_encode($dadosAtividade); 
}catch (Exception $exc){    
    $erro = $exc->getCode();
    switch ($erro) {
        case 6:
        echo "<script>javascript:window.location='turmas.php';</script>";
        break;            
    default:
        echo "<script>javascript:window.location='turmas.php';</script>";
        break;
    }
}
    
   




