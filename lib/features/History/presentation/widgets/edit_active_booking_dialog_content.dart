import 'package:book_it/core/utils/validators.dart';
import 'package:book_it/core/widgets/custom_text_field.dart';
import 'package:book_it/core/widgets/label_text.dart';
import 'package:book_it/core/widgets/primary_button.dart';
import 'package:book_it/features/History/data/model/book_model.dart';
import 'package:flutter/material.dart';

class EditActiveBookingDialogContent extends StatefulWidget {
  final BookModel book;
  const EditActiveBookingDialogContent({super.key, required this.book});

  @override
  State<EditActiveBookingDialogContent> createState() =>
      _EditActiveBookingDialogContentState();
}

class _EditActiveBookingDialogContentState
    extends State<EditActiveBookingDialogContent> {
  final TextEditingController _endDateController = TextEditingController();

  DateTime? endDate;

  @override
  void initState() {
    super.initState();
    endDate = DateTime.parse(widget.book.endDate);
    _endDateController.text = formatDate(endDate!);
  }

  @override
  void dispose() {
    _endDateController.dispose();
    super.dispose();
  }

  String formatDate(DateTime date) {
    return "${date.year}-${date.month}-${date.day}";
  }

  Future<void> pickEndDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now().add(const Duration(days: 1)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        LabelText(text: "End Date :"),
        const SizedBox(height: 10),
        CustomTextField(
          onTap: pickEndDate,
          readOnly: true,
          validator: endDateValidator,
          hintText: "Enter End Date",
          controller: _endDateController,
          prefixIcon: Icons.calendar_month,
        ),
        const SizedBox(height: 20),
        PrimaryButton(
          text: "Confirm",
          onTap: () {
            print("endDate : ${_endDateController.text}");
          },
        ),
      ],
    );
  }
}
