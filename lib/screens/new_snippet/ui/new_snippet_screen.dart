import 'package:awesome_dropdown/awesome_dropdown.dart';
import 'package:codehub/constant/app_colors/app_colors.dart';
import 'package:codehub/constant/app_strings/app_strings.dart';
import 'package:codehub/constant/app_styles.dart';
import 'package:codehub/global_widgets/custom_gradient_button/custom_gradient_button.dart';
import 'package:codehub/utils/size_config/size_config.dart';
import 'package:flutter/material.dart';

class NewSnippetScreen extends StatefulWidget {
  const NewSnippetScreen({Key? key}) : super(key: key);

  @override
  _NewSnippetScreenState createState() => _NewSnippetScreenState();
}

class _NewSnippetScreenState extends State<NewSnippetScreen> {
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
              sizedBox(SizeConfig.heightMultiplier * 2),
              Text(
                snippetLangTitle,
                style: bodyBoldStyle,
              ),
              // AwesomeDropDown(
              //   isPanDown: _isPanDown,
              //   dropDownList: _list,
              //   dropDownIcon: Icon(
              //     Icons.arrow_drop_down,
              //     color: Colors.grey,
              //     size: 23,
              //   ),
              //   selectedItem: _selectedItem,
              //   onDropDownItemClick: (selectedItem) {
              //     _selectedItem = selectedItem;
              //   },
              //   dropStateChanged: (isOpened) {
              //     _isDropDownOpened = isOpened;
              //     if (!isOpened) {
              //       _isBackPressedOrTouchedOutSide = false;
              //     }
              //   },
              // ),
              sizedBox(SizeConfig.heightMultiplier * 2),
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
