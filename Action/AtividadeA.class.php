<?php
namespace Action;
use Model\AtividadeM;
class AtividadeA extends AtividadeM{    
    private $sqlSelectAtividades = "SELECT %s
                                        FROM atividades AS A 
                                        %s                                       
                                        WHERE A.cod_turma_disciplina = '%s'
                                        AND numero_periodo = '%s'
                                        %s";    

    public function getAtividadesAluno($codAluno, $numePeriodo){
        $sql = sprintf(
            $this->sqlSelectAtividades,
            " nome_atividade, peso_atividade, nota, cod_nota ",
            " INNER JOIN notas AS N ON (A.cod_atividade = N.cod_atividade) ",
            $this->getCodTurmaAtividade(),
            $numePeriodo,
            sprintf(
                " AND N.cod_matricula = '%s' ",
                $codAluno
                )           
        );
        $resul = $this->runSelect($sql);    
        if(empty($resul)){ // se nao existir notas quero q retorne apenas o nome das atividades
            $sql = sprintf(
                $this->sqlSelectAtividades,
                " nome_atividade ",
                " ",
                $this->getCodTurmaAtividade(),
                $numePeriodo,
                ' '
            );
            $resul = $this->runSelect($sql);
        }   
        return $resul;
    }

    
    
}
