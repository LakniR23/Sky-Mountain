/**
 * Schedule a Viewing Form JavaScript
 */

// When DOM is fully loaded
document.addEventListener('DOMContentLoaded', function() {
    // Get elements
    const viewingForm = document.getElementById('viewingForm');
    const formModal = document.getElementById('formModal');
    const dateInput = document.getElementById('aDate');
    
    // Set minimum date to today to prevent booking in the past
    if (dateInput) {
        const today = new Date().toISOString().split('T')[0];
        dateInput.min = today;
        
        // Focus event to help with mobile usability
        dateInput.addEventListener('focus', function() {
            this.showPicker();
        });
    }
    
    // Function to open the form modal
    window.openFormModal = function() {
        if (formModal) {
            formModal.style.display = 'flex'; // Changed from block to flex for better centering
            document.body.classList.add('modal-open'); // Add class to body for styling
            document.body.classList.add('has-modal'); // For footer styling
        }
    };

    // Function to close modal and redirect to previous page
    window.closeModal = function() {
        if (formModal) {
            formModal.style.display = 'none';
            document.body.classList.remove('modal-open'); // Remove class from body
            document.body.classList.remove('has-modal'); // Remove footer styling class
        }
        window.history.back();
    };
    
    // Make select boxes more user-friendly on mobile
    const selectBoxes = document.querySelectorAll('select');
    selectBoxes.forEach(select => {
        select.addEventListener('focus', function() {
            if (window.innerWidth < 768) {
                // On mobile, make sure dropdown is visible
                this.size = 2;
            }
        });
        
        select.addEventListener('blur', function() {
            this.size = 1;
        });
        
        select.addEventListener('change', function() {
            this.size = 1;
            this.blur();
        });
    });
    
    // Phone number validation - only allow numbers and format as user types
    const phoneInput = document.querySelector('input[name="aPhone"]');
    if (phoneInput) {
        phoneInput.addEventListener("input", function(e) {
            let phoneValue = this.value;
            
            // Remove any non-numeric characters
            phoneValue = phoneValue.replace(/\D/g, '');
            
            // Limit to 10 digits
            if (phoneValue.length > 10) {
                phoneValue = phoneValue.substring(0, 10);
            }
            
            // Update input value
            this.value = phoneValue;
            
            // Validate as user types
            if (phoneValue.length === 10) {
                this.classList.add('valid');
                this.classList.remove('invalid');
            } else if (phoneValue.length > 0) {
                this.classList.add('invalid');
                this.classList.remove('valid');
            } else {
                this.classList.remove('valid');
                this.classList.remove('invalid');
            }
        });
    }
    
    // Handle form submission
    if (viewingForm) {
        viewingForm.addEventListener('submit', function(event) {
            event.preventDefault(); // Prevent the default form submission
            
            // Validate form
            if (validateForm()) {
                // Two options for submission - try fetch first, with fallback to traditional form submission
                
                // Create URLSearchParams for form data (better servlet compatibility than FormData)
                const formData = new URLSearchParams();
                const formElements = viewingForm.elements;
                
                // Add each form field to the URLSearchParams
                for (let i = 0; i < formElements.length; i++) {
                    const element = formElements[i];
                    if (element.name) {
                        formData.append(element.name, element.value);
                    }
                }
                
                // Log the data being sent (for debugging)
                console.log("Submitting data:", Object.fromEntries(formData));
                
                fetch(viewingForm.action, {
                    method: viewingForm.method,
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                    body: formData,
                })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.text();
                })
                .then(data => {
                    console.log('Success:', data);
                    
                    // Hide the modal
                    if (formModal) {
                        formModal.style.display = 'none';
                        document.body.classList.remove('modal-open');
                        document.body.classList.remove('has-modal');
                    }
                    
                    // Create and display the success alert modal
                    showSuccessAlert();
                })
                .catch(error => {
                    console.error('AJAX Error:', error);
                    
                    // Fallback to traditional form submission if AJAX fails
                    console.log("Trying traditional form submission as fallback");
                    
                    // Store the form action and method
                    const formAction = viewingForm.action;
                    const formMethod = viewingForm.method;
                    
                    // Add a hidden field to indicate submission was processed
                    const hiddenField = document.createElement('input');
                    hiddenField.type = 'hidden';
                    hiddenField.name = 'submitProcessed';
                    hiddenField.value = 'true';
                    viewingForm.appendChild(hiddenField);
                    
                    // Submit the form traditionally
                    viewingForm.method = formMethod;
                    viewingForm.action = formAction;
                    
                    // Show success alert and then submit
                    showSuccessAlert();
                    
                    // Give the alert time to display before submitting
                    setTimeout(function() {
                        viewingForm.submit();
                    }, 100);
                });
            }
        });
    }
    
    // Check if modal should be open by default and set proper body classes
    if (formModal && formModal.style.display !== 'none') {
        document.body.classList.add('modal-open');
        document.body.classList.add('has-modal');
    }
});

/**
 * Creates and displays a success alert with checkmark
 */
function showSuccessAlert() {
    // Create elements for success alert
    const alertBox = document.createElement('div');
    alertBox.classList.add('alert-box');
    alertBox.id = 'successAlertBox';
    
    const checkmarkContainer = document.createElement('div');
    checkmarkContainer.classList.add('checkmark-container');
    checkmarkContainer.innerHTML = '&#10004;';
    
    const title = document.createElement('h2');
    title.textContent = 'Success!';
    title.classList.add('alert-title');
    
    const message = document.createElement('p');
    message.textContent = 'Your viewing request has been submitted.';
    message.classList.add('alert-message');
    
    const okButton = document.createElement('button');
    okButton.textContent = 'OK';
    okButton.classList.add('ok-button');
    
    // Add close button
    const closeIcon = document.createElement('span');
    closeIcon.innerHTML = '&times;';
    closeIcon.classList.add('alert-close');
    
    // Add event listeners for closing the alert and redirecting
    function closeAlertAndRedirect() {
        document.body.removeChild(alertBox);
        window.history.back(); // Go back to previous page
    }
    
    okButton.addEventListener('click', closeAlertAndRedirect);
    closeIcon.addEventListener('click', closeAlertAndRedirect);
    
    // Assemble and append the alert box
    alertBox.appendChild(closeIcon);
    alertBox.appendChild(checkmarkContainer);
    alertBox.appendChild(title);
    alertBox.appendChild(message);
    alertBox.appendChild(okButton);
    
    document.body.appendChild(alertBox);
}

/**
 * Form validation function
 * @returns {boolean} - Whether the form is valid
 */
function validateForm() {
    let isValid = true;
    const errorMessages = [];
    
    // Get form elements
    const date = document.querySelector('input[name="aDate"]').value;
    const time = document.querySelector('select[name="aTime"]').value;
    const name = document.querySelector('input[name="aName"]').value;
    const phone = document.querySelector('input[name="aPhone"]').value;
    
    // Validate date is selected and is not in the past
    const selectedDate = new Date(date);
    const today = new Date();
    today.setHours(0, 0, 0, 0);
    
    if (!date) {
        isValid = false;
        errorMessages.push("Please select a date");
    } else if (selectedDate < today) {
        isValid = false;
        errorMessages.push("Please select a future date");
    }
    
    // Validate time is selected
    if (!time) {
        isValid = false;
        errorMessages.push("Please select a time");
    }
    
    // Validate name is entered
    if (!name.trim()) {
        isValid = false;
        errorMessages.push("Please enter your name");
    }
    
    // Validate phone has 10 digits
    if (!phone.match(/^\d{10}$/)) {
        isValid = false;
        errorMessages.push("Please enter a valid 10-digit phone number");
    }
    
    // Display error messages if any
    if (errorMessages.length > 0) {
        alert(errorMessages.join("\n"));
    }
    
    return isValid;
}