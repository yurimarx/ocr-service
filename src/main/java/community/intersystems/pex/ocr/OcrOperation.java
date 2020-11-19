package community.intersystems.pex.ocr;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

import javax.imageio.ImageIO;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.rendering.ImageType;
import org.apache.pdfbox.rendering.PDFRenderer;

import com.intersystems.enslib.pex.BusinessOperation;
import com.intersystems.gateway.GatewayContext;
import com.intersystems.jdbc.IRIS;
import com.intersystems.jdbc.IRISObject;

import net.sourceforge.tess4j.ITesseract;
import net.sourceforge.tess4j.Tesseract;
import net.sourceforge.tess4j.TesseractException;

public class OcrOperation extends BusinessOperation {

	// Connection to InterSystems IRIS
    private IRIS iris;

	@Override
	public void OnInit() throws Exception {
		iris = GatewayContext.getIRIS();
	}
	
	@Override
	public Object OnMessage(Object request) throws Exception {
		IRISObject req = (IRISObject) request;
		String filePath = req.getString("FileName");
		String ocrText = doOcr(filePath);
		IRISObject response = (IRISObject)(iris.classMethodObject("Ens.StringContainer","%New",ocrText));
        return response;
	}
	
	public String doOcr(String filePath) {

		File tempFile = new File(filePath);

		String ocrText = "";

		try {
			
			if (tempFile.toString().contains(".pdf")) {
				ocrText = extractTextFromPDF(tempFile);
			} else {
				ocrText = extractTextFromImage(tempFile);
			}

			return ocrText;

		} catch (IllegalStateException | IOException | TesseractException e) {
			return e.getMessage();
		}

	}

	private String extractTextFromPDF(File tempFile) throws IOException, TesseractException {

		String ocrText = "";

		// Load file into PDFBox class
		PDDocument document;
		document = PDDocument.load(tempFile);

		// Extract images from file
		PDFRenderer pdfRenderer = new PDFRenderer(document);
		StringBuilder out = new StringBuilder();

		ITesseract tesseract = new Tesseract();
		tesseract.setDatapath("/usr/share/tessdata/"); //directory to trained models 
		tesseract.setLanguage("por"); // choose your language/trained model

		for (int page = 0; page < document.getNumberOfPages(); page++) {
			BufferedImage bim = pdfRenderer.renderImageWithDPI(page, 300, ImageType.RGB);

			// Create a temp image file
			File temp = File.createTempFile("tempfile_" + page, ".png");
			ImageIO.write(bim, "png", temp);
 
			String result = tesseract.doOCR(temp);
			out.append(result);

			// Delete temp file
			Files.delete(temp.toPath());

			ocrText = out.toString();
		}

		return ocrText;

	}

	private String extractTextFromImage(File tempFile) throws TesseractException {

		ITesseract tesseract = new Tesseract();
		tesseract.setDatapath("/usr/share/tessdata/"); //directory to trained models
		tesseract.setLanguage("eng+por"); // choose your language/trained model

		return tesseract.doOCR(tempFile); //call tesseract function doOCR() 
										  //passing the file to be processed with OCR technique

	}

	@Override
	public void OnTearDown() throws Exception {
		// TODO Auto-generated method stub
		
	}

}
