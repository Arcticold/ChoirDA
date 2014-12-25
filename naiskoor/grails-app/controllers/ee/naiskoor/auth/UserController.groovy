package ee.naiskoor.auth
import grails.plugin.springsecurity.annotation.Secured


class UserController {

    def index() { }

    @Secured(['ROLE_ADMIN'])
    def create() { }
}
