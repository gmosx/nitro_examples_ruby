var Dom = YAHOO.util.Dom;
var Event = YAHOO.util.Event;

/*
var editor = new YAHOO.widget.Editor("body", { 
    handleSubmit: true
    // dompath: true, // Turns on the bar at the bottom 
    // animate: true // Animates the opening, closing and moving of Editor windows 
}); 
*/

var bodyEditor = new YAHOO.widget.Editor("body", {
    handleSubmit: true,
    animate: true,
    dompath: false,
    toolbar: {
        buttons: [
            { group: "textstyle", label: "Font Style", buttons: [
                { type: "push", label: "Bold (Ctrl Shift B)", value: "bold"},
                { type: "push", label: "Italic (Ctrl Shift I)", value: "italic"},
                { type: "push", label: "Underline (Ctrl Shift U)", value: "underline"},
                { type: "separator"},
                { type: "push", label: "Remove Formatting", value: "removeformat"},
                { type: "push", label: "Show hidden elements", value: "hiddenelements"}
            ]},
            { type: "separator"},
            { type: "separator"},
            { group: "lists", label: "Lists", buttons: [
                {type: "push",label: "Unordered List", value: "insertunorderedlist"},
                {type: "push", label: "Ordered List", value: "insertorderedlist"}
            ]},
            { type: "separator"},
            { type: "separator"},
            { group: "insert", label: "Insert Item", buttons:[
                { type: "push", label: "Insert Link (Ctrl Shift L)", value: "createlink"},
                { type: "push", label: "Insert Picture", value: "insertimage"}
            ]}
        ]
    }
});
bodyEditor.render();


Event.addListener("toggle-summary", "click", function(e) {
    var summaryEditor = new YAHOO.widget.Editor("summary", {
        handleSubmit: true,
        animate: true,
        dompath: false,
        toolbar: {
            buttons: [
                { group: "textstyle", label: "Font Style", buttons: [
                    { type: "push", label: "Bold (Ctrl Shift B)", value: "bold"},
                    { type: "push", label: "Italic (Ctrl Shift I)", value: "italic"},
                    { type: "push", label: "Underline (Ctrl Shift U)", value: "underline"},
                    { type: "separator"},
                    { type: "push", label: "Remove Formatting", value: "removeformat"},
                    { type: "push", label: "Show hidden elements", value: "hiddenelements"}
                ]},
                { type: "separator"},
                { type: "separator"},
                { group: "lists", label: "Lists", buttons: [
                    {type: "push",label: "Unordered List", value: "insertunorderedlist"},
                    {type: "push", label: "Ordered List", value: "insertorderedlist"}
                ]},
                { type: "separator"},
                { type: "separator"},
                { group: "insert", label: "Insert Item", buttons:[
                    { type: "push", label: "Insert Link (Ctrl Shift L)", value: "createlink"},
                    { type: "push", label: "Insert Picture", value: "insertimage"}
                ]}
            ]
        }
    });
    summaryEditor.render();

    Event.stopEvent(e);
});

var button;
button = new YAHOO.widget.Button("save-button");
button = new YAHOO.widget.Button("draft-button");

/*
var resize = new YAHOO.util.Resize("body", { 
    handles: ["b"],  
    minHeight: 100
});
*/

/*
var ds = new YAHOO.widget.DS_XHR("/tags/auto_complete", ["\n", "\t"]);
ds.responseType = YAHOO.widget.DS_XHR.TYPE_FLAT;
ds.maxCacheEntries = 60;
ds.queryMatchSubset = true;

var ac = new YAHOO.widget.AutoComplete("raw_tagstring", "raw_tagstring_autocomplete", ds);
ac.prehighlightClassName = "yui-ac-prehighlight";
ac.typeAhead = true;
ac.useShadow = true;
ac.minQueryLength = 0;
ac.delimChar = ",";
ac.textboxFocusEvent.subscribe(function(){
    var input = YAHOO.util.Dom.get("raw_tagstring").value;
    if(input.length === 0) {
        var self = this;
        setTimeout(function(){ self.sendQuery(input); }, 0);
    }
});
*/
