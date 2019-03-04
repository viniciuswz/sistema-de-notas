<?php
    require_once('Config/Config.php');
    require_once(SITE_ROOT.DS.'autoload.php');
    use Core\Usuario;
    use Core\Matricula;
    use Core\Turma;
    use Core\Atividade;
    use Classes\ValidarCampos;
    session_start();
    try{    
        Usuario::verificarPermissoes(array('Professor','Diretor'));  // apenas professores tem acesso a essa pagina   

        $nomesCampos = array('ID');// Nomes dos campos que receberei da URL    
        $validar = new ValidarCampos($nomesCampos, $_GET);
        $validar->verificarTipoInt(array('ID'),$_GET); // Verificar se é um numero
        if($_SESSION['tipo_usu'] == 'Professor'){
            $validar->verificarTipoInt(array('CodDis'),$_GET); // Verificar se é um numero

            $turma = new Turma();
            $turma->setCodTurma($_GET['ID']);
            $dadosTurma = $turma->getTipoPeriodoTurma(); 

            $matricula = new Matricula();
            $matricula->setCodTurma($_GET['ID']);        
            $dadosMatriculas = $matricula->getDadosAlunos($_GET['CodDis']);  
        }else{
            $matricula = new Matricula();
            $matricula->setCodTurma($_GET['ID']);        
            $dadosMatriculas = $matricula->getAlunosBoletim();            
        }
        

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
    <script src="js/form.js"></script>
    
</head>
<body>
    <div id="container">        
        <header>
            <p>Olá, <strong><?php echo $dadosUsuario[0]['nome_usuario']?></strong> !</p>
            <a href="logout.php">logout</a>
        </header>
        <section class="alunos">
            <?php if($_SESSION['tipo_usu'] == 'Professor') { ?>
                <h1><?php echo $dadosMatriculas[0]['descricao_turma']?>, Sala <?php echo $dadosMatriculas[0]['sala_turma']?></h1>
                <p>Clique em um nome para lançar a nota</p>
                <table border="0" cellpading="0" cellspacing="0">
                    <thead>
                        
                        <tr>
                            <th>N°</th>
                            <th>Nome</th>                        
                            <?php
                                $contador2 = 1;
                                while($contador2 <= $dadosTurma[0]['num_perido']){                                        
                                        echo '<th class="nota-table">'.$contador2.$dadosTurma[0]['sigla_perido'].'</th>';                                       
                                    $contador2++;
                                }
                            ?>     
                            <th>Status</th>                   
                        </tr>
                        
                    </thead>
                    <tbody>                    
                            <?php
                                $contador = 0;
                                while($contador < count($dadosMatriculas)){
                                    echo "<tr class='codMatricula' data-id={$dadosMatriculas[$contador]['cod_matricula']} data-status='{$dadosMatriculas[$contador]['status_matricula']}'>";
                                    echo "<td>{$dadosMatriculas[$contador]['numeroChamada']}</td>";
                                    echo "<td><p>{$dadosMatriculas[$contador]['nome_aluno']}</p></td>";                                                                 
                                        $contador2 = 0;
                                        while($contador2 < count($dadosMatriculas[$contador]['notas'])){                                        
                                            if($dadosMatriculas[$contador]['notas'] == false){
                                                $contador3 = 0;
                                                while($contador3 < $dadosMatriculas[$contador]['numPeriodo']){
                                                    echo '<td>-</td>';
                                                    $contador3++;
                                                }                                            
                                            }else if($dadosMatriculas[$contador]['notas'][$contador2][0]['media'] < 6){
                                                $nota = number_format($dadosMatriculas[$contador]['notas'][$contador2][0]['media'], 2, '.', '');                                           
                                                echo "<td style='background-color:red'><p>{$nota}</p></td>";
                                            }else{
                                                $nota = number_format($dadosMatriculas[$contador]['notas'][$contador2][0]['media'], 2, '.', '');  
                                                echo "<td><p>{$nota}</p></td>";
                                            }
                                            
                                            $contador2++;
                                        }            
                                    echo "<td ><p>{$dadosMatriculas[$contador]['status_matricula']}</p></td>";                          
                                    echo "</tr>";
                                    $contador++;
                                }
                            ?>   
                    </tbody>
                </table>
            <?php  }else{ ?>

                <h1><?php echo $dadosMatriculas[0]['descricao_turma']?>, Sala <?php echo $dadosMatriculas[0]['sala_turma']?></h1>
                    <p>Clique em um nome para lançar a nota</p>
                    <table border="0" cellpading="0" cellspacing="0">
                        <thead>
                            
                            <tr>
                                <th>N°</th>
                                <th>Nome</th> 
                                <th>Status</th>                   
                            </tr>
                            
                        </thead>
                        <tbody>                    
                                <?php
                                    $contador = 0;
                                    while($contador < count($dadosMatriculas)){
                                        echo "<tr class='codMatricula' data-id={$dadosMatriculas[$contador]['cod_matricula']} data-status='{$dadosMatriculas[$contador]['status_matricula']}'>";
                                        echo "<td>{$dadosMatriculas[$contador]['numeroChamada']}</td>";
                                        echo "<td><p>{$dadosMatriculas[$contador]['nome_aluno']}</p></td>";
                                        echo "<td ><p>{$dadosMatriculas[$contador]['status_matricula']}</p></td>";                          
                                        echo "</tr>";
                                        $contador++;
                                    }
                                ?>   
                        </tbody>
                    </table>
            <?php  } ?>
        </section>
        
    </div>
    <?php if($_SESSION['tipo_usu'] == 'Professor'){ ?>    
        <div class="modal" >
            <div class="fundo-modal">
                <span style="color: azure; font-size: 40px; font-weight: bold; position: absolute; top: 10px;right: 30px; cursor: pointer">×</span>
            </div>
            <div>
                <div class="tabs">
                    <?php
                        $contador = 1;
                        while($contador <= $dadosTurma[0]['num_perido']){
                            if($contador == 1){
                                echo '<a href="#" data-tipo="'.$contador.'" class="tab-ativo">'.$contador.$dadosTurma[0]['sigla_perido'].'</a>';
                            }else{
                                echo '<a href="#" data-tipo="'.$contador.'">'.$contador.$dadosTurma[0]['sigla_perido'].'</a>';
                            }
                            $contador++;
                        }
                    ?>           
                </div>
            <h2 style="text-align:center"></h2>
                <form id="lancar-nota">
                    <div class="nota-input">
                        <label for="nota1" id="txtNota1"></label>
                        <input type="number" id="nota1" name="nota1" min="0" max="10" step="0.1" maxlenght="3" value="0" required>
                    </div>
                    <div class="nota-input">
                        <label for="nota2" id="txtNota2"></label>
                        <input type="number" id="nota2" name="nota2" min="0" max="10" step="0.1" maxlenght="3" required>
                    </div>
                    <div class="nota-input">
                        <label for="nota3" id="txtNota3"></label>
                        <input type="number" id="nota3" name="nota3" min="0" max="10" step="0.1" maxlenght="3" required>
                    </div>
                    <div class="nota-input">
                        <label for="nota4" id="txtNota4"></label>
                        <input type="number" id="nota4" name="nota4" min="0" max="10" step="0.1" maxlenght="3" required>
                    </div>
                    <input type="hidden" id="turma" name="tipo" value="<?php echo $_GET['CodDis']?>">
                    <input type="hidden" id="codMatricula" name="codMatricula" value="">
                    <input type="hidden" id="periodo" name="periodo" value="<?php echo $dadosTurma[0]['sigla_perido']?>">
                    <input type="hidden" id="id" name="id" value="<?php echo $_GET['ID']?>">
                    <input type="submit" value="Salvar">
                </form>
                <p><strong>Média <?php echo $dadosTurma[0]['descricao_periodo']?></strong><span id="media">-</span></p>
            </div>
        </div>
    <?php } 
        echo '<input type="hidden" id="tipoUsu" name="tipoUsu" value='.$_SESSION['tipo_usu'].'>';    
    ?>
    
</body>
</html>
<?php    
    }catch (Exception $exc){    
        $erro = $exc->getCode();
    switch ($erro) {
    case 6:
        echo "<script>javascript:window.location='turmas.php';</script>";
        break;         
    case 40:
    case 60:
        echo $exc->getMessage();
        break;
    default:
        echo "<script>javascript:window.location='turmas.php';</script>";
        break;
    }
    }
