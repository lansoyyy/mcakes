import 'package:flutter/material.dart';
import 'package:mcakes/widgets/footer_widget.dart';
import 'package:mcakes/widgets/text_widget.dart';

import '../../utlis/colors.dart';
import '../../widgets/button_widget.dart';

class StoreTab extends StatefulWidget {
  const StoreTab({super.key});

  @override
  State<StoreTab> createState() => _StoreTabState();
}

class _StoreTabState extends State<StoreTab> {
  final searchController = TextEditingController();
  String nameSearched = '';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: 'Find a store:',
                fontSize: 16,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                width: 700,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(5)),
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      nameSearched = value;
                    });
                  },
                  decoration: const InputDecoration(
                      hintText: 'Search for a store',
                      hintStyle: TextStyle(fontFamily: 'QRegular'),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      )),
                  controller: searchController,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 1000,
            height: 500,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5),
              itemBuilder: (context, index) {
                return Card(
                  elevation: 3,
                  color: Colors.pink[100],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidget(
                        text: 'Czar Store',
                        fontSize: 24,
                        fontFamily: 'Bold',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextWidget(
                        text: 'Opening Time: 8:00 AM',
                        fontSize: 12,
                        fontFamily: 'Bold',
                      ),
                      TextWidget(
                        text: 'Closing Time: 5:00 PM',
                        fontSize: 12,
                        fontFamily: 'Bold',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ButtonWidget(
                        radius: 100,
                        color: primary,
                        fontSize: 14,
                        width: 125,
                        height: 45,
                        label: 'Visit Store',
                        onPressed: () {},
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const FooterWidget(),
        ],
      ),
    );
  }
}
