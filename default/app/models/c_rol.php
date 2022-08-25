<?php

class CRol extends ActiveRecord{
    public function all()
    {
        return $this->find('order: nb_rol' );
    }

}
