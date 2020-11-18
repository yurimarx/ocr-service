Class dc.ocr.OcrProduction Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="dc.ocr.OcrProduction" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="OcrService" Category="" ClassName="dc.ocr.OcrService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule=""> 
  </Item>
  <Item Name="JavaGateway" Category="" ClassName="EnsLib.JavaGateway.Service" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="ClassPath">.:/usr/irissys/dev/java/lib/JDK18/*:/opt/irisapp/*:/usr/irissys/dev/java/lib/gson/*:/usr/irissys/dev/java/lib/jackson/*:/jgw/ocr-pex-1.0.0.jar</Setting> 
    <Setting Target="Host" Name="JavaHome">/usr/lib/jvm/java-8-openjdk-amd64/</Setting> 
  </Item> 
  <Item Name="OcrOperation" Category="" ClassName="EnsLib.PEX.BusinessOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule=""> 
    <Setting Target="Host" Name="%gatewayPort">55555</Setting> 
    <Setting Target="Host" Name="%remoteClassname">community.intersystems.pex.ocr.OcrOperation</Setting> 
    <Setting Target="Host" Name="%gatewayExtraClasspaths">.:/usr/irissys/dev/java/lib/JDK18/*:/opt/irisapp/*:/usr/irissys/dev/java/lib/gson/*:/usr/irissys/dev/java/lib/jackson/*:/jgw/ocr-pex-1.0.0.jar</Setting> 
  </Item> 
</Production>
}

}
