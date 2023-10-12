<?php
namespace Controllers;

use MVC\Router;
use Model\Propiedad;
use PHPMailer\PHPMailer\PHPMailer;

class PaginasController{
    public static function index(Router $router){
        $propiedades = Propiedad::get(3);
        $inicio = true;
        $router->render('paginas/index', [
            'inicio' => $inicio,
            'propiedades'=> $propiedades
        ]);
    }

    public static function nosotros(Router $router){
        
        $router->render('paginas/nosotros');
    }

    public static function propiedades(Router $router){
        
        $propiedades = Propiedad::all();
        $router->render('paginas/propiedades', [
            'propiedades' => $propiedades
        ]);
    }

    public static function propiedad(Router $router){
        //Obtener el id
        $id = validarORedireccionar('/propiedades');

        //Buscar la propiedad por el ID
        $propiedad = Propiedad::find($id);
        
        $router->render('paginas/propiedad', [
            'propiedad' => $propiedad
        ]);
    }

    public static function blog(Router $router){
        $router->render('paginas/blog');
    }

    public static function entrada(Router $router){
        
        $router->render('paginas/entrada',[]);
    }

    public static function contacto(Router $router){

        $mensaje = null;

        if($_SERVER['REQUEST_METHOD'] === 'POST'){

            $respuestas = $_POST['contacto']; 
            
            //Crear una nueva instancia de PHPMailer
            $mail = new PHPMailer();

            /*
            $phpmailer = new PHPMailer();
            $phpmailer->isSMTP();
            $phpmailer->Host = 'sandbox.smtp.mailtrap.io';
            $phpmailer->SMTPAuth = true;
            $phpmailer->Port = 2525;
            $phpmailer->Username = 'b18480eae98d1f';
            $phpmailer->Password = 'c19ebd4114bd78';
            
            
            */

            //Configurar SMTP
            $mail->isSMTP();
            $mail->Host = 'sandbox.smtp.mailtrap.io';
            $mail->SMTPAuth = true;
            $mail->Username = 'b18480eae98d1f';
            $mail->Password = 'c19ebd4114bd78';
            $mail->SMTPSecure = 'tls';
            $mail->Port = '2525';

            //Configurar el contenido del email
            $mail->setFrom('admin@bienesraices.com');
            $mail->addAddress('admin@bienesraices.com', 'BienesRaices.com');
            $mail->Subject = 'Tienes un nuevo mensaje';

            //Habilitar HTML
            $mail->isHTML(true);
            $mail->CharSet = 'UTF-8';

            //Definir el contenido
            $contenido = '<html>';
            $contenido .= '<p> Tienes un nuevo mensaje </p>';
            $contenido .= '<p>Nombre: ' . $respuestas['nombre'] . '</p>';
            

            //Enviar de forma condicional EMAIL O TELEFONO
            if($respuestas['contacto'] === 'telefono'){
                $contenido .= '<p>CONTACTAR AL TELEFONO:</p>';
                $contenido .= '<p>Teléfono: ' . $respuestas['telefono'] . '</p>';

                $contenido .= '<p>Fecha para contacto: ' . $respuestas['fecha'] . '</p>';
                $contenido .= '<p>Hora para contacto: ' . $respuestas['hora'] . '</p>';
            }else{
                //Agregamos el campo de email
                $contenido .= '<p>CONTACTAR AL EMAIL:</p>';
                $contenido .= '<p>Email: ' . $respuestas['email'] . '</p>';
            }

            
            $contenido .= '<p>Mensaje: ' . $respuestas['mensaje'] . '</p>';
            $contenido .= '<p>Vende/Compra: ' . $respuestas['tipo'] . '</p>';
            $contenido .= '<p>Precio/Presupuesto: ' . $respuestas['precio'] . '</p>';
            $contenido .= '<p>Preferencia de contacto: ' . $respuestas['contacto'] . '</p>';
            
            $contenido.= '</html>';

            $mail->Body = $contenido;
            $mail->AltBody = 'Esto es texto alternativo sin HTML';

            //Enviar el email
            if($mail->send()){
                $mensaje = 'Mensaje enviado correctamente!';
            }else{
                $mensaje = 'El mensaje no se pudo enviar...';
            }

        }
        $router->render('paginas/contacto', [
            'mensaje' => $mensaje
        ]);
    }
}

?>