<?php
require_once('Config/Config.php');
require_once(SITE_ROOT.DS.'autoload.php');
use Core\Usuario;
use Classes\ValidarCampos;
session_start();
try{    
    Usuario::verificarLogin(0);  // Não pode estar logado    
    $nomesCampos = array('cpf','senha'); // Nomes dos campos que receberei do formulario
    $validar = new ValidarCampos($nomesCampos, $_POST); //Verificar se eles existem, se nao existir estoura um erro

    $usuario = new Usuario();  
    $usuario->setCpfUsu($_POST['cpf']);
    $usuario->setSenhaUsu($_POST['senha']);
    $usuario->logar();
    
    if($_SESSION['tipo_usu'] == 'Professor'){ // se for professor
        echo "<script>javascript:window.location='turmas.php';</script>";
    }
}catch (Exception $exc){
    $erro = $exc->getCode();
    switch ($erro) {
    case 6:
        echo "<script>javascript:window.location='turmas.php';</script>";
        break;        
    case 30:    
        echo $exc->getMessage();
        break;
    default:
        echo "<script>javascript:window.location='turmas.php';</script>";
        break;
    }
}
    
   




