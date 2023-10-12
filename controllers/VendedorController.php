<?php
namespace Controllers;
use MVC\Router;
use Model\Vendedor;

class VendedorController{

    public static function crear(Router $router){

        $errores = Vendedor::getErrores();
        $vendedor = new Vendedor;

        if($_SERVER['REQUEST_METHOD'] === 'POST'){
            //Crear una nueva instancia
            $vendedor = new Vendedor($_POST['vendedor']);
            
            //Validar que no haya campos vacíos
            $errores = $vendedor->validar();
        
            if(empty($errores)){
                $vendedor->guardar();
            }
            
        }

        $router -> render('vendedores/crear', [
            'errores'=> $errores,
            'vendedor' => $vendedor
        ]);
    }

    public static function actualizar(Router $router){
        $id = validarORedireccionar('/admin');
        $errores = Vendedor::getErrores();

        //Obtener datos del vendedor a actualizar
        $vendedor = Vendedor::find($id);

        if($_SERVER['REQUEST_METHOD'] === 'POST'){
            //Asignar los valores
            $args = $_POST['vendedor'];
        
            //Sincrinizar objeto en memoria con lo que el objeto escribió 
            $vendedor->sincronizar($args);
            
            //Validacion
            $errores = $vendedor->validar();
        
            if(empty($errores)){
                $vendedor->guardar();
            }
        }

        $router->render('vendedores/actualizar',[
            'errores' => $errores,
            'vendedor' => $vendedor
        ]); 
    }

    public static function eliminar(){
        if($_SERVER['REQUEST_METHOD'] === 'POST'){
            //Validar el ID
            $id = $_POST['id'];
            $id = filter_var($id, FILTER_VALIDATE_INT);

            if($id){
                //Validar el tipo a elminiar
                $tipo = $_POST['tipo'];

                if(validarTipoContenido($tipo)){
                    $vendedor = Vendedor::find($id);
                    $vendedor->eliminar();
                }
            }

        }
    }


}

?>