<?php 

namespace Model;
use Db\DbConnection;

class BoletimM extends DbConnection{        
    private $codAluno;
    private $codTurma;    

    public function getCodAluno(){
        return $this->codAluno;
    }

    public function getCodTurma(){
        return $this->codTurma;
    }

    public function setCodAluno($cod){
        $this->codAluno = $cod;
    }

    public function setCodTurma($cod){
        $this->codTurma = $cod;
    }
}



