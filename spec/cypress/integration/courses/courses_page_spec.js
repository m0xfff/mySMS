describe('The Courses Page', () => {
    before(() => {
        cy.app('clean')
        cy.appFactories([
            ['create_list', 'course', 30]
        ])
    })

    it('successfully loads', () => {
        cy.visit('/courses')
    })

    it('has a title containing 📚', () => {
        cy.get('h1').contains('📚')
    })

    it('has a table with 20 rows', () => {
        cy.get('table').find('tr').then( rows => {
            expect(rows).to.have.lengthOf(21)
        })
    })
})
