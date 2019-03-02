<?php
namespace Action;
use Model\NotasM;
class NotasA extends NotasM{    
    private $sqlGetNotasAluno = "SELECT AVG(nota) AS media, numero_periodo,descricao_periodo,aluno_cod_aluno FROM notas AS N
                                    INNER JOIN atividades AS A ON (N.cod_atividade = A.cod_atividade)
                                    INNER JOIN matricula AS M ON (M.cod_matricula = N.cod_matricula)
                                    INNER JOIN turma AS T ON (M.turma_cod_turma = T.cod_turma)
                                    INNER JOIN periodo AS P ON (T.cod_periodo = P.cod_periodo)
                                    WHERE M.cod_matricula = '%s' AND numero_periodo = '%s'
                                    AND A.cod_turma_disciplina = '%s'";
    
    public function mediaAluno($numPeriodo, $codigoDisciplina){
        $contador = 1;
        $notas = array();
        while($contador <= $numPeriodo){
            $sql = sprintf(
                $this->sqlGetNotasAluno,
                $this->getCodMatricula(),
                $contador,
                $codigoDisciplina
            );
            $res = $this->runSelect($sql);
            if(empty($res[0]['media'])){
                $notas[] = false;
            }else{
                $notas[] = $res;
            }          
            $contador++;
        }
        return $notas; 
    }
}
