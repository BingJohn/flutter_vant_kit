import 'package:flutter/material.dart';
import '../utils/index.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoField extends StatefulWidget {
  @override
  _DemoField createState() => _DemoField();
}

class _DemoField extends State<DemoField> {
  var testInput1 = TextEditingController();
  var testInput2 = TextEditingController(text: "test");
  var testInput3 = TextEditingController();
  var testInput4 = TextEditingController();
  var testInput5 = TextEditingController();
  var testInput6 = TextEditingController();
  var testInput7 = TextEditingController();
  var testInput8 = TextEditingController();

  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Text(title, style: TextStyle(fontSize: 14, color: Colors.grey)),
    );
  }

  bool isEmptyName(String text) {
    return text == "";
  }

  bool isErrorPhone(String text) {
    String patttern = r'(^([1][3,4,5,6,7,8,9])\d{9}$)';
    return !(new RegExp(patttern).hasMatch(text));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          title("基础用法"),
          CellGroup(
            children: <Widget>[
              Field(
                placeholder: "请输入用户名",
                controller: testInput1,
                onChange: (val) {
                  Utils.toast("text changed: $val");
                },
                onSubmitted: (val) {
                  Utils.toast("submitted: $val");
                },
              )
            ],
          ),
          title("自定义类型"),
          CellGroup(children: <Widget>[
            Field(
              label: "用户名",
              placeholder: "请输入用户名",
              controller: testInput2,
              maxLength: 10,
              clearable: true,
              rightIcon: Icons.help_outline,
              require: true,
              clickRight: () async {
                Utils.toast("Click Right!");
              },
            ),
            Field(
                label: "密码",
                placeholder: "请输入密码",
                controller: testInput3,
                require: true,
                type: "password"),
          ]),
          title("禁用输入框"),
          CellGroup(
            children: <Widget>[
              Field(
                label: "用户名",
                placeholder: "输入框已禁用",
                disabled: true,
                controller: testInput4,
                leftIcon: Icons.perm_identity,
                clickLeft: () async {
                  Utils.toast("click left");
                },
              )
            ],
          ),
          title("错误提示"),
          CellGroup(
            children: <Widget>[
              Field(
                label: "用户名",
                placeholder: "请输入用户名",
                error: isEmptyName(testInput5.text),
                controller: testInput5,
                maxLength: 10,
                clearable: true,
                onChange: (val) {
                  setState(() {
                    testInput5.text = val;
                  });
                },
              ),
              Field(
                label: "手机号",
                placeholder: "请输入手机号",
                controller: testInput6,
                errorMessage: isErrorPhone(testInput6.text) ? "手机号格式错误" : null,
                maxLength: 11,
                clearable: true,
                onChange: (val) {
                  setState(() {
                    testInput6.text = val;
                  });
                },
              ),
            ],
          ),
          title("插入按钮"),
          CellGroup(
            children: <Widget>[
              Field(
                label: "短信验证码",
                placeholder: "请输入短信验证码",
                controller: testInput7,
                right: NButton(
                  text: "发送验证码",
                  type: "primary",
                  size: "small",
                  onClick: () => {},
                ),
              ),
            ],
          ),
          title("显示字数统计"),
          CellGroup(
            children: <Widget>[
              Field(
                  label: "留言",
                  placeholder: "请输入留言",
                  controller: testInput8,
                  type: "textarea",
                  rows: 5,
                  maxLength: 100,
                  showWordLimit: true),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
