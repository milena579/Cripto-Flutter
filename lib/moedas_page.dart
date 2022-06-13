
import 'package:flutter/material.dart';
import 'package:flutter_application_1/favoritas_page.dart';
import 'package:flutter_application_1/favoritas_repository.dart';
import 'package:flutter_application_1/moeda_repository.dart';
import 'package:flutter_application_1/moedas_detalhes_page.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'moeda.dart';

class MoedasPage extends StatefulWidget {

   MoedasPage({Key? key}) : super(key: key);

  @override
  State<MoedasPage> createState() => _MoedasPageState();
}

class _MoedasPageState extends State<MoedasPage> {
    final tabela = MoedaRepository.tabela;   

    NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');

    List<Moeda> selecionadas = [];
    late FavoritasRepository favoritas;
    
    appBarDinamica(){
      if(selecionadas.isEmpty){
      return AppBar(
        title: Text('Cripto Moedas')
      );
      } else {
        return AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              setState(() {
                selecionadas = [];
              });
            },
          ),
          title: Text('${selecionadas.length} selecionadas'),
          backgroundColor: Colors.blueGrey[50],
          elevation: 1,
          iconTheme: IconThemeData(color: Colors.black87), toolbarTextStyle: TextTheme(
            headline6: TextStyle(
              color:Colors.black87,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ).bodyText2, titleTextStyle: TextTheme(
            headline6: TextStyle(
              color:Colors.black87,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ).headline6,
        );
      }
    }
    mostarDatelhes(Moeda moeda) {
      Navigator.push
      (context,
       MaterialPageRoute(
        builder: (_) => MoedasDetalhesPage(moeda: moeda),
        ),
      );
    }

    limparSelecionadas (){
      setState(() {
        selecionadas = [];
      });
    }
    
  @override
  Widget build(BuildContext context) {
    favoritas = Provider.of<FavoritasRepository>(context);

    return Scaffold(
      appBar:  appBarDinamica(),
      body:ListView.separated(
        itemBuilder: (BuildContext context, int moeda){
          return ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),

            leading: (selecionadas.contains(tabela[moeda]))
            ? CircleAvatar(
              child: Icon(Icons.check),
            )
             :SizedBox(
              child: Image.asset(tabela[moeda].icone),
              width: 40,
            ),
            title: Text(tabela[moeda].nome, style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),

            trailing: Text(real.format(tabela[moeda].preco)
            ),
            selected: selecionadas.contains(tabela[moeda]),
            selectedTileColor: Color.fromARGB(255, 198, 201, 223),
            onLongPress: () {
              setState(() {
                (selecionadas.contains(tabela[moeda])
                ? selecionadas.remove(tabela[moeda])
                : selecionadas.add(tabela[moeda]));
              },);
              print(tabela[moeda].nome);
            },
              onTap: () => mostarDatelhes(tabela[moeda]),
        );
      },
          padding: EdgeInsets.all(16),
          separatorBuilder: (_,___) => Divider(), 
          itemCount: tabela.length),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: selecionadas.isNotEmpty? 
          FloatingActionButton.extended(
              onPressed: () {
                favoritas.saveAll(selecionadas);
                limparSelecionadas;
              },
              icon: Icon(Icons.star),
              label: Text(
                'FAVORITAR',
                style: TextStyle(
                  letterSpacing: 0,
                  fontWeight: FontWeight.bold,
                ),
                ),
            )
      :null,
    );
  }
}

