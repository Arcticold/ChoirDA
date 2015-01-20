package ee.naiskoor.note

import ee.naiskoor.status.Status
import ee.naiskoor.auth.User

class NoteController {
	
	def springSecurityService

    def index() {
	}
	
	def updateStatus()
	{
		//def status = new Status(message: params.message)
		//status.author = lookupPerson()
		//status.save()
		//def messages = currentUserTimeline()
		
		def message = params.message
		
		return ["note": message]
	}
	
//	def currentUserTimeline() 
//	{
//		def messages = Status.withCriteria	{
//			author { eq 'username', lookupPerson()}
//			maxResults 10
//			order 'dateCreated', 'desc'
//		}
//		messages
//	}
	
//	private lookupPerson()
//	{
//		User.get(springSecurityService.principal.id)
//	}
}
