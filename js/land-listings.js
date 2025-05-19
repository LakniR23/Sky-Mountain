// Function to create property cards
function createPropertyCards() {
    const propertyListings = document.getElementById('property-listings');
    
    properties.forEach((property, index) => {
        // Create card HTML
        const propertyCard = document.createElement('div');
        propertyCard.className = 'property-card';
        propertyCard.setAttribute('data-index', index);
        
        // For demo purposes, use a placeholder image if no images are available
        const imageSrc = property.images && property.images.length > 0 ? 
                         property.images[0] : 
                         '/api/placeholder/400/320';
        
        // Define the target HTML page for each property
        const targetPage = `insideLand${index + 1}.html`;
        
        propertyCard.innerHTML = `
            <div class="image-container">
                <div class="slider">
                    <img src="${imageSrc}" alt="${property.title}">
                    <div class="slider-nav prev">
                        <i class="fas fa-chevron-left"></i>
                    </div>
                    <div class="slider-nav next">
                        <i class="fas fa-chevron-right"></i>
                    </div>
                </div>
                <div class="property-share">
                    <i class="fas fa-share-alt"></i>
                </div>
            </div>
            <div class="property-details">
                <h5 class="property-title">${property.title}</h5>
                <p class="property-location">${property.location}</p>
                
                <div class="property-info">
                    <div class="info-row">
                        <span class="info-label">Size:</span>
                        <span class="info-value">${property.size}</span>
                    </div>
                </div>
                
                <div class="price-section">
                    <div class="price-label">Starting Price</div>
                    <div class="price-value">${property.startingPrice}</div>
                    <div class="price-usd">
                        <span class="usd-value">${property.priceUSD}</span>
                        <span class="usd-label">LISTED IN USD</span>
                    </div>
                </div>
                
                <div class="buttons-container">
                    <a href="${targetPage}" class="btn btn-primary view-details">View Details</a>
                    <a href="tel:${property.contactNumber}" class="btn btn-secondary btn-contact">
                        <i class="fas fa-phone"></i> ${property.contactNumber}
                    </a>
                </div>
            </div>
        `;
        
        propertyListings.appendChild(propertyCard);
        
        // Setup image slider functionality
        setupSlider(propertyCard, property.images || []);
        
        // Add event listener for card click (except for share button and slider)
        propertyCard.addEventListener('click', (e) => {
            if (!e.target.closest('.property-share') && 
                !e.target.closest('.slider-nav') && 
                !e.target.closest('.btn-contact') &&
                !e.target.closest('.btn-primary') &&
                !e.target.closest('.btn-secondary')) {
                window.location.href = targetPage;
            }
        });
    });
    
    // Setup share buttons
    setupShareButtons();
}

// Function to setup image slider
function setupSlider(card, images) {
    if (!images || images.length <= 1) {
        const sliderNav = card.querySelectorAll('.slider-nav');
        sliderNav.forEach(nav => nav.style.display = 'none');
        return;
    }
    
    const slider = card.querySelector('.slider');
    const img = slider.querySelector('img');
    const prevBtn = card.querySelector('.slider-nav.prev');
    const nextBtn = card.querySelector('.slider-nav.next');
    
    let currentIndex = 0;
    
    function updateImage() {
        img.src = images[currentIndex] || '/api/placeholder/400/320';
        img.setAttribute('alt', `Image ${currentIndex + 1}`);
    }
    
    prevBtn.addEventListener('click', function(e) {
        e.stopPropagation();
        currentIndex = (currentIndex > 0) ? currentIndex - 1 : images.length - 1;
        updateImage();
    });
    
    nextBtn.addEventListener('click', function(e) {
        e.stopPropagation();
        currentIndex = (currentIndex < images.length - 1) ? currentIndex + 1 : 0;
        updateImage();
    });
}

// Function to handle the share button click
function setupShareButtons() {
    document.querySelectorAll('.property-share').forEach(button => {
        button.addEventListener('click', function(e) {
            e.stopPropagation();
            const propertyCard = this.closest('.property-card');
            const propertyTitle = propertyCard.querySelector('.property-title').textContent;
            
            if (navigator.share) {
                navigator.share({
                    title: propertyTitle,
                    text: `Check out this property: ${propertyTitle}`,
                    url: window.location.href,
                });
            } else {
                alert('Share functionality: ' + propertyTitle);
            }
        });
    });
}

// Initialize the page
window.addEventListener('DOMContentLoaded', createPropertyCards);