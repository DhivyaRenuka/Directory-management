<!-- process_form.php -->
<?php
// Retrieve form data
$name = $_POST['name'];
$address = $_POST['address'];
$phone = $_POST['phone'];
$website = $_POST['website'];
$email = $_POST['email'];
$contact = $_POST['contact'];

// Insert data into the database (replace these lines with your database insertion code)
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "buisnessdirectory";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "INSERT INTO businesses (name, address, phone, website, email, contact)
        VALUES ('$name', '$address', '$phone', '$website', '$email', '$contact')";

if ($conn->query($sql) === TRUE) {
    header("Location: data.php"); // Redirect to main page
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
