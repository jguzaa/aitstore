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

    $firstname=$_POST["first_name"];

    $lastname=$_POST["last_name"];

    $dob=$_POST["dob"];

    $address=$_POST["address"];

    $username=$_POST["user_name"];

    $password=password_hash($_POST["password"],PASSWORD_DEFAULT);

    $email=$_POST["email"];

    $pnumber=$_POST["contact_no"];

    $query = "INSERT INTO customer (fName,lName,dob,address,username,password,email,contactNo) VALUES
    ('".$firstname."','".$lastname."','".$dob."','".$address."','".$username."','".$password."','".$email."','".$pnumber."')";

    $result = mysqli_query($conn,$query);

    if(!$result){

        $responseArray = array('type' => 'danger', 'message' => 'There was an error while submitting the form. Please try again later');

    }
    else
    {

        $responseArray = array('type' => 'success', 'message' => 'Registration form successfully submitted. Thank you!');

    }

    $encoded = json_encode($responseArray);

    header('Content-Type: application/json');

    echo $encoded;
}

mysqli_close($conn);

?>