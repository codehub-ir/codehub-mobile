import 'package:codehub/constant/app_colors/app_colors.dart';
import 'package:codehub/constant/app_strings/app_strings.dart';
import 'package:codehub/constant/app_styles/app_styles.dart';
import 'package:codehub/global_widgets/custom_gradient_button/custom_gradient_button.dart';
import 'package:codehub/global_widgets/custom_indicator/custom_indicators.dart';
import 'package:codehub/screens/new_snippet/bloc/new_snippet_bloc.dart';
import 'package:codehub/screens/new_snippet/model/snippet_lang_model.dart';
import 'package:codehub/screens/new_snippet/model/snippet_model.dart';
import 'package:codehub/utils/custom_snack_bar/custom_snack_bar.dart';
import 'package:codehub/utils/size_config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewSnippetScreen extends StatefulWidget {
  NewSnippetScreen({Key? key}) : super(key: key);

  @override
  State<NewSnippetScreen> createState() => _NewSnippetScreenState();
}

class _NewSnippetScreenState extends State<NewSnippetScreen> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _bodyController = TextEditingController();

  late NewSnippetBloc _newSnippetBloc;

  SnippetLangModel selectedLanguageItem =
      SnippetLangModel(name: "-----", value: "-");

  @override
  void initState() {
    _newSnippetBloc = NewSnippetBloc();
    super.initState();
  }

  @override
  void dispose() {
    _newSnippetBloc.close();
    _titleController.dispose();
    _descriptionController.dispose();
    _bodyController.dispose();
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
      body: BlocProvider(
        create: (context) => _newSnippetBloc,
        child: BlocListener(
          bloc: _newSnippetBloc,
          listener: (context, state) {
            if (state is SubmitSnippetFailed) {
              customSnackBar(context, state.error, isSuccess: false);
            } else if (state is SubmitSnippetSuccess) {
              customSnackBar(context, snippetAddedSuccessTitle,
                  isSuccess: true);
            }
          },
          child: SingleChildScrollView(
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
                      controller: _titleController,
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
                      controller: _descriptionController,
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
                  BlocBuilder(
                    bloc: _newSnippetBloc,
                    builder: (context, state) {
                      if (state is LanguageSelectedSuccess) {
                        selectedLanguageItem = state.item;
                      }
                      return Directionality(
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
                                value: selectedLanguageItem,
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.grey,
                                ),
                                underline: Container(),
                                items: _newSnippetBloc.languagesModel.map((e) {
                                  return DropdownMenuItem<SnippetLangModel>(
                                    value: e,
                                    child: Directionality(
                                        textDirection: TextDirection.ltr,
                                        child: Text(e.name)),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  _newSnippetBloc
                                      .add(LanguagesItemOnSelect(value!));
                                },
                              ),
                            ),
                          ),
                        ),
                      );
                    },
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
                        controller: _bodyController,
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
                  BlocBuilder(
                    bloc: _newSnippetBloc,
                    builder: (context, state) {
                      return Center(
                        child: CustomGradientButton(
                          onPressed: () {
                            _newSnippetBloc.add(
                              SubmitSnippet(
                                SnippetModel(
                                  title: _titleController.text,
                                  body: _bodyController.text,
                                  description: _descriptionController.text,
                                  language: selectedLanguageItem.value,
                                ),
                              ),
                            );
                          },
                          child: (state is SubmitSnippetLoading)
                              ? CustomIndicators(
                                  color: whiteColor,
                                )
                              : Text(createSnippet),
                          width: SizeConfig.widthMultiplier * 60,
                          height: 55,
                          borderRadius: 20,
                          colors: [
                            primaryColor,
                            Colors.deepPurpleAccent,
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
