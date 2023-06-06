class appexception implements Exception{
  final _message;
  final _prefix;
  appexception([this._message,this._prefix]);
  String tostring(){
    return "$_prefix$_message";
  }
}
class fetchDataException extends appexception{
  fetchDataException([String?_message]):super(_message,"Error while communication");

}
class UnothorizeException extends appexception{

  UnothorizeException([String?_message]):super(_message,"Unothorized Exception");

}
