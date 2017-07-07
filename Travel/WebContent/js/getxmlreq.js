function getXmlReq() {
	var xmlhttp;
	if (window.XMLHttpRequest)
	  {   //非IE
	  xmlhttp=new XMLHttpRequest();
	  }
	else
	  {  //IE
	  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	  }
	return xmlhttp;
}