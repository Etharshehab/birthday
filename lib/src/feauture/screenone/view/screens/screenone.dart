import 'package:date_of_birth/src/feauture/screenone/view/widget/customelvatedbutton.dart';
import 'package:date_of_birth/src/feauture/screenone/view/widget/customtexfield.dart';
import 'package:date_of_birth/src/feauture/screentwo/view/screen/screentwo.dart';
import 'package:flutter/material.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String currentName = "";
  String currentBirthday = "";

  @override
  void initState() {
    super.initState();

    nameController.addListener(() {
      setState(() {
        currentName = nameController.text;
      });
    });
    birthDateController.addListener(() {
      setState(() {
        currentBirthday = birthDateController.text;
      });
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    birthDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Main"),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomTextField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "لا بد أن يكون الاسم أكبر من ثلاثة حروف";
                      }
                      if (value.length < 3) {
                        return "لا بد أن يكون الاسم أكبر من ثلاثة حروف";
                      }
                      return null;
                    },
                    controller: nameController,
                    label: const Text("الاسم"),
                    hintText: "قم بإدخال اسمك الثنائي",
                    prefixIcon: const Icon(Icons.person),
                    suffixIcon: const Icon(Icons.clear),
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "تاريخ الميلاد مطلوب";
                      }

                      final dateRegex = RegExp(r"^\d{4}-\d{2}-\d{2}$");
                      if (!dateRegex.hasMatch(value)) {
                        return "التاريخ يجب أن يكون بصيغة YYYY-MM-DD";
                      }

                      try {
                        final birthDate = DateTime.parse(value);
                        if (birthDate.isAfter(DateTime.now())) {
                          return "تاريخ الميلاد لا يمكن أن يكون في المستقبل";
                        }
                      } catch (e) {
                        return "تاريخ الميلاد غير صالح";
                      }

                      return null;
                    },
                    controller: birthDateController,
                    label: const Text("تاريخ الميلاد"),
                    hintText: "قم بإدخال تاريخ ميلادك (YYYY-MM-DD)",
                    prefixIcon: const Icon(Icons.calendar_today),
                    suffixIcon: const Icon(Icons.clear),
                  ),
                  const SizedBox(height: 30),
                  CustomElvatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                    text: "عرض البيانات",
                  ),
                  CustomElvatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => ScreenTwo(
                            name: nameController.text,
                            birthDate: birthDateController.text,
                          ),
                        ),
                      );
                    },
                    text: "الإنتقال",
                  ),
                  Text("الاسم: $currentName\nتاريخ الميلاد: $currentBirthday"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
