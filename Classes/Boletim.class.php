<?php
namespace Classes;
use Model\BoletimM;
use Core\Turma;
use Core\Notas;
class Boletim extends BoletimM{    
    
    private $sqlGetDadosAluno = "SELECT nome_aluno, cod_aluno, status_aluno, cpf_aluno, descricao_turma,turma_cod_turma,M.cod_matricula FROM Aluno as A
                                INNER JOIN matricula AS M ON(A.cod_aluno = M.aluno_cod_aluno)
                                INNER JOIN turma AS T ON(M.turma_cod_turma = T.cod_turma)                                                         
                                WHERE A.cod_aluno = '%s'";

    public function getDadosAluno(){
        $sql = sprintf(
            $this->sqlGetDadosAluno,
            $this->getCodAluno()
        );        
        return $res = $this->runSelect($sql);        
    }

    public function getDadosTurma($codMatricula){
        $turma = new Turma();
        $turma->setCodTurma($this->getCodTurma());
        $dadosTurma = $turma->getTipoPeriodoTurma();
        $dadosTurma[] = $this->getMateriasTurma($dadosTurma,$codMatricula);
        return $dadosTurma;
    }
    
    public function getMateriasTurma($dadosTurma,$codMatricula){
        $turma = new Turma();
        $turma->setCodTurma($this->getCodTurma());
        $dados = $turma->getMateriasTurma();
        $contador = 0;
        $contador2 = 1;        
        while($contador < count($dados)){
            $dados[$contador]['notas']= $this->pegarNotas($codMatricula, $dadosTurma[0]['num_perido'], $dados[$contador]['cod_turma_disciplina']);           
            $contador++;
        } 
        return $dados;
    }

    public function pegarNotas($codMatricula, $numPeriodo, $codigoDisciplina){
        $notas = new Notas();
        $notas->setCodMatricula($codMatricula);
        return $notas->mediaAluno($numPeriodo, $codigoDisciplina);
    }
   

}