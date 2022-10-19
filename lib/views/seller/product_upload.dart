import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shikisha/widgets/input_field.dart';
import 'package:shikisha/widgets/text_widget.dart';

class ProductUpload extends ConsumerStatefulWidget {
  const ProductUpload({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductUploadState();
}

class _ProductUploadState extends ConsumerState<ProductUpload> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController fileController = TextEditingController();
  FilePickerResult? result;
  bool isSelected = false;
  PlatformFile? file;

  Future getImage() async {
    result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg'],
    );
    setState(() {
      isSelected = true;
      file = result!.files.first;
    });
    print(result!.files.first.name);
  }

  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.only(top: 40, right: 10, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  height: 40,
                  width: 170,
                  decoration: BoxDecoration(
                      color: Colors.orange.shade900,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: TextWidget(
                      text: "Welcome",
                      textStyle: theme.textTheme.headline5!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextWidget(
                text: "Provide Product Details",
                textStyle: theme.textTheme.headline5,
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomeInput(
                          controller: titleController,
                          icon: Icons.title_outlined,
                          labelText: "Name",
                          inputType: TextInputType.name),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomeInput(
                          controller: priceController,
                          icon: Icons.currency_bitcoin,
                          labelText: "Price",
                          inputType: TextInputType.number),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomeInput(
                          controller: descriptionController,
                          icon: Icons.more,
                          labelText: "Description",
                          inputType: TextInputType.multiline),
                      const SizedBox(
                        height: 10,
                      ),
                      // GestureDetector(
                      //   onTap: () async {
                      //     await getImage();
                      //   },
                      //   child: CustomeInput(
                      //       controller: fileController,
                      //       icon: Icons.image,
                      //       labelText: "Image",
                      //       inputType: TextInputType.none),
                      // )
                    ],
                  )),
              ElevatedButton(
                  onPressed: () async {
                    await getImage();
                  },
                  child: TextWidget(
                    text: "Pick Image",
                    textStyle: theme.textTheme.headline5!
                        .copyWith(color: Colors.white),
                  )),
              TextWidget(
                text: "Personal Information",
                textStyle: theme.textTheme.headline5,
              ),
              Column(
                children: [
                  CustomeInput(
                      controller: nameController,
                      icon: Icons.person,
                      labelText: "Seller's name",
                      inputType: TextInputType.name),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomeInput(
                      controller: idController,
                      icon: Icons.perm_identity,
                      labelText: "Id number",
                      inputType: TextInputType.number),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Colors.orange.shade900)),
                      onPressed: () {},
                      child: TextWidget(
                        text: "Confirm",
                        textStyle: theme.textTheme.headline6!
                            .copyWith(color: Colors.white),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
