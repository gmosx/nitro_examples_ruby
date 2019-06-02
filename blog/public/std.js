// FIXME: add namespace.

// Base64 decoding.

var base64Decode = function(str) {
    var data = "";
    var chr1, chr2, chr3, enc1, enc2, enc3, enc4;
    var i = 0;

    // remove all characters that are not A-Z, a-z, 0-9, +, /, or =
    str = str.replace(/[^A-Za-z0-9\+\/\=]/g, "");

    keyStr = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";

    do {
        enc1 = keyStr.indexOf(str.charAt(i++));
        enc2 = keyStr.indexOf(str.charAt(i++));
        enc3 = keyStr.indexOf(str.charAt(i++));
        enc4 = keyStr.indexOf(str.charAt(i++));

        chr1 = (enc1 << 2) | (enc2 >> 4);
        chr2 = ((enc2 & 15) << 4) | (enc3 >> 2);
        chr3 = ((enc3 & 3) << 6) | enc4;

        data = data + String.fromCharCode(chr1);

        if (enc3 != 64) {
            data = data + String.fromCharCode(chr2);
        }
        if (enc4 != 64) {
            data = data + String.fromCharCode(chr3);
        }
    } while (i < str.length);

    return data;
}

// Show admin controls.

var enableAdmin = function(level) {
    var Dom = YAHOO.util.Dom;
    
    if (level > 2) {
        els = Dom.getElementsByClassName("admin-b", "div");
        Dom.setStyle(els, "display", "block");
        els = Dom.getElementsByClassName("admin-i", "span");
        Dom.setStyle(els, "display", "inline");
    }
}

// Expand emoticons.

var emoticonRules = [
    [ new RegExp(":(\\w+):", "g"), "\\$1" ],
    [ new RegExp(":(-?)\\)", "g"), "smile" ],
    [ new RegExp(":(-?)\\(", "g"), "sad" ],
    [ new RegExp(";(-?)\\)", "g"), "wink" ],
    [ new RegExp(":(-?)P", "g"),  "razz" ]
];

var emoticonExpand = function(str) {
    for (i in emoticonRules) {
        var r = emoticonRules[i];
        str = str.replace(r[0], '<img src="/img/emt/' + r[1] + '.gif" />');
    }
    return str;
}

