<?php 

namespace Model;
use Db\DbConnection;

class AtividadeM extends DbConnection{        
    private $codAtividade;
    private $nomeAtividade;
    private $pesoAtividade;
    private $numeroPeriodo;
    private $dataHoraAtividade;
    private $statusAtividade;
    private $codTurmaDisciplina;

    public function getCodAtividade(){
        return $this->codAtividade;
    }

    public function getNomeAtividade(){
        return $this->nomeAtividade;
    }

    public function getPesoAtividade(){
        return $this->pesoAtividade;
    }

    public function getNumeroPeriodo(){
        return $this->numeroPeriodo;
    }

    public function getDataHoratividade(){
        return $this->dataHoraAtividade;
    }

    public function getStatusAtividade(){
        return $this->statusAtividade;
    }

    public function getCodTurmaAtividade(){
        return $this->codTurmaDisciplina;
    }


    public function setCodAtividade($cod){
        $this->codAtividade = $cod;
    }

    public function setNomeAtividade($nome){
        $this->nomeAtividade = $nome;
    }

    public function setPesoAtividade($peso){
        $this->pesoAtividade = $peso;
    }

    public function setNumeroPeriodo($numero){
        $this->numeroPeriodo = $numero;
    }

    public function setDataHoratividade($data){
        $this->dataHoraAtividade = $data;
    }

    public function setStatusAtividade($status){
        $this->statusAtividade = $status;
    }

    public function setCodTurmaAtividade($cod){
        $this->codTurmaDisciplina = $cod;
    } 
}



