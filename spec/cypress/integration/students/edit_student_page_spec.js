describe('The Edit Student Page', () => {
    before(() => {
        cy.app('clean')
        cy.appFactories([
            ['create', 'demo_student']
        ])
    })

    it('successfully loads', () => {
        cy.visit('/students/1/edit')
    })
})
