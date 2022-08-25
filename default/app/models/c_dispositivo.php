<?php

class CDispositivo extends ActiveRecord {

    public function allByUbicacion(int $fl_ubicacion) {
        return $this->find("fl_ubicacion = $fl_ubicacion", 'order: fl_ubicacion');
    }

    public function allByFlUbicacion() {
        //return $this->find("fl_usuario = $fl_usuario", 'order: nb_usuario', "columns: nb_usuario, nb_apaterno, nb_amaterno");
    }

    

}
