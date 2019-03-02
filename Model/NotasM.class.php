<?php 

namespace Model;
use Db\DbConnection;
class NotasM extends DbConnection{        
    private $codNota;
    private $nota;
    private $codMatricula;
    private $codAtividade;

    public function getCodNota(){
        return $this->codNota;
    }

    public function getNota(){
        return $this->nota;
    }

    public function getCodMatricula(){
        return $this->codMatricula;
    }

    public function getCodAtividade(){
        return $this->codAtividade;
    }

    public function setCodNota($cod){
        $this->codNota = $cod;
    }

    public function setNota($nota){
        $this->nota = $nota;
    }

    public function setCodMatricula($cod){
        $this->codMatricula = $cod;
    }

    public function setCodAtividade($cod){
        $this->codAtividade = $cod;
    }
}



