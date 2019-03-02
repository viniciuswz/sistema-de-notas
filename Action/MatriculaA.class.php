<?php
namespace Action;
use Model\MatriculaM;
use Core\Notas;
use Core\Turma;
class MatriculaA extends MatriculaM{    
    private $sqlAlunosMatricula = "SELECT M.aluno_cod_aluno, M.cod_matricula, nome_aluno, status_aluno, status_matricula, sala_turma, descricao_turma, turma_cod_turma
                            FROM matricula as M INNER JOIN 
                            aluno as A ON (M.aluno_cod_aluno = A.cod_aluno)
                            INNER JOIN Turma as T ON (M.turma_cod_turma = T.cod_turma)
                            WHERE M.turma_cod_turma = '%s' 
                            ORDER BY nome_aluno ASC";

    public function getDadosAlunos(){ //  pegar dados dos alunos de uma turma
        $sql = sprintf(
            $this->sqlAlunosMatricula,
            $this->getCodTurma()
        );

        $resul = $this->tratarDados($this->runSelect($sql));        
        if(empty($resul)){            
            return "Não há nenhum aluno matriculado nesta turma";
        }      
        return $resul;
    }

    public function tratarDados($dados){ // tratar dados dos alunos
        if(empty($dados)){
            throw new \Exception("Não há nenhum aluno matriculado nesta turma", 60);
            
        }
        $contador2 = 1;
        $numPeriodo = $this->getPeriodo($dados[0]['turma_cod_turma']);
        for($contador = 0; $contador < count($dados); $contador++){
            $dados[$contador]['numeroChamada'] = $contador2;
            if($dados[$contador]['status_matricula'] == "A"){
                $dados[$contador]['status_matricula'] = "Matriculado";
                $dados[$contador]['notas'] = $this->getMediaAluno($dados[$contador]['cod_matricula'], $numPeriodo);
            }else{
                $dados[$contador]['status_matricula'] = "Transferido";
                $dados[$contador]['notas'] = null;
            }
            
            $contador2++;
        } 
        return $dados;
    }

    public function getMediaAluno($cod, $numPeriodo){
        $aluno = new Notas();
        $aluno->setCodMatricula($cod);
        return $aluno->mediaAluno($numPeriodo);
    }

    public function getPeriodo($cod){
        $periodo = new Turma();
        $periodo->setCodTurma($cod);
        $res = $periodo->getTipoPeriodoTurma();
        return $res[0]['num_perido'];
    }
}
