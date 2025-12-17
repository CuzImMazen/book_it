import 'package:book_it/core/utils/helpers.dart';
import 'package:book_it/core/utils/validators.dart';
import 'package:book_it/core/widgets/back_button_row.dart';
import 'package:book_it/core/widgets/custom_text_field.dart';
import 'package:book_it/core/widgets/label_text.dart';
import 'package:book_it/core/widgets/primary_button.dart';
import 'package:book_it/core/widgets/primary_text.dart';
import 'package:book_it/core/widgets/secondary_text.dart';
import 'package:book_it/features/Home/data/models/confirm_book_data.dart';
import 'package:flutter/material.dart';

class BookConfirmationViewBody extends StatefulWidget {
  const BookConfirmationViewBody({super.key, required this.confirmBookData});
  final ConfirmBookData confirmBookData;
  @override
  State<BookConfirmationViewBody> createState() =>
      _BookConfirmationViewBodyState();
}

class _BookConfirmationViewBodyState extends State<BookConfirmationViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();

  Future<void> handlePickStartDate() async {
    _endDateController.text = "";

    final selectedDate = await pickStartDate(context: context);
    if (selectedDate != null) {
      _startDateController.text = selectedDate;
    }
    setState(() {});
  }

  Future<void> handlePickEndDate() async {
    final selectedDate = await pickEndDate(
      context: context,
      startDate: _startDateController.text,
    );
    if (selectedDate != null) {
      _endDateController.text = selectedDate;
    }
    setState(() {});
  }

  double get totalPrice {
    if (_startDateController.text.isEmpty || _endDateController.text.isEmpty) {
      return 0;
    }

    final start = DateTime.parse(_startDateController.text);
    final end = DateTime.parse(_endDateController.text);

    final days = end.difference(start).inDays;
    return days * double.parse(widget.confirmBookData.price);
  }

  @override
  void dispose() {
    _startDateController.dispose();
    _endDateController.dispose();
    _cardNumberController.dispose();
    _addressController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              BackButtonRow(),
              SizedBox(height: 20),
              PrimaryText(text: "Confirm your booking"),
              SizedBox(height: 20),
              SecondaryText(
                text: "We need a few more details to complete your booking.",
              ),
              SizedBox(height: 30),
              LabelText(text: "Start Date:"),
              SizedBox(height: 10),
              CustomTextField(
                onTap: handlePickStartDate,
                hintText: "Select your start Date",
                prefixIcon: Icons.calendar_today,
                validator: startDateValidator,
                controller: _startDateController,
                readOnly: true,
              ),
              SizedBox(height: 20),
              LabelText(text: "End Date:"),
              SizedBox(height: 10),
              CustomTextField(
                onTap: handlePickEndDate,
                hintText: "Select your end Date",
                prefixIcon: Icons.calendar_today,
                validator: (value) {
                  return endDateValidator(value, _startDateController.text);
                },
                controller: _endDateController,
                readOnly: true,
              ),
              SizedBox(height: 20),
              LabelText(text: " Billing Address:"),
              SizedBox(height: 10),
              CustomTextField(
                hintText: "Enter your billing address",
                prefixIcon: Icons.location_on,
                validator: addressValidator,
                controller: _addressController,
              ),
              SizedBox(height: 20),
              LabelText(text: "Card Number:"),
              SizedBox(height: 10),
              CustomTextField(
                isNumber: true,
                hintText: "Enter your bill card number",
                prefixIcon: Icons.credit_card,
                validator: cardNumberValidator,
                controller: _cardNumberController,
              ),
              SizedBox(height: 20),

              LabelText(
                text: "Total Price:  ${totalPrice.toStringAsFixed(2)}\$",
              ),
              SizedBox(height: 30),
              PrimaryButton(
                text: "Confirm",
                onTap: () {
                  if (_formKey.currentState!.validate()) {}
                },
                wdith: 250,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
