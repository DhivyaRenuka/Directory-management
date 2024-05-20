<?php
// Connect to your database
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "buisnessdirectory";
$conn = new mysqli($servername, $username, $password, $dbname);

// Check the connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Process the form submission
$name = $_POST['name'];
$email = $_POST['email'];
$message = $_POST['message'];

// Insert the form data into the 'contacts' table
$sql = "INSERT INTO contacts (name, email, message) VALUES ('$name', '$email', '$message')";

if ($conn->query($sql) === TRUE) {
    header("Location: home.html"); // Redirect to main page
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

// Close the database connection
$conn->close();
?>
