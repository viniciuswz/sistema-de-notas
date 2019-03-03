<?php
namespace Action;
use Model\TurmaM;
class TurmaA extends TurmaM{    
    private $sqlSelectTipoPeriodo = "SELECT descricao_periodo, P.cod_periodo FROM turma AS T
                                INNER JOIN periodo AS P on (T.cod_periodo = P.cod_periodo)
                                WHERE T.cod_turma = '%s'";

    private $sqlSelectMateriasTurma = "SELECT cod_turma_disciplina, DR.cod_disciplina_responsavel, nome_usuario, descricao_disciplina, DR.cod_disciplina FROM turma AS T
                                        INNER JOIN turma_disciplina AS TD ON (T.cod_turma = TD.cod_turma)
                                        INNER JOIN disciplina_responsavel AS DR ON (TD.cod_disciplina_responsavel = DR.cod_disciplina_responsavel)
                                        INNER JOIN disciplina AS D ON (DR.cod_disciplina = D.cod_disciplina)
                                        INNER JOIN usuario AS U ON (DR.cod_usuario = U.cod_usuario)
                                        WHERE T.cod_turma = '%s'";

    public function getTipoPeriodoTurma(){ // verificar se é bimestre, trimestre ou semestre
        $sql = sprintf(
            $this->sqlSelectTipoPeriodo,
            $this->getCodTurma()
        );
        $res = $this->runSelect($sql);
        if(empty($res)){ // nada foi encontrado
            throw new \Exception("Não foi possível verificar o periodo da turna", 40);            
        }
        return $this->tratarDados($res);        
    }

    public function tratarDados($dados){ // tratar dados
        $contador = 0;
        while($contador < count($dados)){
            if($dados[$contador]['descricao_periodo'] == 'Bimestre'){
                $dados[$contador]['num_perido'] = 4;
                $dados[$contador]['sigla_perido'] = '°Bi';
            }else if($dados[$contador]['descricao_periodo'] == 'Trimestre'){
                $dados[$contador]['num_perido'] = 3;
                $dados[$contador]['sigla_perido'] = '°Tri';
            }else{
                $dados[$contador]['num_perido'] = 2;
                $dados[$contador]['sigla_perido'] = '°Semes';
            }
            $contador++;
        }        
        return $dados;
    }

    public function getMateriasTurma(){ // pegar todas as materias que um turma tem
        $sql = sprintf(
            $this->sqlSelectMateriasTurma,
            $this->getCodTurma()
        );
        return $this->runSelect($sql);
    }
}
