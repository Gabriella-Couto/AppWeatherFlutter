import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Componentes{

  static caixaDeTexto(String rotulo, String dica,
      TextEditingController controlador, valicao,
      {bool obscure=false, bool numero=false}){
    return Container(
        //padding: EdgeInsets.only(left: 20, top: 25),
        margin: EdgeInsets.only(left: 20, top: 10, right: 25),
        child:  TextFormField(
        controller: controlador,
        obscureText: obscure,
        validator: valicao,
        keyboardType: numero?TextInputType.number:TextInputType.text,
        decoration: InputDecoration(
          labelText: rotulo,
          labelStyle:TextStyle(fontSize: 34),
          hintText: dica,
          hintStyle:TextStyle(fontSize: 18, color: Colors.grey),

        ),
      )
    );

  }

  static botao(String _texto, Function _f){
    return Container(
      child: RaisedButton(
        onPressed: _f,
        child: Text(
          _texto,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Colors.black, width: 4)
        ),
        color: Colors.black87.withOpacity(0.4),
        hoverColor: Colors.yellow.withOpacity(0.3),
      ),
    );

  }

  static rotulo(String rotulo){
    return Text(
      rotulo,
      style: TextStyle(color: Colors.black54,  fontSize: 21),
    );
  }

}