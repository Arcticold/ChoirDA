package ee.naiskoor.upload

import com.jcraft.jsch.JSchException
import com.toastcoders.jschssh.RunSshCommand
import com.toastcoders.jschssh.ScpFileTo
import com.toastcoders.jschssh.ScpFileFrom

class UploadController {

    def index() {	}
	
	def readContents() 
	{
		String s = new RunSshCommand().execute() {
			host = params.ServerAddress
			username = params.Username
			password = params.Password
			command = "ls -m"
			}
		
		String[] token = new String[20]
		token = s.split(",")
		//render view:'readRemoteFile.gsp', model:['i':token]
		return [lsOut:token]
	}
	
	def downloadFile()
	{
		new ScpFileFrom().execute() {
			
		}
	}
	
	def dataStore() // gets user inserted data
	{
		String serverAddress = params.ServerAddress
		String id = params.Username
		String pwd = params.Password
		//readRemoteFile(id, pwd, serverAddress)
	}
}
