document.addEventListener('DOMContentLoaded', function() {
  // Add styles for validation
  document.head.insertAdjacentHTML('beforeend', `
    <style>
      .error-message { color: #dc3545; font-size: 0.875rem; margin-top: 0.25rem; }
      .border-danger { border-color: #dc3545 !important; }
    </style>
  `);
  
  // Get form and set up validation
  const form = document.querySelector('form');
  
  // Check if form exists before proceeding
  if (!form) {
    console.error('Form not found in the document');
    return;
  }
  
  const formType = form.getAttribute('data-form-type') || 'add'; // 'add' or 'edit'
  
  // Setup validation rules
  const validationRules = {
    'pName': {
      required: true,
      minLength: 3,
      message: 'Property name must be at least 3 characters'
    },
    'pPrice': {
      required: true,
      validator: function(value) {
        return !isNaN(value) && parseFloat(value) > 0;
      },
      message: 'Price must be a positive number'
    },
    'pLocation': {
      required: true,
      minLength: 3,
      message: 'Location must be at least 3 characters'
    },
    'pPhone': {
      required: true,
      pattern: /^[0-9]{10}$/,
      message: 'Please enter a valid 10-digit phone number'
    },
    'pDescription': {
      required: true,
      minLength: 10,
      message: 'Description must be at least 10 characters'
    },
    'pImage': {
      required: formType === 'add',
      validator: validateImageFile,
      message: 'Please select a valid image file (JPG, JPEG, PNG)'
    }
  };
  
  // Add blur event listeners for real-time validation
  Object.keys(validationRules).forEach(function(fieldName) {
    const field = document.querySelector(`[name="${fieldName}"]`);
    if (field) {
      field.addEventListener('blur', function() {
        validateField(field, validationRules[fieldName]);
      });
    }
  });
  
  // Form submission validation
  form.addEventListener('submit', function(event) {
    // Clear all previous errors
    document.querySelectorAll('.error-message').forEach(function(el) {
      el.remove();
    });
    document.querySelectorAll('.border-danger').forEach(function(el) {
      el.classList.remove('border-danger');
    });
    
    let isValid = true;
    
    // Validate each field according to rules
    Object.keys(validationRules).forEach(function(fieldName) {
      const field = document.querySelector(`[name="${fieldName}"]`);
      
      // Skip image validation on edit form if no new image
      if (fieldName === 'pImage' && formType === 'edit' && !field.value) {
        return;
      }
      
      if (field && !validateField(field, validationRules[fieldName])) {
        isValid = false;
      }
    });
    
    // Prevent form submission if validation fails
    if (!isValid) {
      event.preventDefault();
    }
  });
});


 //Validate a specific field
function validateField(field, rules) {
  // Skip validation if field doesn't exist
  if (!field) return true;
  
  // Clear existing errors
  clearFieldError(field);
  
  // Check if empty for required fields
  if (rules.required && !field.value.trim()) {
    showError(field, `${field.previousElementSibling ? field.previousElementSibling.textContent || 'Field' : 'Field'} is required`);
    return false;
  }
  
  // Skip further validation if empty and not required
  if (!field.value.trim()) return true;
  
  // Check minimum length
  if (rules.minLength && field.value.trim().length < rules.minLength) {
    showError(field, rules.message);
    return false;
  }
  
  // Check pattern
  if (rules.pattern && !rules.pattern.test(field.value.trim())) {
    showError(field, rules.message);
    return false;
  }
  
  // Custom validator
  if (rules.validator && !rules.validator(field.value)) {
    showError(field, rules.message);
    return false;
  }
  
  return true;
}


  //Validate image file extension
function validateImageFile(filename) {
  if (!filename) return false;
  return /(\.jpg|\.jpeg|\.png)$/i.test(filename);
}


  //Display error message for a field
function showError(field, message) {
  const formGroup = field.closest('.form-group');
  if (!formGroup) {
    console.error('Form group not found for field', field);
    return;
  }
  
  const errorDiv = document.createElement('div');
  errorDiv.className = 'error-message';
  errorDiv.textContent = message;
  formGroup.appendChild(errorDiv);
  field.classList.add('border-danger');
}


 //Clear error for a specific field
function clearFieldError(field) {
  const formGroup = field.closest('.form-group');
  if (!formGroup) return;
  
  const errorMessage = formGroup.querySelector('.error-message');
  if (errorMessage) errorMessage.remove();
  field.classList.remove('border-danger');
}