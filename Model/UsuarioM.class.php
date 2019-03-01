<?php 

namespace Model;
use Db\DbConnection;
class UsuarioM extends DbConnection{        
    private $codUsuario;
    private $cpfUsuario;
    private $senhaUsuario;
    private $dataHoraRegistro;
    private $nomeUsuario;
    private $fotoUsuarioPerfil;
    private $statusUsuario;
    private $codTipoUsuario;

    public function getCodUsu(){
        return $this->codUsuario;
    }

    public function getCpfUsu(){
        return $this->cpfUsuario;
    }

    public function getSenhaUsu(){
        return $this->senhaUsuario;
    }

    public function getDataHoraUsu(){
        return $this->dataHoraRegistro;
    }

    public function getNomeUsu(){
        return $this->nomeUsuario;
    }

    public function getFotoUsuarioPerfilUsu(){
        return $this->fotoUsuarioPerfil;
    }

    public function getStatusUsuario(){
        return $this->statusUsuario;
    }

    public function getTipoUsuario(){
        return $this->codTipoUsuario;
    }


    public function setCodUsu($cod){
        $this->codUsuario = $cod;
    }

    public function setCpfUsu($cpf){
        $this->cpfUsuario = $cpf;
    }

    public function setSenhaUsu($senha){
        $this->senhaUsuario = $senha;
    }

    public function setDataHoraUsu($data){
        $this->dataHoraRegistro = $data;
    }

    public function setNomeUsu($nome){
        $this->nomeUsuario = $nome;
    }

    public function setFotoUsuarioPerfilUsu($foto){
        $this->fotoUsuarioPerfil = $foto;
    }

    public function setStatusUsuario($status){
        $this->statusUsuario = $status;
    }

    public function setTipoUsuario($tipo){
        $this->codTipoUsuario = $tipo;
    }




}



