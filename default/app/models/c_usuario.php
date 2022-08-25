<?php

class CUsuario extends ActiveRecord{
    
    public function allByRol(int $fl_rol)
    {
        return $this->find("fl_rol = $fl_rol", 'order: fl_rol' );
    }
    
    public function allByFlUsuario()
    {
        //return $this->find("fl_usuario = $fl_usuario", 'order: nb_usuario', "columns: nb_usuario, nb_apaterno, nb_amaterno");
        
    }

}
