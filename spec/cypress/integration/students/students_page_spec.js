describe('The Students Page', () => {
    before(() => {
        cy.app('clean')
        cy.appFactories([
            ['create_list', 'demo_student', 30]
        ])
    })

    it('successfully loads', () => {
        cy.visit('/students')
    })

    it('has a title containing Students', () => {
        cy.get('h1').contains('Students')
    })

    it('deletes a student', () => {
        cy.get('a[aria-label=Destroy]').first().click()
    })
})
