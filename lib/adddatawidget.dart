import 'package:flutter/material.dart';
import 'models/cases.dart';
import 'services/api_service.dart';

enum Tipo { pronta, afazer }

class AddDataWidget extends StatefulWidget {
  AddDataWidget();

  @override
  _AddDataWidgetState createState() => _AddDataWidgetState();
}

class _AddDataWidgetState extends State<AddDataWidget> {
  _AddDataWidgetState();

  final ApiService api = ApiService();
  final _addFormKey = GlobalKey<FormState>();
  final _tituloController = TextEditingController();
  String tipo = 'pronta';
  Tipo _tipo = Tipo.pronta;
  final _vencController = TextEditingController();
  final _descricaoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Cases'),
      ),
      body: Form(
        key: _addFormKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Card(
                child: Container(
                    padding: EdgeInsets.all(10.0),
                    width: 440,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Nome da tarefa'),
                              TextFormField(
                                controller: _tituloController,
                                decoration: const InputDecoration(
                                  hintText: 'Tarefa',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Por favor, insira o nome da tarefa ';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Tipo'),
                              ListTile(
                                title: const Text('Pronta'),
                                leading: Radio(
                                  value: Tipo.pronta,
                                  groupValue: _tipo,
                                  onChanged: (Tipo? value) {
                                    setState(() {
                                      _tipo = value!;
                                      tipo = 'pronta';
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: const Text('A Fazer'),
                                leading: Radio(
                                  value: Tipo.afazer,
                                  groupValue: _tipo,
                                  onChanged: (Tipo? value) {
                                    setState(() {
                                      _tipo = value!;
                                      tipo = 'afazer';
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Venc'),
                              TextFormField(
                                controller: _vencController,
                                decoration: const InputDecoration(
                                  hintText: 'Venc',
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Por favor, insira a data do vencimento';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Descricao'),
                              TextFormField(
                                controller: _descricaoController,
                                decoration: const InputDecoration(
                                  hintText: 'Descreva a tarefa',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Por favor, descreva a tarefa';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        // Container(
                        //   margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        //   child: Column(
                        //     children: <Widget>[
                        //       Text('City'),
                        //       TextFormField(
                        //         controller: _cityController,
                        //         decoration: const InputDecoration(
                        //           hintText: 'City',
                        //         ),
                        //         validator: (value) {
                        //           if (value!.isEmpty) {
                        //             return 'Please enter city';
                        //           }
                        //           return null;
                        //         },
                        //         onChanged: (value) {},
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // Container(
                        //   margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        //   child: Column(
                        //     children: <Widget>[
                        //       Text('Country'),
                        //       TextFormField(
                        //         controller: _countryController,
                        //         decoration: const InputDecoration(
                        //           hintText: 'Country',
                        //         ),
                        //         validator: (value) {
                        //           if (value!.isEmpty) {
                        //             return 'Please enter country';
                        //           }
                        //           return null;
                        //         },
                        //         onChanged: (value) {},
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // Container(
                        //   margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        //   child: Column(
                        //     children: <Widget>[
                        //       Text('Status'),
                        //       ListTile(
                        //         title: const Text('Positive'),
                        //         leading: Radio(
                        //           value: Status.positive,
                        //           groupValue: _status,
                        //           onChanged: (Status? value) {
                        //             setState(() {
                        //               _status = value!;
                        //               status = 'positive';
                        //             });
                        //           },
                        //         ),
                        //       ),
                        //       ListTile(
                        //         title: const Text('Dead'),
                        //         leading: Radio(
                        //           value: Status.dead,
                        //           groupValue: _status,
                        //           onChanged: (Status? value) {
                        //             setState(() {
                        //               _status = value!;
                        //               status = 'dead';
                        //             });
                        //           },
                        //         ),
                        //       ),
                        //       ListTile(
                        //         title: const Text('Recovered'),
                        //         leading: Radio(
                        //           value: Status.recovered,
                        //           groupValue: _status,
                        //           onChanged: (Status? value) {
                        //             setState(() {
                        //               _status = value!;
                        //               status = 'recovered';
                        //             });
                        //           },
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              ElevatedButton(
                                onPressed: () {
                                  if (_addFormKey.currentState!.validate()) {
                                    _addFormKey.currentState!.save();
                                    api.save(Cases(
                                        titulo: _tituloController.text,
                                        tipo: tipo,
                                        venc: _vencController.text,
                                        descricao: _descricaoController.text,
                                        updated: '', //????????????????
                                        id: ''));

                                    Navigator.pop(context);
                                  }
                                },
                                child: Text('Save',
                                    style: TextStyle(color: Colors.white)),
                              )
                            ],
                          ),
                        ),
                      ],
                    ))),
          ),
        ),
      ),
    );
  }
}
