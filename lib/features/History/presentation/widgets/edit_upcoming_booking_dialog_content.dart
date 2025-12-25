import 'package:book_it/core/utils/validators.dart';
import 'package:book_it/core/widgets/custom_text_field.dart';
import 'package:book_it/core/widgets/label_text.dart';
import 'package:book_it/core/widgets/primary_button.dart';
import 'package:book_it/features/History/data/model/book_model.dart';
import 'package:flutter/material.dart';

class EditUpCommingBookingDialogContent extends StatefulWidget {
  final BookModel book;
  const EditUpCommingBookingDialogContent({super.key, required this.book});

  @override
  State<EditUpCommingBookingDialogContent> createState() =>
      _EditUpCommingBookingDialogContentState();
}

class _EditUpCommingBookingDialogContentState
    extends State<EditUpCommingBookingDialogContent> {
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DateTime? startDate;
  DateTime? endDate;

  @override
  void initState() {
    super.initState();

    startDate = DateTime.parse(widget.book.startDate);
    endDate = DateTime.parse(widget.book.endDate);
    _startDateController.text = formatDate(startDate!);
    _endDateController.text = formatDate(endDate!);
  }

  @override
  void dispose() {
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  String formatDate(DateTime date) {
    return "${date.year}-${date.month}-${date.day}";
  }

  Future<void> pickStartDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: startDate ?? DateTime.now().add(Duration(days: 1)),
      firstDate: DateTime.now().add(Duration(days: 1)),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (picked != null) {
      setState(() {
        startDate = picked;
        _startDateController.text = formatDate(picked);

        if (endDate != null && !endDate!.isAfter(picked)) {
          endDate = null;
          _endDateController.text = "";
        }
      });
    }
  }

  Future<void> pickEndDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate:
          endDate ??
          (startDate?.add(Duration(days: 1)) ??
              DateTime.now().add(Duration(days: 1))),
      firstDate:
          startDate?.add(Duration(days: 1)) ??
          DateTime.now().add(Duration(days: 1)),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (picked != null) {
      setState(() {
        endDate = picked;
        _endDateController.text = formatDate(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LabelText(text: "Start Date :"),
          const SizedBox(height: 10),
          CustomTextField(
            onTap: pickStartDate,
            readOnly: true,
            validator: startDateValidator,
            hintText: "Enter Start Date",
            controller: _startDateController,
            prefixIcon: Icons.calendar_month,
          ),
          const SizedBox(height: 10),
          LabelText(text: "End Date :"),
          const SizedBox(height: 10),
          CustomTextField(
            validator: endDateValidator,
            onTap: pickEndDate,
            readOnly: true,
            hintText: "Enter End Date",
            controller: _endDateController,
            prefixIcon: Icons.calendar_month,
          ),
          const SizedBox(height: 20),
          PrimaryButton(
            text: "Confirm",
            onTap: () {
              if (_formKey.currentState!.validate()) {
                print("startDate : ${_startDateController.text}");
                print("endDate : ${_endDateController.text}");
              }
            },
          ),
        ],
      ),
    );
  }
}
