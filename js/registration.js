function validateForm() {
    const nic = document.getElementById("nic").value.trim();
    const pass = document.getElementById("password").value;
    const confirm = document.getElementById("confirm_password").value;
    const terms = document.getElementById("terms").checked;
    const errorMsg = document.getElementById("errorMsg");

    if (!nic) {
        errorMsg.textContent = "NIC/Passport number is required.";
        return false;
    }
	
	// Validate NIC format — must be exactly 13 digits
	    const nicPattern = /^\d{13}$/;
	    if (!nicPattern.test(nic)) {
	        errorMsg.textContent = "NIC/Passport number must be exactly 13 digits.";
	        return false;
	    }
		

    if (pass.length < 6) {
        errorMsg.textContent = "Password must be at least 6 characters.";
        return false;
    }

    if (pass !== confirm) {
        errorMsg.textContent = "Passwords do not match.";
        return false;
    }

    if (!terms) {
        errorMsg.textContent = "You must agree to the Terms & Conditions.";
        alert("You must agree to the Terms & Conditions to register.");
        return false;
    }

    errorMsg.textContent = "";
    return true;
}

function toggleButton() {
    const terms = document.getElementById("terms");
    const registerBtn = document.getElementById("registerBtn");
    registerBtn.disabled = !terms.checked;
}
