// import 'package:flutter/material.dart';

// class FarmerRegistrationWithStepper extends StatefulWidget {
//   const FarmerRegistrationWithStepper({Key? key}) : super(key: key);

//   @override
//   State<FarmerRegistrationWithStepper> createState() => _FarmerRegistrationWithStepperState();
// }

// class _FarmerRegistrationWithStepperState extends State<FarmerRegistrationWithStepper> {
//   int _currentStep = 1;
//   final TextEditingController _nameController = TextEditingController(text: "Favour Mokwenye");
//   final TextEditingController _phoneController = TextEditingController();
//   String? _relationship;
//   final List<String> _relationshipOptions = [
//     'Spouse',
//     'Child',
//     'Parent',
//     'Sibling',
//     'Other'
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: const Text(
//           'Register a new farmer',
//           style: TextStyle(color: Colors.black, fontSize: 18),
//         ),
//         centerTitle: true,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
//           onPressed: () {
//             // Handle back navigation
//           },
//         ),
//       ),
//       body: 

//     var bottom = MediaQuery.of(context).viewInsets.bottom;
//     bottom = max(min(bottom, 80), 0);

//     return 
//     Padding(
//       padding: EdgeInsets.only(bottom: bottom),
//       child: Stack(
//         children: [
//           Container(
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             color: ThemeManager.of(context).colorWhite,
//           ),
//           Positioned.fill(
//               child: Padding(
//             padding: REdgeInsets.symmetric(horizontal: 28.0),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     'register_a_new_farmer'.tr(),
//                     style: TextStyle(
//                       fontSize: 24.sp,
//                       fontFamily: Styles.FONT_TEXT_FAMILY,
//                       color: ThemeManager.of(context).colorTextLight,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         GlobalVariables()
//                             .farmerInformation[state.currentStep]
//                             .tr(),
//                         style: TextStyle(
//                             color: ThemeManager.of(context)
//                                 .colorTextLight!
//                                 .withOpacity(0.7),
//                             fontSize: 14.sp,
//                             fontFamily: Styles.FONT_TEXT_FAMILY,
//                             fontWeight: FontWeight.w400),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           )),
//           Positioned.fill(
//             top: 54,
//             child: Theme(
//               data: ThemeData(
//                 canvasColor: ThemeManager.of(context).colorWhite,
//                 colorScheme:
//                     const ColorScheme.light(primary: Color(0xff38CB89)),
//               ),
//               child: Stepper(
//                 elevation: 0,
//                 controlsBuilder: (context, index) {
//                   return const SizedBox();
//                 },
//                 physics: const ScrollPhysics(),
//                 onStepTapped: (index) {
//                   state.onStepTapped(index);
//                 },
//                 currentStep: state.currentStep,
//                 type: StepperType.horizontal,
//                 steps: [
//                   Step(
//                     title: const Text(''),
//                     isActive: state.currentStep >= 0,
//                     content: Form(
//                         autovalidateMode: AutovalidateMode.onUserInteraction,
//                         key: state.formKeyStep1,
//                         child: SingleChildScrollView(
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               InkWell(
//                                 onTap: () {
//                                   SystemSound.play(SystemSoundType.click);

//                                   // state.openCamera();
//                                   state.getImage(state.imageController);
//                                 },
//                                 child: state.image != null ||
//                                         (state.farmer.photoUrl != null &&
//                                             state.farmer.photoUrl!.isNotEmpty)
//                                     ? Column(children: [
//                                         SizedBox(
//                                           width: 170.w,
//                                           height: 200.h,
//                                           child: FittedBox(
//                                             fit: BoxFit.contain,
//                                             child: Image.file(
//                                               state.image ?? File(""),
//                                             ),
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           height: 10.w,
//                                         ),
//                                         Center(
//                                           child: Container(
//                                             decoration: BoxDecoration(
//                                                 borderRadius:
//                                                     BorderRadius.circular(39.r),
//                                                 color: AppColors.statusColor),
//                                             child: Padding(
//                                               padding: REdgeInsets.symmetric(
//                                                   horizontal: 8.0, vertical: 4),
//                                               child: Text(
//                                                 'change_image'.tr(),
//                                                 style: TextStyle(
//                                                     fontSize: 16.sp,
//                                                     fontWeight: FontWeight.w600,
//                                                     fontFamily:
//                                                         Styles.FONT_TEXT_FAMILY,
//                                                     color: AppColors
//                                                         .colorDeepGreen),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ])
//                                     : Container(
//                                         decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(8.r),
//                                             color: ThemeManager.of(context)
//                                                 .colorDarkBox),
//                                         child: Padding(
//                                           padding: REdgeInsets.symmetric(
//                                               vertical: 33.0, horizontal: 90),
//                                           child: Column(
//                                             mainAxisSize: MainAxisSize.min,
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.center,
//                                             children: [
//                                               SvgPicture.asset(
//                                                 'assets/images/add_pic.svg',
//                                                 height: 70.w,
//                                                 width: 70.w,
//                                                 fit: BoxFit.scaleDown,
//                                               ),
//                                               SizedBox(
//                                                 height: 20.h,
//                                               ),
//                                               Text(
//                                                 'add_farmer_profile_picture'
//                                                     .tr(),
//                                                 textAlign: TextAlign.center,
//                                                 style: TextStyle(
//                                                     color: AppColors
//                                                         .colorDeepGreen,
//                                                     fontSize: 14.sp,
//                                                     fontFamily:
//                                                         Styles.FONT_TEXT_FAMILY,
//                                                     fontWeight:
//                                                         FontWeight.w700),
//                                               )
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                               )
//                             ],
//                           ),
//                         )),
//                   ),
//                   Step(
//                     title: const Text(''),
//                     isActive: state.currentStep >= 1,
//                     content: Form(
//                         autovalidateMode: AutovalidateMode.onUserInteraction,
//                         key: state.formKeyStep2,
//                         child: SingleChildScrollView(
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text('title'.tr(),
//                                       style: Styles.formLabelStyle(context)),
//                                   SizedBox(
//                                     height: 8.0.sp,
//                                   ),
//                                   DropdownButtonFormField(
//                                     dropdownColor:
//                                         ThemeManager.of(context).colordeepGray,
//                                     style: Styles.dropdownTextStyle(context),
//                                     items: GlobalVariables()
//                                         .titleList
//                                         .map((String value) {
//                                       return DropdownMenuItem<String>(
//                                         value: value,
//                                         child: Text(value.tr()),
//                                       );
//                                     }).toList(),
//                                     value: state.selectedTitle,
//                                     decoration:
//                                         Styles.dropdownFormFieldDecoration(
//                                             '', 'select_title'.tr(),
//                                             validationText: '',
//                                             context: context,
//                                             check: false),
//                                     onChanged: (String? value) {
//                                       state.setTitle(value);
//                                     },
//                                     validator:
//                                         FormValidators.dropDownStringValidator,
//                                   ),
//                                   SizedBox(
//                                     height: 30.h,
//                                   ),
//                                 ],
//                               ),
//                               Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text('surname'.tr(),
//                                       style: Styles.formLabelStyle(context)),
//                                   SizedBox(
//                                     height: 8.0.sp,
//                                   ),
//                                   WidgetHelper.textFormField(
//                                     context: context,
//                                     keyboardType: TextInputType.name,
//                                     textInputAction: TextInputAction.next,
//                                     controller: state.surnameController,
//                                     onSubmitted: () => focus.nextFocus(),
//                                     clearText: () =>
//                                         state.surnameController.clear(),
//                                     validator: FormValidators.nameValidator,
//                                     hint: 'Isa',
//                                     onChanged: (value) {
//                                       state.farmer.lastName = value;
//                                     },
//                                   ),
//                                   SizedBox(
//                                     height: 30.h,
//                                   ),
//                                 ],
//                               ),
//                               Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text('first_name'.tr(),
//                                       style: Styles.formLabelStyle(context)),
//                                   SizedBox(
//                                     height: 8.0.sp,
//                                   ),
//                                   WidgetHelper.textFormField(
//                                     context: context,
//                                     controller: state.firstNameController,
//                                     textInputAction: TextInputAction.next,
//                                     clearText: () =>
//                                         state.firstNameController.clear(),
//                                     validator: FormValidators.nameValidator,
//                                     hint: 'Ojo',
//                                     onChanged: (value) {
//                                       state.farmer.firstName = value;
//                                     },
//                                   ),
//                                   SizedBox(
//                                     height: 30.h,
//                                   ),
//                                 ],
//                               ),
//                               Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text('middle_name'.tr(),
//                                       style: Styles.formLabelStyle(context)),
//                                   SizedBox(
//                                     height: 8.0.sp,
//                                   ),
//                                   WidgetHelper.textFormField(
//                                     context: context,
//                                     controller: state.middleNameController,
//                                     textInputAction: TextInputAction.next,
//                                     clearText: () =>
//                                         state.middleNameController.clear(),
//                                     validator: (_) {
//                                       return null;
//                                     },
//                                     hint: 'Muhammed',
//                                     onChanged: (value) {
//                                       state.farmer.middleName = value;
//                                     },
//                                   ),
//                                   SizedBox(
//                                     height: 30.h,
//                                   ),
//                                 ],
//                               ),
//                               Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text('genders'.tr(),
//                                       style: Styles.formLabelStyle(context)),
//                                   SizedBox(
//                                     height: 8.0.sp,
//                                   ),
//                                   DropdownButtonFormField(
//                                     dropdownColor:
//                                         ThemeManager.of(context).colordeepGray,
//                                     style: Styles.dropdownTextStyle(context),
//                                     items: GlobalVariables()
//                                         .genderList
//                                         .map((String value) {
//                                       return DropdownMenuItem<String>(
//                                         value: value,
//                                         child: Text(value).tr(),
//                                       );
//                                     }).toList(),
//                                     value: state.selectedGender,
//                                     decoration:
//                                         Styles.dropdownFormFieldDecoration(
//                                             'select_gender'.tr(),
//                                             'select_gender'.tr(),
//                                             validationText: '',
//                                             context: context,
//                                             check: false),
//                                     onChanged: (String? value) {
//                                       state.setGender(value);
//                                     },
//                                     validator:
//                                         FormValidators.dropDownStringValidator,
//                                   ),
//                                   SizedBox(
//                                     height: 30.h,
//                                   ),
//                                 ],
//                               ),
//                               Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text('marital_status'.tr(),
//                                       style: Styles.formLabelStyle(context)),
//                                   SizedBox(
//                                     height: 8.0.sp,
//                                   ),
//                                   DropdownButtonFormField(
//                                     dropdownColor:
//                                         ThemeManager.of(context).colordeepGray,
//                                     style: Styles.dropdownTextStyle(context),
//                                     items: GlobalVariables()
//                                         .maritalStatusList
//                                         .map((String value) {
//                                       return DropdownMenuItem<String>(
//                                         value: value,
//                                         child: Text(value),
//                                       );
//                                     }).toList(),
//                                     value: state.selectedMaritalStatus,
//                                     decoration:
//                                         Styles.dropdownFormFieldDecoration(
//                                             '', 'select_status'.tr(),
//                                             context: context,
//                                             validationText: '',
//                                             check: false),
//                                     onChanged: (String? value) {
//                                       state.setMaritalStatus(value);
//                                     },
//                                     validator:
//                                         FormValidators.dropDownStringValidator,
//                                   ),
//                                   SizedBox(
//                                     height: 30.h,
//                                   ),
//                                 ],
//                               ),
//                               Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text('language'.tr(),
//                                       style: Styles.formLabelStyle(context)),
//                                   SizedBox(
//                                     height: 8.0.sp,
//                                   ),
//                                   BlocBuilder<UserCubit, UserState>(
//                                       builder: (context, stateBloc) {
//                                     if (stateBloc is UserLoaded) {
//                                       List<String>? language =
//                                           stateBloc.login.languages;

//                                       return DropdownButtonFormField(
//                                         dropdownColor: ThemeManager.of(context)
//                                             .colordeepGray,
//                                         style:
//                                             Styles.dropdownTextStyle(context),
//                                         items: language!.map((String value) {
//                                           return DropdownMenuItem<String>(
//                                             value: value,
//                                             child: Text(value),
//                                           );
//                                         }).toList(),
//                                         value: state.selectedLanguage,
//                                         decoration:
//                                             Styles.dropdownFormFieldDecoration(
//                                                 '', 'select_language'.tr(),
//                                                 context: context,
//                                                 validationText: '',
//                                                 check: false),
//                                         onChanged: (String? value) {
//                                           state.setLanguage(value);
//                                         },
//                                         validator: FormValidators
//                                             .dropDownStringValidator,
//                                       );
//                                     }
//                                     return const SizedBox();
//                                   }),
//                                   SizedBox(
//                                     height: 30.h,
//                                   ),
//                                 ],
//                               ),
//                               Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text('date_of_birth'.tr(),
//                                       style: Styles.formLabelStyle(context)),
//                                   SizedBox(
//                                     height: 8.0.sp,
//                                   ),
//                                   InkWell(
//                                     onTap: () => state.selectDateOfBirth(),
//                                     child: IgnorePointer(
//                                       child: TextFormField(
//                                         style: TextStyle(
//                                           fontFamily: Styles.FONT_TEXT_FAMILY,
//                                           color: ThemeManager.of(context)
//                                               .colorTextLight,
//                                           fontSize: 15.sp,
//                                         ),
//                                         controller: state.dateController,
//                                         validator:
//                                             FormValidators.stringValidator,
//                                         keyboardType: TextInputType.number,
//                                         textInputAction: TextInputAction.next,
//                                         enabled: true,
//                                         onTap: () {},
//                                         onChanged: (value) {
//                                           state.farmer.dob = value;
//                                         },
//                                         decoration: InputDecoration(
//                                           isDense: true,
//                                           hintText: 'dd/mm/yyyy',
//                                           hintStyle: TextStyle(
//                                               fontSize: 15.sp,
//                                               color: ThemeManager.of(context)
//                                                   .colorSubText,
//                                               fontFamily:
//                                                   Styles.FONT_TEXT_FAMILY,
//                                               fontWeight: FontWeight.w400,
//                                               height: 1.5,
//                                               fontStyle: FontStyle.normal),
//                                           suffixIcon: const Icon(
//                                               Icons.calendar_today_outlined),
//                                           border: OutlineInputBorder(
//                                               borderSide: BorderSide(
//                                                   color:
//                                                       ThemeManager.of(context)
//                                                           .colorSubText!)),
//                                           enabledBorder: OutlineInputBorder(
//                                               borderSide: BorderSide(
//                                                   color:
//                                                       ThemeManager.of(context)
//                                                           .colorSubText!)),
//                                           focusedBorder: OutlineInputBorder(
//                                               borderSide: BorderSide(
//                                                   color:
//                                                       ThemeManager.of(context)
//                                                           .colorSubText!)),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 30.h,
//                                   ),
//                                 ],
//                               ),
//                               Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text('phone_number'.tr(),
//                                       style: Styles.formLabelStyle(context)),
//                                   SizedBox(
//                                     height: 8.0.sp,
//                                   ),
//                                   BlocBuilder<UserCubit, UserState>(
//                                       builder: (context, stateBloc) {
//                                     if (stateBloc is UserLoaded) {
//                                       return TextFormField(
//                                         style: TextStyle(
//                                           fontFamily: Styles.FONT_TEXT_FAMILY,
//                                           color: ThemeManager.of(context)
//                                               .colorTextLight,
//                                           fontSize: 15.sp,
//                                         ),
//                                         controller: state.phoneController,
//                                         keyboardType: TextInputType.phone,
//                                         validator: FormValidators.nameValidator,
//                                         textInputAction: TextInputAction.next,
//                                         onChanged: (value) {
//                                           state
//                                               .validateAndSetPhoneNumber(value);
//                                         },
//                                         decoration: InputDecoration(
//                                           hintText: '0800000000',
//                                           hintStyle: TextStyle(
//                                               fontSize: 15.sp,
//                                               color: AppColors.xTextFieldHint,
//                                               fontFamily:
//                                                   Styles.FONT_TEXT_FAMILY,
//                                               fontWeight: FontWeight.w400,
//                                               height: 1.5,
//                                               fontStyle: FontStyle.normal),
//                                           isDense: true,
//                                           prefixIcon: CountryCodePicker(
//                                             textStyle: TextStyle(
//                                                 color: ThemeManager.of(context)
//                                                     .colorTextLight),
//                                             onChanged: (value) {
//                                               state.onPhoneCodeSelected(value);
//                                               state.validateAndSetPhoneNumber(
//                                                   state.phoneController.text);
//                                             },
//                                             // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
//                                             initialSelection: GlobalVariables()
//                                                     .currentUser!
//                                                     .countryCode_2 ??
//                                                 'NG',

//                                             showFlagDialog: true,
//                                             comparator: (a, b) =>
//                                                 b.name!.compareTo(a.name!),
//                                             //Get the country information relevant to the initial selection
//                                             //onInit: (code) => print("on init ${code.name} ${code.dialCode} ${code.name}"),
//                                           ),
//                                           border: OutlineInputBorder(
//                                               borderSide: BorderSide(
//                                                   color:
//                                                       ThemeManager.of(context)
//                                                           .colorSubText!)),
//                                           enabledBorder: OutlineInputBorder(
//                                               borderSide: BorderSide(
//                                                   color:
//                                                       ThemeManager.of(context)
//                                                           .colorSubText!)),
//                                           focusedBorder: OutlineInputBorder(
//                                               borderSide: BorderSide(
//                                                   color:
//                                                       ThemeManager.of(context)
//                                                           .colorSubText!)),
//                                         ),
//                                       );
//                                     }
//                                     return TextFormField(
//                                       style: TextStyle(
//                                         fontFamily: Styles.FONT_TEXT_FAMILY,
//                                         color: ThemeManager.of(context)
//                                             .colorTextLight,
//                                         fontSize: 15.sp,
//                                       ),
//                                       controller: state.phoneController,
//                                       keyboardType: TextInputType.phone,
//                                       validator: FormValidators.nameValidator,
//                                       textInputAction: TextInputAction.next,
//                                       onChanged: (value) {
//                                         state.validateAndSetPhoneNumber(value);
//                                       },
//                                       decoration: InputDecoration(
//                                         hintText: '0800000000',
//                                         hintStyle: TextStyle(
//                                             fontSize: 15.sp,
//                                             color: AppColors.xTextFieldHint,
//                                             fontFamily: Styles.FONT_TEXT_FAMILY,
//                                             fontWeight: FontWeight.w400,
//                                             height: 1.5,
//                                             fontStyle: FontStyle.normal),
//                                         isDense: true,
//                                         prefixIcon: CountryCodePicker(
//                                           textStyle: TextStyle(
//                                               color: ThemeManager.of(context)
//                                                   .colorTextLight),
//                                           onChanged: (value) {
//                                             state.onPhoneCodeSelected(value);
//                                             state.validateAndSetPhoneNumber(
//                                                 state.phoneController.text);
//                                           },
//                                           // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
//                                           initialSelection: GlobalVariables()
//                                                   .currentUser!
//                                                   .countryCode_2 ??
//                                               'NG',
//                                           showFlagDialog: true,
//                                           comparator: (a, b) =>
//                                               b.name!.compareTo(a.name!),
//                                           //Get the country information relevant to the initial selection
//                                           //onInit: (code) => print("on init ${code.name} ${code.dialCode} ${code.name}"),
//                                         ),
//                                         border: const OutlineInputBorder(),
//                                       ),
//                                     );
//                                   }),
//                                   SizedBox(
//                                     height: 30.h,
//                                   ),
//                                 ],
//                               ),
//                               Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text('id_type'.tr(),
//                                       style: Styles.formLabelStyle(context)),
//                                   SizedBox(
//                                     height: 8.0.sp,
//                                   ),
//                                   BlocBuilder<UserCubit, UserState>(
//                                       builder: (context, stateBloc) {
//                                     if (stateBloc is UserLoaded) {
//                                       List<String>? idType =
//                                           stateBloc.login.countryCode_3 == 'NGA'
//                                               ? GlobalVariables().idCardLists
//                                               : (stateBloc.login
//                                                           .countryCode_3 ==
//                                                       'UGA'
//                                                   ? GlobalVariables()
//                                                       .ugandaIdCardList
//                                                   : (stateBloc.login
//                                                               .countryCode_3 ==
//                                                           'CIV'
//                                                       ? GlobalVariables()
//                                                           .ivoryCoastIdCardList
//                                                       : GlobalVariables()
//                                                           .kenyaIdCardList));

//                                       return DropdownButtonFormField(
//                                         dropdownColor: ThemeManager.of(context)
//                                             .colordeepGray,
//                                         style:
//                                             Styles.dropdownTextStyle(context),
//                                         items: idType.map((String value) {
//                                           return DropdownMenuItem<String>(
//                                             value: value,
//                                             child: Text(value),
//                                           );
//                                         }).toList(),
//                                         value: state.selectedIdCard,
//                                         decoration:
//                                             Styles.dropdownFormFieldDecoration(
//                                                 '', 'Select ID type',
//                                                 context: context,
//                                                 validationText: '',
//                                                 check: false),
//                                         onChanged: (String? value) {
//                                           state.setIDType(value);
//                                         },
//                                         validator: FormValidators
//                                             .dropDownStringValidator,
//                                       );
//                                     }
//                                     return const SizedBox();
//                                   }),
//                                   SizedBox(
//                                     height: 30.h,
//                                   ),
//                                 ],
//                               ),
//                               Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text('id_card_number'.tr(),
//                                       style: Styles.formLabelStyle(context)),
//                                   SizedBox(
//                                     height: 8.0.sp,
//                                   ),
//                                   WidgetHelper.textFormField(
//                                       controller: state.idNumberController,
//                                       context: context,
//                                       textInputAction: TextInputAction.next,
//                                       keyboardType: TextInputType.number,
//                                       clearText: () =>
//                                           state.idNumberController.clear(),
//                                       validator: FormValidators.stringValidator,
//                                       hint: '0800000000',
//                                       onChanged: (value) {
//                                         state.farmer.passportNumber = value;
//                                       }),
//                                   SizedBox(
//                                     height: 30.h,
//                                   ),
//                                 ],
//                               ),
//                               Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text('upload_id_card'.tr(),
//                                       style: Styles.formLabelStyle(context)),
//                                   SizedBox(
//                                     height: 8.0.sp,
//                                   ),
//                                   InkWell(
//                                       onTap: () {
//                                         // state.onSelectImages(
//                                         //     state.passportImageController);
//                                         state.getImage(
//                                             state.passportImageController);
//                                       },
//                                       child: state.passportImage != null ||
//                                               (state.farmer.passportUrl !=
//                                                       null &&
//                                                   state.farmer.passportUrl!
//                                                       .isNotEmpty)
//                                           ? Column(children: [
//                                               Image.file(
//                                                 state.passportImage ?? File(""),
//                                                 width: 300,
//                                                 height: 160,
//                                                 fit: BoxFit.cover,
//                                               ),
//                                               SizedBox(
//                                                 height: 10.w,
//                                               ),
//                                               Center(
//                                                   child: Text(
//                                                 'change_image'.tr(),
//                                                 style: TextStyle(
//                                                     decoration: TextDecoration
//                                                         .underline,
//                                                     color: Colors.green,
//                                                     fontStyle: FontStyle.italic,
//                                                     fontFamily:
//                                                         Styles.FONT_TEXT_FAMILY,
//                                                     fontWeight: FontWeight.w600,
//                                                     fontSize: 16.sp),
//                                               ))
//                                             ])
//                                           : DottedBorder(
//                                               color: const Color(
//                                                   0xff1D925D), //color of dotted/dash line
//                                               radius: Radius.circular(8.r),
//                                               strokeWidth:
//                                                   2, //thickness of dash/dots
//                                               dashPattern: const [10, 6],
//                                               child: Container(
//                                                 decoration: BoxDecoration(
//                                                   color: AppColors.colorFloat
//                                                       .withOpacity(0.1),
//                                                   borderRadius:
//                                                       BorderRadius.circular(
//                                                           8.r),
//                                                 ),
//                                                 child: Padding(
//                                                   padding:
//                                                       REdgeInsets.symmetric(
//                                                           vertical: 25.0),
//                                                   child: Center(
//                                                     child: Text(
//                                                       'add_image'.tr(),
//                                                       style: TextStyle(
//                                                         fontSize: 16.sp,
//                                                         color: AppColors
//                                                             .xTextFieldHint,
//                                                         fontWeight:
//                                                             FontWeight.w400,
//                                                         height: 1.5,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             )),
//                                   SizedBox(
//                                     height: 30.h,
//                                   ),
//                                 ],
//                               ),
//                               Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text("next_of_kin's_name".tr(),
//                                       style: Styles.formLabelStyle(context)),
//                                   SizedBox(
//                                     height: 8.0.sp,
//                                   ),
//                                   WidgetHelper.textFormField(
//                                       validator: FormValidators.nameValidator,
//                                       context: context,
//                                       clearText: () =>
//                                           state.nokNameController.clear(),
//                                       textInputAction: TextInputAction.next,
//                                       controller: state.nokNameController,
//                                       hint: 'Somto Lily',
//                                       onChanged: (value) {
//                                         state.farmer.nokName = value;
//                                       }),
//                                   SizedBox(
//                                     height: 30.h,
//                                   ),
//                                 ],
//                               ),
//                               Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text("next_of_kin's_relationship".tr(),
//                                       style: Styles.formLabelStyle(context)),
//                                   SizedBox(
//                                     height: 8.0.sp,
//                                   ),
//                                   DropdownButtonFormField(
//                                     dropdownColor:
//                                         ThemeManager.of(context).colordeepGray,
//                                     style: Styles.dropdownTextStyle(context),
//                                     items: GlobalVariables()
//                                         .nokRelationshipList
//                                         .map((String value) {
//                                       return DropdownMenuItem<String>(
//                                         value: value,
//                                         child: Text(value).tr(),
//                                       );
//                                     }).toList(),
//                                     value: state.selectedNokRelationship,
//                                     decoration:
//                                         Styles.dropdownFormFieldDecoration(
//                                             '', 'relationship'.tr(),
//                                             context: context,
//                                             validationText: '',
//                                             check: false),
//                                     onChanged: (String? value) {
//                                       state.setNokRelationship(value);
//                                     },
//                                     validator:
//                                         FormValidators.dropDownStringValidator,
//                                   ),
//                                   SizedBox(
//                                     height: 30.h,
//                                   ),
//                                 ],
//                               ),
//                               Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text("next_of_kin's_phone".tr(),
//                                       style: Styles.formLabelStyle(context)),
//                                   SizedBox(
//                                     height: 8.0.sp,
//                                   ),
//                                   BlocBuilder<UserCubit, UserState>(
//                                       builder: (context, stateBloc) {
//                                     if (stateBloc is UserLoaded) {
//                                       return TextFormField(
//                                         style: TextStyle(
//                                           fontFamily: Styles.FONT_TEXT_FAMILY,
//                                           color: ThemeManager.of(context)
//                                               .colorTextLight,
//                                           fontSize: 15.sp,
//                                         ),
//                                         controller: state.nokPhoneController,
//                                         keyboardType: TextInputType.phone,
//                                         validator: FormValidators.nameValidator,
//                                         textInputAction: TextInputAction.next,
//                                         onChanged: (value) {
//                                           state.validateAndSetNOKPhoneNumber(
//                                               value);
//                                         },
//                                         decoration: InputDecoration(
//                                           isDense: true,
//                                           hintText: '0800000000',
//                                           hintStyle: TextStyle(
//                                               fontSize: 16.sp,
//                                               fontFamily:
//                                                   Styles.FONT_TEXT_FAMILY,
//                                               color: AppColors.xTextFieldHint,
//                                               fontWeight: FontWeight.w400,
//                                               height: 1.5,
//                                               fontStyle: FontStyle.normal),
//                                           prefixIcon: CountryCodePicker(
//                                             textStyle: TextStyle(
//                                                 color: ThemeManager.of(context)
//                                                     .colorTextLight),
//                                             onChanged: (value) {
//                                               state.onPhoneCodeSelected(value);
//                                             },
//                                             initialSelection: GlobalVariables()
//                                                     .currentUser!
//                                                     .countryCode_2 ??
//                                                 'NG',
//                                             showFlagDialog: true,
//                                             comparator: (a, b) =>
//                                                 b.name!.compareTo(a.name!),
//                                           ),
//                                           border: OutlineInputBorder(
//                                               borderSide: BorderSide(
//                                                   color:
//                                                       ThemeManager.of(context)
//                                                           .colorSubText!)),
//                                           focusedBorder: OutlineInputBorder(
//                                               borderSide: BorderSide(
//                                                   color:
//                                                       ThemeManager.of(context)
//                                                           .colorSubText!)),
//                                           enabledBorder: OutlineInputBorder(
//                                               borderSide: BorderSide(
//                                                   color:
//                                                       ThemeManager.of(context)
//                                                           .colorSubText!)),
//                                         ),
//                                       );
//                                     }
//                                     return TextFormField(
//                                       style: TextStyle(
//                                         fontFamily: Styles.FONT_TEXT_FAMILY,
//                                         color: ThemeManager.of(context)
//                                             .colorTextLight,
//                                         fontSize: 15.sp,
//                                       ),
//                                       controller: state.nokPhoneController,
//                                       keyboardType: TextInputType.phone,
//                                       validator: FormValidators.nameValidator,
//                                       textInputAction: TextInputAction.next,
//                                       onChanged: (value) {
//                                         state.validateAndSetNOKPhoneNumber(
//                                             value);
//                                       },
//                                       decoration: InputDecoration(
//                                         isDense: true,
//                                         hintText: '0800000000',
//                                         hintStyle: TextStyle(
//                                             fontSize: 16.sp,
//                                             color: AppColors.xTextFieldHint,
//                                             fontWeight: FontWeight.w400,
//                                             height: 1.5,
//                                             fontStyle: FontStyle.normal),
//                                         prefixIcon: CountryCodePicker(
//                                           textStyle: TextStyle(
//                                               color: ThemeManager.of(context)
//                                                   .colorTextLight),
//                                           onChanged: (value) {
//                                             state.onPhoneCodeSelected(value);
//                                           },
//                                           // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
//                                           initialSelection: GlobalVariables()
//                                                   .currentUser!
//                                                   .countryCode_2 ??
//                                               'NG',
//                                           showFlagDialog: true,
//                                           comparator: (a, b) =>
//                                               b.name!.compareTo(a.name!),
//                                           //Get the country information relevant to the initial selection
//                                           //onInit: (code) => print("on init ${code.name} ${code.dialCode} ${code.name}"),
//                                         ),
//                                         border: OutlineInputBorder(
//                                             borderSide: BorderSide(
//                                                 color: ThemeManager.of(context)
//                                                     .colorSubText!)),
//                                         focusedBorder: OutlineInputBorder(
//                                             borderSide: BorderSide(
//                                                 color: ThemeManager.of(context)
//                                                     .colorSubText!)),
//                                         enabledBorder: OutlineInputBorder(
//                                             borderSide: BorderSide(
//                                                 color: ThemeManager.of(context)
//                                                     .colorSubText!)),
//                                       ),
//                                     );
//                                   }),
//                                   SizedBox(
//                                     height: 30.h,
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 20.h,
//                               )
//                             ],
//                           ),
//                         )),
//                   ),
//                   Step(
//                     title: const Text(''),
//                     isActive: state.currentStep >= 2,
//                     content: Form(
//                         autovalidateMode: AutovalidateMode.onUserInteraction,
//                         key: state.formKeyStep3,
//                         child: SingleChildScrollView(
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text('house_address'.tr(),
//                                       style: Styles.formLabelStyle(context)),
//                                   SizedBox(
//                                     height: 8.0.sp,
//                                   ),
//                                   WidgetHelper.textFormField(
//                                       validator: FormValidators.stringValidator,
//                                       clearText: () =>
//                                           state.houseAddressController.clear(),
//                                       autoFocus: false,
//                                       context: context,
//                                       textInputAction: TextInputAction.next,
//                                       controller: state.houseAddressController,
//                                       hint: 'house_address'.tr(),
//                                       onChanged: (value) {
//                                         state.farmer.address = value;
//                                       }),
//                                   SizedBox(
//                                     height: 30.h,
//                                   ),
//                                 ],
//                               ),
//                               Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text('farmer_house'.tr(),
//                                       textAlign: TextAlign.left,
//                                       style: Styles.formLabelStyle(context)),
//                                   SizedBox(
//                                     height: 8.0.sp,
//                                   ),
//                                   state.houseLocations.isEmpty
//                                       ? Stack(
//                                           children: [
//                                             SizedBox(
//                                               width: MediaQuery.of(context)
//                                                   .size
//                                                   .width,
//                                               height: 366.h,
//                                               child: GoogleMap(
//                                                 //given camera position
//                                                 initialCameraPosition:
//                                                     state.currentCameraPosition,
//                                                 // on below line we have given map type
//                                                 mapType: MapType.normal,
//                                                 // on below line we have enabled location
//                                                 myLocationEnabled: true,
//                                                 myLocationButtonEnabled: true,
//                                                 // on below line we have enabled compass location
//                                                 compassEnabled: false,
//                                                 zoomControlsEnabled: true,
//                                                 zoomGesturesEnabled: true,

//                                                 //mapToolbarEnabled: false,
//                                                 //scrollGesturesEnabled: true,
//                                                 //liteModeEnabled: true,
//                                                 // on below line we have added polygon
//                                                 polygons: state
//                                                     .housePolygonsBasedOnHouseLocations,
//                                                 // displayed google map
//                                                 onMapCreated:
//                                                     (GoogleMapController
//                                                         controller) {
//                                                   state.mapController
//                                                       .complete(controller);
//                                                 },
//                                               ),
//                                             ),
//                                             Positioned(
//                                                 top: 10,
//                                                 child: InkWell(
//                                                   onTap: () {
//                                                     state.onAddHouseLocation();
//                                                   },
//                                                   child: Container(
//                                                     width:
//                                                         MediaQuery.of(context)
//                                                             .size
//                                                             .width,
//                                                     decoration:
//                                                         const BoxDecoration(
//                                                             color:
//                                                                 Colors.white),
//                                                     child: Padding(
//                                                       padding:
//                                                           REdgeInsets.symmetric(
//                                                               horizontal: 11.0,
//                                                               vertical: 10),
//                                                       child: Row(
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .start,
//                                                         children: [
//                                                           SvgPicture.asset(
//                                                             'assets/images/small_map.svg',
//                                                             width: 16.w,
//                                                             height: 16.w,
//                                                             fit: BoxFit.cover,
//                                                           ),
//                                                           SizedBox(
//                                                             width: 10.w,
//                                                           ),
//                                                           Text(
//                                                             '${state.houseLocations.length} locations added',
//                                                             style: TextStyle(
//                                                                 color: const Color(
//                                                                     0xff54565B),
//                                                                 fontFamily: Styles
//                                                                     .FONT_TEXT_FAMILY,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .w400,
//                                                                 fontSize:
//                                                                     11.sp),
//                                                           ),
//                                                           // const Spacer(),
//                                                           SizedBox(
//                                                             width: 40.w,
//                                                           ),
//                                                           Text(
//                                                             'click_to_add_house_location'
//                                                                 .tr(),
//                                                             style: TextStyle(
//                                                                 color: const Color(
//                                                                     0xff1D925D),
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .w700,
//                                                                 fontFamily: Styles
//                                                                     .FONT_TEXT_FAMILY,
//                                                                 fontSize:
//                                                                     14.sp),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 )),
//                                           ],
//                                         )
//                                       : ListView.builder(
//                                           itemCount:
//                                               state.houseLocations.length,
//                                           shrinkWrap: true,
//                                           itemBuilder: (context, index) {
//                                             return Column(
//                                               mainAxisSize: MainAxisSize.min,
//                                               children: [
//                                                 Container(
//                                                   decoration:
//                                                       const BoxDecoration(
//                                                           color: Color(
//                                                               0xffF5F6F7)),
//                                                   child: Padding(
//                                                     padding:
//                                                         REdgeInsets.symmetric(
//                                                             horizontal: 12.0,
//                                                             vertical: 14.0),
//                                                     child: Row(
//                                                       children: [
//                                                         SvgPicture.asset(
//                                                           'assets/images/maps.svg',
//                                                           height: 36.w,
//                                                           width: 36.w,
//                                                           fit: BoxFit.scaleDown,
//                                                         ),
//                                                         SizedBox(
//                                                           width: 9.w,
//                                                         ),
//                                                         Column(
//                                                           mainAxisSize:
//                                                               MainAxisSize.min,
//                                                           crossAxisAlignment:
//                                                               CrossAxisAlignment
//                                                                   .start,
//                                                           children: [
//                                                             Text(
//                                                               'House Location added',
//                                                               // 'Farm Location ${index + 1}',
//                                                               style: TextStyle(
//                                                                 fontSize: 14.sp,
//                                                                 fontFamily: Styles
//                                                                     .FONT_TEXT_FAMILY,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .w700,
//                                                                 color: const Color(
//                                                                     0xff111827),
//                                                               ),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                         const Spacer(),
//                                                         Column(
//                                                           mainAxisSize:
//                                                               MainAxisSize.min,
//                                                           crossAxisAlignment:
//                                                               CrossAxisAlignment
//                                                                   .end,
//                                                           children: [
//                                                             InkWell(
//                                                               onTap: () => state
//                                                                   .clearHouseLocation(),
//                                                               child: SvgPicture
//                                                                   .asset(
//                                                                 'assets/images/cancel.svg',
//                                                                 height: 24.w,
//                                                                 width: 24.w,
//                                                                 fit: BoxFit
//                                                                     .scaleDown,
//                                                               ),
//                                                             ),
//                                                           ],
//                                                         )
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 SizedBox(
//                                                   height: 10.h,
//                                                 )
//                                               ],
//                                             );
//                                           },
//                                         ),
//                                   SizedBox(
//                                     height: 30.h,
//                                   ),
//                                 ],
//                               ),
//                               Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                       '${GlobalVariables().currentUser!.firstSubDivision} of Residence',
//                                       style: Styles.formLabelStyle(context)),
//                                   SizedBox(
//                                     height: 8.0.sp,
//                                   ),
//                                   TypeAheadFormField(
//                                     key: state.stateKey,
//                                     suggestionsBoxDecoration:
//                                         SuggestionsBoxDecoration(
//                                             color: ThemeManager.of(context)
//                                                 .colordeepGray,
//                                             elevation: 4,
//                                             constraints: BoxConstraints(
//                                               maxHeight: 250.0.h,
//                                             )),
//                                     hideSuggestionsOnKeyboardHide: false,
//                                     autoFlipDirection: true,
//                                     textFieldConfiguration:
//                                         TextFieldConfiguration(
//                                       autofocus: false,
//                                       controller:
//                                           state.stateOfResidenceController,
//                                       style:
//                                           Styles.x14dp_4A4A4A(14.0.sp, context),
//                                       enabled: true,
//                                       decoration:
//                                           Styles.textFormFieldDecoration('', "",
//                                               validationText: '',
//                                               context: context,
//                                               check: false, clearText: () {
//                                         state.stateOfResidenceController
//                                             .clear();
//                                         state.lgaController.clear();
//                                         state.selectedStateOfResidence = null;
//                                         state.selectedLgaResidence = null;
//                                       }),
//                                       textInputAction: TextInputAction.next,
//                                       onChanged: (text) {
//                                         if (text.isEmpty) {
//                                           state.selectedStateOfResidence = null;
//                                         }
//                                       },
//                                     ),
//                                     suggestionsCallback: (pattern) async {
//                                       return await state
//                                           .onSearchStates(pattern);
//                                     },
//                                     itemBuilder: (context, States? suggestion) {
//                                       return ListTile(
//                                         title: Text(
//                                           suggestion!.name!,
//                                           style: Styles.normal_000000(
//                                               14.sp, context),
//                                         ),
//                                       );
//                                     },
//                                     errorBuilder:
//                                         (BuildContext context, Object? error) =>
//                                             Container(
//                                       padding: REdgeInsets.all(7),
//                                       margin: REdgeInsets.only(left: 10),
//                                       child: Text(
//                                         '$error',
//                                       ),
//                                     ),
//                                     onSuggestionSelected: (States? suggestion) {
//                                       state.stateOfResidenceController.text =
//                                           (suggestion!.name!);
//                                       state.selectedStateOfResidence =
//                                           suggestion.pk;
//                                       state.setStateResidence(suggestion.pk);
//                                     },
//                                     hideOnEmpty: true,
//                                     autovalidateMode:
//                                         AutovalidateMode.onUserInteraction,
//                                     validator: (text) {
//                                       if (text == null || text.isEmpty) {
//                                         return 'required'.tr();
//                                       }
//                                       if (state.selectedStateOfResidence ==
//                                               null ||
//                                           state.selectedStateOfResidence! <=
//                                               0) {
//                                         return 'select_suggestions'.tr();
//                                       }
//                                       return null;
//                                     },
//                                   ),
//                                   SizedBox(
//                                     height: 30.h,
//                                   ),
//                                 ],
//                               ),
//                               Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                       '${GlobalVariables().currentUser!.secondSubDivision} of Residence',
//                                       style: Styles.formLabelStyle(context)),
//                                   SizedBox(
//                                     height: 8.0.sp,
//                                   ),
//                                   TypeAheadFormField(
//                                     key: state.lgaResidenceKey,
//                                     suggestionsBoxDecoration:
//                                         SuggestionsBoxDecoration(
//                                             color: ThemeManager.of(context)
//                                                 .colordeepGray,
//                                             elevation: 4.0,
//                                             constraints: BoxConstraints(
//                                               maxHeight: 250.0.h,
//                                             )),
//                                     hideSuggestionsOnKeyboardHide: false,
//                                     autoFlipDirection: true,
//                                     textFieldConfiguration:
//                                         TextFieldConfiguration(
//                                       autofocus: false,
//                                       controller: state.lgaController,
//                                       style:
//                                           Styles.x14dp_4A4A4A(14.0.sp, context),
//                                       enabled: state.selectedStateOfResidence !=
//                                                   null ||
//                                               state.selectedStateOfResidence !=
//                                                   0
//                                           ? true
//                                           : false,
//                                       decoration:
//                                           Styles.textFormFieldDecoration('', "",
//                                               validationText: '',
//                                               context: context,
//                                               check: false, clearText: () {
//                                         state.lgaController.clear();
//                                         state.selectedLgaResidence = null;
//                                       }),
//                                       textInputAction: TextInputAction.next,
//                                       onChanged: (text) {
//                                         if (text.isEmpty) {
//                                           state.selectedLgaResidence = null;
//                                         }
//                                       },
//                                     ),
//                                     suggestionsCallback: (pattern) async {
//                                       return await state.onSearchLga(
//                                           state.selectedStateOfResidence,
//                                           pattern);
//                                     },
//                                     itemBuilder: (context, Lga? suggestion) {
//                                       return ListTile(
//                                         title: Text(
//                                           suggestion!.name!,
//                                           style: Styles.normal_000000(
//                                               14.sp, context),
//                                         ),
//                                       );
//                                     },
//                                     errorBuilder:
//                                         (BuildContext context, Object? error) =>
//                                             Container(
//                                       padding: REdgeInsets.all(7),
//                                       margin: REdgeInsets.only(left: 10),
//                                       child: Text(
//                                         '$error',
//                                       ),
//                                     ),
//                                     onSuggestionSelected: (Lga? suggestion) {
//                                       state.lgaController.text =
//                                           suggestion!.name!;
//                                       state.selectedLgaResidence =
//                                           suggestion.pk;
//                                       state.farmer.lgaOfResidence =
//                                           suggestion.pk;
//                                     },
//                                     hideOnEmpty: true,
//                                     autovalidateMode:
//                                         AutovalidateMode.onUserInteraction,
//                                     validator: (text) {
//                                       if (text == null || text.isEmpty) {
//                                         return 'required'.tr();
//                                       }
//                                       if (state.selectedLgaResidence == null ||
//                                           state.selectedLgaResidence! <= 0) {
//                                         return 'select_suggestions'.tr();
//                                       }
//                                       return null;
//                                     },
//                                   ),
//                                   SizedBox(
//                                     height: 30.h,
//                                   ),
//                                 ],
//                               ),
//                               Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                       '${GlobalVariables().currentUser!.firstSubDivision} of Origin',
//                                       style: Styles.formLabelStyle(context)),
//                                   SizedBox(
//                                     height: 8.0.sp,
//                                   ),
//                                   TypeAheadFormField(
//                                     key: state.stateOfOriginKey,
//                                     suggestionsBoxDecoration:
//                                         SuggestionsBoxDecoration(
//                                             color: ThemeManager.of(context)
//                                                 .colordeepGray,
//                                             elevation: 4.0,
//                                             constraints: BoxConstraints(
//                                               maxHeight: 250.0.h,
//                                             )),
//                                     hideSuggestionsOnKeyboardHide: false,
//                                     autoFlipDirection: true,
//                                     textFieldConfiguration:
//                                         TextFieldConfiguration(
//                                       autofocus: false,
//                                       controller: state.stateOfOriginController,
//                                       style:
//                                           Styles.x14dp_4A4A4A(14.0.sp, context),
//                                       enabled: true,
//                                       decoration:
//                                           Styles.textFormFieldDecoration('', "",
//                                               validationText: '',
//                                               context: context,
//                                               check: false, clearText: () {
//                                         state.stateOfOriginController.clear();
//                                         state.lgaOriginController.clear();
//                                         state.selectedStateOfOrigin = null;
//                                         state.selectedLgaOrigin = null;
//                                       }),
//                                       textInputAction: TextInputAction.next,
//                                       onChanged: (text) {
//                                         if (text.isEmpty) {
//                                           state.selectedStateOfOrigin = null;
//                                         }
//                                       },
//                                     ),
//                                     suggestionsCallback: (pattern) async {
//                                       return await state
//                                           .onSearchStateOfOrigin(pattern);
//                                     },
//                                     itemBuilder: (context, States? suggestion) {
//                                       return ListTile(
//                                         title: Text(
//                                           suggestion!.name!,
//                                           style: Styles.normal_000000(
//                                               14.sp, context),
//                                         ),
//                                       );
//                                     },
//                                     errorBuilder:
//                                         (BuildContext context, Object? error) =>
//                                             Container(
//                                       padding: REdgeInsets.all(7),
//                                       margin: REdgeInsets.only(left: 10),
//                                       child: Text(
//                                         '$error',
//                                       ),
//                                     ),
//                                     onSuggestionSelected: (States? suggestion) {
//                                       state.stateOfOriginController.text =
//                                           (suggestion!.name!);
//                                       state.selectedStateOfOrigin =
//                                           suggestion.pk;
//                                       state.setStateOrigin(suggestion.pk);
//                                       // state.onReBuildOnSelectedCooperative();
//                                     },
//                                     hideOnEmpty: true,
//                                     autovalidateMode:
//                                         AutovalidateMode.onUserInteraction,
//                                     validator: (text) {
//                                       if (text == null || text.isEmpty) {
//                                         return 'required'.tr();
//                                       }
//                                       if (state.selectedStateOfOrigin == null ||
//                                           state.selectedStateOfOrigin! <= 0) {
//                                         return 'select_suggestions'.tr();
//                                       }
//                                       return null;
//                                     },
//                                   ),
//                                   SizedBox(
//                                     height: 30.h,
//                                   ),
//                                 ],
//                               ),
//                               Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                       '${GlobalVariables().currentUser!.secondSubDivision} of Origin',
//                                       style: Styles.formLabelStyle(context)),
//                                   SizedBox(
//                                     height: 8.0.sp,
//                                   ),
//                                   TypeAheadFormField(
//                                     key: state.lgaOriginKey,
//                                     suggestionsBoxDecoration:
//                                         SuggestionsBoxDecoration(
//                                             color: ThemeManager.of(context)
//                                                 .colordeepGray,
//                                             elevation: 4.0,
//                                             constraints: BoxConstraints(
//                                               maxHeight: 250.0.h,
//                                             )),
//                                     hideSuggestionsOnKeyboardHide: false,
//                                     autoFlipDirection: true,
//                                     textFieldConfiguration:
//                                         TextFieldConfiguration(
//                                       autofocus: false,
//                                       controller: state.lgaOriginController,
//                                       style:
//                                           Styles.x14dp_4A4A4A(14.0.sp, context),
//                                       enabled: state.selectedStateOfOrigin !=
//                                                   null ||
//                                               state.selectedStateOfOrigin != 0
//                                           ? true
//                                           : false,
//                                       decoration:
//                                           Styles.textFormFieldDecoration('', "",
//                                               validationText: '',
//                                               context: context,
//                                               check: false, clearText: () {
//                                         state.lgaOriginController.clear();
//                                         state.selectedLgaOrigin = null;
//                                       }),
//                                       textInputAction: TextInputAction.next,
//                                       onChanged: (text) {
//                                         if (text.isEmpty) {
//                                           state.selectedLgaOrigin = null;
//                                         }
//                                       },
//                                     ),
//                                     suggestionsCallback: (pattern) async {
//                                       return await state.onSearchLga(
//                                           state.selectedStateOfOrigin, pattern);
//                                     },
//                                     itemBuilder: (context, Lga? suggestion) {
//                                       return ListTile(
//                                         title: Text(
//                                           suggestion!.name!,
//                                           style: Styles.normal_000000(
//                                               14.sp, context),
//                                         ),
//                                       );
//                                     },
//                                     errorBuilder:
//                                         (BuildContext context, Object? error) =>
//                                             Container(
//                                       padding: REdgeInsets.all(7),
//                                       margin: REdgeInsets.only(left: 10),
//                                       child: Text(
//                                         '$error',
//                                       ),
//                                     ),
//                                     onSuggestionSelected: (Lga? suggestion) {
//                                       state.lgaOriginController.text =
//                                           suggestion!.name!;
//                                       state.selectedLgaOrigin = suggestion.pk;
//                                       state.farmer.lgaOfOrigin = suggestion.pk;
//                                     },
//                                     hideOnEmpty: true,
//                                     autovalidateMode:
//                                         AutovalidateMode.onUserInteraction,
//                                     validator: (text) {
//                                       if (text == null || text.isEmpty) {
//                                         return 'required'.tr();
//                                       }
//                                       if (state.selectedLgaOrigin == null ||
//                                           state.selectedLgaOrigin! <= 0) {
//                                         return 'select_suggestions'.tr();
//                                       }
//                                       return null;
//                                     },
//                                   ),
//                                   SizedBox(
//                                     height: 30.h,
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 20.h,
//                               )
//                             ],
//                           ),
//                         )),
//                   ),
//                   Step(
//                     title: const Text(''),
//                     isActive: state.currentStep >= 3,
//                     content: Form(
//                         autovalidateMode: AutovalidateMode.onUserInteraction,
//                         key: state.formKeyStep4,
//                         child: SingleChildScrollView(
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text('cooperative'.tr(),
//                                       style: Styles.formLabelStyle(context)),
//                                   SizedBox(
//                                     height: 8.0.sp,
//                                   ),
//                                   TypeAheadFormField(
//                                     key: state.cooperativeKey,
//                                     textFieldConfiguration:
//                                         TextFieldConfiguration(
//                                       autofocus: false,
//                                       controller: state.cooperativeController,
//                                       style:
//                                           Styles.x14dp_4A4A4A(14.0.sp, context),
//                                       enabled: true,
//                                       onEditingComplete: () =>
//                                           focus.nextFocus(),
//                                       decoration:
//                                           Styles.textFormFieldDecoration('', "",
//                                               validationText: '',
//                                               context: context,
//                                               check: false, clearText: () {
//                                         state.cooperativeController.clear();
//                                         state.selectedCooperative = null;
//                                       }),
//                                       textInputAction: TextInputAction.next,
//                                       onChanged: (text) {
//                                         if (text.isEmpty) {
//                                           state.selectedCooperative = null;
//                                         }
//                                       },
//                                     ),
//                                     suggestionsBoxDecoration:
//                                         SuggestionsBoxDecoration(
//                                             color: ThemeManager.of(context)
//                                                 .colordeepGray,
//                                             elevation: 0.0,
//                                             constraints: BoxConstraints(
//                                               maxHeight: 250.0.h,
//                                             )),
//                                     hideSuggestionsOnKeyboardHide: false,
//                                     autoFlipDirection: true,
//                                     suggestionsCallback: (pattern) async {
//                                       return await state
//                                           .onSearchCooperatives(pattern);
//                                     },
//                                     itemBuilder:
//                                         (context, Cooperative? suggestion) {
//                                       return ListTile(
//                                         title: Text(
//                                           suggestion!.nameOfCooperative() +
//                                               " [${suggestion.id}]",
//                                           style: Styles.normal_000000(
//                                               14.sp, context),
//                                         ),
//                                         subtitle: Text(
//                                             suggestion.getCellByPk()?.name ??
//                                                 "Nil"),
//                                       );
//                                     },
//                                     errorBuilder:
//                                         (BuildContext context, Object? error) =>
//                                             Container(
//                                       padding: REdgeInsets.all(7),
//                                       margin: REdgeInsets.only(left: 10),
//                                       child: Text(
//                                         '$error',
//                                       ),
//                                     ),
//                                     onSuggestionSelected:
//                                         (Cooperative? suggestion) {
//                                       state.cooperativeController.text =
//                                           (suggestion!.nameOfCooperative() +
//                                               " [${suggestion.id}]");
//                                       // state.selectedFarmerTempFolioId = suggestion.tempFolioId;
//                                       state.selectedCooperative = suggestion;
//                                       state.farmer.cooperative =
//                                           suggestion.tempPk;
//                                       state.farmer.cell = suggestion.cell;
//                                       // state.unRepaidMaturedLoans = suggestion.unRepaidMaturedLoans;
//                                       state.onReBuildOnSelectedCooperative();
//                                     },
//                                     hideOnEmpty: true,
//                                     autovalidateMode:
//                                         AutovalidateMode.onUserInteraction,
//                                     validator: (text) {
//                                       if (text == null || text.isEmpty) {
//                                         return 'required'.tr();
//                                       }
//                                       if (state.selectedCooperative == null) {
//                                         return 'select_suggestions'.tr();
//                                       }

//                                       if (state.selectedCooperative
//                                                   ?.getCellByPk() !=
//                                               null &&
//                                           state.selectedCooperative!
//                                                   .getCellByPk()!
//                                                   .canRegisterMore() ==
//                                               false) {
//                                         return "cell_limit_reached_for_farmer_creation"
//                                             .tr();
//                                       }
//                                       return null;
//                                     },
//                                   ),
//                                   SizedBox(
//                                     height: 30.h,
//                                   ),
//                                 ],
//                               ),
//                               Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text('crop_type'.tr(),
//                                       style: Styles.formLabelStyle(context)),
//                                   SizedBox(
//                                     height: 8.0.sp,
//                                   ),
//                                   BlocBuilder<ProductCubit, ProductState>(
//                                       builder: (context, stateBloc) {
//                                     if (stateBloc is ProductLoaded) {
//                                       final Iterable<Product> product =
//                                           stateBloc.productList.where(
//                                               (product) =>
//                                                   (product.productType ==
//                                                       Strings.TEXT_COMMODITY));
//                                       return Container(
//                                         decoration: BoxDecoration(
//                                             border:
//                                                 Border.all(color: Colors.grey),
//                                             borderRadius:
//                                                 BorderRadius.circular(8)),
//                                         child: MultiSelectDialogField<Product>(
//                                             itemsTextStyle: TextStyle(
//                                                 color: ThemeManager.of(context)
//                                                     .neutral),
//                                             backgroundColor:
//                                                 ThemeManager.of(context)
//                                                     .colorDarkBox,
//                                             selectedColor: AppColors.colorFloat,
//                                             validator: (value) {
//                                               if (value == null ||
//                                                   value.isEmpty) {
//                                                 return 'select_option'.tr();
//                                               }
//                                               return null;
//                                             },
//                                             searchable: true,
//                                             searchHint: 'crop_type'.tr(),
//                                             listType: MultiSelectListType.LIST,
//                                             checkColor: AppColors.xFFFFFF,
//                                             initialValue:
//                                                 state.preSelectedProducts,
//                                             items: product.map((Product value) {
//                                               return MultiSelectItem<Product>(
//                                                 value,
//                                                 value.name,
//                                               );
//                                             }).toList(),
//                                             onConfirm: (value) {
//                                               state.setFarmerCrops(value);
//                                             }),
//                                       );
//                                     }
//                                     return const SizedBox();
//                                   }),
//                                   SizedBox(
//                                     height: 30.h,
//                                   ),
//                                 ],
//                               ),
//                               Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text('farm'.tr(),
//                                       textAlign: TextAlign.left,
//                                       style: Styles.formLabelStyle(context)),
//                                   SizedBox(
//                                     height: 8.0.sp,
//                                   ),
//                                   state.farmLocations.isEmpty
//                                       ? Stack(
//                                           children: [
//                                             SizedBox(
//                                               width: MediaQuery.of(context)
//                                                   .size
//                                                   .width,
//                                               height: 366.h,
//                                               child: GoogleMap(
//                                                 //given camera position
//                                                 initialCameraPosition:
//                                                     state.currentCameraPosition,
//                                                 // on below line we have given map type
//                                                 mapType: MapType.normal,
//                                                 // on below line we have enabled location
//                                                 myLocationEnabled: true,
//                                                 myLocationButtonEnabled: true,
//                                                 // on below line we have enabled compass location
//                                                 compassEnabled: false,
//                                                 zoomControlsEnabled: true,
//                                                 zoomGesturesEnabled: true,

//                                                 //mapToolbarEnabled: false,
//                                                 //scrollGesturesEnabled: true,
//                                                 //liteModeEnabled: true,
//                                                 // on below line we have added polygon
//                                                 polygons: state
//                                                     .farmPolygonsBasedOnFarmLocations,
//                                                 // displayed google map
//                                                 onMapCreated:
//                                                     (GoogleMapController
//                                                         controller) {
//                                                   if (!state.mapController
//                                                       .isCompleted) {
//                                                     state.mapController
//                                                         .complete(controller);
//                                                   }
//                                                 },
//                                               ),
//                                             ),
//                                             Positioned(
//                                                 top: 10,
//                                                 child: InkWell(
//                                                   onTap: () {
//                                                     state
//                                                         .onAddFarmFarmLocation();
//                                                   },
//                                                   child: Container(
//                                                     width:
//                                                         MediaQuery.of(context)
//                                                             .size
//                                                             .width,
//                                                     decoration:
//                                                         const BoxDecoration(
//                                                             color:
//                                                                 Colors.white),
//                                                     child: Padding(
//                                                       padding:
//                                                           REdgeInsets.symmetric(
//                                                               horizontal: 11.0,
//                                                               vertical: 10),
//                                                       child: Row(
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .start,
//                                                         children: [
//                                                           SvgPicture.asset(
//                                                             'assets/images/small_map.svg',
//                                                             width: 16.w,
//                                                             height: 16.w,
//                                                             fit: BoxFit.cover,
//                                                           ),
//                                                           SizedBox(
//                                                             width: 10.w,
//                                                           ),
//                                                           Text(
//                                                             '${state.farmLocations.length} locations added',
//                                                             style: TextStyle(
//                                                                 color: const Color(
//                                                                     0xff54565B),
//                                                                 fontFamily: Styles
//                                                                     .FONT_TEXT_FAMILY,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .w400,
//                                                                 fontSize:
//                                                                     11.sp),
//                                                           ),
//                                                           // const Spacer(),
//                                                           SizedBox(
//                                                             width: 40.w,
//                                                           ),
//                                                           Text(
//                                                             'click_to_add_farm_location'
//                                                                 .tr(),
//                                                             style: TextStyle(
//                                                                 color: const Color(
//                                                                     0xff1D925D),
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .w700,
//                                                                 fontFamily: Styles
//                                                                     .FONT_TEXT_FAMILY,
//                                                                 fontSize:
//                                                                     14.sp),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 )),
//                                           ],
//                                         )
//                                       : ListView.builder(
//                                           itemCount: state.farmLocations.length,
//                                           shrinkWrap: true,
//                                           itemBuilder: (context, index) {
//                                             return Column(
//                                               mainAxisSize: MainAxisSize.min,
//                                               children: [
//                                                 Container(
//                                                   decoration:
//                                                       const BoxDecoration(
//                                                           color: Color(
//                                                               0xffF5F6F7)),
//                                                   child: Padding(
//                                                     padding:
//                                                         REdgeInsets.symmetric(
//                                                             horizontal: 12.0,
//                                                             vertical: 14.0),
//                                                     child: Row(
//                                                       children: [
//                                                         SvgPicture.asset(
//                                                           'assets/images/maps.svg',
//                                                           height: 36.w,
//                                                           width: 36.w,
//                                                           fit: BoxFit.scaleDown,
//                                                         ),
//                                                         SizedBox(
//                                                           width: 9.w,
//                                                         ),
//                                                         Column(
//                                                           mainAxisSize:
//                                                               MainAxisSize.min,
//                                                           crossAxisAlignment:
//                                                               CrossAxisAlignment
//                                                                   .start,
//                                                           children: [
//                                                             Text(
//                                                               'Farm Location added',
//                                                               style: TextStyle(
//                                                                 fontSize: 14.sp,
//                                                                 fontFamily: Styles
//                                                                     .FONT_TEXT_FAMILY,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .w700,
//                                                                 color: const Color(
//                                                                     0xff111827),
//                                                               ),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                         const Spacer(),
//                                                         Column(
//                                                           mainAxisSize:
//                                                               MainAxisSize.min,
//                                                           crossAxisAlignment:
//                                                               CrossAxisAlignment
//                                                                   .end,
//                                                           children: [
//                                                             InkWell(
//                                                               onTap: () {
//                                                                 state
//                                                                     .removeCoordinatePoint(
//                                                                         index);
//                                                               },
//                                                               child: SvgPicture
//                                                                   .asset(
//                                                                 'assets/images/cancel.svg',
//                                                                 height: 24.w,
//                                                                 width: 24.w,
//                                                                 fit: BoxFit
//                                                                     .scaleDown,
//                                                               ),
//                                                             ),
//                                                           ],
//                                                         )
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 SizedBox(
//                                                   height: 10.h,
//                                                 )
//                                               ],
//                                             );
//                                           },
//                                         ),
//                                   SizedBox(
//                                     height: 30.h,
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                         )),
//                   ),
//                   Step(
//                     title: const Text(''),
//                     isActive: state.currentStep >= 4,
//                     content: Form(
//                         autovalidateMode: AutovalidateMode.onUserInteraction,
//                         key: state.formKeyStep5,
//                         child: SingleChildScrollView(
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               Flexible(
//                                 child: ListView.builder(
//                                   key: Key(
//                                       state.bankDetailsList.length.toString()),
//                                   itemCount: state.bankDetailsList.length,
//                                   reverse: true,
//                                   shrinkWrap: true,
//                                   itemBuilder: (context, index) {
//                                     BankInfo bankInfo =
//                                         state.bankDetailsList[index];
//                                     return Padding(
//                                       padding: REdgeInsets.symmetric(
//                                           horizontal: 5.0, vertical: 10),
//                                       child: Row(
//                                         children: [
//                                           SvgPicture.asset(
//                                             'assets/images/bank_card.svg',
//                                             fit: BoxFit.scaleDown,
//                                             height: 38.w,
//                                             width: 38.w,
//                                           ),
//                                           SizedBox(
//                                             width: 10.w,
//                                           ),
//                                           Expanded(
//                                             child: Column(
//                                               mainAxisSize: MainAxisSize.min,
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 Text(
//                                                   '${bankInfo.accountNumber}',
//                                                   style: TextStyle(
//                                                       fontSize: 16.sp,
//                                                       fontFamily: Styles
//                                                           .FONT_TEXT_FAMILY,
//                                                       fontWeight:
//                                                           FontWeight.w700,
//                                                       color: ThemeManager.of(
//                                                               context)
//                                                           .colorLgText),
//                                                 ),
//                                                 Text(
//                                                   "${bankInfo.bank()?.name} || '${bankInfo.accountName}'",
//                                                   style: TextStyle(
//                                                       fontSize: 14.sp,
//                                                       fontFamily: Styles
//                                                           .FONT_TEXT_FAMILY,
//                                                       fontWeight:
//                                                           FontWeight.w400,
//                                                       color: ThemeManager.of(
//                                                               context)
//                                                           .colorSubText),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                           const Spacer(),
//                                           InkWell(
//                                               onTap: () {
//                                                 state.setCurrentlyEditedBank(
//                                                     bankInfo: bankInfo);
//                                                 _addBankModal(context,
//                                                     selectedIndex: index);
//                                               },
//                                               child: SvgPicture.asset(
//                                                 'assets/images/pen.svg',
//                                                 fit: BoxFit.scaleDown,
//                                                 height: 36.w,
//                                                 width: 36.w,
//                                               )),
//                                           SizedBox(
//                                             width: 10.w,
//                                           ),
//                                           InkWell(
//                                               onTap: () {
//                                                 state.removeBankFromList(index);
//                                               },
//                                               child: SvgPicture.asset(
//                                                 'assets/images/cancel_coordinate.svg',
//                                                 fit: BoxFit.scaleDown,
//                                                 height: 36.w,
//                                                 width: 36.w,
//                                               )),
//                                           SizedBox(
//                                             height: 10.h,
//                                           )
//                                         ],
//                                       ),
//                                     );
//                                   },
//                                 ),
//                                 fit: FlexFit.loose,
//                               ),
//                               SizedBox(
//                                 height: 20.h,
//                               ),
//                               InkWell(
//                                 onTap: () {
//                                   state.setCurrentlyEditedBank();
//                                   _addBankModal(context);
//                                 },
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(8.r),
//                                       color: AppColors.colorDeepGreen
//                                           .withOpacity(0.06)),
//                                   child: Padding(
//                                     padding: REdgeInsets.symmetric(
//                                         horizontal: 90.0, vertical: 20),
//                                     child: Column(
//                                       mainAxisSize: MainAxisSize.min,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: [
//                                         SvgPicture.asset(
//                                           'assets/images/add_bank.svg',
//                                           fit: BoxFit.scaleDown,
//                                           height: 70.w,
//                                           width: 70.w,
//                                         ),
//                                         SizedBox(
//                                           height: 20.h,
//                                         ),
//                                         Text(
//                                           'add_a_new_bank_account'.tr(),
//                                           style: TextStyle(
//                                               color: AppColors.colorDeepGreen,
//                                               fontSize: 14.sp,
//                                               fontFamily:
//                                                   Styles.FONT_TEXT_FAMILY,
//                                               fontWeight: FontWeight.w700),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         )),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Positioned.fill(
//             bottom: 0,
//             child: Padding(
//               padding: REdgeInsets.symmetric(horizontal: 22.0),
//               child: Container(
//                 alignment: Alignment.bottomCenter,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                       child: Container(
//                         width: MediaQuery.of(context).size.width,
//                         color: ThemeManager.of(context).colorWhite,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             SizedBox(
//                               width: 97.w,
//                               height: 58.h,
//                               child: state.currentStep == 0
//                                   ? null
//                                   : MaterialButton(
//                                       color: AppColors.xFFFFFF,
//                                       onPressed: () {
//                                         state.back();
//                                       },
//                                       shape: RoundedRectangleBorder(
//                                         side: const BorderSide(
//                                           color: Color(0xff54565B),
//                                         ),
//                                         borderRadius: BorderRadius.circular(6),
//                                       ),
//                                       child: Text(
//                                         'back'.tr(),
//                                         style: TextStyle(
//                                             fontSize: 18,
//                                             fontWeight: FontWeight.w500,
//                                             fontFamily: Styles.FONT_TEXT_FAMILY,
//                                             color: state.currentStep == 0
//                                                 ? Colors.grey
//                                                 : AppColors.colorDarkGrey),
//                                       ),
//                                     ),
//                             ),
//                             SizedBox(
//                                 width: 97.w,
//                                 height: 58.h,
//                                 child: state.currentStep == 0 &&
//                                         !(state.image != null ||
//                                             (state.farmer.photoUrl != null &&
//                                                 state.farmer.photoUrl!
//                                                     .isNotEmpty))
//                                     ? null
//                                     : MaterialButton(
//                                         color: AppColors.colorDeepGreen,
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(6),
//                                         ),
//                                         onPressed: () {
//                                           state.next(context);
//                                         },
//                                         child: Text(
//                                           'next'.tr(),
//                                           style: TextStyle(
//                                               fontSize: 18.sp,
//                                               fontFamily:
//                                                   Styles.FONT_TEXT_FAMILY,
//                                               color: AppColors.xFFFFFF,
//                                               fontWeight: FontWeight.w500),
//                                         ),
//                                       )),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
  
//      );
//   }

//   Widget _buildNextOfKinForm() {
//     // Same form as above
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Section title
//         const Text(
//           "Farmer's Next of Kin Information",
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w500,
//             color: Colors.black54,
//           ),
//         ),
//         const SizedBox(height: 24),
        
//         // Next of Kin's Name Field
//         const Text(
//           "Next of Kin's Name",
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         const SizedBox(height: 8),
//         TextField(
//           controller: _nameController,
//           decoration: const InputDecoration(
//             hintText: "Enter full name",
//           ),
//         ),
//         const SizedBox(height: 24),
        
//         // Next of Kin's Phone Number Field
//         const Text(
//           "Next of Kin's Phone Number",
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         const SizedBox(height: 8),
//         Row(
//           children: [
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.grey),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Row(
//                 children: const [
//                   Text(
//                     "+234",
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   SizedBox(width: 4),
//                   Icon(Icons.arrow_drop_down, color: Colors.grey),
//                 ],
//               ),
//             ),
//             const SizedBox(width: 8),
//             Expanded(
//               child: TextField(
//                 controller: _phoneController,
//                 keyboardType: TextInputType.phone,
//                 decoration: const InputDecoration(
//                   hintText: "Enter phone number",
//                 ),
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 24),
        
//         // Relationship Field
//         const Text(
//           "Farmer's Relationship with Next of Kin",
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         const SizedBox(height: 8),
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.grey),
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: DropdownButtonHideUnderline(
//             child: DropdownButton<String>(
//               isExpanded: true,
//               hint: const Text('Choose an option'),
//               value: _relationship,
//               icon: const Icon(Icons.keyboard_arrow_down),
//               items: _relationshipOptions.map((String item) {
//                 return DropdownMenuItem(
//                   value: item,
//                   child: Text(item),
//                 );
//               }).toList(),
//               onChanged: (String? newValue) {
//                 setState(() {
//                   _relationship = newValue;
//                 });
//               },
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }