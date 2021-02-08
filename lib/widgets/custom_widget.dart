import 'package:flutter/material.dart';

class CustomWidget extends FormField<int> {
  CustomWidget({
    FormFieldSetter<int> onSaved,
    FormFieldValidator<int> validator,
    int initialValue,
    bool autoValidate = false,
    List<SexModel> data,
  }) : super(
          onSaved: onSaved,
          validator: validator,
          initialValue: initialValue,
          builder: (FormFieldState<int> state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...data
                    .map(
                      (t) => RadioListTile(
                        title: Text(t.name),
                        groupValue: state.value,
                        value: t.index,
                        onChanged: (val) {
                          state.didChange(val);
                        },
                      ),
                    )
                    .toList(),
                state.hasError
                    ? Text(
                        state.errorText,
                        style: TextStyle(color: Colors.red),
                      )
                    : Container(),
              ],
            );
          },
        );
}

class SexModel {
  String name;
  int index;
  SexModel({
    this.name,
    this.index,
  });
}
