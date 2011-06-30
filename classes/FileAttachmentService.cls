global class FileAttachmentService {

    webservice public static String createFileAttachment(string fileName, string fileContent)
    {
        //just grab the first account we find
        Id parentId;
        for (Account a : [SELECT Id FROM Account WHERE Name = 'Test' LIMIT 1]) {  
            parentId = a.id;
        }
        
        Attachment attach = new Attachment();
        attach.Body = Blob.valueOf(fileContent); 
        attach.Name = fileName;
        attach.IsPrivate = false;
        attach.ParentId = parentId;
        insert attach;
        
        return attach.Id;
    }   
}