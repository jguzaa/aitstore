<?php

$servername="localhost";
$dusername="root";
$dpassword="";
$dbname="eStore";

/*connect to database*/
$conn= new mysqli($servername,$dusername,$dpassword,$dbname);

if ($conn->connect_error)
{
    die ("connect failed:".$conn->connect_error);
}
else
{

    $email=$_POST["email"];

    $password=$_POST["password"];

    $sql = "SELECT password, username, customerId FROM customer WHERE email ='".$email."' LIMIT 1";

    $result = mysqli_query($conn, $sql);

    if(mysqli_num_rows($result)>0){
        $row = mysqli_fetch_array($result);
        if(password_verify($password,$row["password"])){

            $responseArray = array('type' => 'success', 'message' => 'Log in successfully');

            session_start();
            
            $_SESSION['username'] = $row['username'];
            $_SESSION['cid'] = $row['customerId'];

            //header('Location: index.php');

        } else {
            $responseArray = array('type' => 'danger', 'message' => 'Password is wrong!');
        }


    } else {
        $responseArray = array('type' => 'danger', 'message' => 'Email is not found!');
    }

    $encoded = json_encode($responseArray);

    header('Content-Type: application/json');

    echo $encoded;
}

mysqli_close($conn);

?>