package ee.naiskoor.status

import ee.naiskoor.auth.User

class Status {
	
	String message
	User author
	Date dateCreated

    static constraints = {
    }
}
