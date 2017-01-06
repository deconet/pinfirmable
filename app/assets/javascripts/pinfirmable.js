var pinfirmable = {
  init: function() {
    var elem = document.getElementById('pinfirmable-noscript');
    if(elem) {
      elem.style.display = 'none';
    }
  },

  pastePin: function(event) {
    event.preventDefault();
    var clipboardData = event.clipboardData || window.clipboardData;
    var pastedData = clipboardData.getData('Text');
    pastedData = pastedData.replace("-", "");
    var elemIndex = this.indexOfElement(event.currentTarget);
    var elements = event.currentTarget.form.getElementsByClassName("pin-input");
    var pasteCounter = 0;
    for(var i = elemIndex; i < pastedData.length; i++) {
      elements[i].value = pastedData[pasteCounter];
      elements[i].focus();
      pasteCounter++;
    }
    if(pasteCounter === 6) {
      event.currentTarget.form.submit();
    }
  },

  autoTab: function(event) {
    event.preventDefault();
    switch (this.detectKeyPress(event)) {
      case "digit":
        this.handleDigitPress(event);
        break;
      case "backspace":
        this.handleBackspacePress(event);
        break;
    }
  },

  handleDigitPress: function(event) {
    var elem = event.currentTarget;
    var key = this.getKeyCharacter(event);
    elem.value = key;

    var nextElem = this.nextElement(elem);
    if(nextElem && (nextElem.type == "text" || nextElem.type == "number" || nextElem.type == "tel")) {
      nextElem.focus();
    }
    else {
      var loadingGif = document.getElementById("pinfirmable-loading-gif");
      loadingGif.style.display = "inline-block";
      elem.form.style.display = "none";
      elem.form.submit();
    }
    return true;
  },

  handleBackspacePress: function(event) {
    var key = this.getKeyCharacter(event);
    if(key !== "Backspace") { return; } else {
    var elem = event.currentTarget;
    if(elem.value.length > 0) {
      elem.value = "";
    } else {
      var previousElement = this.previousElement(elem);
      previousElement.value = "";
      previousElement.focus();
    }}
  },

  indexOfElement: function(elem) {
    var i;
    var elements = elem.form.getElementsByClassName("pin-input");
      for (i=0, numElements=elements.length; i<numElements; i++) {
        if (elements[i]==elem) {
          break;
      }
    }
    return i;
  },

  nextElement: function(elem) {
    var elements = elem.form.getElementsByClassName("pin-input");
    var i = this.indexOfElement(elem);
    return elements[i + 1];
  },

  previousElement: function(elem) {
    var elements = elem.form.getElementsByClassName("pin-input");
    var i = this.indexOfElement(elem);
    return elements[i - 1];
  },

  detectKeyPress: function(event) {
    var key = this.getKeyCharacter(event);
    if(!isNaN(key - parseFloat(key))) { return "digit"; }
    if(/\S/.test(key)) { return "character"; }
  },

  getKeyCharacter: function(event) {
    if(event.metaKey || event.ctrlKey) {
      return false;
    }else {
      if (event.key) {
        return event.key;
      }
      else if(event.keyCode === 8) {
        return "Backspace";
      }
      else {
        return String.fromCharCode(event.keyCode);
      }
    }
  }
};

pinfirmable.init();
