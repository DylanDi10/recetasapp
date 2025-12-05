import 'package:flutter/material.dart';
import 'package:recetasapp/models/receta_model.dart';
import 'package:recetasapp/widgets/tarjeta_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _preparationController = TextEditingController();
  TextEditingController _imageController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _selectedType;
  final List<String> _types = ["Entrada", "Sopa", "Segundo", "Postre"];

  List<RecetaModel> recetasList = [];

  @override
  void initState() {
    super.initState();
    recetasList.add(
      RecetaModel(
        title: "Wafles",
        preparation: "Mezclar harina...",
        urlImage:
            "https://images.pexels.com/photos/789327/pexels-photo-789327.jpeg",
        type: "Postre",
      ),
    );
  }

  void _cleanForm() {
    _titleController.clear();
    _preparationController.clear();
    _imageController.clear();
    _selectedType = null;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 32, 102, 142),
      appBar: AppBar(title: Text("App de recetas")),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _titleController,
                    style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                    decoration: InputDecoration(
                      hintText: "Ingresa el título",
                      hintStyle: TextStyle(
                        color: const Color.fromARGB(136, 0, 0, 0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return "Campo obligatorio";
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _preparationController,
                    style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),

                    decoration: InputDecoration(
                      hintText: "Ingresa la preparación",
                      hintStyle: TextStyle(
                        color: const Color.fromARGB(135, 0, 0, 0),
                      ),
                    ),
                    maxLines: 3,
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return "Campo obligatorio";
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _imageController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Ingresa URL imagen",
                      hintStyle: TextStyle(
                        color: const Color.fromARGB(136, 0, 0, 0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return "Campo obligatorio";
                      return null;
                    },
                  ),

                  DropdownButtonFormField(
                    dropdownColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Selecciona tipo",
                      hintStyle: TextStyle(color: const Color.fromARGB(134, 0, 0, 0)),
                    ),
                    value: _selectedType,
                    items: _types.map((e) {
                      return DropdownMenuItem(
                        child: Text(
                          e,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        value: e,
                      );
                    }).toList(),
                    onChanged: (value) {
                      _selectedType = value as String;
                      setState(() {});
                    },
                    validator: (value) {
                      if (value == null) return "Selecciona un tipo";
                      return null;
                    },
                  ),

                  SizedBox(height: 16),

                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        recetasList.add(
                          RecetaModel(
                            title: _titleController.text,
                            preparation: _preparationController.text,
                            urlImage: _imageController.text,
                            type: _selectedType!,
                          ),
                        );
                        _cleanForm();
                      }
                    },
                    child: Text("Registrar receta"),
                  ),
                  SizedBox(height: 16),

                  ...recetasList.map((e) {
                    return RecetaCardWidget(receta: e);
                  }).toList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
