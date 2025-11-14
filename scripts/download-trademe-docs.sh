#!/bin/bash

# Trade Me API Documentation Download Script
# Auto-generated from JSON spec files
# Total endpoints: 265

set -e

BASE_URL="https://developer.trademe.co.nz/api-reference"
OUTPUT_DIR="data/downloaded-specs"

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

echo "Downloading Trade Me API documentation..."
echo "Base URL: $BASE_URL"
echo "Output directory: $OUTPUT_DIR"
echo "Total endpoints: 265"
echo ""

# Function to download a page and save to appropriate directory
download_page() {
    local url="$1"
    local output_path="$2"
    local category_dir=$(dirname "$output_path")
    
    # Create category directory if it doesn't exist
    mkdir -p "$OUTPUT_DIR/$category_dir"
    
    echo "Downloading: $url"
    echo "  -> $OUTPUT_DIR/$output_path"
    
    # Download with curl, following redirects and handling errors
    if curl -s -L -f "$url" -o "$OUTPUT_DIR/$output_path"; then
        echo "  ✓ Success"
    else
        echo "  ✗ Failed to download $url"
    fi
    
    # Small delay to be respectful to the server
    sleep 0.5
}

DOWNLOADED=0
FAILED=0

# ADDRESS METHODS (1 endpoints)
download_page "$BASE_URL/address-methods/search-by-address" "address-methods/search-by-address.html"

# BIDDING AND BUYING METHODS (3 endpoints)
download_page "$BASE_URL/bidding-and-buying-methods/buy-an-auction-using-buy-now" "bidding-and-buying-methods/buy-an-auction-using-buy-now.html"
download_page "$BASE_URL/bidding-and-buying-methods/place-a-bid" "bidding-and-buying-methods/place-a-bid.html"
download_page "$BASE_URL/bidding-and-buying-methods/send-delivery-address-info-to-seller" "bidding-and-buying-methods/send-delivery-address-info-to-seller.html"

# BRANDING METHODS (5 endpoints)
download_page "$BASE_URL/branding-methods/adds-an-image-to-the-authenticated-users-list-of-branding-images" "branding-methods/adds-an-image-to-the-authenticated-users-list-of-branding-images.html"
download_page "$BASE_URL/branding-methods/deletes-a-branding-image" "branding-methods/deletes-a-branding-image.html"
download_page "$BASE_URL/branding-methods/gets-a-branding-image-details-associated-with-an-authenticated-user" "branding-methods/gets-a-branding-image-details-associated-with-an-authenticated-user.html"
download_page "$BASE_URL/branding-methods/gets-all-branding-image-details-associated-with-an-authenticated-user" "branding-methods/gets-all-branding-image-details-associated-with-an-authenticated-user.html"
download_page "$BASE_URL/branding-methods/updates-a-branding-image-and-sets-it-as-default" "branding-methods/updates-a-branding-image-and-sets-it-as-default.html"

# CATALOGUE METHODS (28 endpoints)
download_page "$BASE_URL/catalogue-methods/get-in-trade-reasons" "catalogue-methods/get-in-trade-reasons.html"
download_page "$BASE_URL/catalogue-methods/retrieve-blu-ray-ids" "catalogue-methods/retrieve-blu-ray-ids.html"
download_page "$BASE_URL/catalogue-methods/retrieve-complaint-subjects" "catalogue-methods/retrieve-complaint-subjects.html"
download_page "$BASE_URL/catalogue-methods/retrieve-customer-support-enquiry-subjects" "catalogue-methods/retrieve-customer-support-enquiry-subjects.html"
download_page "$BASE_URL/catalogue-methods/retrieve-detailed-information-about-a-single-category-by-mcat-path" "catalogue-methods/retrieve-detailed-information-about-a-single-category-by-mcat-path.html"
download_page "$BASE_URL/catalogue-methods/retrieve-detailed-information-about-a-single-category" "catalogue-methods/retrieve-detailed-information-about-a-single-category.html"
download_page "$BASE_URL/catalogue-methods/retrieve-dvd-ids" "catalogue-methods/retrieve-dvd-ids.html"
download_page "$BASE_URL/catalogue-methods/retrieve-general-categories-by-mcat-path" "catalogue-methods/retrieve-general-categories-by-mcat-path.html"
download_page "$BASE_URL/catalogue-methods/retrieve-general-categories" "catalogue-methods/retrieve-general-categories.html"
download_page "$BASE_URL/catalogue-methods/retrieve-jobs-categories" "catalogue-methods/retrieve-jobs-categories.html"
download_page "$BASE_URL/catalogue-methods/retrieve-list-of-charities" "catalogue-methods/retrieve-list-of-charities.html"
download_page "$BASE_URL/catalogue-methods/retrieve-locality-options-for-search-parameters" "catalogue-methods/retrieve-locality-options-for-search-parameters.html"
download_page "$BASE_URL/catalogue-methods/retrieve-matching-attribute-values" "catalogue-methods/retrieve-matching-attribute-values.html"
download_page "$BASE_URL/catalogue-methods/retrieve-membership-and-motors-localities" "catalogue-methods/retrieve-membership-and-motors-localities.html"
download_page "$BASE_URL/catalogue-methods/retrieve-motorbike-types" "catalogue-methods/retrieve-motorbike-types.html"
download_page "$BASE_URL/catalogue-methods/retrieve-options-for-search-parameters" "catalogue-methods/retrieve-options-for-search-parameters.html"
download_page "$BASE_URL/catalogue-methods/retrieve-property-jobs-and-services-districts" "catalogue-methods/retrieve-property-jobs-and-services-districts.html"
download_page "$BASE_URL/catalogue-methods/retrieve-property-jobs-and-services-individual-suburb" "catalogue-methods/retrieve-property-jobs-and-services-individual-suburb.html"
download_page "$BASE_URL/catalogue-methods/retrieve-property-jobs-and-services-localities" "catalogue-methods/retrieve-property-jobs-and-services-localities.html"
download_page "$BASE_URL/catalogue-methods/retrieve-property-jobs-and-services-regions" "catalogue-methods/retrieve-property-jobs-and-services-regions.html"
download_page "$BASE_URL/catalogue-methods/retrieve-property-jobs-and-services-suburbs" "catalogue-methods/retrieve-property-jobs-and-services-suburbs.html"
download_page "$BASE_URL/catalogue-methods/retrieve-site-statistics" "catalogue-methods/retrieve-site-statistics.html"
download_page "$BASE_URL/catalogue-methods/retrieve-the-top-seller-status-criteria" "catalogue-methods/retrieve-the-top-seller-status-criteria.html"
download_page "$BASE_URL/catalogue-methods/retrieve-travel-localities" "catalogue-methods/retrieve-travel-localities.html"
download_page "$BASE_URL/catalogue-methods/retrieve-used-car-makes" "catalogue-methods/retrieve-used-car-makes.html"
download_page "$BASE_URL/catalogue-methods/retrieves-a-list-of-curated-promotions" "catalogue-methods/retrieves-a-list-of-curated-promotions.html"
download_page "$BASE_URL/catalogue-methods/search-the-blu-ray-catalogue" "catalogue-methods/search-the-blu-ray-catalogue.html"
download_page "$BASE_URL/catalogue-methods/search-the-dvd-catalogue" "catalogue-methods/search-the-dvd-catalogue.html"

# DOCUMENT SERVICE METHODS (4 endpoints)
download_page "$BASE_URL/document-service-methods/delete-a-cv-cover-letter-or-document" "document-service-methods/delete-a-cv-cover-letter-or-document.html"
download_page "$BASE_URL/document-service-methods/retrieve-a-saved-cv-cover-letter-or-document" "document-service-methods/retrieve-a-saved-cv-cover-letter-or-document.html"
download_page "$BASE_URL/document-service-methods/retrieve-your-cvs-cover-letters-and-documents" "document-service-methods/retrieve-your-cvs-cover-letters-and-documents.html"
download_page "$BASE_URL/document-service-methods/upload-a-cv-cover-letter-or-document" "document-service-methods/upload-a-cv-cover-letter-or-document.html"

# FAVOURITE METHODS (10 endpoints)
download_page "$BASE_URL/favourite-methods/remove-a-saved-favourite" "favourite-methods/remove-a-saved-favourite.html"
download_page "$BASE_URL/favourite-methods/retrieve-your-favourite-categories" "favourite-methods/retrieve-your-favourite-categories.html"
download_page "$BASE_URL/favourite-methods/retrieve-your-favourite-searches-with-details" "favourite-methods/retrieve-your-favourite-searches-with-details.html"
download_page "$BASE_URL/favourite-methods/retrieve-your-favourite-searches" "favourite-methods/retrieve-your-favourite-searches.html"
download_page "$BASE_URL/favourite-methods/retrieve-your-favourite-sellers" "favourite-methods/retrieve-your-favourite-sellers.html"
download_page "$BASE_URL/favourite-methods/save-a-category-to-your-favourites" "favourite-methods/save-a-category-to-your-favourites.html"
download_page "$BASE_URL/favourite-methods/save-a-search-category-or-seller-to-your-favourites" "favourite-methods/save-a-search-category-or-seller-to-your-favourites.html"
download_page "$BASE_URL/favourite-methods/save-a-seller-to-your-favourites" "favourite-methods/save-a-seller-to-your-favourites.html"
download_page "$BASE_URL/favourite-methods/update-a-saved-favorite" "favourite-methods/update-a-saved-favorite.html"
download_page "$BASE_URL/favourite-methods/update-a-saved-favourites-label" "favourite-methods/update-a-saved-favourites-label.html"

# FIXED PRICE OFFER METHODS (7 endpoints)
download_page "$BASE_URL/fixed-price-offer-methods/make-a-fixed-price-offer" "fixed-price-offer-methods/make-a-fixed-price-offer.html"
download_page "$BASE_URL/fixed-price-offer-methods/respond-to-a-fixed-price-offer" "fixed-price-offer-methods/respond-to-a-fixed-price-offer.html"
download_page "$BASE_URL/fixed-price-offer-methods/retrieve-a-list-of-members-for-a-fixed-price-offer-with-the-filter" "fixed-price-offer-methods/retrieve-a-list-of-members-for-a-fixed-price-offer-with-the-filter.html"
download_page "$BASE_URL/fixed-price-offer-methods/retrieve-a-list-of-members-for-a-fixed-price-offer" "fixed-price-offer-methods/retrieve-a-list-of-members-for-a-fixed-price-offer.html"
download_page "$BASE_URL/fixed-price-offer-methods/retrieve-the-fixed-price-offers-you-have-made-to-others" "fixed-price-offer-methods/retrieve-the-fixed-price-offers-you-have-made-to-others.html"
download_page "$BASE_URL/fixed-price-offer-methods/retrieve-your-unreviewed-fixed-price-offers" "fixed-price-offer-methods/retrieve-your-unreviewed-fixed-price-offers.html"
download_page "$BASE_URL/fixed-price-offer-methods/withdraw-a-fixed-price-offer" "fixed-price-offer-methods/withdraw-a-fixed-price-offer.html"

# JOB AGENT METHODS (2 endpoints)
download_page "$BASE_URL/job-agent-methods/retrieves-job-agent-report" "job-agent-methods/retrieves-job-agent-report.html"
download_page "$BASE_URL/job-agent-methods/retrieves-job-agent-six-month-summary" "job-agent-methods/retrieves-job-agent-six-month-summary.html"

# JOB COMPANY METHODS (2 endpoints)
download_page "$BASE_URL/job-company-methods/creates-a-company-for-the-currently-logged-in-member-or-returns-their-existing-c" "job-company-methods/creates-a-company-for-the-currently-logged-in-member-or-returns-their-existing-c.html"
download_page "$BASE_URL/job-company-methods/retrieves-companies-for-the-currently-logged-in-member" "job-company-methods/retrieves-companies-for-the-currently-logged-in-member.html"

# JOB LISTING METHODS (1 endpoints)
download_page "$BASE_URL/job-listing-methods/get-a-suggested-salary-for-the-given-listing-details" "job-listing-methods/get-a-suggested-salary-for-the-given-listing-details.html"

# JOB POSITION METHODS (6 endpoints)
download_page "$BASE_URL/job-position-methods/create-a-job-position" "job-position-methods/create-a-job-position.html"
download_page "$BASE_URL/job-position-methods/relist-or-list-similar-job-position" "job-position-methods/relist-or-list-similar-job-position.html"
download_page "$BASE_URL/job-position-methods/retrieve-a-position" "job-position-methods/retrieve-a-position.html"
download_page "$BASE_URL/job-position-methods/retrieve-positions-for-a-member" "job-position-methods/retrieve-positions-for-a-member.html"
download_page "$BASE_URL/job-position-methods/tracking-the-listing-process" "job-position-methods/tracking-the-listing-process.html"
download_page "$BASE_URL/job-position-methods/update-an-existing-job-position" "job-position-methods/update-an-existing-job-position.html"

# JOBS CATALOGUE METHODS (7 endpoints)
download_page "$BASE_URL/jobs-catalogue-methods/get-position-packages" "jobs-catalogue-methods/get-position-packages.html"
download_page "$BASE_URL/jobs-catalogue-methods/get-preferred-application-modes" "jobs-catalogue-methods/get-preferred-application-modes.html"
download_page "$BASE_URL/jobs-catalogue-methods/retrieve-all-employment-duration-type-values" "jobs-catalogue-methods/retrieve-all-employment-duration-type-values.html"
download_page "$BASE_URL/jobs-catalogue-methods/retrieve-all-employment-type-values" "jobs-catalogue-methods/retrieve-all-employment-type-values.html"
download_page "$BASE_URL/jobs-catalogue-methods/retrieve-all-pay-type-values" "jobs-catalogue-methods/retrieve-all-pay-type-values.html"
download_page "$BASE_URL/jobs-catalogue-methods/retrieve-all-possible-hourly-rate-values" "jobs-catalogue-methods/retrieve-all-possible-hourly-rate-values.html"
download_page "$BASE_URL/jobs-catalogue-methods/retrieve-all-possible-salary-values" "jobs-catalogue-methods/retrieve-all-possible-salary-values.html"

# JOBS PAYMENT METHODS (4 endpoints)
download_page "$BASE_URL/jobs-payment-methods/retrieve-details-about-a-job-pack" "jobs-payment-methods/retrieve-details-about-a-job-pack.html"
download_page "$BASE_URL/jobs-payment-methods/retrieve-details-about-volume-plans-and-job-packs" "jobs-payment-methods/retrieve-details-about-volume-plans-and-job-packs.html"
download_page "$BASE_URL/jobs-payment-methods/retrieves-a-job-pack-invoice-for-a-member" "jobs-payment-methods/retrieves-a-job-pack-invoice-for-a-member.html"
download_page "$BASE_URL/jobs-payment-methods/retrieves-job-pack-invoices-for-a-member" "jobs-payment-methods/retrieves-job-pack-invoices-for-a-member.html"

# LISTING ENQUIRIES METHODS (1 endpoints)
download_page "$BASE_URL/listing-enquiries-methods/retrieve-all-enquiries-made-for-a-specific-listing" "listing-enquiries-methods/retrieve-all-enquiries-made-for-a-specific-listing.html"

# LISTING METHODS (22 endpoints)
download_page "$BASE_URL/listing-methods/add-your-review-to-a-listing" "listing-methods/add-your-review-to-a-listing.html"
download_page "$BASE_URL/listing-methods/answer-a-question-on-a-listing" "listing-methods/answer-a-question-on-a-listing.html"
download_page "$BASE_URL/listing-methods/edit-your-review" "listing-methods/edit-your-review.html"
download_page "$BASE_URL/listing-methods/post-a-question-or-comment-on-a-listing" "listing-methods/post-a-question-or-comment-on-a-listing.html"
download_page "$BASE_URL/listing-methods/remove-a-comment-from-a-listing" "listing-methods/remove-a-comment-from-a-listing.html"
download_page "$BASE_URL/listing-methods/retrieve-all-your-unanswered-questions" "listing-methods/retrieve-all-your-unanswered-questions.html"
download_page "$BASE_URL/listing-methods/retrieve-closing-soon-listings" "listing-methods/retrieve-closing-soon-listings.html"
download_page "$BASE_URL/listing-methods/retrieve-cool-listings" "listing-methods/retrieve-cool-listings.html"
download_page "$BASE_URL/listing-methods/retrieve-hot-listings" "listing-methods/retrieve-hot-listings.html"
download_page "$BASE_URL/listing-methods/retrieve-latest-listings" "listing-methods/retrieve-latest-listings.html"
download_page "$BASE_URL/listing-methods/retrieve-one-dollar-listings" "listing-methods/retrieve-one-dollar-listings.html"
download_page "$BASE_URL/listing-methods/retrieve-questions-for-a-listing" "listing-methods/retrieve-questions-for-a-listing.html"
download_page "$BASE_URL/listing-methods/retrieve-recommended-listings" "listing-methods/retrieve-recommended-listings.html"
download_page "$BASE_URL/listing-methods/retrieve-reviews-for-a-listing" "listing-methods/retrieve-reviews-for-a-listing.html"
download_page "$BASE_URL/listing-methods/retrieve-similar-listings" "listing-methods/retrieve-similar-listings.html"
download_page "$BASE_URL/listing-methods/retrieve-the-details-of-a-single-listing" "listing-methods/retrieve-the-details-of-a-single-listing.html"
download_page "$BASE_URL/listing-methods/retrieve-unanswered-questions-on-a-single-listing" "listing-methods/retrieve-unanswered-questions-on-a-single-listing.html"
download_page "$BASE_URL/listing-methods/retrieves-complementary-listings" "listing-methods/retrieves-complementary-listings.html"
download_page "$BASE_URL/listing-methods/retrieves-equivalent-listings" "listing-methods/retrieves-equivalent-listings.html"
download_page "$BASE_URL/listing-methods/send-an-email-to-the-property-seller" "listing-methods/send-an-email-to-the-property-seller.html"
download_page "$BASE_URL/listing-methods/send-an-email-to-the-seller" "listing-methods/send-an-email-to-the-seller.html"
download_page "$BASE_URL/listing-methods/sends-an-email-to-a-friend-about-a-listing" "listing-methods/sends-an-email-to-a-friend-about-a-listing.html"

# MEMBERSHIP METHODS (4 endpoints)
download_page "$BASE_URL/membership-methods/retrieve-feedback-for-a-member" "membership-methods/retrieve-feedback-for-a-member.html"
download_page "$BASE_URL/membership-methods/retrieve-member-feedback-counts" "membership-methods/retrieve-member-feedback-counts.html"
download_page "$BASE_URL/membership-methods/retrieve-member-id-for-a-nickname" "membership-methods/retrieve-member-id-for-a-nickname.html"
download_page "$BASE_URL/membership-methods/retrieve-member-profile" "membership-methods/retrieve-member-profile.html"

# MY TRADE ME METHODS (61 endpoints)
download_page "$BASE_URL/my-trade-me-methods/add-a-delivery-address" "my-trade-me-methods/add-a-delivery-address.html"
download_page "$BASE_URL/my-trade-me-methods/add-a-listing-to-your-watchlist-with-options" "my-trade-me-methods/add-a-listing-to-your-watchlist-with-options.html"
download_page "$BASE_URL/my-trade-me-methods/add-a-listing-to-your-watchlist" "my-trade-me-methods/add-a-listing-to-your-watchlist.html"
download_page "$BASE_URL/my-trade-me-methods/ask-the-seller-to-create-an-fpo" "my-trade-me-methods/ask-the-seller-to-create-an-fpo.html"
download_page "$BASE_URL/my-trade-me-methods/ask-the-seller-to-relist-a-listing" "my-trade-me-methods/ask-the-seller-to-relist-a-listing.html"
download_page "$BASE_URL/my-trade-me-methods/blacklist-a-member" "my-trade-me-methods/blacklist-a-member.html"
download_page "$BASE_URL/my-trade-me-methods/clear-saved-credit-card" "my-trade-me-methods/clear-saved-credit-card.html"
download_page "$BASE_URL/my-trade-me-methods/confirm-address-verification-by-applying-the-code-that-has-been-physically-maile" "my-trade-me-methods/confirm-address-verification-by-applying-the-code-that-has-been-physically-maile.html"
download_page "$BASE_URL/my-trade-me-methods/create-or-update-a-note" "my-trade-me-methods/create-or-update-a-note.html"
download_page "$BASE_URL/my-trade-me-methods/delete-a-note" "my-trade-me-methods/delete-a-note.html"
download_page "$BASE_URL/my-trade-me-methods/delete-courier-parcel-by-id" "my-trade-me-methods/delete-courier-parcel-by-id.html"
download_page "$BASE_URL/my-trade-me-methods/delete-your-payment-instructions-template" "my-trade-me-methods/delete-your-payment-instructions-template.html"
download_page "$BASE_URL/my-trade-me-methods/gets-a-list-of-your-active-listing-counts-grouped-by-category" "my-trade-me-methods/gets-a-list-of-your-active-listing-counts-grouped-by-category.html"
download_page "$BASE_URL/my-trade-me-methods/post-feedback-on-a-listing" "my-trade-me-methods/post-feedback-on-a-listing.html"
download_page "$BASE_URL/my-trade-me-methods/refund-a-pay-now-payment" "my-trade-me-methods/refund-a-pay-now-payment.html"
download_page "$BASE_URL/my-trade-me-methods/remove-a-delivery-address" "my-trade-me-methods/remove-a-delivery-address.html"
download_page "$BASE_URL/my-trade-me-methods/remove-a-listing-from-your-lost-items-list" "my-trade-me-methods/remove-a-listing-from-your-lost-items-list.html"
download_page "$BASE_URL/my-trade-me-methods/remove-a-listing-from-your-unsold-items-list" "my-trade-me-methods/remove-a-listing-from-your-unsold-items-list.html"
download_page "$BASE_URL/my-trade-me-methods/remove-a-listing-from-your-watchlist" "my-trade-me-methods/remove-a-listing-from-your-watchlist.html"
download_page "$BASE_URL/my-trade-me-methods/remove-a-member-from-your-blacklist" "my-trade-me-methods/remove-a-member-from-your-blacklist.html"
download_page "$BASE_URL/my-trade-me-methods/remove-a-purchase-from-your-won-items-list" "my-trade-me-methods/remove-a-purchase-from-your-won-items-list.html"
download_page "$BASE_URL/my-trade-me-methods/remove-a-sale-from-your-sold-items-list" "my-trade-me-methods/remove-a-sale-from-your-sold-items-list.html"
download_page "$BASE_URL/my-trade-me-methods/remove-the-status-from-a-listing-using-a-listing-id-and-offer-id" "my-trade-me-methods/remove-the-status-from-a-listing-using-a-listing-id-and-offer-id.html"
download_page "$BASE_URL/my-trade-me-methods/remove-the-status-from-a-listing-using-a-purchase-id" "my-trade-me-methods/remove-the-status-from-a-listing-using-a-purchase-id.html"
download_page "$BASE_URL/my-trade-me-methods/remove-your-feedback" "my-trade-me-methods/remove-your-feedback.html"
download_page "$BASE_URL/my-trade-me-methods/request-address-verification-letter-to-be-physically-mailed-to-the-membership" "my-trade-me-methods/request-address-verification-letter-to-be-physically-mailed-to-the-membership.html"
download_page "$BASE_URL/my-trade-me-methods/respond-to-a-fixed-price-offer" "my-trade-me-methods/respond-to-a-fixed-price-offer.html"
download_page "$BASE_URL/my-trade-me-methods/respond-to-feedback" "my-trade-me-methods/respond-to-feedback.html"
download_page "$BASE_URL/my-trade-me-methods/retrieve-a-note" "my-trade-me-methods/retrieve-a-note.html"
download_page "$BASE_URL/my-trade-me-methods/retrieve-feedback-details-for-a-purchase" "my-trade-me-methods/retrieve-feedback-details-for-a-purchase.html"
download_page "$BASE_URL/my-trade-me-methods/retrieve-skus-and-stock-levels" "my-trade-me-methods/retrieve-skus-and-stock-levels.html"
download_page "$BASE_URL/my-trade-me-methods/retrieve-the-details-of-a-settlement-into-your-bank-account" "my-trade-me-methods/retrieve-the-details-of-a-settlement-into-your-bank-account.html"
download_page "$BASE_URL/my-trade-me-methods/retrieve-your-account-statement" "my-trade-me-methods/retrieve-your-account-statement.html"
download_page "$BASE_URL/my-trade-me-methods/retrieve-your-blacklisted-members" "my-trade-me-methods/retrieve-your-blacklisted-members.html"
download_page "$BASE_URL/my-trade-me-methods/retrieve-your-delivery-addresses" "my-trade-me-methods/retrieve-your-delivery-addresses.html"
download_page "$BASE_URL/my-trade-me-methods/retrieve-your-email-preferences" "my-trade-me-methods/retrieve-your-email-preferences.html"
download_page "$BASE_URL/my-trade-me-methods/retrieve-your-items-currently-for-sale" "my-trade-me-methods/retrieve-your-items-currently-for-sale.html"
download_page "$BASE_URL/my-trade-me-methods/retrieve-your-lost-items" "my-trade-me-methods/retrieve-your-lost-items.html"
download_page "$BASE_URL/my-trade-me-methods/retrieve-your-pay-now-statement" "my-trade-me-methods/retrieve-your-pay-now-statement.html"
download_page "$BASE_URL/my-trade-me-methods/retrieve-your-payment-instructions-template" "my-trade-me-methods/retrieve-your-payment-instructions-template.html"
download_page "$BASE_URL/my-trade-me-methods/retrieve-your-profile-information" "my-trade-me-methods/retrieve-your-profile-information.html"
download_page "$BASE_URL/my-trade-me-methods/retrieve-your-sold-items" "my-trade-me-methods/retrieve-your-sold-items.html"
download_page "$BASE_URL/my-trade-me-methods/retrieve-your-top-seller-status-summary" "my-trade-me-methods/retrieve-your-top-seller-status-summary.html"
download_page "$BASE_URL/my-trade-me-methods/retrieve-your-unreviewed-fixed-price-offers" "my-trade-me-methods/retrieve-your-unreviewed-fixed-price-offers.html"
download_page "$BASE_URL/my-trade-me-methods/retrieve-your-unsold-items" "my-trade-me-methods/retrieve-your-unsold-items.html"
download_page "$BASE_URL/my-trade-me-methods/retrieve-your-watchlist" "my-trade-me-methods/retrieve-your-watchlist.html"
download_page "$BASE_URL/my-trade-me-methods/retrieve-your-weekly-sales-statistics-new" "my-trade-me-methods/retrieve-your-weekly-sales-statistics-new.html"
download_page "$BASE_URL/my-trade-me-methods/retrieve-your-won-items" "my-trade-me-methods/retrieve-your-won-items.html"
download_page "$BASE_URL/my-trade-me-methods/retrieves-your-property-agent-report" "my-trade-me-methods/retrieves-your-property-agent-report.html"
download_page "$BASE_URL/my-trade-me-methods/save-or-update-the-status-of-a-listing-using-a-listing-id-and-offer-id" "my-trade-me-methods/save-or-update-the-status-of-a-listing-using-a-listing-id-and-offer-id.html"
download_page "$BASE_URL/my-trade-me-methods/save-or-update-the-status-of-a-listing-using-a-purchase-id" "my-trade-me-methods/save-or-update-the-status-of-a-listing-using-a-purchase-id.html"
download_page "$BASE_URL/my-trade-me-methods/send-payment-instructions-email" "my-trade-me-methods/send-payment-instructions-email.html"
download_page "$BASE_URL/my-trade-me-methods/set-in-trade-status" "my-trade-me-methods/set-in-trade-status.html"
download_page "$BASE_URL/my-trade-me-methods/set-your-email-preferences" "my-trade-me-methods/set-your-email-preferences.html"
download_page "$BASE_URL/my-trade-me-methods/submit-a-new-enquiry-message-to-trade-me-customer-support" "my-trade-me-methods/submit-a-new-enquiry-message-to-trade-me-customer-support.html"
download_page "$BASE_URL/my-trade-me-methods/track-a-courier-parcel" "my-trade-me-methods/track-a-courier-parcel.html"
download_page "$BASE_URL/my-trade-me-methods/update-a-delivery-address" "my-trade-me-methods/update-a-delivery-address.html"
download_page "$BASE_URL/my-trade-me-methods/update-courier-parcel-by-id" "my-trade-me-methods/update-courier-parcel-by-id.html"
download_page "$BASE_URL/my-trade-me-methods/update-your-email-address" "my-trade-me-methods/update-your-email-address.html"
download_page "$BASE_URL/my-trade-me-methods/update-your-feedback" "my-trade-me-methods/update-your-feedback.html"
download_page "$BASE_URL/my-trade-me-methods/update-your-payment-instructions-template" "my-trade-me-methods/update-your-payment-instructions-template.html"

# OAUTH METHODS (2 endpoints)
download_page "$BASE_URL/oauth-methods/createaccesstoken" "oauth-methods/createaccesstoken.html"
download_page "$BASE_URL/oauth-methods/createrequesttoken" "oauth-methods/createrequesttoken.html"

# PHOTO METHODS (11 endpoints)
download_page "$BASE_URL/photo-methods/add-a-photo-to-a-listing" "photo-methods/add-a-photo-to-a-listing.html"
download_page "$BASE_URL/photo-methods/get-a-collection-of-the-different-urls-for-a-given-photo-id" "photo-methods/get-a-collection-of-the-different-urls-for-a-given-photo-id.html"
download_page "$BASE_URL/photo-methods/remove-a-photo" "photo-methods/remove-a-photo.html"
download_page "$BASE_URL/photo-methods/remove-the-members-profile-image" "photo-methods/remove-the-members-profile-image.html"
download_page "$BASE_URL/photo-methods/retrieve-information-about-a-branding-image" "photo-methods/retrieve-information-about-a-branding-image.html"
download_page "$BASE_URL/photo-methods/retrieve-your-photos-with-usage-details" "photo-methods/retrieve-your-photos-with-usage-details.html"
download_page "$BASE_URL/photo-methods/retrieve-your-photos" "photo-methods/retrieve-your-photos.html"
download_page "$BASE_URL/photo-methods/search-by-image" "photo-methods/search-by-image.html"
download_page "$BASE_URL/photo-methods/upload-a-photo" "photo-methods/upload-a-photo.html"
download_page "$BASE_URL/photo-methods/upload-an-agent-branding-image" "photo-methods/upload-an-agent-branding-image.html"
download_page "$BASE_URL/photo-methods/upload-and-set-a-members-profile-image" "photo-methods/upload-and-set-a-members-profile-image.html"

# PING METHODS (2 endpoints)
download_page "$BASE_URL/ping-methods/get-your-ping-balance-ledger" "ping-methods/get-your-ping-balance-ledger.html"
download_page "$BASE_URL/ping-methods/make-a-refund-for-a-purchase" "ping-methods/make-a-refund-for-a-purchase.html"

# PROPERTY AGENCY METHODS (3 endpoints)
download_page "$BASE_URL/property-agency-methods/get-office-listing-statistics" "property-agency-methods/get-office-listing-statistics.html"
download_page "$BASE_URL/property-agency-methods/get-property-office-live-listing-statistics" "property-agency-methods/get-property-office-live-listing-statistics.html"
download_page "$BASE_URL/property-agency-methods/gets-the-counts-for-listing-statistics-from-homes" "property-agency-methods/gets-the-counts-for-listing-statistics-from-homes.html"

# PROPERTY AGENT METHODS (1 endpoints)
download_page "$BASE_URL/property-agent-methods/get-property-agent-live-listing-statistics" "property-agent-methods/get-property-agent-live-listing-statistics.html"

# PROPERTY MAP METHODS (1 endpoints)
download_page "$BASE_URL/property-map-methods/get-map-dots-for-a-given-search-request" "property-map-methods/get-map-dots-for-a-given-search-request.html"

# PROPERTY PARTNERSHIP AGREEMENT METHODS (3 endpoints)
download_page "$BASE_URL/property-partnership-agreement-methods/creates-a-partnership-agreement" "property-partnership-agreement-methods/creates-a-partnership-agreement.html"
download_page "$BASE_URL/property-partnership-agreement-methods/edits-an-existing-depth-commitment-contract" "property-partnership-agreement-methods/edits-an-existing-depth-commitment-contract.html"
download_page "$BASE_URL/property-partnership-agreement-methods/retrieve-member-commitment-contracts" "property-partnership-agreement-methods/retrieve-member-commitment-contracts.html"

# PROPERTY SOLD SEARCH METHODS (1 endpoints)
download_page "$BASE_URL/property-sold-search-methods/get-search-card-based-on-address-points-or-polyline" "property-sold-search-methods/get-search-card-based-on-address-points-or-polyline.html"

# PROPERTY TIMELINE METHODS (1 endpoints)
download_page "$BASE_URL/property-timeline-methods/get-property-timeline-data" "property-timeline-methods/get-property-timeline-data.html"

# RENTI METHODS (5 endpoints)
download_page "$BASE_URL/renti-methods/retrieve-renti-viewing-times-for-a-listing" "renti-methods/retrieve-renti-viewing-times-for-a-listing.html"
download_page "$BASE_URL/renti-methods/retrieve-the-renti-status-of-a-member" "renti-methods/retrieve-the-renti-status-of-a-member.html"
download_page "$BASE_URL/renti-methods/send-renti-enquiry-request-for-a-listing" "renti-methods/send-renti-enquiry-request-for-a-listing.html"
download_page "$BASE_URL/renti-methods/send-renti-viewing-request-for-a-listing" "renti-methods/send-renti-viewing-request-for-a-listing.html"
download_page "$BASE_URL/renti-methods/update-the-renti-status-of-a-member" "renti-methods/update-the-renti-status-of-a-member.html"

# SEARCH METHODS (24 endpoints)
download_page "$BASE_URL/search-methods/clear-recent-searches" "search-methods/clear-recent-searches.html"
download_page "$BASE_URL/search-methods/commercial-lease-search" "search-methods/commercial-lease-search.html"
download_page "$BASE_URL/search-methods/commercial-sale-search" "search-methods/commercial-sale-search.html"
download_page "$BASE_URL/search-methods/deletes-a-single-recent-search" "search-methods/deletes-a-single-recent-search.html"
download_page "$BASE_URL/search-methods/flatmate-search" "search-methods/flatmate-search.html"
download_page "$BASE_URL/search-methods/general-search" "search-methods/general-search.html"
download_page "$BASE_URL/search-methods/get-search-suggestions" "search-methods/get-search-suggestions.html"
download_page "$BASE_URL/search-methods/jobs-search" "search-methods/jobs-search.html"
download_page "$BASE_URL/search-methods/lifestyle-property-search" "search-methods/lifestyle-property-search.html"
download_page "$BASE_URL/search-methods/modify-search-suggestion-settings" "search-methods/modify-search-suggestion-settings.html"
download_page "$BASE_URL/search-methods/motorbike-search" "search-methods/motorbike-search.html"
download_page "$BASE_URL/search-methods/motorboat-search" "search-methods/motorboat-search.html"
download_page "$BASE_URL/search-methods/new-homes-search" "search-methods/new-homes-search.html"
download_page "$BASE_URL/search-methods/open-home-search" "search-methods/open-home-search.html"
download_page "$BASE_URL/search-methods/price-groups-to-make-a-histogram" "search-methods/price-groups-to-make-a-histogram.html"
download_page "$BASE_URL/search-methods/rental-search" "search-methods/rental-search.html"
download_page "$BASE_URL/search-methods/residential-search" "search-methods/residential-search.html"
download_page "$BASE_URL/search-methods/retirement-village-search" "search-methods/retirement-village-search.html"
download_page "$BASE_URL/search-methods/retrieve-the-recent-searches-for-the-logged-in-member" "search-methods/retrieve-the-recent-searches-for-the-logged-in-member.html"
download_page "$BASE_URL/search-methods/rural-property-search" "search-methods/rural-property-search.html"
download_page "$BASE_URL/search-methods/search-residential-property-for-hp-recommendations" "search-methods/search-residential-property-for-hp-recommendations.html"
download_page "$BASE_URL/search-methods/search-residential-property-for-srp-recommendations" "search-methods/search-residential-property-for-srp-recommendations.html"
download_page "$BASE_URL/search-methods/store-search" "search-methods/store-search.html"
download_page "$BASE_URL/search-methods/used-motors-search" "search-methods/used-motors-search.html"

# SELLING METHODS (24 endpoints)
download_page "$BASE_URL/selling-methods/create-a-draft-listing" "selling-methods/create-a-draft-listing.html"
download_page "$BASE_URL/selling-methods/delete-a-draft-listing" "selling-methods/delete-a-draft-listing.html"
download_page "$BASE_URL/selling-methods/edit-an-item" "selling-methods/edit-an-item.html"
download_page "$BASE_URL/selling-methods/extend-a-classified" "selling-methods/extend-a-classified.html"
download_page "$BASE_URL/selling-methods/get-a-draft-listing" "selling-methods/get-a-draft-listing.html"
download_page "$BASE_URL/selling-methods/get-a-list-of-draft-listings" "selling-methods/get-a-list-of-draft-listings.html"
download_page "$BASE_URL/selling-methods/list-an-item" "selling-methods/list-an-item.html"
download_page "$BASE_URL/selling-methods/promote-a-listing-with-a-temporal-extra" "selling-methods/promote-a-listing-with-a-temporal-extra.html"
download_page "$BASE_URL/selling-methods/relist-an-item-with-edits" "selling-methods/relist-an-item-with-edits.html"
download_page "$BASE_URL/selling-methods/relist-an-item" "selling-methods/relist-an-item.html"
download_page "$BASE_URL/selling-methods/remove-leading-bid" "selling-methods/remove-leading-bid.html"
download_page "$BASE_URL/selling-methods/retrieve-estimated-success-fees-for-selling-an-item" "selling-methods/retrieve-estimated-success-fees-for-selling-an-item.html"
download_page "$BASE_URL/selling-methods/retrieve-fees-for-editing-an-item" "selling-methods/retrieve-fees-for-editing-an-item.html"
download_page "$BASE_URL/selling-methods/retrieve-fees-for-listing-an-item" "selling-methods/retrieve-fees-for-listing-an-item.html"
download_page "$BASE_URL/selling-methods/retrieve-fees-for-relisting-an-item-with-edits" "selling-methods/retrieve-fees-for-relisting-an-item-with-edits.html"
download_page "$BASE_URL/selling-methods/retrieve-fees-for-relisting-an-item" "selling-methods/retrieve-fees-for-relisting-an-item.html"
download_page "$BASE_URL/selling-methods/retrieve-fees-for-withdrawing-a-listing" "selling-methods/retrieve-fees-for-withdrawing-a-listing.html"
download_page "$BASE_URL/selling-methods/retrieve-member-selling-preferences" "selling-methods/retrieve-member-selling-preferences.html"
download_page "$BASE_URL/selling-methods/retrieve-the-details-of-a-single-listing" "selling-methods/retrieve-the-details-of-a-single-listing.html"
download_page "$BASE_URL/selling-methods/sell-similar-from-an-existing-auction-or-classified" "selling-methods/sell-similar-from-an-existing-auction-or-classified.html"
download_page "$BASE_URL/selling-methods/update-a-draft-listing" "selling-methods/update-a-draft-listing.html"
download_page "$BASE_URL/selling-methods/update-member-selling-preferences" "selling-methods/update-member-selling-preferences.html"
download_page "$BASE_URL/selling-methods/validate-a-listing-request" "selling-methods/validate-a-listing-request.html"
download_page "$BASE_URL/selling-methods/withdraw-an-auction-or-classified" "selling-methods/withdraw-an-auction-or-classified.html"

# SEO METHODS FOR DYNAMIC PAGES DIRECTORY (1 endpoints)
download_page "$BASE_URL/seo-methods-for-dynamic-pages-directory/retrieves-jobs-dynamic-pages-directory" "seo-methods-for-dynamic-pages-directory/retrieves-jobs-dynamic-pages-directory.html"

# SEO METHODS FOR INTERNAL LINKING (4 endpoints)
download_page "$BASE_URL/seo-methods-for-internal-linking/motors-search-seo-links" "seo-methods-for-internal-linking/motors-search-seo-links.html"
download_page "$BASE_URL/seo-methods-for-internal-linking/property-search-seo-links" "seo-methods-for-internal-linking/property-search-seo-links.html"
download_page "$BASE_URL/seo-methods-for-internal-linking/retrieves-internal-links-for-the-motors-homepage" "seo-methods-for-internal-linking/retrieves-internal-links-for-the-motors-homepage.html"
download_page "$BASE_URL/seo-methods-for-internal-linking/retrieves-internal-links-for-the-property-homepage" "seo-methods-for-internal-linking/retrieves-internal-links-for-the-property-homepage.html"

# SEO METHODS FOR LANDING PAGE CONTENT (4 endpoints)
download_page "$BASE_URL/seo-methods-for-landing-page-content/retrieves-landing-page-internal-links-and-seo-content-for-jobs" "seo-methods-for-landing-page-content/retrieves-landing-page-internal-links-and-seo-content-for-jobs.html"
download_page "$BASE_URL/seo-methods-for-landing-page-content/retrieves-landing-page-internal-links-and-seo-content-for-marketplace" "seo-methods-for-landing-page-content/retrieves-landing-page-internal-links-and-seo-content-for-marketplace.html"
download_page "$BASE_URL/seo-methods-for-landing-page-content/retrieves-landing-page-internal-links-and-seo-content-for-motors" "seo-methods-for-landing-page-content/retrieves-landing-page-internal-links-and-seo-content-for-motors.html"
download_page "$BASE_URL/seo-methods-for-landing-page-content/retrieves-landing-page-internal-links-and-seo-content-for-property" "seo-methods-for-landing-page-content/retrieves-landing-page-internal-links-and-seo-content-for-property.html"

# SEO METHODS FOR MENU LINKS (1 endpoints)
download_page "$BASE_URL/seo-methods-for-menu-links/retrieves-menu-links-for-job-homepage" "seo-methods-for-menu-links/retrieves-menu-links-for-job-homepage.html"

# SHIPPING METHODS (7 endpoints)
download_page "$BASE_URL/shipping-methods/add-a-shipping-template-and-related-options" "shipping-methods/add-a-shipping-template-and-related-options.html"
download_page "$BASE_URL/shipping-methods/get-a-list-of-shipping-carrier-products" "shipping-methods/get-a-list-of-shipping-carrier-products.html"
download_page "$BASE_URL/shipping-methods/get-a-list-of-shipping-carriers" "shipping-methods/get-a-list-of-shipping-carriers.html"
download_page "$BASE_URL/shipping-methods/get-a-list-of-shipping-regions" "shipping-methods/get-a-list-of-shipping-regions.html"
download_page "$BASE_URL/shipping-methods/get-a-shipping-template-by-id" "shipping-methods/get-a-shipping-template-by-id.html"
download_page "$BASE_URL/shipping-methods/get-my-shipping-templates" "shipping-methods/get-my-shipping-templates.html"
download_page "$BASE_URL/shipping-methods/update-a-shipping-template" "shipping-methods/update-a-shipping-template.html"

# SUBURB SEARCH METHODS (2 endpoints)
download_page "$BASE_URL/suburb-search-methods/get-all-suburbs-details" "suburb-search-methods/get-all-suburbs-details.html"
download_page "$BASE_URL/suburb-search-methods/get-suburb-details-based-on-cityname-and-suburbname" "suburb-search-methods/get-suburb-details-based-on-cityname-and-suburbname.html"

echo ""
echo "Download complete!"
echo "Files saved to: $OUTPUT_DIR"
echo ""