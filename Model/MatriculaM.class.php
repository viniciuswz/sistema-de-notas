<?php 

namespace Model;
use Db\DbConnection;
class MatriculaM extends DbConnection{        
    private $codMatricula;
    private $dataHoraMatricula;
    private $statusMatricula;
    private $codTurma;
    private $codAluno;
    private $codDisciplina;

    public function getCodMatricula(){
        return $this->codMatricula;
    }

    public function getDataHoraMatricula(){
        return $this->dataHoraMatricula;
    }

    public function getStatusMatricula(){
        return $this->statusMatricula;
    }

    public function getCodTurma(){
        return $this->codTurma;
    }

    public function getCodAluno(){
        return $this->codAluno;
    }

    public function setCodMatricula($cod){
        $this->codMatricula = $cod;
    }

    public function setDataHoraMatricula($data){
        $this->dataHoraMatricula = $data;
    }

    public function setStatusMatricula($status){
        $this->statusMatricula = $status;
    }

    public function setCodTurma($cod){
        $this->codTurma = $cod;
    }

    public function setCodAluno($cod){
        $this->codAluno = $cod;
    }

}



