
import ee.naiskoor.auth.*

class BootStrap {

    def springSecurityService

    def init = { servletContext ->

        //comment this out, if you want to build with a production environment
        //localData()

    	}
    def destroy = {
    }

    // Creates data neede to test the functionality locally.
    def localData(){
        // Create Roles and users.
        def devRole = Role.findOrSaveWhere(authority: 'ROLE_DEVELOPER').save()
        def adminRole = Role.findOrSaveWhere(authority: 'ROLE_ADMIN').save()
        def user = User.findOrSaveWhere(username: 'dev', password: 'dev', enabled: true)
        def adminUser = User.findOrSaveWhere(username: 'admin', password: 'admin', enabled: true)
        
        // Make the connection between a user and a role.
        if (!user.authorities.contains('ROLE_DEVELOPER')) {
         UserRole.create(user, devRole, true)
        }

        if (!adminUser.authorities.contains('ROLE_ADMIN')) {
         UserRole.create(adminUser, adminRole, true)
        }

        // if (!adminUser.authorities.contains('ROLE_DEVELOPER')) {
        //  UserRole.create(adminUser, devRole, true)
        // }
    }
}
