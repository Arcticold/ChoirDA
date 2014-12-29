package ee.naiskoor.ftp

import grails.transaction.Transactional
import javax.websocket.Session

import com.toastcoders.jschssh.RunSshCommand
import com.toastcoders.jschssh.ScpFileTo
import com.toastcoders.jschssh.ScpFileFrom


@Transactional
class FtpService 
{
/*
    def serviceMethod() 
	{

    }
	
	def save(InputStream inputStream, String fileName, FtpCredential ftpCredential) {
        connect(ftpCredential) { ChannelSftp sftp ->
            sftp.put inputStream, fileName
        }
    }
 
    def load(String fileName, FtpCredential ftpCredential) {
        connect(ftpCredential, { ChannelSftp sftp ->
            File outputFile = File.createTempFile(fileName,'')
            outputFile?.newOutputStream() << sftp.get(fileName)
            outputFile
        }, false)
    }
 
    def delete(String fileName, FtpCredential ftpCredential) throws Throwable {
        connect(ftpCredential) { ChannelSftp sftp ->
            sftp.rm fileName
        }
    }
 
    def makeDir(String directoryName, FtpCredential ftpCredential) {
        connect(ftpCredential) { ChannelSftp sftp ->
            sftp.mkdir directoryName
        }
    }
 
    private def connect(FtpCredential ftpCredential, Closure c, boolean disconnectOnFinish = true) {
        Session session = null
        ChannelSftp sftp = null
        try {
            JSch jSch = new JSch()
            session = jSch.getSession username, ftpCredential?.server, ftpCredential?.port
            session.setConfig "StrictHostKeyChecking", "no"
            File keyFile = new File("${grailsApplication.config.pathToKeyFile}")
            if (ftpCredential?.password) {
                session.password = ftpCredential?.password
            } else {
                jSch.addIdentity(keyFile?.absolutePath)
            }
            session.connect()
            Channel sFtpChannel = session.openChannel "sftp"
            sFtpChannel.connect()
            sftp = sFtpChannel as ChannelSftp
            sftp.cd ftpCredential?.remoteBaseDir
            c.call sftp
        } catch (Exception ex) {
            ex.printStackTrace()
        } finally {
            if (disconnectOnFinish) {
                sftp?.exit()
                session?.disconnect()
            }
        }
    }
	
	*/
}

