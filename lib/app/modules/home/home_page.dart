import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Lista de Tarefas :D"})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  TextEditingController _title = TextEditingController();
  TextEditingController _desc = TextEditingController();
  Color _pickedColor = Colors.red;

  List<Map> data = [
    {
      'title': 'Jogar o lixo fora',
      'description': 'Apenas jogar fora',
      'checked': false,
      'marker': Colors.green,
    },
    {
      'title': 'Jogar o lixo fora',
      'description': 'Apenas jogar fora',
      'checked': false,
      'marker': Colors.green,
    },
    {
      'title': 'Jogar o lixo fora',
      'description': 'Apenas jogar fora',
      'checked': false,
      'marker': Colors.green,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addTaskDialog(context).then((value) => setState(() {}));
        },
        backgroundColor: Colors.deepOrangeAccent,
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.only(left: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                widget.title,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, i) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: data[i]['marker'],
                      ),
                      child: ExpansionTile(
                        expandedAlignment: Alignment.centerLeft,
                        title: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                            ),
                            Text(data[i]['title']),
                          ],
                        ),
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            child: Text(
                              data[i]['description'],
                            ),
                          ),
                          Checkbox(
                            value: data[i]['checked'],
                            onChanged: (v) {
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  Future addTaskDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            elevation: 1,
            content: Container(
              margin: EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      "Nova Tarefa",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    TextField(
                      controller: _title,
                      decoration: InputDecoration(labelText: 'Título'),
                    ),
                    TextField(
                      controller: _desc,
                      minLines: 1,
                      maxLines: 6,
                      // expands: true,
                      decoration: InputDecoration(
                        labelText: 'Descrição',
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Etiqueta: "),
                        Container(
                          margin: EdgeInsets.all(10),
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: _pickedColor,
                          ),
                          child: DropdownButton(
                            elevation: 0,
                            isDense: true,
                            value: _pickedColor,
                            items: [
                              DropdownMenuItem(
                                child: Text("Vermelho"),
                                value: Colors.red,
                              ),
                              DropdownMenuItem(
                                child: Text("Azul"),
                                value: Colors.blue,
                              ),
                              DropdownMenuItem(
                                child: Text("Verde"),
                                value: Colors.green,
                              ),
                              DropdownMenuItem(
                                child: Text("Roxo"),
                                value: Colors.purple,
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                _pickedColor = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancelar'),
              ),
              FlatButton(
                onPressed: () {
                  data.add({
                    'title': _title.text.trim(),
                    'description': _desc.text.trim(),
                    'checked': false,
                    'marker': _pickedColor,
                  });
                  Navigator.pop(context);
                },
                child: Text('Salvar'),
              ),
            ],
          );
        },
      ),
    );
  }
}
