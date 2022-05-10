describe("jungle", () => {
  it.skip("user can signup for an account", () => {
    cy.visit("http://localhost:3000/signup");

    cy.get("#user_first_name").type("Bob");
    cy.get("#user_last_name").type("Smith");
    cy.get("#user_email").type("test1@example.com");
    cy.get("#user_password").type("p@55word");
    cy.get("#user_password_confirmation").type("p@55word");

    cy.get(".btn").contains("Submit").first().click({ force: true });

    cy.url().should("eq", "http://localhost:3000/");
  });

  it.skip("user can logout", () => {
    cy.visit("http://localhost:3000/logout");
    cy.url().should("eq", "http://localhost:3000/login");
  })

  it("user can login", () => {
    cy.visit("http://localhost:3000/login");

    cy.get("#email").type("test1@example.com");
    cy.get("#password").type("p@55word");

    cy.get(".btn").contains("Submit").first().click({ force: true });

    cy.url().should("eq", "http://localhost:3000/");
  });

  
});
