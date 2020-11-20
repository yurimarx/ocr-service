Class dc.ocr.NLPRequest Extends Ens.Request
{

Property FileName As %String;

Property Text As %VarString;

Storage Default
{
<Data name="NLPRequestDefaultData">
<Subscript>"NLPRequest"</Subscript>
<Value name="1">
<Value>FileName</Value>
</Value>
<Value name="2">
<Value>Text</Value>
</Value>
</Data>
<DefaultData>NLPRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
