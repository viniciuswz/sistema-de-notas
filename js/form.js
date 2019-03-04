(function(){
    'use strict'

    var mensagem = {
        'cpf': 'O CPF não foi digitado',
        'senha': 'A senha não foi digitada',
        'remove': '',
        'errocpf': 'CPF não cadastrado',
        'errosenha': 'Senha errada'
    }

    var erroAjax = {
        'CPF não cadastrado': function(){
            redInput('#cpf','errocpf')
        },
        'Senha inválida': function(){
            redInput('#senha','errosenha')
        },
        'login': function(){
            location.href="turmas.php";
        }
    }
    jQuery(function(){
        
        var $inputs = document.querySelectorAll('form:nth-child(1) input');
        

        $('#login').submit(function(){

            var okay = Array.prototype.every.call($inputs,function($this){
                return $this.value != '';  
            })
            Array.prototype.forEach.call($inputs,function($this){
                if($this.value != '' && $this.type != 'submit'){
                    okayInput.call(okayInput,$this); 
                }    
                if($this.value == '' && $this.type != 'submit'){
                    redInput.call(redInput,$this,$this.name);                    
                }
            })
            if(okay){               
                $.ajax({
                    url: 'Logar.php',
                    type: 'post',
                    data: $('#login').serialize(),
                    success:function(result){
                        erroAjax[result]();
                    }
                 });
            }
          return false
        })
        
    })
    

    function redInput(doc,txt){
        $(doc).addClass('errado');
        $(doc).parent().find('span').text(mensagem[txt]);
    }

    function okayInput(doc){
        $(doc).removeClass('errado');
        doc.parentElement.firstElementChild.firstElementChild.innerHTML = mensagem.remove;
    }
 })()