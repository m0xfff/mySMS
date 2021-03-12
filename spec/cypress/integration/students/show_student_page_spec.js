describe('The Show Student Page', () => {
    before(() => {
        cy.app('clean')
        cy.appFactories([
            ['create', 'demo_student', { first_name: 'Matthew', last_name: 'White' }]
        ])
    })

    it('successfully loads', () => {
        cy.visit('/students/1')
    })
})
