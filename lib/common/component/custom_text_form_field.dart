import 'package:flutter/material.dart';
import 'package:inf_cf/common/const/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final String? errorText;
  final bool obscureText;
  final bool autofocus;
  final ValueChanged<String>? onChanged;

  const CustomTextFormField({

    required this.onChanged,
    this.hintText, 
    this.errorText,
    this.obscureText=false,
    this.autofocus=false,
     Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final baseBorder = OutlineInputBorder(
        borderSide: BorderSide(
      color: INPUT_BORDER_COLOR,
      width: 1.0,
    ));

    return TextFormField(
      cursorColor: PRIMARY_COLOR,
      //비밀번호 
      obscureText: obscureText,
      //앱 시작 시? 혹은 이 화면 들어올 때? 자동으로 이 텍스트필드 활성화.
      autofocus: autofocus,
      //값 변경 시 실행되는 콜백
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(20),
        hintText: hintText,
        errorText: errorText,
        hintStyle: TextStyle(
          color: BODY_TEXT_COLOR,
          fontSize: 14.0,
        ),
        fillColor: INPUT_BG_COLOR,
        filled: true,
        //border= 모든 인풋 상태의 기본 스타일 세팅
        border: baseBorder,
        //선택되지 않은, 글자를 쓸 수 있는 칸의 스타일.
        enabledBorder: baseBorder,
        //선택됐을 때의 스타일.
        focusedBorder: baseBorder.copyWith(
          borderSide: baseBorder.borderSide.copyWith(
            color: PRIMARY_COLOR
          )
        )
      ),
    );
  }
}
