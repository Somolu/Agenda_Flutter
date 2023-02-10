import 'package:flutter/material.dart';
import 'package:flutter_crud_restapi_example_master_androidx/adddatawidget.dart';
import 'models/cases.dart';
import 'services/api_service.dart';

enum Gender { pronta, afazer }

class EditDataWidget extends StatefulWidget {
  EditDataWidget(this.cases);

  final Cases cases;

  @override
  _EditDataWidgetState createState() => _EditDataWidgetState();
}

class _EditDataWidgetState extends State<EditDataWidget> {
  _EditDataWidgetState();

  final ApiService api = ApiService();
  final _addFormKey = GlobalKey<FormState>();
  String id = '';
  final _tituloController = TextEditingController();
  String tipo = 'afazer';
  Tipo _tipo = Tipo.afazer;
  final _vencController = TextEditingController();
  final _descricaoController = TextEditingController();

  @override
  void initState() {
    id = widget.cases.id;
    _tituloController.text = widget.cases.titulo;
    tipo = widget.cases.tipo;
    if (widget.cases.tipo == 'afazer') {
      _tipo = Tipo.afazer;
    } else {
      _tipo = Tipo.pronta;
    }
    _vencController.text = widget.cases.venc.toString();
    _descricaoController.text = widget.cases.descricao;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Cases'),
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
                              Text('Titulo'),
                              TextFormField(
                                controller: _tituloController,
                                decoration: const InputDecoration(
                                  hintText: 'Titulo',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Pot favor, insira o titulo';
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
                              Text('Vencimento'),
                              TextFormField(
                                controller: _vencController,
                                decoration: const InputDecoration(
                                  hintText: 'Vencimento',
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Favor, selecione a data do vencimento';
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
                              Text('DEscrição'),
                              TextFormField(
                                controller: _descricaoController,
                                decoration: const InputDecoration(
                                  hintText: 'Descrção da atividade',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Favor inserir a atividade';
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
                                    api.alterar(
                                        id,
                                        Cases(
                                            titulo: _tituloController.text,
                                            tipo: tipo,
                                            venc: _vencController.text,
                                            descricao:
                                                _descricaoController.text,
                                            id: '',
                                            updated: ''));

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
