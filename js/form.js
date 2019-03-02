(function(){
    'use strict'

    var mensagem = {
        'CPF': 'O CPF não foi digitado',
        'senha': 'A senha não foi digitada',
        'remove': ''
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
                    redInput.call(redInput,$this);
                }
            })
            if(okay){
                $.ajax({
                    url: '../Logar.php',
                    type: 'post',
                    data: $('#login').serialize(),
                    success:function(result){
                      
                    }
                 });
            }
          return false
        })
        
    })
    

    function redInput(doc){
        $(doc).addClass('errado');
        doc.parentElement.firstElementChild.firstElementChild.innerHTML = mensagem[doc.name];
    }

    function okayInput(doc){
        $(doc).removeClass('errado');
        doc.parentElement.firstElementChild.firstElementChild.innerHTML = mensagem.remove;
    }
 })()