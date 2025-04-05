<?php
include 'db_config.php'; // Include the database configuration file

$sql = "SELECT * FROM users"; // SQL query to select all users
$result = $conn->query($sql); // Execute the query

$users = []; // Initialize an array to hold user data
while($row = $result->fetch_assoc()) { // Fetch each row as an associative array
    $users[] = $row; // Add the row to the users array
}
echo json_encode($users); // Encode the users array as JSON and output it

?>