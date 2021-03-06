<?php
    require_once('Config/Config.php');
    require_once(SITE_ROOT.DS.'autoload.php');
    use Core\Usuario;
    use Classes\ValidarCampos;
    session_start();
    try{    
        Usuario::verificarLogin(0);  // Não pode estar logado    
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
        <script src="lib/_jquery/jquery.mask177.min.js"></script>
        <script src="js/js.js"></script>
        <script src="js/form.js"></script>
        
    </head>
    <body>
        
        
            <section class="container-login">
                <div class="login">               
                
                
                    <form id='login' method="POST" action="Logar.php"> 
                            <h1>Login</h1>  
                        <div>
                            <label for="cpf">CPF<span></span></label>
                            <input type="text" name="cpf" id="cpf" placeholder="Digite seu cpf">
                        </div>
                        <div>
                            <label for="senha">Senha<span></span></label>
                            <input type="password" name="senha" id="senha" placeholder="*********">
                        </div>
                        <input type="submit" value="Login">
                    
                    </form>
                </div>
            </section>
        
        
    </body>
    </html>
<?php    
    }catch (Exception $exc){    
        $erro = $exc->getCode();  
        switch ($erro) {
            case 6: // ja esta logado
                echo "<script>javascript:window.location='turmas.php';</script>";
                break;            
            default:
                echo "<script>javascript:window.location='turmas.php';</script>";
                break;
        }
    }
        