
<?php 
 
//these are the server details
//the username is root by default in case of xampp
//password is nothing by default
//and lastly we have the database named android. if your database name is different you have to change it 
$servername = "localhost";
$database = "jakart44_vvipeddb";
$username = "jakart44_vvipeddb";
$password = "pqJuM#tAdO0q";
 
 
//creating a new connection object using mysqli 
$conn = mysqli_connect($servername, $username, $password, $database);
 
//if there is some error connecting to the database
//with die we will stop the further execution by displaying a message causing the error 
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
