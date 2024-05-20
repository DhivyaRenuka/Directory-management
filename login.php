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

$username = $_POST['login-username'];
$password = $_POST['login-password'];

$sql = "SELECT * FROM users WHERE username='$username'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    if (password_verify($password, $row['password'])) {
        $_SESSION['username'] = $username;
        header("Location: home.html"); // Redirect to main page
        exit();
    } else {
        echo "<script>alert('Incorrect password');</script>"; // Display alert message
        echo "<script>window.location.href = 'index.html';</script>"; // Redirect back to login page
    }
} else {
    echo "<script>alert('User not found');</script>"; // Display alert message
    echo "<script>window.location.href = 'index.html';</script>"; // Redirect back to login page
}

$conn->close();
?>
