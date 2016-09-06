var pinfirmable = {
  init: function() {
    var elem = document.getElementById('pinfirmable-noscript');
    if(elem) {
      elem.style.display = 'none';
    }
  },

  autoTab: function(event) {
    switch (this.detectKeyPress(event)) {
    case "digit":
      this.handleDigitPress(event);
      event.preventDefault();
      break;
    case "backspace":
      this.handleBackspacePress(event);
      break;
    case "character":
      return false;
    default:
      return true;
    }
  },

  handleDigitPress: function(event) {
    var elem = event.srcElement;
    elem.value = event.key;

    var nextElem = this.nextElement(elem);
    if(nextElem.type == "text" || nextElem.type == "number") {
      nextElem.focus();
    }
    else {
      elem.form.submit();
    }
    return true;
  },

  handleBackspacePress: function(event) {
    var elem = event.srcElement;
    if(elem.value.length > 0) {
      elem.value = "";
    } else {
      var previousElement = this.previousElement(elem);
      previousElement.value = "";
      previousElement.focus();
    }
  },

  indexOfElement: function(elem) {
    var i;
    var elements = elem.form.elements;
      for (i=0, numElements=elements.length; i<numElements; i++) {
        if (elements[i]==elem) {
          break;
      }
    }
    return i;
  },

  nextElement: function(elem) {
    var elements = elem.form.elements;
    var i = this.indexOfElement(elem);
    return elements[i + 1];
  },

  previousElement: function(elem) {
    var elements = elem.form.elements;
    var i = this.indexOfElement(elem);
    return elements[i - 1];
  },

  detectKeyPress: function(event) {
    if(event.keyCode === 8) { return "backspace"; }
    if(!isNaN(event.key - parseFloat(event.key))) { return "digit"; }
    if(/\S/.test(String.fromCharCode(event.keyCode))) { return "character"; }
  }
};

pinfirmable.init();
