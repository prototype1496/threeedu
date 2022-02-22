<?php

require '../../controller/super/SessionStart.php';
require '../../db_connection/dbconfig.php';
require_once '../../model/TeacherModel.php';
require_once '../../model/SuperModel.php';
require_once './StudentController.php';


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
    if (isset($_GET['user_id']) && isset($_GET['password'])) {
        $user = ["userId"=>$_GET['user_id'],"password"=>$_GET['password']];
        $requestMethod = $_SERVER["REQUEST_METHOD"];
        $dbConnection = new Connection();
        $controller = new StudentController($dbConnection, $requestMethod, $user);
        $controller->authenticateUser();
    }elseif (!isset($_GET['user_id'])){
            $response['status_code_header'] = 'HTTP/1.1 401 Unauthorized';
            $response['error'] = ["login failed"];
            header($response['status_code_header']);
        echo $response['body'] = "username required";
    }else{
        $response['status_code_header'] = 'HTTP/1.1 401 Unauthorized';
        $response['error'] = ["login failed"];
        header($response['status_code_header']);
        echo $response['body'] = "password required";
    }
}




