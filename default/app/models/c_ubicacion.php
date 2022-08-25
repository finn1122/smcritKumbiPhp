<?php
class CUbicacion extends ActiveRecord{


  public function all()
  {
      return $this->find('order: nb_ubicacion');
  }

}
