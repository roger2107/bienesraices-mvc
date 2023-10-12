<?php
namespace Controllers;
use MVC\Router;
use Model\Propiedad;
use Model\Vendedor;
use Intervention\Image\ImageManagerStatic as Image;

class  PropiedadController{
    public static function index(Router $router){
        $propiedades = Propiedad::all();
        
        $vendedores = Vendedor::all();
        //Muestra mensaje condicional
        $resultado = $_GET['resultado']??null;
        
        $router->render('propiedades/admin', [
            'propiedades' => $propiedades,
            'resultado' => $resultado,
            'vendedores' => $vendedores
        ]);
    }

    public static function crear(Router $router){

        $propiedad = new Propiedad;
        $vendedores = Vendedor::all();
        //Arreglo con mensajes de erroes
        $errores = Propiedad::getErrores();

        if($_SERVER['REQUEST_METHOD'] === 'POST'){

            $propiedad = new Propiedad($_POST['propiedad']);
    
            /**Subida de archivos */
            //Crear carpeta
            
            //Generar nombre unico
            $nombreImagen = md5( uniqid(rand(), true) ) . ".jpg";
    
            //Setear la imagen
            //Realiza un rezise con Intervention
            if($_FILES['propiedad']['tmp_name']['imagen']){
                $image = Image::make($_FILES['propiedad']['tmp_name']['imagen'])->fit(800,600);
                $propiedad->setImagen($nombreImagen);
            }

            //debuguear(CARPETA_IMAGENES);
    
            //Validar
            $errores = $propiedad->validar();
            //Revisar que el arreglo de errores esté vacío
    
            if(empty($errores)){
                //Crear la carpeta para subir imagenes
                if(!is_dir(CARPETA_IMAGENES)){
                    mkdir(CARPETA_IMAGENES);
                }
                //Guarda la imagen en el servidor
                $image->save(CARPETA_IMAGENES . $nombreImagen);
    
                //Guardar en la base de datos
                $propiedad->guardar();
            } 
        }
        $router->render('propiedades/crear', [
            'propiedad' => $propiedad,
            'vendedores' => $vendedores,
            'errores' => $errores
        ]);
    }

    public static function actualizar(Router $router){
        $id = validarORedireccionar('/admin');

        $propiedad = Propiedad::find($id);
        $vendedores = Vendedor::all();
        $errores = Propiedad::getErrores();

        //Metodo POST para actualizar
        if($_SERVER['REQUEST_METHOD'] === 'POST'){
            //Asignar los atributos
            $args=$_POST['propiedad'];
            
            $propiedad->sincronizar($args);
            
            //Validacion
            $errores = $propiedad->validar();
    
            //Subida de archivos
            //Generar nombre unico
            $nombreImagen = md5( uniqid(rand(), true) ) . ".jpg";
    
            if($_FILES['propiedad']['tmp_name']['imagen']){
                $image = Image::make($_FILES['propiedad']['tmp_name']['imagen'])->fit(800,600);
                $propiedad->setImagen($nombreImagen);
            }
            //Revisar que el arreglo de errores esté vacío
            if(empty($errores)){
                if($_FILES['propiedad']['tmp_name']['imagen']){
                    $image->save(CARPETA_IMAGENES . $nombreImagen);
                }
                $propiedad->guardar(); 
            }      
        }

        $router->render('propiedades/actualizar',[
            'propiedad' => $propiedad,
            'errores' => $errores,
            'vendedores' => $vendedores
        ]);
    }

    public static function eliminar(){
        if($_SERVER['REQUEST_METHOD'] === 'POST'){
            $id = $_POST['id'];
            $id = filter_var($id, FILTER_VALIDATE_INT);
    
            if($id){
    
                $tipo = $_POST['tipo'];
                
                if(validarTipoContenido($tipo)){
                    $propiedad = Propiedad::find($id);
                    $propiedad->eliminar();
                }  
            }
        }
    }
}

?>