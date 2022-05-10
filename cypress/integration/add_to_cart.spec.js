describe("jungle", () => {
  beforeEach(() => {
    cy.visit("http://localhost:3000/");
  });

  it("if clicking on 'add to cart' adds items to cart", () => {
    cy.get(".btn").contains("Add").first().click({ force: true });

    cy.visit("http://localhost:3000/cart");

    cy.contains("My Cart (1)");
  });
});
