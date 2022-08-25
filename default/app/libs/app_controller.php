<?php
/**
 * @see Controller nuevo controller
 */
require_once CORE_PATH . 'kumbia/controller.php';

/**
 * Controlador principal que heredan los controladores
 *
 * Todas las controladores heredan de esta clase en un nivel superior
 * por lo tanto los metodos aqui definidos estan disponibles para
 * cualquier controlador.
 *
 * @category Kumbia
 * @package Controller
 */
class AppController extends Controller
{
  public $acl;
  public $CRol = " ";

    final protected function initialize()
    {
      if(Auth::is_valid()) $this->CRol = Auth::get("CRol");
      $this->acl = new Acl();

      $this->acl->add_role(new AclRole("u"));
      $this->acl->add_role(new AclRole("A"));

    }

    final protected function finalize()
    {

    }

}
