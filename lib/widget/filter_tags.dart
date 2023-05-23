import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menu_say/constants/constant.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class FilterTag extends StatelessWidget {
  const FilterTag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> tagList = [
      "Price",
      "Veg",
      "Non-veg",
      "Starter",
      "Main course",
      "Desert",
      "Cusines"
    ];
    return Container(
        padding: EdgeInsets.only(left: 12),
        height: 60,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: tagList
              .map((tag) => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () {
                          showMaterialModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16),
                                  )),
                              context: context,
                              builder: (context) => PriceFilter());
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration:
                              Constants().getDecoration(context: context),
                          child: Text(tag),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      )
                    ],
                  ))
              .toList(),
        ));
  }
}

class PriceFilter extends StatefulWidget {
  const PriceFilter({Key? key}) : super(key: key);

  @override
  State<PriceFilter> createState() => _PriceFilterState();
}

class _PriceFilterState extends State<PriceFilter> {
  double filterValue = 500;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: ModalScrollController.of(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5,),
          Padding(
            padding: EdgeInsets.only(
              left: 16,
            ),
            child: Row(
              children: [
                const Text(
                  "Price filter",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                Spacer(),
                CloseButton(),
                SizedBox(width: 8,)
              ],
            ),
          ),
          SizedBox(height: 5,),
          Container(height: 1, color: Colors.grey.withOpacity(.2)),
          SizedBox(
            height: 12,
          ),
          Slider(
            activeColor: Theme.of(context).primaryColor,
            semanticFormatterCallback: (val) {
              return val.toString();
            },
            divisions: 100,
            label: filterValue.toInt().toString(),
            inactiveColor: Theme.of(context).primaryColor.withOpacity(.2),
            onChanged: (value) {
              setState(() {
                filterValue = value;
              });
            },
            max: 1000,
            min: 0,
            value: filterValue,
          ),
          CheckboxListTile(
            value: false,
            onChanged: (val) {},
            title: Text("Low to High"),
          ),
          CheckboxListTile(
            value: false,
            onChanged: (val) {},
            title: Text("High to Low"),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: OutlinedButton(
                  child: Text("Clear"),
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    side: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                    foregroundColor: Theme.of(context).primaryColor,
                    minimumSize: Size(100, 45),
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                  child: ElevatedButton(
                child: Text("Apply"),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  minimumSize: Size(100, 45),
                ),
              )),
              SizedBox(
                width: 12,
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
