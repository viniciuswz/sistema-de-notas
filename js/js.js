//form

jQuery(function(){
  $('.tabs a').click(function(){
    var $this = $(this);
    var tipo = $this.data("tipo");
    $("#tipo").val(tipo);
    $(".tabs").find('a.tab-ativo').removeClass('tab-ativo');
    $this.addClass('tab-ativo');
    $(".modal").find('h2').text($this.text());

    var codMatricula = $("#codMatricula").val();
    var codDisci = $("#turma").val();
    var periodo = $(".tab-ativo").data('tipo');  

    colocarNotasAjax(codDisci,periodo,codMatricula);
    return false;
  })

  $(".nota-input input").keyup(function(){
    $media = calcular.apply(calcular,pegarValForm());
    $media = parseFloat($media.toFixed(2));
    if($media < 6){
      $("#media").css("color", 'red');
      $("#media").text($media);  
    }else if($media > 6){
      $("#media").css("color", 'blue');
      $("#media").text($media);  
    }else{
      $("#media").css("color", 'red');
      $("#media").text(0);
    }
      
    //addValorNotas.apply(addValorNotas,[1,2,3,4])
  });  

  $('#lancar-nota').submit(function(){
    lancaNotaAjax.apply(lancaNotaAjax,pegarValForm(true)); 
    return false;   
  })
  
})

function verificarNotaVazia(id){ 
  $nota = $(id).val();  
    if($nota != ""){
      return $nota;
    }
  $(id).val('0');
  return 0;
}

function pegarValForm($indCodNota = false){
  if($indCodNota){
    var nota1 = $("#nota1").val() + '-' + $("#nota1").attr('cod-nota');
    var nota2 = $("#nota2").val() + '-' + $("#nota2").attr('cod-nota');
    var nota3 = $("#nota3").val() + '-' + $("#nota3").attr('cod-nota');
    var nota4 = $("#nota4").val() + '-' + $("#nota4").attr('cod-nota');
  }else{
    var nota1 = $("#nota1").val();
    var nota2 = $("#nota2").val();
    var nota3 = $("#nota3").val();
    var nota4 = $("#nota4").val();
  }
  
  var tipo = $("#tipo").val();
  var id = $("#id").val();
  return [nota1,nota2,nota3,nota4,tipo,id];
}
function calcular(nota1,nota2,nota3,nota4){ 
  return (Number(nota1) + Number(nota2) + Number(nota3) + Number(nota4)) / 4;
}

function colocarMediaNaTable(id,tipo,calc){
  $("tr[data-id="+id+"] td:nth-child("+(2 + tipo)+")").text(calc)
}

function addValorNotas(nota1,nota2,nota3,nota4){
  $("#nota1").val(nota1);
  $("#nota2").val(nota2);
  $("#nota3").val(nota3);
  $("#nota4").val(nota4);
}

function colocarNotasAjax(codDisci,numPeriodo,codAluno){
  
  addValorNotas.apply(addValorNotas,['...','...','...','...']);
  jQuery(function(){
    
    $.ajax({
      url: 'GetNotasAluno.php',
      type: 'post',
      data: 'CodDis=' + codDisci + "&numeroPeriodo=" + numPeriodo + "&codAluno=" + codAluno,
      success:function(result){
        $resul2 = JSON.parse(result);       
        contador = 1;
        for(i = 0; i < $resul2.length; i++){
          $('#txtNota' + contador).text($resul2[i].nome_atividade);
          $('#nota' + contador).attr('cod-Nota', $resul2[i].cod_atividade);
          if($resul2[i].nota){
            $('#nota' + contador).val('0');          
            $('#nota' + contador).val($resul2[i].nota);
            $('#nota' + contador).attr('cod-Nota', $resul2[i].cod_nota);
          }else{
            $('#nota' + contador).val('0');
          }          
          contador++;
        }       
        $media = calcular($('#nota1').val(),$('#nota2').val(),$('#nota3').val(),$('#nota4').val());
        $media = parseFloat($media.toFixed(2));
        if($media < 6){
          $("#media").css("color", 'red')
        }else{
          $("#media").css("color", 'blue')
        }
        $("#media").text($media);
        $("mediaTdTabela").text($media);
      }
   });
  })
  
}

function lancaNotaAjax(nota1,nota2,nota3,nota4,tipo,id){
  jQuery(function(){
    var codMatricula = $("#codMatricula").val();
    var codDisci = $("#turma").val();
    var periodo = $(".tab-ativo").data('tipo');  
    var notas = [nota1, nota2, nota3, nota4]
    $.ajax({
      url: 'AlterarNota.php',
      type: 'post',
      data: 'codMatricula=' + codMatricula + '&CodDis=' + codDisci + '&periodo=' + periodo +
      '&notas=' + notas,     
      success:function(result){
        if(result == 1){
          $('#lancar-nota input').css('border', '1px solid #006400');
          //location.reload();
          //alert("alterado")
        }else{
          alert("erro")
        }       
      }
   });
   return false
  })
 
}

//Modal

jQuery(function(){
  $('.fundo-modal').click(function(){
    $('.modal').removeClass('modal-ativo');    
    location.reload();
  })

  $('table tbody tr').click(function(){
    var $this = $(this);
    var codMatricula = $this.data('id');
    var codDisci = $("#turma").val();
    var periodo = $(".tab-ativo").data('tipo');    
    $("#id").val(id);
    $("#codMatricula").val(codMatricula);
    $(".modal").find('h2').text($('.tab-ativo').text());
    $('.modal').addClass('modal-ativo');    
    colocarNotasAjax(codDisci,periodo,codMatricula);
    
    return false;
  })

  $(document).on("change", "#fotoPerfil", qtdTabs())
  function qtdTabs(){
    var qtd = $('.tabs a').length;
  
    if(qtd == '2')
    $('.tabs a').addClass('semes')
  
    if(qtd == '3')
    $('.tabs a').addClass('tri')
  
    if(qtd == '4')
    $('.tabs a').addClass('bi')
  }

})

