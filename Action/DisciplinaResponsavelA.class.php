<?php
namespace Action;
use Model\DisciplinaResponsavelM;
class DisciplinaResponsavelA extends DisciplinaResponsavelM{    

    private $sqlGetDisciplinas = "SELECT TD.cod_turma_disciplina,DR.cod_disciplina_responsavel, DR.cod_disciplina, descricao_turma, T.cod_turma, descricao_disciplina FROM disciplina_responsavel as DR
                                    INNER JOIN turma_disciplina AS TD ON (DR.cod_disciplina_responsavel = TD.cod_disciplina_responsavel)
                                    INNER JOIN turma AS T ON (TD.cod_turma = T.cod_turma)
                                    INNER JOIN disciplina AS A ON (DR.cod_disciplina = A.cod_disciplina)
                                    WHERE DR.cod_usuario = '%s' AND status_disciplina_responsavel = 'A' 
                                    AND TD.status_disciplina = 'A' AND T.status_turma = 'A'
                                    ORDER BY descricao_disciplina";

    private $sqlGetQtdDisciplinasRespon = "SELECT COUNT(*) FROM disciplina_responsavel WHERE cod_usuario = '%s'";

    public function getQtdDisciplinasRepon(){ // pegar quantidade de disciplias que o professor é responsável
        $sql = sprintf(
            $this->sqlGetQtdDisciplinasRespon,
            $this->getCodUsuario()
        );
        $resul = $this->runSelect($sql);        
        if($resul[0]['COUNT(*)'] > 0){ // é responsavel por alguma disciplina
            return TRUE;
        }   
        return FALSE; // não é responsável por alguma disciplina
    }

    public function getTurmas(){ // pegar dados das turmas em q o professor ministra aulas
        if(!$this->getQtdDisciplinasRepon()){// mostar na tela
            return "Você ainda não é responsável por nenhuma disciplina";
        }
        $sql = sprintf(
            $this->sqlGetDisciplinas,
            $this->getCodUsuario()
        );
        $res = $this->runSelect($sql);        
        if(empty($res)){
            throw new \Exception("Você ainda não tem turmas para lecionar", 50);
        }
        return $res;
    }
   
}
