<?php

class UsuarioController extends AppController {

    public function index() {
        
    }

    function agregarUsuario() {
        if (Input::hasPost('CUsuario')) {
            $objUsuario = new CUsuario(Input::post('CUsuario'));
            $objUsuario->save();
            Redirect::to('usuario/listarUsuario/');
        }

        // $datosUsuario = new CUsuario();
        //      $this->datos = $datosUsuario->find();
    }

    public function eliminarUsuario($fl_usuario) {
        View::select(NULL);
        $usuario = new CUsuario();
        $usuario->delete($fl_usuario);
        Redirect::to('usuario/listarUsuario/');
    }

    public function modificarUsuario($fl_usuario) {
        $usuario = new CUsuario();
        $datosUsuario = $usuario->find($fl_usuario);
        $this->CUsuario = $datosUsuario;
        $this->fl_usuario = $fl_usuario;

        if (Input::hasPost('CUsuario')) { //pregunta si hubi un post
            $guardar = new CUsuario(Input::post('CUsuario')); //obtiene los datos del post
            $guardar->update();
            Redirect::to('usuario/listarUsuario/');
        }
    }

    public function listarUsuario() {
        //$usuario = new CUsuario();
        //$this->usuario = $usuario -> find();
    }

    public function obtenerUsuario() {

        View::template(null);
        $this->fl_rol = Input::post('fl_rol');
    }

    public function obtenerTablaUsuario() {
        View::template(null);
        //recibimos fl_usuario del javascript
        $fl_usuario = Input::post('fl_usuario');
        $datosUsuario = new CUsuario();

        //filtramos datos de usuario segun su fl, se recibe en views/getTablaUsuario.phtml
        $this->datos = $datosUsuario->find("columns: c_usuario.fl_usuario, c_usuario.nb_usuario, c_usuario.nb_apaterno, c_usuario.nb_amaterno, c_usuario.nb_puesto, c_usuario.nb_login, c_usuario.fe_creacion, c_usuario.fe_ultimod, c_usuario.ds_usuario,c_usuario.fg_activo, ca.nb_area, r.nb_rol"
                , "join: inner join c_rol r on r.fl_rol = c_usuario.fl_rol inner join c_area ca on ca.fl_area = c_usuario.fl_area"
                , "conditions: fl_usuario = '$fl_usuario'");
    }

}
