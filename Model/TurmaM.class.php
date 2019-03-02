<?php 

namespace Model;
use Db\DbConnection;

class TurmaM extends DbConnection{        
    private $codTurma;
    private $salaTurma;
    private $qtdMaxima;
    private $statusTurma;
    private $descricaoTurma;
    private $codPeriodo;

    public function getCodTurma(){
        return $this->codTurma;
    }

    public function getSalaTurma(){
        return $this->salaTurma;
    }

    public function getQtdMaxima(){
        return $this->qtdMaxima;
    }

    public function getDescricaoTurma(){
        return $this->descricao_turma;
    }

    public function getStatusTurma(){
        return $this->statusTurma;
    }

    public function getCodPerido(){
        return $this->codPeriodo;
    }


    public function setCodTurma($cod){
        $this->codTurma = $cod;
    }

    public function setSalaTurma($sala){
        $this->salaTurma = $sala;
    }

    public function setQtdMaxima($qtd){
        $this->qtdMaxima = $qtd;
    }

    public function setDescricaoTurma($descricao){
        $this->descricao_turma = $descricao;
    }

    public function setStatusTurma($status){
        $this->statusTurma = $status;
    }

    public function setCodPerido($cod){
        $this->codPeriodo = $cod;
    }
}



