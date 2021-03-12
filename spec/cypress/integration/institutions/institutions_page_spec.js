describe('The Institutions Page', () => {
    before(() => {
        cy.app('clean')
        cy.appFactories([
            ['create_list', 'institute', 30]
        ])
    })

    it('successfully loads', () => {
        cy.visit('/institutes')
    })

    it('has a title containing Institutions', () => {
        cy.get('h1').contains('Institutes')
    })
})
