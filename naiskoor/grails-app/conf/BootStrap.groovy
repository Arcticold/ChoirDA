
import ee.naiskoor.auth.*

class BootStrap {

    def init = { servletContext ->

    	// Developer user
    	def devRole = Role.findOrSaveWhere(authority: 'ROLE_DEVELOPER')
    	def adminRole = Role.findOrSaveWhere(authority: 'ROLE_ADMIN')
    	def user = User.findOrSaveWhere(username: 'dev', password: 'dev', firstName: 'developer', lastName: 'developer', roleInChoir: 'Bass', eMail: 'dev@naiskoor.ee')
    	def adminUser = User.findOrSaveWhere(username: 'admin', password: 'admin', firstName: 'admin', lastName: 'admin', roleInChoir: 'Soprano', eMail: 'admin@naiskoor.ee')
    	
    	if (!user.authorities.contains('ROLE_DEVELOPER')) {
    		UserRole.create(user, devRole)

    	}

    	if (!adminUser.authorities.contains('ROLE_ADMIN')) {
    		UserRole.create(adminUser, adminRole)
    	}

    	if (!adminUser.authorities.contains('ROLE_DEVELOPER')) {
    		UserRole.create(adminUser, devRole)
    	}

    	}
    def destroy = {
    }
}
