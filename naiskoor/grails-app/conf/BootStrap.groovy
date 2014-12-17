
import ee.naiskoor.auth.*

class BootStrap {

    def init = { servletContext ->

    	// Developer user
    	def devRole = Role.findOrSaveWhere(authority: 'ROLE_DEVELOPER')
    	def adminRole = Role.findOrSaveWhere(authority: 'ROLE_ADMIN')
    	def user = User.findOrSaveWhere(username: 'dev', password: 'dev', enabled: 'true', accountExpired: 'false', accountLocked: 'false', passwordExpired: 'false', firstName: 'developer', lastName: 'developer', roleInChoir: 'Bass', eMail: 'dev@naiskoor.ee')
        user.save(flush: 'true')
    	def adminUser = User.findOrSaveWhere(username: 'admin', password: 'admin', enabled: 'true', accountExpired: 'false', accountLocked: 'false', passwordExpired: 'false',  firstName: 'admin', lastName: 'admin', roleInChoir: 'Soprano', eMail: 'admin@naiskoor.ee')
        adminUser.save(flush:'true')
    	
    	if (!user.authorities.contains('ROLE_DEVELOPER')) {
    		UserRole.create(user, devRole, true)

    	}

    	if (!adminUser.authorities.contains('ROLE_ADMIN')) {
    		UserRole.create(adminUser, adminRole, true)
    	}

    	if (!adminUser.authorities.contains('ROLE_DEVELOPER')) {
    		UserRole.create(adminUser, devRole, true)
    	}

    	}
    def destroy = {
    }
}
