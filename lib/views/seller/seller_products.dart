import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:shikisha/logic/models/products_model.dart';
import 'package:shikisha/logic/providers/seller_products_provider.dart';
import 'package:shikisha/widgets/input_field.dart';
import 'package:shikisha/widgets/text_widget.dart';

class SellerProducts extends ConsumerStatefulWidget {
  const SellerProducts({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SellerProductsState();
}

class _SellerProductsState extends ConsumerState<SellerProducts> {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  String? imgUrl;
  Future<void> uploadImage(String? inputSource) async {
    final picker = ImagePicker();
    XFile? pickedImage;
    try {
      pickedImage = await picker.pickImage(
          source: inputSource == 'camera'
              ? ImageSource.camera
              : ImageSource.gallery);
      final String fileName = path.basename(pickedImage!.name);
      File file = File(pickedImage.path);
      var snapshot =
          await storage.ref().child("images/$fileName").putFile(file);

      final downloadUrl = await snapshot.ref.getDownloadURL();

      setState(() {
        imgUrl = downloadUrl;
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final userProducts = ref.watch(userProduct);
    final product = ref.watch(sellerproductProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.orange.shade600)),
                onPressed: () => showDialog(
                    context: context,
                    builder: (BuildContext context) => Form(
                          child: AlertDialog(
                            title: Center(
                                child: TextWidget(
                              text: "Add new Product",
                              textStyle: theme.textTheme.headline6!
                                  .copyWith(color: Colors.orange.shade600),
                            )),
                            scrollable: true,
                            content: Column(
                              children: [
                                CustomeInput(
                                    inputType: TextInputType.name,
                                    controller: nameController,
                                    labelText: "Name"),
                                const SizedBox(
                                  height: 20,
                                ),
                                CustomeInput(
                                  inputType: TextInputType.multiline,
                                  controller: descriptionController,
                                  labelText: "Description",
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                CustomeInput(
                                    controller: priceController,
                                    inputType: TextInputType.number,
                                    labelText: "Price"),
                                const SizedBox(
                                  height: 20,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                ElevatedButton.icon(
                                    onPressed: () async {
                                      await uploadImage('');
                                    },
                                    icon: const Icon(Icons.file_copy),
                                    label: TextWidget(
                                      text: "Upload image",
                                      textStyle: theme.textTheme.bodyLarge!
                                          .copyWith(color: Colors.white),
                                    ))
                              ],
                            ),
                            actions: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton.icon(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.red.shade600)),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      icon: const Icon(
                                        Icons.cancel,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                      label: TextWidget(
                                        text: "Cancel",
                                        textStyle: theme.textTheme.bodyLarge!
                                            .copyWith(color: Colors.white),
                                      )),
                                  ElevatedButton.icon(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.green.shade600)),
                                      onPressed: () async {
                                        ProductModel productModel =
                                            ProductModel(
                                          isVerified: false,
                                          title: nameController.text,
                                          category: "category",
                                          description:
                                              descriptionController.text,
                                          img: imgUrl!,
                                          price:
                                              int.parse(priceController.text),
                                          seller: auth.currentUser!.email,
                                        );
                                        await product.addProduct(productModel,
                                            auth.currentUser!.uid, context);
                                      },
                                      icon: const Icon(
                                        Icons.check,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                      label: TextWidget(
                                        text: "Save",
                                        textStyle: theme.textTheme.bodyLarge!
                                            .copyWith(color: Colors.white),
                                      ))
                                ],
                              )
                            ],
                          ),
                        )),
                icon: const Icon(Icons.add, color: Colors.white, size: 30),
                label: TextWidget(
                  text: "New Product",
                  textStyle:
                      theme.textTheme.bodyLarge!.copyWith(color: Colors.white),
                )),
            SizedBox(
                height: 650,
                child: userProducts.when(
                    data: (data) {
                      return ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(top: 15),
                              child: ListTile(
                                leading: Container(
                                  height: 150,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      image: DecorationImage(
                                          image: NetworkImage(data[index].img),
                                          fit: BoxFit.cover)),
                                ),
                                title: TextWidget(text: data[index].title),
                                subtitle: TextWidget(
                                  text: data[index].isVerified
                                      ? "Approved"
                                      : "Not Approved",
                                  textStyle: data[index].isVerified
                                      ? theme.textTheme.bodyLarge!.copyWith(
                                          color: Colors.green.shade600)
                                      : theme.textTheme.bodyLarge!
                                          .copyWith(color: Colors.red.shade600),
                                ),
                                trailing: TextWidget(
                                  text: "Ksh. ${data[index].price}",
                                  textStyle: theme.textTheme.bodyLarge!
                                      .copyWith(color: Colors.orange.shade600),
                                ),
                              ),
                            );
                          });
                    },
                    error: (error, stackTrace) =>
                        TextWidget(text: error.toString()),
                    loading: () => const Center(
                          child: CircularProgressIndicator(),
                        )))
          ],
        ),
      ),
    );
  }
}
