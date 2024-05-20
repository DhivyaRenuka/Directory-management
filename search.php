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

// Retrieve search query
if (isset($_GET['query'])) {
    $search_query = $_GET['query'];

    // Prepare SQL query to search for businesses by name, address, phone, website, email, and contact
    $sql = "SELECT * FROM businesses WHERE 
            name LIKE '%$search_query%' OR 
            address LIKE '%$search_query%' OR 
            phone LIKE '%$search_query%' OR 
            website LIKE '%$search_query%' OR 
            email LIKE '%$search_query%' OR 
            contact LIKE '%$search_query%'";

    // Execute SQL query
    $result = $conn->query($sql);

    // Initialize array to store search results
    $search_results = array();

    // Fetch search results
    while ($row = $result->fetch_assoc()) {
        $search_results[] = array(
            'name' => $row['name'],
            'address' => $row['address'],
            'phone' => $row['phone'],
            'website' => $row['website'],
            'email' => $row['email'],
            'contact' => $row['contact']
        );
    }

    // Send search results as JSON response
    header('Content-Type: application/json');
    echo json_encode($search_results);
}

// Close the connection
$conn->close();
?>
