describe('Jungle add carts', () => {
  beforeEach(() => {
    cy.visit('/')
  });

  it("Clicking add cart should increase cart size by 1", () => {
    cy.contains("Add")
      .first()
      .click({force:true});
      
    cy.contains("My Cart (1)");
  });
})

