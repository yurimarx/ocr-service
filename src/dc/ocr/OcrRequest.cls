Class dc.ocr.OcrRequest Extends Ens.Request
{

Property FileName As %String(MAXLEN = 255) [ Required ];

Storage Default
{
<Data name="OcrRequestDefaultData">
<Subscript>"OcrRequest"</Subscript>
<Value name="1">
<Value>FileName</Value>
</Value>
<Value name="2">
<Value>Text</Value>
</Value>
</Data>
<DefaultData>OcrRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
