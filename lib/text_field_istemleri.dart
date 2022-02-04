import 'package:flutter/material.dart';

class TextFieldIslemleri extends StatefulWidget {
  const TextFieldIslemleri({Key? key}) : super(key: key);

  @override
  State<TextFieldIslemleri> createState() => _TextFieldIslemleriState();
}

class _TextFieldIslemleriState extends State<TextFieldIslemleri> {
  late TextEditingController _emailController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController(text: 'merhabaas');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('inputs'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: TextField(
              controller: _emailController,
              cursorColor: Colors.pink,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white10,
                prefixIcon: Icon(Icons.email),
                suffixIcon: Icon(Icons.access_alarm_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                ),
                hintText: 'Ad giriniz',
                label: Text(
                  'Ad',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              onSubmitted: (value) {
                debugPrint('sumbit $value');
              },
              onChanged: (value) {
                if (value.length > 3) {
                  print(value);
                }
              },
              // maxLines: 5,
              //maxLength: 100,
              autofocus:
                  false, //! auto focus özelliği uygulama başlayınca direk klavye açılıyorke
              // keyboardType: TextInputType.number,
              //  textInputAction: TextInputAction
              // .emergencyCall, //! klavyedeki gönder tuşunu customize etme
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(50.0),
            child: TextField(
              decoration: InputDecoration(
                label: Text(
                  'Ad',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction
                  .emergencyCall, //! klavyedeki gönder tuşunu customize etme
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.edit),
      ),
    );
  }
}
