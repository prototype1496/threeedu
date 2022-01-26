<?php

require '../../../controller/super/SessionStart.php';
require '../../../db_connection/dbconfig.php';
require_once '../../../model/TeacherModel.php';
require_once '../../../model/SuperModel.php';
require_once '../../../api/controller/StudentController.php';


header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: OPTIONS,GET,POST,PUT,DELETE");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

$uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
$uri = explode('/', $uri);

// all of our endpoints start with /student
// everything else results in a 404 Not Found
if ($uri[2] == 'api') {


// the user id is, of course, optional and must be a number:
    $userId = null;
    if (isset($_GET['user_id'])) {
        $userId = $_GET['user_id'];
    }

    $requestMethod = $_SERVER["REQUEST_METHOD"];
    $dbConnection = new Connection();

    $controller = new StudentController($dbConnection, $requestMethod, $userId);
    $controller->processRequest();
}


