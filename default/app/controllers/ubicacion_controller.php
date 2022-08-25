<?php
class UbicacionController extends AppController{

    function agregarUbicacion(){
        if(Input::hasPost('CUbicacion')){
            $objUbicacion = new CUbicacion(Input::post('CUbicacion'));
            $objUbicacion->save();
            Redirect::to('ubicacion/listarUbicacion/');
        }


}

public function eliminarUbicacion($fl_ubicacion){
      View::select(NULL);
      $ubicacion  = new CUbicacion();
      $ubicacion->delete($fl_ubicacion);
      Redirect::to('ubicacion/listarUbicacion/');

    }

    public function modificarUbicacion($fl_ubicacion){
					$ubicacion = new CUbicacion();
					$datosUbicacion = $ubicacion->find($fl_ubicacion);
					$this->CUbicacion = $datosUbicacion;
					$this->fl_ubicacion = $fl_ubicacion;

					if(Input::hasPost('CUbicacion')){ //pregunta si hubi un post
						$guardar = new CUbicacion (Input::post('CUbicacion')); //obtiene los datos del post
						$guardar->update();
						Redirect::to('ubicacion/listarUbicacion/');


          }

				}
        public function listarUbicacion()
        {
        //  $ubicacion = new CUbicacion();
        //$this->ubicacion = $ubicacion -> find();

        }

      

        public function obtenerTablaUbicacion() {
            View::template(null);
            //recibimos fl_usuario del javascript
            $fl_ubicacion = Input::post('fl_ubicacion');
            $datosUbicacion = new CUbicacion();

            //filtramos datos de usuario segun su fl, se recibe en views/getTablaUsuario.phtml
            $this->datos = $datosUbicacion->find("columns: c_ubicacion.fl_ubicacion, c_ubicacion.nb_ubicacion,a.nb_crit, c_ubicacion.no_oficina, c_ubicacion.fe_creacion, c_ubicacion.fe_ultimod, c_ubicacion.ds_ubicacion,c_ubicacion.fg_activo"
                    , "join: inner join c_crit a on a.fl_crit = c_ubicacion.fl_crit"
                    , "conditions: fl_ubicacion = '$fl_ubicacion'");
        }





    }
