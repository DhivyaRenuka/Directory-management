<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feature-rich Website</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header>
        <h1>My Business Directory</h1>
        <nav>
            <a href="home.html">Home</a>
            <a href="data.php">Business</a>
            <a href="search.html">Search & Filter</a>
            <a href="map.html">Maps</a>
            <a href="contact.html">Contact</a>
        </nav>
    </header>

    <div id="business-listing" class="card-container">
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

        // Retrieve all data from the businesses table
        $sql = "SELECT * FROM `businesses`";
        $result = $conn->query($sql);

        // Check if there are any rows in the result set
        if ($result->num_rows > 0) {
            // Output data of each row
            while ($row = $result->fetch_assoc()) {
                echo "<div class='card'>";
                echo "<h3>{$row["name"]}</h3>";
                echo "<p><strong>Address:</strong> {$row["address"]}</p>";
                echo "<button class='view-more-btn' onclick='showDetails(\"{$row["name"]}\")'>View More</button>";
                echo "</div>";
            }
        } else {
            echo "0 results";
        }

        // Close the connection
        $conn->close();
        ?>
    </div>

    <footer>
        <p>&copy; 2024 Your Website. All rights reserved.</p>
    </footer>

    <!-- Popup container -->
    <div id="popup-container" class="popup-container">
        <div class="popup-content">
            <span class="close-btn" onclick="closePopup()">&times;</span>
            <div id="business-details" class="business-details"></div>
        </div>
    </div>

    <script>
        // Function to show full details when clicking on a business card
        function showDetails(name) {
            // Send an AJAX request to get full details of the clicked business
            let xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        // Parse the JSON response
                        let businessDetails = JSON.parse(xhr.responseText);
                        // Display full details dynamically
                        displayPopup(businessDetails);
                    } else {
                        console.error('Error fetching business details');
                    }
                }
            };
            xhr.open('GET', 'get_details.php?name=' + encodeURIComponent(name), true);
            xhr.send();
        }

        // Function to display popup with full details
        function displayPopup(businessDetails) {
            var popupContainer = document.getElementById('popup-container');
            var businessDetailsContainer = document.getElementById('business-details');

            // Populate business details inside the popup
            businessDetailsContainer.innerHTML = "<h2>" + businessDetails.name + "</h2>" +
                "<p><strong>Address:</strong> " + businessDetails.address + "</p>" +
                "<p><strong>Phone:</strong> " + businessDetails.phone + "</p>" +
                "<p><strong>Website:</strong> " + businessDetails.website + "</p>" +
                "<p><strong>Email:</strong> " + businessDetails.email + "</p>" +
                "<p><strong>Contact:</strong> " + businessDetails.contact + "</p>";

            // Show the popup
            popupContainer.style.display = 'block';
        }

        // Function to close the popup
        function closePopup() {
            var popupContainer = document.getElementById('popup-container');
            popupContainer.style.display = 'none';
        }
    </script>
</body>
</html>
