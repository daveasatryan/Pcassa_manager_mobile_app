import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'package:pcassa_retail/error_handler/error_handler.dart';
import 'package:pcassa_retail/router/services.dart';
import 'package:pcassa_retail/store/loading_state/loading_state.dart';
import 'package:secure_shared_preferences/secure_shared_pref.dart';
import '../../constants/app_assets/app_assets.dart';
import '../../constants/app_themes/app_colors/app_colors.dart';
import '../../constants/paddings_constants/padding_constants.dart';
import '../../router/router.gr.dart';
import '../../store/login_state/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Password Obscure
  bool _isObscure = true;

  //isLoading Check
  bool isLoading = false;

  //Login text listener
  final loginController = TextEditingController();

  //Password text listener
  final passwordController = TextEditingController();

  //Login State
  final loginState = LoginState();
@override
void initState() {
  super.initState();
  SecureSharedPref.getInstance().then((value) {
    value.getString("login", isEncrypted: false).then((value) {
      if(value!=null){
       setState(() {
          loginController.text=value;
       });
      }else{
        setState(() {
          loginController.text="";
        });
      }
    });
  });
}
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: GetMaterialApp(
      
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(Assets.logo,
                        height: MediaQuery.of(context).size.height / 7,
                        width: MediaQuery.of(context).size.height / 3.51),
                    Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height / 28.1),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.height /
                                          84.4),
                                  boxShadow: [
                                    BoxShadow(
                                        color:
                                            Color.fromRGBO(143, 148, 251, .2),
                                        blurRadius:
                                            MediaQuery.of(context).size.height /
                                                84.4,
                                        offset: Offset(0, 10))
                                  ]),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding:
                                        const EdgeInsets.all(loginPagePadding),
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color:
                                                    AppColors.appLightBlack))),
                                    child: TextField(
                                      textInputAction: TextInputAction.next,
                                      controller: loginController,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "login".tr(),
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400])),
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        const EdgeInsets.all(loginPagePadding),
                                    child: TextField(
                                      textInputAction: TextInputAction.done,
                                      controller: passwordController,
                                      obscureText: _isObscure,
                                      decoration: InputDecoration(
                                          suffixIcon: IconButton(
                                              icon: Icon(
                                                _isObscure
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,
                                                color: AppColors.appCoral,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  _isObscure = !_isObscure;
                                                });
                                              }),
                                          border: InputBorder.none,
                                          hintText: "password".tr(),
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400])),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 28.1),
                            Container(
                              width: double.infinity,
                              height:
                                  MediaQuery.of(context).size.height / 16.88,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.height / 84.4),
                                color: AppColors.appPurple,
                              ),
                              child: ElevatedButton(
                                onPressed: () async {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  await onEnterTap();

                                  setState(() {
                                    isLoading = false;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  // shape: RoundedRectangleBorder(borderRadius: borderRadius),
                                ),
                                child: isLoading
                                    ? const CircularProgressIndicator(
                                        color: AppColors.appWhite,
                                      )
                                    : Text("enter".tr()),
                              ),
                            ),
                          ]),
                    )
                  ]),
            ),
          ),
        ));
  }

//Authorization Function
  Future<void> onEnterTap() async {
    try {
      loginState.login = loginController.text;
      loginState.password = passwordController.text;
      await loginState.autorisationCheck(context: context);
      
  await saveLoginAndPassword(login:loginController.text);
      router.replace(
        const MainRoute(),
      );
    } catch (e) {
      if (e is DioError) {
        await ErrorHandler.errorModal(
          context: context,
          errorCode: e.response,
        );
        
        passwordController.clear();
        loginState.login = '';
        loginState.password = '';
      } else {
        print(e.toString());
      }
    }
  }
   saveLoginAndPassword( {required String login}) async {
    var pref = await SecureSharedPref.getInstance();
    pref.putString("login", login.toString(),
        isEncrypted: false);
   
  }
}
