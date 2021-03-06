Class dc.ocr.OcrService Extends Ens.BusinessService
{

// extends Ens.BusinessService to create a custom Business service using Object Script

// This class receive a file from a multipart http request and save to the folder configured into folder parameter

// choose an adapter to get data from a source of data

// HTTP.InboundAdapter allows you get data from an http request

Parameter ADAPTER = "EnsLib.HTTP.InboundAdapter";

// custom parameter to allows production user set destination folder to multipart file uploaded 

Property Folder As %String(MAXLEN = 100);

// when you set parameter Folder to SETTINGS parameter, the production IRIS interface create a field to the user fills

// so the user will inform host path for the uploaded file 

Parameter SETTINGS = "Folder,Basic";

// This method is mandatory to have a business service. It receives the multipart file into pInput 

// and returns a result to the caller using pOutput

Method OnProcessInput(pInput As %GlobalBinaryStream, pOutput As %RegisteredObject) As %Status
{
    //try to do the actions
    try {
        
        Set reader = ##class(%Net.MIMEReader).%New() //creates a MIMEReader to extract files from multipart requests 
        Do reader.OpenStream(pInput) //reader open the file

        Set tSC = reader.ReadMIMEMessage(.message) //the reader put the file uploaded into a MIME Message
        //Get Header obtains headers from the request and the multipart file, like content-type or content disposition
        //the content disposition have 3 headers: Content-Disposition: form-data; name="file"; filename="filename.ext"
        //This split content-disposition header into 3 parts
        Set filenameHeader = $PIECE(message.GetHeader("CONTENT-DISPOSITION", .header),";",3) 
        //get filename header value
        Set filename = $EXTRACT(filenameHeader, 12, $LENGTH(filenameHeader)-1)
        //Headers are not more needed. It clean the header to remains only the file content to be saved
        Do message.ClearHeaders()

        //create a file object to save the multipart file
        Set file=##class(%Stream.FileBinary).%New()
        //points the file to folder informed into folder parameter, plus upload filename from header
        Set file.Filename=..Folder_filename
        
        //save body message (the file content) to file object
        Set tSC = file.CopyFromAndSave(message.Body)  

        // Connect a Gateway instance to server JavaGateway on the host machine, if you do not want use pex
        //set GW = ##class(%Net.Remote.Gateway).%New()
        //set st = GW.%Connect("127.0.0.1", "55555", "IRISAPP",,)
        //instantiate java ocr class, if you do not want use pex
        //set proxyOcr = ##class(%Net.Remote.Object).%New(GW,"community.intersystems.pex.ocr.OcrOperation")
        //returns to the service
        //set pResponse = proxyOcr.doOcr(file.Filename)
        
        //call ocr method to get text from image, if you want to use pex
        Set pRequest = ##class(dc.ocr.OcrRequest).%New()
        Set pRequest.FileName = ..Folder_filename
        
        //set the filename and ocr text to send to nlp index
        Set pNLPRequest = ##class(dc.ocr.NLPRequest).%New()
        Set pNLPRequest.FileName = ..Folder_filename
        
        // call java pex operation to do ocr, passing file into pRequest and receive ocr text with pResponse
        Set tSC = ..SendRequestSync("OcrOperation", pRequest, .pOcrResponse, 1200)
        
        // call nlp operation to do nlp index to the domain, passing ocr text
        Set pNLPRequest.Text = pOcrResponse.StringValue
        Set tSC =  ..SendRequestSync("NLPOperation", pNLPRequest, .pResponse, 1200)
        
        //returns to the service
        Set pOutput = pOcrResponse.StringValue

        Return tSC

    //returns error message to the user
    } catch e {
        Set tSC=e.AsStatus()
        Return tSC
    }

    Quit tSC
}

}
