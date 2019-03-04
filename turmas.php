<?php
    require_once('Config/Config.php');
    require_once(SITE_ROOT.DS.'autoload.php');
    use Core\Usuario;
    use Core\DisciplinaResponsavel;
    use Core\Turma;
    use Classes\ValidarCampos;
    session_start();
    try{    
        Usuario::verificarPermissoes(array('Professor','Diretor'));  // apenas professores  e diretor têm acesso a essa pagina 
        $usuario = new Usuario();
        $dadosUsuario = $usuario->getDadosUser();        
?>   
<!DOCTYPE html>
    <html lang=pt-br>
    <head>
        
        <title>Nossa nota</title>
        <meta charset=UTF-8> <!-- ISO-8859-1 -->
        <meta name=viewport content="width=device-width, initial-scale=1.0">
        <meta name=description content="sistema de notas para professores">
        <meta name=keywords content="notas"> <!-- Opcional -->
        <meta name=author content='Daniel52x e Viniciuswz'>
        
        <!-- favicon, arquivo de imagem podendo ser 8x8 - 16x16 - 32x32px com extensão .ico -->
        <link rel="shortcut icon" href="imagens/favicon.ico" type="image/x-icon">
        
        <!-- CSS PADRÃO -->
        <link href="css/default.css" rel=stylesheet>
        
        <!-- Telas Responsivas -->
        <link rel=stylesheet media="screen and (max-width:480px)" href="css/style480.css">
        <link rel=stylesheet media="screen and (min-width:481px) and (max-width:768px)" href="css/style768.css">
        <link rel=stylesheet media="screen and (min-width:769px) and (max-width:1024px)" href="css/style1024.css">
        <link rel=stylesheet media="screen and (min-width:1025px)" href="css/style1025.css">
        <!-- JS-->
        <script src="lib/_jquery/jquery.js"></script>
        <script src="js/js.js"></script>
        
    </head>
    <body>
        <div id="container">
            <header>
                <p>Olá, <strong><?php echo $dadosUsuario[0]['nome_usuario']?></strong> !</p>
                <a href="logout.php">logout</a>
            </header>
            <section class="turmas">
                <?php 
                    if($_SESSION['tipo_usu'] == 'Professor'){
                        $turmas = new DisciplinaResponsavel();
                        $turmas->setCodUsuario($_SESSION['id_user']);
                        $dadosTurma = $turmas->getTurmas();
                ?>
                <h1>Suas turmas</h1>
                        <div>
                            <?php
                                if(count($dadosTurma) > 0){
                                    $contador = 0;                            
                                    $html = "";
                                    $nomeDisciplina = array();
                                    $nomeDisciplina2 = "";
                                    while($contador < count($dadosTurma)){ 
                                        if(!in_array($dadosTurma[$contador]['descricao_disciplina'], $nomeDisciplina)){ 
                                            if($contador == 0){
                                                echo '<div>';
                                                echo "<h3>{$dadosTurma[$contador]['descricao_disciplina']}</h3>";
                                            }else{
                                                echo '</div>';
                                                echo "<h3>{$dadosTurma[$contador]['descricao_disciplina']}</h3>";
                                                echo '<div>';
                                            }                                    
                                            $nomeDisciplina[] = $dadosTurma[$contador]['descricao_disciplina'];                                    
                                        }                                           
                                        echo '<a href="sala.php?ID='.$dadosTurma[$contador]['cod_turma'].'&CodDis='.$dadosTurma[$contador]['cod_turma_disciplina'].'">'.$dadosTurma[$contador]['descricao_turma'].'</a>';
                                        $contador++;                                
                                    }
                                }                       
                            ?>     
                        </div>
                <?php
                    }else{
                        $turmas = new Turma();                        
                        $dadosTurma = $turmas->getTurmas();                        
                ?>
                        <h1>Turmas do colégio</h1>
                <?php
                        echo '<div>';
                            $contador=0;
                            while($contador < count($dadosTurma)){
                                echo '<a href="sala.php?ID='.$dadosTurma[$contador]['cod_turma'].'">'.$dadosTurma[$contador]['descricao_turma'].'</a>';
                                $contador++;
                            }
                        echo '</div>';
                    }
                ?>
            </section>
        </div>
        
        
    </body>
    </html>
<?php    
    }catch (Exception $exc){    
        $erro = $exc->getCode();
        switch ($erro) {
        case 6:
            echo "<script>javascript:window.location='login.php';</script>";
            break;     
        case 50:
            echo $exc->getMessage();
            break;
        default:
            echo "<script>javascript:window.location='login.php';</script>";
            break;
        }
    }
