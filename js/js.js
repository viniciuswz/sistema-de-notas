//form

jQuery(function(){
  $('.tabs a').click(function(){
    var $this = $(this);
    var tipo = $this.data("tipo");
    $("#tipo").val(tipo);
    $(".tabs").find('a.tab-ativo').removeClass('tab-ativo');
    $this.addClass('tab-ativo');
    $(".modal").find('h2').text($this.text());
    colocarNotas(tipo,$("#id").val());
    return false;
  })

  $(".nota-input input").keyup(function(){
    $("#media").text(calcular.apply(calcular,pegarValForm()));
    //addValorNotas.apply(addValorNotas,[1,2,3,4])
  })

  $('#lancar-nota').submit(function(){
    lancaNota.apply(lancaNota,pegarValForm());
    //alert('jaca')
  })
  
})

function pegarValForm(){
  var nota1 = $("#nota1").val();
  var nota2 = $("#nota2").val();
  var nota3 = $("#nota3").val();
  var nota4 = $("#nota4").val();
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

function colocarNotasAjax(tipo,id){
  
  addValorNotas.apply(addValorNotas,['...','...','...','...']);
  jQuery(function(){
    
    $.ajax({
      url: jaca,
      type: 'post',
      data: 'tipo=' + tipo+ '&id=' + id,
      success:function(result){
         alert(result);
        addValorNotas.apply(addValorNotas,result);
        calcular();
      }
   });
  })
  
}

function lancaNotaAjax(nota1,nota2,nota3,nota4,tipo,id){
  jQuery(function(){
    $.ajax({
      url: jaca,
      type: 'post',
      data: 'nota1='+nota1+ '&nota2='+ nota2 +'&nota3='+ nota3 +'&nota4='+ nota4 +'&tipo='+tipo+'&id='+id,
      success:function(result){
        alert(result);
        calcular.apply(calcular,pegarValForm());
        colocarMediaNaTable(id,tipo,calcular.apply(calcular,pegarValForm()))
      }
   });
   return false
  })
 
}

//Modal

jQuery(function(){
  $('.fundo-modal').click(function(){
    $('.modal').removeClass('modal-ativo');
  })

  $('table tbody tr').click(function(){
    var $this = $(this);
    var id = $this.data('id');
    $("#id").val(id);
    $(".modal").find('h2').text($('.tab-ativo').text());
    $('.modal').addClass('modal-ativo');
    colocarNotasAjax(1,id);
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

