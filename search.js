// Function to display search results on the page
function displaySearchResults(responseText) {
    // Parse the JSON response
    var results = JSON.parse(responseText);

    // Get the search results container
    var resultsContainer = document.getElementById('search-results');

    // Clear previous search results
    resultsContainer.innerHTML = '';

    // Get the selected sort option
    var sortSelect = document.getElementById('sort-select');
    var sortBy = sortSelect.value;

    // Sort the results based on the selected option
    results.sort(function(a, b) {
        return a[sortBy].localeCompare(b[sortBy]);
    });

    // Display each result as a list item
    results.forEach(function(result) {
        var listItem = document.createElement('li');
        listItem.innerHTML = '<h3>' + result.name + '</h3>' +
                             '<p><strong>Address:</strong> ' + result.address + '</p>' +
                             '<p><strong>Phone:</strong> ' + result.phone + '</p>' +
                             '<p><strong>Website:</strong> ' + result.website + '</p>' +
                             '<p><strong>Email:</strong> ' + result.email + '</p>' +
                             '<p><strong>Contact:</strong> ' + result.contact + '</p>';
        resultsContainer.appendChild(listItem);
    });
}

// Function to handle form submission
document.getElementById('search-form').addEventListener('submit', function(event) {
    // Prevent default form submission
    event.preventDefault();

    
    // Function to search for businesses
function searchBusinesses(query) {
    // Create a new XMLHttpRequest object
    var xhr = new XMLHttpRequest();

    // Configure the request
    xhr.open('GET', 'search.php?query=' + encodeURIComponent(query), true);

    // Set up callback function
    xhr.onload = function() {
        if (xhr.status >= 200 && xhr.status < 400) {
            // Call the displaySearchResults function with the response text
            displaySearchResults(xhr.responseText);
        } else {
            console.error('Request failed with status:', xhr.status);
        }
    };

    // Handle network errors
    xhr.onerror = function() {
        console.error('Request failed');
    };

    // Send the request
    xhr.send();
}
// Get the search query from the input field
    var query = document.getElementById('search-input').value;

    // Perform search
    searchBusinesses(query);
});
