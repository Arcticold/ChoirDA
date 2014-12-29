package ee.naiskoor.ftp

import com.toastcoders.jschssh.ScpFileTo
import com.toastcoders.jschssh.ScpFileFrom
import com.toastcoders.jschssh.RunSshCommand


import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(FtpController)
class FtpControllerSpec extends Specification {

	def setup() 
	{
		
	}

	def cleanup() {
	}

	void "test something"() 
	{
		when: 
		controller.index()
		
		then:
		new ScpFileTo().execute()
		{
			host = "adalberg.ut.ee"
			username = ""
			password = ""
			localFile = "D:\\Programmid.txt"
			remoteFile = "test/Programmid.txt"
			strictHostKeyChecking = "no" // host must be provided somewhere in known_hosts file, else the host key is rejected. Setting "no" to bypass this during testing
		}
	}
}