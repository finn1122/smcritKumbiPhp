<?php

/**
 * Controller por defecto si no se usa el routes
 *
 */
class IndexController extends AppController {

    public function index() {
        
        View::template(null);
        if (Input::hasPost("nb_login", "nb_contrasenia")) {
            $pwd = Input::post("nb_contrasenia");
            $usuario = Input::post("nb_login");

            $auth = new Auth("model", "class: CUsuario", "nb_login: $usuario", "nb_contrasenia: $pwd");
            if ($auth->authenticate()) {

                $this->fl_rol = Auth::get('fl_rol');
                Redirect::to("dashboard/dashboard");
            } else {
                Redirect::to("/index?fallo=true");
            }
        }
    }
    
    public function salir(){
        Auth::destroy_identity();
        Redirect::to("index/index");
    }

}
