<?php
if(!defined('DS')){
    define('DS',DIRECTORY_SEPARATOR);
}
if(!defined('ROOT')){
    //define('ROOT',$_SERVER['DOCUMENT_ROOT']);//,str_replace('/','\\',$_SERVER['DOCUMENT_ROOT'])); //$_SERVER['DOCUMENT_ROOT'] = Pega a raiz do servidor
    define('ROOT',str_replace('/','\\',$_SERVER['DOCUMENT_ROOT']));
}
if(!defined('SITE_ROOT')){
    if(is_dir(ROOT.DS.'FIEB-teste' .DIRECTORY_SEPARATOR. 'sistema-de-notas')){        
        define('SITE_ROOT',ROOT.DS.'FIEB-teste' .DIRECTORY_SEPARATOR. 'sistema-de-notas');
    }else if(is_dir(ROOT.DS.'sistema-de-notas-Daniel')){        
        define('SITE_ROOT',ROOT.DS.'sistema-de-notas-Daniel');
    }else if(is_dir(ROOT.DS.'sistema-de-notas-Vinicius')){        
        define('SITE_ROOT',ROOT.DS.'sistema-de-notas-Vinicius');
    }else if(is_dir(ROOT.DS.'sistema-de-notas-master')){
        define('SITE_ROOT',ROOT.DS.'sistema-de-notas-master');
    }
    
}

