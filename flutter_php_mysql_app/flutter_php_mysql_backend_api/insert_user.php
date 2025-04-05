<?php

include 'db_config.php';

$name = $_POST['name'];
$email = $_POST['email'];
$password = password_hash($_POST['password'], PASSWORD_DEFAULT); // Hash the password for security

$sql = "INSERT INTO users (name, email, password) VALUES ('$name', '$email', '$password')"; 

if($conn->query($sql)===TRUE) { // Execute the query and check if it was successful
    echo json_encode(['message' => 'User inserted successfully']);
} else {
    echo json_encode(['status' => 'error', 'message' => 'Error inserting user: ' . $conn->error]); // Return error message as JSON
}
?>