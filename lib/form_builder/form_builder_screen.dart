import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormBuilderScreen extends StatefulWidget {
  const FormBuilderScreen({super.key});

  @override
  State<FormBuilderScreen> createState() => _FormBuilderScreenState();
}

class _FormBuilderScreenState extends State<FormBuilderScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              FormBuilderField<String?>(
                name: 'name',
                onChanged: (val) => debugPrint(val.toString()),
                builder: (FormFieldState field) {
                  return CupertinoFormRow(
                    prefix: const Text('Name: '),
                    error: field.errorText != null ? Text(field.errorText!) : null,
                    child: CupertinoTextField(
                      onChanged: (value) => field.didChange(value),
                    ),
                  );
                },
                autovalidateMode: AutovalidateMode.always,
                validator: (valueCandidate) {
                  if (valueCandidate?.isEmpty ?? true) {
                    return 'This field is required.';
                  }
                  return null;
                },
              ),
              FormBuilderTextField(name: 'name')
            ],
          ),
        ),
      ],
    );
  }
}
