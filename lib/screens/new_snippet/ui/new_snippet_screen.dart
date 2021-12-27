import 'package:codehub/constant/app_colors/app_colors.dart';
import 'package:codehub/constant/app_strings/app_strings.dart';
import 'package:codehub/constant/app_styles.dart';
import 'package:codehub/global_widgets/custom_gradient_button/custom_gradient_button.dart';
import 'package:codehub/screens/new_snippet/model/snippet_lang_model.dart';
import 'package:codehub/utils/size_config/size_config.dart';
import 'package:flutter/material.dart';

class NewSnippetScreen extends StatefulWidget {
  const NewSnippetScreen({Key? key}) : super(key: key);

  @override
  _NewSnippetScreenState createState() => _NewSnippetScreenState();
}

class _NewSnippetScreenState extends State<NewSnippetScreen> {
  SnippetLangModel selectedItem =
      SnippetLangModel(name: "-----", value: "-----");

  final List<SnippetLangModel> languagesModel = [
    SnippetLangModel(name: "-----", value: "-----"),
    SnippetLangModel(name: "Arduino", value: "arduino"),
    SnippetLangModel(name: "Bash", value: "bash"),
    SnippetLangModel(name: "C", value: "c"),
    SnippetLangModel(name: "C++", value: "cpp"),
    SnippetLangModel(name: "C#", value: "csharp"),
    SnippetLangModel(name: "Css", value: "css"),
    SnippetLangModel(name: "Dart", value: "dart"),
    SnippetLangModel(name: "Docker", value: "docker"),
    SnippetLangModel(name: "Go", value: "go"),
    SnippetLangModel(name: "Html", value: "html"),
    SnippetLangModel(name: "Java", value: "java"),
    SnippetLangModel(name: "Js", value: "js"),
    SnippetLangModel(name: "Json", value: "json"),
    SnippetLangModel(name: "Lua", value: "lua"),
    SnippetLangModel(name: "Markdown", value: "md"),
    SnippetLangModel(name: "MySql", value: "mysql"),
    SnippetLangModel(name: "Php", value: "php"),
    SnippetLangModel(name: "Python", value: "python"),
    SnippetLangModel(name: "Ruby", value: "rb"),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  sizedBox(h) => SizedBox(
        height: h,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(newSnippetTitle),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                snippetNameTitle,
                style: bodyBoldStyle,
              ),
              sizedBox(SizeConfig.heightMultiplier * 2),
              Container(
                decoration: BoxDecoration(
                  color: textGrey.withOpacity(.3),
                  borderRadius: BorderRadius.circular(14.0),
                ),
                child: TextFormField(
                  cursorColor: primaryColor,
                  maxLines: 1,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              sizedBox(SizeConfig.heightMultiplier * 2),
              Text(
                snippetDescriptionTitle,
                style: bodyBoldStyle,
              ),
              sizedBox(SizeConfig.heightMultiplier * 2),
              Container(
                decoration: BoxDecoration(
                  color: textGrey.withOpacity(.3),
                  borderRadius: BorderRadius.circular(14.0),
                ),
                child: TextFormField(
                  cursorColor: primaryColor,
                  maxLines: 3,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              sizedBox(SizeConfig.heightMultiplier * 2),
              Text(
                snippetLangTitle,
                style: bodyBoldStyle,
              ),
              sizedBox(SizeConfig.heightMultiplier * 2),
              Directionality(
                textDirection: TextDirection.ltr,
                child: Container(
                  decoration: BoxDecoration(
                    color: textGrey.withOpacity(.3),
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    width: SizeConfig.widthMultiplier * 100,
                    height: 70,
                    child: Center(
                      child: DropdownButton<SnippetLangModel>(
                        isExpanded: true,
                        style: underlineBoldStyle,
                        menuMaxHeight: SizeConfig.heightMultiplier * 50,
                        value: selectedItem,
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.grey,
                        ),
                        underline: Container(),
                        items: languagesModel.map((e) {
                          return DropdownMenuItem<SnippetLangModel>(
                            value: e,
                            child: Text(e.name),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedItem = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              sizedBox(SizeConfig.heightMultiplier * 2),
              Text(
                snippetCodeTitle,
                style: bodyBoldStyle,
              ),
              sizedBox(SizeConfig.heightMultiplier * 2),
              Directionality(
                textDirection: TextDirection.ltr,
                child: Container(
                  decoration: BoxDecoration(
                    color: textGrey.withOpacity(.3),
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  child: TextFormField(
                    cursorColor: primaryColor,
                    maxLines: null,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              sizedBox(SizeConfig.heightMultiplier * 3),
              Center(
                child: CustomGradientButton(
                  onPressed: () {},
                  child: Text(createSnippet),
                  width: SizeConfig.widthMultiplier * 60,
                  height: 55,
                  borderRadius: 20,
                  colors: [
                    primaryColor,
                    Colors.deepPurpleAccent,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
