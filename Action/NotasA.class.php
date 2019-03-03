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
    
    private $sqlSelectQtdNotaAluno = "SELECT COUNT(*) FROM notas AS N
                                        INNER JOIN matricula AS M
                                        ON(N.cod_matricula = M.cod_matricula)
                                        INNER JOIN atividades AS A 
                                        ON(N.cod_atividade = A.cod_atividade)
                                        WHERE N.cod_matricula = '%s'
                                        AND A.numero_periodo = '%s'
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

    public function AdcionarNotaAluno($perido,$codDisciplina, $notas){
        $qtdNotas = $this->getQtdNotaAluno($perido,$codDisciplina);
        if($qtdNotas == 0){//Insert            
            return $this->insertNotas($notas);
        }else{ // update
            return $this->alterarNotas($notas);
        }        
    }

    public function getQtdNotaAluno($perido,$codDisciplina){
        $sql = sprintf(
            $this->sqlSelectQtdNotaAluno,
            $this->getCodMatricula(),
            $perido,
            $codDisciplina
        );
        $res = $this->runSelect($sql);
        return $res[0]['COUNT(*)'];
    }

    public function insertNotas($notas){        
        $notasComCodigo = explode(',',$notas);
        $contador = 0;            
        $sqlInsert = "INSERT INTO notas(nota, cod_matricula, cod_atividade) VALUES ";    
        while($contador < count($notasComCodigo)){            
            $notas2 = explode('-',$notasComCodigo[$contador]);
            // $notas2[0] = Nota
            // $notas[1] = Cod da Atividade
            $sqlInsert .= "({$notas2[0]},{$this->getCodMatricula()},{$notas2[1]})";
            if($contador + 1 < count($notasComCodigo)){
                $sqlInsert .= ", ";
            }                     
            $contador++;            
        }
        $inserir = $this->runQuery($sqlInsert);   
        if(!$inserir->rowCount()){  // Se der erro cai nesse if          
            throw new \Exception("Não foi possível alterar as notas",70);   
        }  
        return 1;
    }

    public function alterarNotas($notas){
        $notasComCodigo = explode(',',$notas);        
        $contador = 0;    
        $sqlUpdate = "UPDATE notas set nota = '%s' WHERE cod_matricula = '%s' AND cod_nota = '%s' ";         
        while($contador < count($notasComCodigo)){            
            $notas2 = explode('-',$notasComCodigo[$contador]);
            // $notas2[0] = Nota
            // $notas[1] = Cod da nota
            $sqlUpdate2 = sprintf(
                $sqlUpdate,
                $notas2[0],
                $this->getCodMatricula(),
                $notas2[1]
            );
            $update = $this->runQuery($sqlUpdate2);  
            $sqlUpdate2 = "";       
            $contador++;            
        }
        return 1;
    }
}
