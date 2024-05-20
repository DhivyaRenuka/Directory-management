<?php
// Connect to the database
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "buisnessdirectory";
$conn = new mysqli($servername, $username, $password, $dbname);

// Check the connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Validate and sanitize the input
if (!isset($_GET['name'])) {
    die("Business name not provided");
}
$name = $conn->real_escape_string($_GET['name']);

// Prepare a SQL statement to fetch details of the business with the given name
$sql = "SELECT * FROM `businesses` WHERE `name` = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $name);
$stmt->execute();
$result = $stmt->get_result();

// Check if there are any rows in the result set
if ($result->num_rows > 0) {
    // Fetch the details of the business
    $row = $result->fetch_assoc();
    // Output the details as JSON
    echo json_encode($row);
} else {
    // If no matching business found, return an empty JSON object
    echo json_encode(array());
}

// Close the statement and connection
$stmt->close();
$conn->close();
?>
