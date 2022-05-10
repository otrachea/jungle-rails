describe("homepage", () => {
  beforeEach(() => {
    cy.visit("http://localhost:3000/");
  });

  it("visits the homepage by default", () => {
    cy.get(".intro").contains(
      "Looking for a way to add some life to your home? Look no further than our online plant shop! We have a wide variety of beautiful plants and flowers, as well as all the accessories you need to keep them healthy and happy. Plus, our prices are unbeatable! So what are you waiting for?"
    );
  });

  it("There are products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There are 12 products on the page", () => {
    cy.get(".products article").should("have.length", 12);
  });
});
