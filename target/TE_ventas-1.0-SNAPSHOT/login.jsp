<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es" data-bs-theme="auto">
    <head>
        <title>Login</title>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

        <link rel="stylesheet" type="text/css" href="css/estilos.css">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <style>
            .user-img {
                width: 120px;
                height: 110px;
                position: absolute;
                top: -50px;
                left: 50%;
                transform: translateX(-50%);
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="d-flex justify-content-center h-100">
                <div class="card">
                    <img class="user-img" src="img/hombre.png" alt="">
                    <div class="card-header text-center">
                        
                        <h3>Login</h3>
                    </div>
                    <div class="card-body">
                        <form action="LoginControlador" method="post" >
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                </div>
                                <input type="email" name="correo" class="form-control" placeholder="Correo electrónico">

                            </div>
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-key"></i></span>
                                </div>
                                <input type="password" name="password" class="form-control" placeholder="Contraseña">
                            </div>
                            <div class="row align-items-center remember">
                                <input type="checkbox">Recuerdame
                            </div>
                            <div class="form-group d-flex justify-content-center">
                                <input type="submit" value="Ingresar" class="btn login_btn">
                            </div>
                        </form>
                    </div>
                    <div class="card-footer">
                        <div class="d-flex justify-content-center links">
                            <p class="text-body-secondary">&copy; RosmeliaChura-2024</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>