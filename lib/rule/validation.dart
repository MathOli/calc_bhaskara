class Validation{
List _validar;
int _ttl;
String _error;

  String validate(double a,double b,double c){
    _ttl = 0;
    _validar = [a,b,c];
    for(int i = 0; i<_validar.length;i++){
      if(_validar[i] == null){
        _ttl++;
      }
    }

    if (_ttl > 1){
      _error = "Faltou informar $_ttl numeros";
    }else{
      _error = "Faltou informar $_ttl numero";
    }
      return _error;
  }
}