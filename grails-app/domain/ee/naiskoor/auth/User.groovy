package ee.naiskoor.auth

class User {

	transient springSecurityService

	String username
	String password
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	// String firstName
	// String lastName
	// String roleInChoir // Soprano, ..., etc 
	// String eMail

	static transients = ['springSecurityService']

	static constraints = {
		username blank: false, unique: true
		password blank: false
		// firstName nullable: true
		// lastName nullable: true
		// roleInChoir nullable: true
		// eMail nullable: true
	}

	// static mapping = {
	// 	password column: '`password`'
	// 	table '`user`'
	// }

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}
}
