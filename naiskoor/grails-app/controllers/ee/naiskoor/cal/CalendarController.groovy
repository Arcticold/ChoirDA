package ee.naiskoor.cal

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_DEVELOPER'])
class CalendarController {

    def index() { }
}
