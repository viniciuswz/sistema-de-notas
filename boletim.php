<?php
    require_once('Config/Config.php');
    require_once(SITE_ROOT.DS.'autoload.php');
    use Core\Usuario;    
    use Classes\ValidarCampos;
    use Classes\Boletim;
    session_start();
    try{    
        Usuario::verificarPermissoes(array('Diretor'));  // apenas diretores tem acesso a essa pagina
        
        $nomesCampos = array('codAluno');// Nomes dos campos que receberei da URL    
        $validar = new ValidarCampos($nomesCampos, $_GET);
        $validar->verificarTipoInt(array('codAluno'),$_GET); // Verificar se é um numero

        $usuario = new Usuario();
        $dadosUsuario = $usuario->getDadosUser(); 
        
        $boletim = new Boletim();
        $boletim->setCodAluno($_GET['codAluno']);
        $dadosAluno = $boletim->getDadosAluno();    
        $boletim->setCodTurma($dadosAluno[0]['turma_cod_turma']);
        $dadosTurma = $boletim->getDadosTurma($dadosAluno[0]['cod_matricula']);            
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
            <p><a onclick="window.history.go(-1);return false;">⇽</a>Olá,&nbsp;<strong><?php echo $dadosUsuario[0]['nome_usuario']?></strong>!</p>
            <a href="logout.php">logout</a>
        </header>
        <section class="boletim">
            <div class="info">
                <p><strong>Nome:</strong><span><?php echo $dadosAluno[0]['nome_aluno']?></span></p>
                <p><strong>Turma:</strong><span><?php echo $dadosAluno[0]['descricao_turma']?></span></p>
                <p><strong>RM:</strong><span><?php echo $dadosAluno[0]['cod_aluno']?></span></p>
                
            </div>
            <h4 style="text-align: center;padding: 10px 0">boletim do ano de 2018</h4>
            <div class="materia">
                <h3>Máteria</h3>
                <div>
                    <?php
                        $contador2 = 1;
                        while($contador2 <= $dadosTurma[0]['num_perido']){                                        
                                echo '<span style=font-weight:bold>'.$contador2.' '.$dadosTurma[0]['sigla_perido'].'</span>';                                       
                            $contador2++;
                        }
                    ?>     
                </div>
                <h3 class="mobile-hidden">Professor</h3>
            </div>

            <?php
                $contador = 0;
                $contador2 = 0;
                while($contador < count($dadosTurma[1])){
                echo 
                "
                    <div class='materia'>                    
                        <h3>{$dadosTurma[1][$contador]['descricao_disciplina']}</h3>
                        <div>";
                         
                        while($contador2 < $dadosTurma[0]['num_perido']){
                            if($dadosTurma[1][$contador]['notas'][$contador2][0]['media'] == null){
                                echo '<span style="background-color:red">0</span>';
                            }else if($dadosTurma[1][$contador]['notas'][$contador2][0]['media'] < 6){                          
                                echo '<span style="background-color:red">' . number_format($dadosTurma[1][$contador]['notas'][$contador2][0]['media'], 2, '.', '') . '</span>';
                            }else{
                                echo '<span>' . number_format($dadosTurma[1][$contador]['notas'][$contador2][0]['media'], 2, '.', '') . '</span>';
                            }                            
                            $contador2++;
                        }
                        $contador2 = 0;
                echo "</div>   
                        <h3 class='mobile-hidden'>{$dadosTurma[1][$contador]['nome_usuario']}</h3>
                    </div>             
                ";
                    $contador++;
                }
            ?>          

        </section>
        
    </div>
    
    
</body>
</html>
<?php    
    }catch (Exception $exc){    
        echo $erro = $exc->getCode();
    }
