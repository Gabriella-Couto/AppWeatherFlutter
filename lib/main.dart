import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:weather_app/componente.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyWeatherApp(),
  ));
}

class MyWeatherApp extends StatefulWidget {
  @override
  _MyWeatherAppState createState() => _MyWeatherAppState();
}


class _MyWeatherAppState extends State<MyWeatherApp> {

  TextEditingController controladorClima = TextEditingController();
  GlobalKey<FormState> cform = GlobalKey<FormState>();


  int temperatura = 0;
  String descricao = "Descricao";
  String cidade = "Cidade";
  int humidade = 0;
  String vento = "Vento";

  String temp = "Temperatura:";
  String desc = "Descrição:";
  String cid = "Cidade:";
  String hum = "Humidade:";
  String vent = "Velocidade do vento:";

  Function validaCidade = ((value){
    if(value.isEmpty)
      return "Informe a cidade";
    return null;
  });

  OnClick() async{
    if(!cform.currentState.validate())
      return;
    String url = "https://api.hgbrasil.com/weather/?woeid=${controladorClima.text}";
    Response response = await get(url);
    Map clima = json.decode(response.body);
    //print(clima['results']["temp"]);
    setState(() {
      temperatura = clima["results"]["temp"];
      humidade = clima["results"]["humidity"];
      cidade = clima["results"]["city"];
      descricao = clima["results"]["description"];
      vento = clima['results']["wind_speedy"];
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: cform,
            child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Image.asset(
                        "assets/imgs/sol_e_chuva.webp",
                        fit: BoxFit.fitWidth,
                      )
                  ),
                  Componentes.caixaDeTexto("Cidade:", "Informe o código da cidade", controladorClima, validaCidade, numero: true),
                  Container(
                    height: 100,
                    child: IconButton(
                      onPressed: OnClick,
                      icon: FaIcon(FontAwesomeIcons.searchLocation, size: 60, ),
                    ),
                  ),
                  Componentes.rotulo(temp),
                  Componentes.rotulo(temperatura.toString()),
                  Componentes.rotulo(hum),
                  Componentes.rotulo(humidade.toString()),
                  Componentes.rotulo(desc),
                  Componentes.rotulo(descricao),
                  Componentes.rotulo(cid),
                  Componentes.rotulo(cidade),
                  Componentes.rotulo(vent),
                  Componentes.rotulo(vento)
                ]
            ),
          ),
        )

    );

  }
}

