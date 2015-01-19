package ee.naiskoor.document

import org.codehaus.groovy.grails.web.context.ServletContextHolder
import grails.util.GrailsUtil

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DocumentController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Document.list(params), model:[documentInstanceCount: Document.count()]
    }

    def show(Document documentInstance) {
        respond documentInstance
    }

    def create() {
        respond new Document(params)
    }

    @Transactional
    def save(Document documentInstance) {
        if (documentInstance == null) {
            notFound()
            return
        }

        if (documentInstance.hasErrors()) {
            respond documentInstance.errors, view:'create'
            return
        }

        def file = request.getFile('file')
        if(file.empty) {
            flash.message = "File cannot be empty"
        }
        else {
            String storagePath = ""

            if (GrailsUtil.environment == "production") {
              storagePath = "/opt/assets"

            }
            else {
              def servletContext = ServletContextHolder.servletContext
              storagePath = servletContext.getRealPath("/WEB-INF/uploads/")
            }

            documentInstance.fullPath = storagePath + "/" + documentInstance.filename
            file.transferTo(new File(documentInstance.fullPath))
            documentInstance.save flush:true    
        }


        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'document.label', default: 'Document'), documentInstance.id])
                redirect documentInstance
            }
            '*' { respond documentInstance, [status: CREATED] }
        }

        // redirect (action:'list')

    }

    def upload() {
        def file = request.getFile('file')
        if(file.empty) {
            flash.message = "File cannot be empty"
        }

        else {
            def documentInstance = new Document()
            documentInstance.filename = file.originalFilename
            documentInstance.fullPath = grailsApplication.config.uploadFolder + documentInstance.filename
            file.transferTo(new File(documentInstance.fullPath))
            documentInstance.save()
        }
        redirect (action:'list')
    }

    def download(long id) {
        Document documentInstance = Document.get(id)
        if ( documentInstance == null) {
            flash.message = "Document not found."
            redirect (action:'list')
        } else {
            response.setContentType("APPLICATION/OCTET-STREAM")
            response.setHeader("Content-Disposition", "Attachment;Filename=\"${documentInstance.filename}\"")
            def file = new File(documentInstance.fullPath)
            def fileInputStream = new FileInputStream(file)
            def outputStream = response.getOutputStream()
            byte[] buffer = new byte[4096];
            int len;
            while ((len = fileInputStream.read(buffer)) > 0) {
                outputStream.write(buffer, 0, len);
            }
            outputStream.flush()
            outputStream.close()
            fileInputStream.close()
        }
    }

    def edit(Document documentInstance) {
        respond documentInstance
    }

    @Transactional
    def update(Document documentInstance) {
        if (documentInstance == null) {
            notFound()
            return
        }

        if (documentInstance.hasErrors()) {
            respond documentInstance.errors, view:'edit'
            return
        }

        documentInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Document.label', default: 'Document'), documentInstance.id])
                redirect documentInstance
            }
            '*'{ respond documentInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Document documentInstance) {

        if (documentInstance == null) {
            notFound()
            return
        }

        documentInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Document.label', default: 'Document'), documentInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'document.label', default: 'Document'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
