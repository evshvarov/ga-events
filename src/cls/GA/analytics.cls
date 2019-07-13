Class GA.Analytics
{

/// event - name of the GA event - usually 1st level of detalization
/// category - event category - 2nd level of detalization
/// label - event label - 3rd level of detalization
/// tid - id of Google Analytics account to send event to
ClassMethod SendEvent(tid As %String = "UA-101413258-1", event As %String, category As %String, label As %String) As %Status
{
    set req = ##class(%Net.HttpRequest).%New()
    set version="1.0"
    set req.Server = "www.google-analytics.com"
    do req.EntityBody.Write("v=1&tid="_tid_"&cid="_##class(%SYS.System).InstanceGUID()
        _"&ds=web&an=IRIS&av="_version
        _"&t=event&aiid="_$ZCONVERT($zv, "O", "URL")
        _"&ec="_$ZCONVERT(event, "O", "URL")
        _"&ea="_$ZCONVERT(category, "O", "URL")
        _"&el="_$ZCONVERT(label, "O", "URL")
        )
    try {
        return req.Post("/collect")
    } catch e {
        write "Unable to send analytics to " _ req.Server _ ", skipping analytics collection."
        return $$$OK
    }
}

}
