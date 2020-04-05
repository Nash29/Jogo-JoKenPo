import 'package:flutter/material.dart';
import 'dart:math';

// stful
//Colocando Jogo classe é criada

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var imagemApp = AssetImage("image/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";

  //_ = não deixa ela ser executada fora dessa classe
  void _opcaoSelecionada(String escolhaUsuario){

    //print("Opção selecionada: " + escolhaUsuario); //Debug para testar se esta funcionando

    var opcoes = ["pedra", "papel", "tesoura"];

    //Pega os 3 valores do array
    var numero = Random().nextInt(3);

    //Vai acessar o array de opções com o numero que foi selecionado
    var escolhaApp = opcoes[numero];

    print("Escolha do App: " + escolhaApp);
    print("Escolha do Usuario: " + escolhaUsuario);

    //Exibição da imagem escolhida pelo App
    switch(escolhaApp){
      case "pedra":
        setState(() {
          this.imagemApp = AssetImage("image/pedra.png");
        });
        break;

      case "papel":
        setState(() {
          this.imagemApp = AssetImage("image/papel.png");
        });
        break;

      case "tesoura":
        setState(() {
          this.imagemApp = AssetImage("image/tesoura.png");
        });
        break;
    }

    //Validação do ganhador
    //Usuario Ganhandor
    if(
    (escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra")
    ) {
      setState(() {
        this._mensagem = "Você Venceu!!! :)";
      });

      //App Ganhador
    }else if(
    (escolhaApp == "pedra" && escolhaUsuario == "tesoura")||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel")||
        (escolhaApp == "papel" && escolhaUsuario == "pedra")
    ) {
      setState(() {
        this._mensagem = "Você Perdeu!!! :(";
      });

    }else{
      setState(() {
        this._mensagem = "Empate";
      });
    }

  }

  @override
  //build é para contruir a interface
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
      appBar: AppBar(//Retangulo superior do app, onde vai o nome
        backgroundColor: Colors.blue,
        title: Text("JokenPo"),
      ),
      body: Column(//A parte de baixo do App

        crossAxisAlignment: CrossAxisAlignment.center,//O text 'Escolha do app fica centralizado'
        children: <Widget>[
          //1) text
          //2) imagem
          //3) text resultado
          //4) Linha 3 imagens

          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),//Espaçamento de cima e de baixo
            child: Text(
                "Escolha do App",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,//Tamanho do texto
                  fontWeight: FontWeight.bold,//Deixa o texto em negrito

                )
            ),
          ),

          Image(image: this.imagemApp,),



          /*GestureDetector(//Evento para click na tela
              //Quando for verificar é necessarios colocar a ultima palavra nesse caso 'imagem' no logcat
              onTap: () {print("Um clique na imagem!");},
              onDoubleTap: () {print("Dois cliques na imagem!");},
              onLongPress: () {print("Clique longo na imagem!");},
              child: Image.asset("image/padrao.png"),
            ),*/



          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),//Espaçamento de cima e de baixo
            child: Text(
                this._mensagem,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,//Tamanho do texto
                    fontWeight: FontWeight.bold//Deixa o texto em negrito
                )
            ),
          ),


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,//Coloca um do lado do outro
            children: <Widget>[

              //Baseado na palavra que foi clicada

              GestureDetector(
                //onTap = Quando o usuario clicar
                onTap: () => _opcaoSelecionada("pedra"),//() => \ Necessario quando usar o VOID
                child: Image.asset("image/pedra.png", height: 100),//Nessa imagem
              ),

              GestureDetector(
                //onTap = Quando o usuario clicar
                onTap: () => _opcaoSelecionada('papel'),//() => \ Necessario quando usar o VOID
                child: Image.asset("image/papel.png", height: 100),//Nessa imagem
              ),

              GestureDetector(
                //onTap = Quando o usuario clicar
                onTap: () => _opcaoSelecionada('tesoura'),//() => \ Necessario quando usar o VOID
                child: Image.asset("image/tesoura.png", height: 100),//Nessa imagem
              ),

              /*
              Image.asset("image/pedra.png", height: 100),
              Image.asset("image/papel.png", height: 100),
              Image.asset("image/tesoura.png", height: 100)
              */
            ],
          )
        ],
      ),
    );
  }
}
