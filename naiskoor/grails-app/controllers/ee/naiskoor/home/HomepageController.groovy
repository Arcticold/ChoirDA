package ee.naiskoor.home

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_DEVELOPER'])
class HomepageController {
	
    def index() {
    }
}
