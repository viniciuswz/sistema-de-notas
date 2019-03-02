<?php
namespace Action;
use Model\TurmaM;
class TurmaA extends TurmaM{    
    private $sqlSelectTipoPeriodo = "SELECT descricao_periodo, P.cod_periodo FROM turma AS T
                                INNER JOIN periodo AS P on (T.cod_periodo = P.cod_periodo)
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
}
