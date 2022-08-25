<?php

class DispositivoController extends AppController {

    function agregarDispositivo() {
        if (Input::hasPost('CDispositivo')) {
            $objDispositivo = new CDispositivo(Input::post('CDispositivo'));
            $objDispositivo->save();
            Redirect::to('dispositivo/listarDispositivo/');
        }
    }

    public function eliminarDispositivo($fl_dispositivo) {
        View::select(NULL);
        $dispositivo = new CDispositivo();
        $dispositivo->delete($fl_dispositivo);
        Redirect::to('dispositivo/listarDispositivo/');
    }

    public function modificarDispositivo($fl_dispositivo) {
        $dispositivo = new CDispositivo();
        $datosDispositivo = $dispositivo->find($fl_dispositivo);
        $this->CDispositivo = $datosDispositivo;
        $this->fl_dispositivo = $fl_dispositivo;

        if (Input::hasPost('CDispositivo')) { //pregunta si hubi un post
            $guardar = new CDispositivo(Input::post('CDispositivo')); //obtiene los datos del post
            $guardar->update();
            Redirect::to('dispositivo/listarDispositivo/');
        }
    }

    public function listarDispositivo() {
        //  $dispositivo = new CDispositivo();
        //  $this->dispositivo = $dispositivo -> find();
    }

    public function obtenerDispositivo() {

        View::template(null);
        $this->fl_ubicacion = Input::post('fl_ubicacion');
    }

    public function obtenerTablaDispositivo() {
        View::template(null);
        //recibimos fl_usuario del javascript
        $fl_dispositivo = Input::post('fl_dispositivo');
        $datosDispositivo = new CDispositivo();

        //filtramos datos de usuario segun su fl, se recibe en views/getTablaUsuario.phtml
        $this->datos = $datosDispositivo->find("columns: c_dispositivo.fl_dispositivo, c_dispositivo.nb_dispositivo, c_dispositivo.nb_modelo, c_dispositivo.fe_creacion, c_dispositivo.fe_ultimod, c_dispositivo.ds_dispositivo,c_dispositivo.fg_activo, ub.nb_ubicacion"
                , "join: inner join c_ubicacion ub on ub.fl_ubicacion = c_dispositivo.fl_ubicacion"
                , "conditions: fl_dispositivo = '$fl_dispositivo'");
    }

    public function consultaTemperaturaApi() {
        View::template(null);
        
    }
    
    
    public function consultaHumedadApi() {
        View::template(null);
        
    }

}
