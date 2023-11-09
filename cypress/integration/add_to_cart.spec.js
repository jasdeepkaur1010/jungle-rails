describe('Add to Cart', () => {
  beforeEach(() => {
    // Visit the home page or adjust the URL as needed
    cy.visit('/');
  });

  it('should increase the cart count when adding a product', () => {
    // Get the initial cart count
    cy.get('.cart-count').invoke('text').as('initialCartCount');

    // Click the 'Add to Cart' button for a product
    cy.get('.add-to-cart-btn').first().click(); // Adjust the selector based on your 'Add to Cart' button

    // Validate that the cart count has increased
    cy.get('@initialCartCount').then((initialCount) => {
      cy.get('.cart-count').should('have.text', String(Number(initialCount) + 1));
    });
  });

});
