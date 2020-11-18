Class dc.ocr.OcrTable Extends %Persistent
{

Property FileName As %String;

Property OcrText As %VarString;

Storage Default
{
<Data name="OcrTableDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>FileName</Value>
</Value>
<Value name="3">
<Value>OcrText</Value>
</Value>
</Data>
<DataLocation>^dc.ocr.OcrTableD</DataLocation>
<DefaultData>OcrTableDefaultData</DefaultData>
<IdLocation>^dc.ocr.OcrTableD</IdLocation>
<IndexLocation>^dc.ocr.OcrTableI</IndexLocation>
<StreamLocation>^dc.ocr.OcrTableS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
