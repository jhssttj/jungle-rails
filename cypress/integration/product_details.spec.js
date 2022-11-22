
describe('Jungle home page', () => {
  beforeEach(() => {
    cy.visit('/')
  });

  it("Clicking on product page direct you to that page", () => {
    cy.contains("Scented Blade")
      .first()
      .click();
      
    cy.url().should('include', '/products/2')
  });

})

