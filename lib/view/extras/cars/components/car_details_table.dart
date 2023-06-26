import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:r_r_admin/components/table.dart';
import 'package:r_r_admin/view_model/cars_view_model.dart';

class CarDetailsTable extends StatelessWidget {
  final int index;
  const CarDetailsTable({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final providerCars = context.watch<CarsViewModel>().carsDataList;
    return Padding(
      padding: const EdgeInsets.only(
        left: 12.0,
        right: 12,
      ),
      child: Table(
        border: TableBorder.all(color: Colors.black),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          TableRow(
            children: [
              TableWidget.tableCellHead("NAME"),
              TableWidget.tableCellData(
                  providerCars[index].name.toString().toUpperCase()),
            ],
          ),
          TableRow(
            children: [
              TableWidget.tableCellHead("RENT /Hr"),
              TableWidget.tableCellData(providerCars[index].rent.toString()),
            ],
          ),
          TableRow(
            children: [
              TableWidget.tableCellHead("BODY"),
              TableWidget.tableCellData(providerCars[index].body.toString()),
            ],
          ),
          TableRow(
            children: [
              TableWidget.tableCellHead("MODEL"),
              TableWidget.tableCellData(providerCars[index].model.toString()),
            ],
          ),
          TableRow(
            children: [
              TableWidget.tableCellHead("TRANSMISSION"),
              TableWidget.tableCellData(
                  providerCars[index].transmission.toString()),
            ],
          ),
          TableRow(
            children: [
              TableWidget.tableCellHead("FUEL"),
              TableWidget.tableCellData(providerCars[index].fuel.toString()),
            ],
          ),
          TableRow(
            children: [
              TableWidget.tableCellHead("PLACE"),
              TableWidget.tableCellData(providerCars[index].place.toString()),
            ],
          ),
          TableRow(
            children: [
              TableWidget.tableCellHead("BRAND"),
              TableWidget.tableCellData(providerCars[index].brand.toString()),
            ],
          ),
          TableRow(
            children: [
              TableWidget.tableCellHead("DESCRIPTION"),
              TableWidget.tableCellData(
                  providerCars[index].description.toString()),
            ],
          ),
        ],
      ),
    );
  }
}
