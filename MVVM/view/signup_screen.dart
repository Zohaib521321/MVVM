import 'package:first/MVVM/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:first/MVVM/utils/routes/utils.dart';
import 'package:first/MVVM/viewmodel/auth_view_model.dart';
import '../resources/Button.dart';
import 'package:provider/provider.dart';
class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  ValueNotifier<bool> _toggle=ValueNotifier<bool>(true);
  final emailcontroller=TextEditingController();
  final passwordcontroller=TextEditingController();
  final FocusNode emailfocus=FocusNode();
  final FocusNode passfocus=FocusNode();

  @override
  Widget build(BuildContext context) {
    final auth_view=Provider.of<AuthviewModel>(context);
    final height=MediaQuery.of(context).size.height*1;
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///Email
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextFormField(
                focusNode: emailfocus,
                keyboardType: TextInputType.emailAddress,
                controller: emailcontroller,
                decoration: InputDecoration(
                    hintText: "Email",
                    prefixIcon: Icon(Icons.alternate_email)

                ),
                onFieldSubmitted: (value){
                  FocusScope.of(context).requestFocus(passfocus);
                },
              ),
            ),

            ///Password

            ValueListenableBuilder(valueListenable: _toggle, builder: (builder,value,child){
              return  Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextFormField(
                  focusNode: passfocus,
                  controller: passwordcontroller,
                  obscureText: _toggle.value,
                  decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: InkWell(
                          onTap: (){
                            _toggle.value=!_toggle.value;
                          },
                          child:_toggle.value?Icon(Icons.visibility):Icon(Icons.visibility_off))
                  ),
                ),
              );
            }),
            SizedBox(height: height*.08,),
            Rounded_button(
              title: "Signup",
              loading: auth_view.signuploading,
              onpressed: (){
                if (emailcontroller.text.isEmpty) {
                  utils.flushBarErrorMessage("Please enter Email", context);
                }
                else if(passwordcontroller.text.isEmpty){
                  utils.flushBarErrorMessage("Please enter Password", context);
                }
                else if(passwordcontroller.text.length <6){
                  utils.flushBarErrorMessage("Please enter 6 Digit Password", context);
                }
                else {
                  Map data={
                    "email":emailcontroller.text.toString(),
                    "password":passwordcontroller.text.toString(),
                  };
                  auth_view.signupApi(data, context);
                  print("Api hit");
                }

              },
            ),
            SizedBox(height: height*.02,),
            InkWell(
                onTap: (){
                  Navigator.pushNamed(context, RoutesName.login);
                },
                child: Text("Already have account?? Login"))
          ],
        ),
      ),
    );
  }
}
