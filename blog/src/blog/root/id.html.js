var Event = YAHOO.util.Event,
    Dom = YAHOO.util.Dom,
    Connect = YAHOO.util.Connect;

var cbutton = new YAHOO.widget.Button("comment_submit"); 

Event.addListener("comment_form", "submit", function(e) {
    Event.stopEvent(e);

    var body = encodeURIComponent(Dom.get("comment_body").value);
    var parent_id = encodeURIComponent("{{article.id}}");
    var recaptcha_challenge_field = Dom.get("recaptcha_challenge_field").value;
    var recaptcha_response_field = Dom.get("recaptcha_response_field").value;
    
    Connect.asyncRequest(
        "POST", 
        "/comments", 
        {
            success: function(o) {
                Dom.get("comments").innerHTML += o.responseText;
                Dom.get("comment_body").value = "";
                Recaptcha.reload();
            },
            failure: function(o) {
            }
        }, 
        "body=" + body + "&parent_id=" + parent_id + "&recaptcha_challenge_field=" + recaptcha_challenge_field + "&recaptcha_response_field=" + recaptcha_response_field
    );    
});

if (user.level < 2) {
    Dom.setStyle("captcha", "display", "block");
}

/*
var resize = new YAHOO.util.Resize("resize_comment_body", { 
    handles: ["b"],  
    minHeight: 64
});
*/


var em = Dom.get("emoticons");
em.innerHTML = emoticonExpand(em.innerHTML);
