function textAreaMaxLength(oInObj)
{
      var iMaxLen = parseInt(oInObj.getAttribute('maxlength'));
      var iCurLen = oInObj.value.length;

      if ( oInObj.getAttribute && iCurLen > iMaxLen )
      {
          oInObj.value = oInObj.value.substring(0, iMaxLen);
      }
}
