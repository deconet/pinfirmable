var pinfirmable = {
  autoTab: function(event) {
    if(!isNaN(event.key - parseFloat(event.key))) {
      var elem = event.srcElement;
      var i;
      var elements = elem.form.elements;
        for (i=0, numElements=elements.length; i<numElements; i++) {
          if (elements[i]==elem) {
            break;
        }
      }
      var nextElem = elements[i+1];
      if(nextElem.type == "text" || nextElem.type == "number") {
        elements[i+1].focus();
      }
      else {
        elem.form.submit();
      }
      return true;
    } else {
      return false;
    }
  }
};
