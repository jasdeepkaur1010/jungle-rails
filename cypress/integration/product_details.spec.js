
describe('Product Details', () => {
  beforeEach(() => {
    // Visit the home page or adjust the URL as needed
    cy.visit('/');
  });

  it('should navigate to product details from home page', () => {
    // Find a product link and click on it
    cy.get('.product-link').first().click(); // Adjust the selector based on your product partial

    // Validate that the product details page is displayed
    cy.url().should('include', '/products/');
    cy.get('.product-details').should('exist'); // Adjust the selector based on your product details page
  });

});
