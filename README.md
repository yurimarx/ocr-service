## InterSystems IRIS Interoperability OCR Service
This is an InterSystems IRIS Interoperability OCR Service to extract text from images and pdfs from a file into a multipart request from form or http request.

## What The the service does

This application receive a http multipart request with a file, extract text using OCR from Tesseract and returns the result  

## Prerequisites
Make sure you have [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and [Docker desktop](https://www.docker.com/products/docker-desktop) installed.


## Installation: Docker
Clone/git pull the repo into any local directory

```
$ git clone https://github.com/yurimarx/ocr-service.git
```

Open the terminal in this directory and run:

```
$ docker-compose build
```

3. Run the IRIS container with your project:

```
$ docker-compose up -d
```

## OCR working:
<img src="https://github.com/yurimarx/ocr-service/raw/master/ocrgif.gif" alt="OCR in Action">

## OCR and NLP working together:
<img src="https://github.com/yurimarx/ocr-service/raw/master/nlp2.gif" alt="OCR and NLP in Action">

## How to Run the Ocr Production

1. Open the [production](http://localhost:52773/csp/irisapp/EnsPortal.ProductionConfig.zen?PRODUCTION=dc.ocr.OcrProduction) 

2. Set host destination folder to the uploaded files. See:

<img src="https://github.com/yurimarx/upload-adapter/raw/main/folder.png" alt="folder">

3. Start the production.

4. Now Open Postman or create a multipart request into a form pointing to localhost:9980/ using POST with a form-data file attribute. See sample (use an image or pdf with image inside):
<img src="https://github.com/yurimarx/ocr-service/raw/master/postman.png" alt="postman">

5. See the text returned - support to english and portuguese languages only, in the first version

6. Send 2 or 3 files with some text

7. Go to the [NLP Domain Explorer](http://localhost:52773/csp/IRISAPP/_iKnow.UI.KnowledgePortal.zen?$NAMESPACE=IRISAPP&domain=1)

8. Analyze the texts and enjoy!