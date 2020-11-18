Class dc.ocr.OcrNLP Extends %iKnow.DomainDefinition [ ProcedureBlock ]
{

XData Domain [ XMLNamespace = "http://www.intersystems.com/iknow" ]
{
<domain name="OcrNLP" disabled="false" allowCustomUpdates="true">
<parameter name="DefaultConfig" value="OcrNLP.Configuration" isList="false" />
<data dropBeforeBuild="true">
<table listname="OcrNLPTable" batchMode="true" disabled="false" listerClass="%iKnow.Source.SQL.Lister" tableName="dc_ocr.OcrTable" idField="ID" groupField="ID" dataFields="OcrText" metadataColumns="FileName" metadataFields="filename" />
</data>
<matching disabled="false" dropBeforeBuild="true" autoExecute="true" ignoreDictionaryErrors="true" />
<metadata>
<field name="filename" operators="=" dataType="STRING" storage="0" caseSensitive="false" disabled="false" />
</metadata>
<configuration name="OcrNLP.Configuration" detectLanguage="true" languages="en,pt" userDictionary="OcrNLP.Dictionary#1" summarize="true" maxConceptLength="0" />
<userDictionary name="OcrNLP.Dictionary#1" />
</domain>
}

}
