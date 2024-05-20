<?php
session_start();

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "buisnessdirectory";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$username = $_POST['reg-username'];
$password = $_POST['reg-password'];

$hashed_password = password_hash($password, PASSWORD_DEFAULT);

$sql = "INSERT INTO users (username, password) VALUES ('$username', '$hashed_password')";

if ($conn->query($sql) === TRUE) {
    $_SESSION['registered'] = true;
    header("Location: index.html"); // Redirect to login page
    exit();
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
