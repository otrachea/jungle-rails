describe("jungle", () => {
  beforeEach(() => {
    cy.visit("http://localhost:3000/");
    cy.get(".products article").first().click();
  });

  it("visits the product after clicking on it", () => {
    cy.get("section.products-show");
  });
});
