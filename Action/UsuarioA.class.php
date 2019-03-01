<?php
namespace Action;
use Model\UsuarioM;
class UsuarioA extends UsuarioM{

    private $sqlVerificarExitenCPF = "SELECT COUNT(*) FROM usuario WHERE cpf_usuario = '%s'";

    private $sqlLogar = "SELECT cod_usuario, nome_usuario, foto_usuario_perfil, descricao_tipo_usuario, status_usuario, senha_usuario
                            FROM usuario as U INNER JOIN tipo_usuario as T
                            ON (u.cod_tipo_usuario = T.cod_tipo_usuario) WHERE
                            cpf_usuario = '%s' AND status_tipo_usuario = 'A'";

    public function verificarExistenCPF(){ // verificar se existe o cpf no banco
        $sql = sprintf(
            $this->sqlVerificarExitenCPF,
            $this->getCpfUsu()
        );
        $resul = $this->runSelect($sql);
        if($resul[0]['COUNT(*)'] > 0){ // existe retorna true
            return TRUE;
        } 
        return FALSE; // nao existe retorna false
    }

    public function logar(){ // função responsável por fazer o login
        if($this->verificarExistenCPF() != TRUE){ // Não existe no banco    
            throw new \Exception("CPF não cadastrado", 30);
        }        
        $sql = sprintf(
            $this->sqlLogar,
            $this->getCpfUsu()            
        );
        $resul = $this->runSelect($sql);
        if(empty($resul)){ // Ocorreu um erro tente novamente
            throw new \Exception("Ocorreu um erro, tente novamente!", 31);
        }else if($resul[0]['status_usuario'] != 'A'){ // conta bloqueda
            throw new \Exception("Sua conta foi bloqueada, entrem em contato conosco", 31);
        }else if(!password_verify($this->getSenhaUsu(), $resul[0]['senha_usuario'])){ // Verifico se o hash é igual a senha digitada
            throw new \Exception("Senha inválida",32); 
        }
        $_SESSION['id_user'] = $resul[0]['cod_usuario'];
        $_SESSION['tipo_usu'] = $resul[0]['descricao_tipo_usuario'];
        return;
    }


    

}
