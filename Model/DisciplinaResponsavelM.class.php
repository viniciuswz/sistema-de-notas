<?php 

namespace Model;
use Db\DbConnection;
class DisciplinaResponsavelM extends DbConnection{        
    private $codDisciplinaResponsavel;
    private $statusDisciplinaResponsavel;
    private $codUsuario;
    private $codDisciplina;
    
    public function getCodDisciplinaResposavel(){
        return $this->codDisciplinaResponsavel;
    }

    public function getStatusDisciplinaResponsavel(){
        return $this->statusDisciplinaResponsavel;
    }

    public function getCodUsuario(){
        return $this->codUsuario;
    }

    public function getCodDisciplina(){
        return $this->codUsuario;
    }


    public function setCodDisciplinaResposavel($cod){
        $this->codDisciplinaResponsavel = $cod;
    }

    public function setStatusDisciplinaResponsavel($status){
        $this->statusDisciplinaResponsavel = $status;
    }

    public function setCodUsuario($cod){
        $this->codUsuario = $cod;
    }

    public function setCodDisciplina($cod){
        $this->codUsuario = $cod;
    }

}



