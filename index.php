<h1>Bienvenidos a mi web</h1>

<?php

   require_once 'controllers/UsuarioController.PHP';

   $controlador = new UsuarioController();

   $controlador->mostrarTodos();
