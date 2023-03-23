import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

void main() => runApp(RegisterForm());

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  _RegisterFormData _data = new _RegisterFormData();
  String registrationMessage = "";
  var messageColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Employees App"),
        ),
        body: Container(
          padding: EdgeInsets.all(30),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: validateEmployeeId,
                  onSaved: (value) {
                    this._data.employeeId = value.toString();
                  },
                  decoration: InputDecoration(
                      labelText: 'Employee Id',
                      hintText: 'Enter the employee id here',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      )),
                ),
                SizedBox(height: 10),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: validateEmployeeName,
                  onSaved: (value) {
                    this._data.employeeName = value.toString();
                    print("*********$value");
                  },
                  decoration: InputDecoration(
                      labelText: 'Employee Name',
                      hintText: 'Enter the employee name here',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      )),
                ),
                SizedBox(height: 10),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Email Id is required'),
                    EmailValidator(errorText: "Enter a valid email"),
                  ]),
                  onSaved: (value) {
                    this._data.emailId = value.toString();
                  },
                  decoration: InputDecoration(
                      labelText: 'Email Id',
                      hintText: 'Enter email id here',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    child: Text('Register'), onPressed: registerEmployee),
                SizedBox(
                  height: 10,
                ),
                Text(
                    registrationMessage)
              ],
            ),
          ),
        ),
      ),
    );
  }

  //********* validate on button click**********
  String? validateEmployeeId(String? empId) {
    var empIdRegex = new RegExp("^[A-Z][0-9]{5,6}\$");
    if (empId!.isEmpty || empId == null) {
      return "Employee Id is required";
    } else if (!empIdRegex.hasMatch(empId)) {
      return "Enter proper employee Id";
    } else {
      return null;
    }
  }

  /* function to be triggered on form submission */
  void registerEmployee() {
    if (_formKey.currentState!.validate()) {
      this._formKey.currentState!.save();
      setState(() {
        this.messageColor = Colors.green;
        this.registrationMessage = "Employee Id " +
            _data.employeeId +
            ", Employee Name " +
            _data.employeeName +
            ", Email Id " +
            _data.emailId;
      });
    } else {
      setState(() {
        this.messageColor = Colors.red;
        this.registrationMessage = "Enter valid input for all the fields";
      });
    }
  }


  void validateForm() {
    if (_formKey.currentState!.validate()) {
      this._formKey.currentState!.save();
      print("Registration Successful");
      print(this._data.employeeName);
      setState(() {

      });
    } else {
      print("Invalid input data");
    }
  }

  //********* validate on button click**********

  // validate name (auto validate)
  String? validateEmployeeName(String? empName) {
    var empNameRegex = new RegExp("^[A-Za-z]+([ ][A-Za-z]+)*\$");
    if (empName!.isEmpty || empName == null) {
      return "Employee Name is required";
    } else if (!empNameRegex.hasMatch(empName)) {
      return "Enter proper employee name";
    } else {
      return null;
    }
  }

  // validate email (auto validate)
  String? validateEmail(String? email) {
    var emailRegex = new RegExp("^[A-Za-z][A-Za-z0-9_]+[@][a-z]+(.com)\$");
    if (email!.isEmpty || email == null) {
      return "Employee Name is required";
    } else if (!emailRegex.hasMatch(email)) {
      return "Enter proper employee name";
    } else {
      return null;
    }
  }
}

class _RegisterFormData {
  String employeeId = "";
  String employeeName = "";
  String emailId = "";
}

/*
 GlobalKey i.e. _formKey. This key holds a FormState and can use to retrieve
 the form widget.

 onSaved():  method of TextFormField() method to assign the values to the
 form field properties of _data (an instance of RegisterFormData).

 The autovalidateMode has 3 possible values i.e., always, disabled and onUserInteraction.

always – if autovalidateMode is set to always, the field will be validated even
when the field is not touched i.e. on load of the application and hence this will
display the error message from the beginning itself.

disabled - if autovalidateMode is set to disabled, no auto validation will take place.

onUserInteraction – if autovalidateMode is set to onUserInteraction, the
validations for the input field will be triggered only when the value for that
input field changes.

form_field_validator:
          plugin allows you to add single as well as multiple validators.
          1. EmailValidator :  validator: EmailValidator(errorText: "Enter a valid email"),

              For using the EmailValidator in a TextFormField, you just need to specify one
              mandatory value i.e. for errorText. This errorText will work as a error message
               if the user enters an invalid input to the field.

          2. RequiredValidator : validator: RequiredValidator(errorText: 'Employee Name is required'),

              This validator is used to ensure that the user cannot proceed ahead without
              entering any value into the input field. In simple words, it makes the text
              field mandatory.

          3. MinLengthValidator : validator: MinLengthValidator(6, errorText: 'Employee Id must be atleast 6 characters long'),

              This validator is used to ensure that the user must enter atleast a minimum
              number of characters into the text field.

          4. MultiValidator:
                  validator: MultiValidator([
                  RequiredValidator(errorText: 'Email Id is required'),
                  EmailValidator(errorText: "Enter a valid email"),
             ])
                Using the plugin, you can also add multiple Validators for the same field.
                For this you will have to use MultiValidator() method

 */
