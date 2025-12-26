import 'package:book_it/core/style/colors.dart';
import 'package:book_it/core/utils/helpers.dart';
import 'package:book_it/core/utils/validators.dart';
import 'package:book_it/core/widgets/custom_text_field.dart';
import 'package:book_it/core/widgets/label_text.dart';
import 'package:book_it/core/widgets/primary_button.dart';
import 'package:book_it/features/History/data/model/book_model.dart';
import 'package:book_it/features/History/presentation/ViewModel/cubit/booking_history_cubit.dart';
import 'package:book_it/features/History/presentation/ViewModel/cubit/booking_history_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditUpCommingBookingDialogContent extends StatefulWidget {
  final BookModel book;

  const EditUpCommingBookingDialogContent({super.key, required this.book});

  @override
  State<EditUpCommingBookingDialogContent> createState() =>
      _EditUpCommingBookingDialogContentState();
}

class _EditUpCommingBookingDialogContentState
    extends State<EditUpCommingBookingDialogContent> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  late DateTime originalStartDate;
  late DateTime originalEndDate;

  DateTime? startDate;
  DateTime? endDate;

  @override
  void initState() {
    super.initState();

    originalStartDate = DateTime.parse(widget.book.startDate);
    originalEndDate = DateTime.parse(widget.book.endDate);

    startDate = originalStartDate;
    endDate = originalEndDate;

    _startDateController.text = _formatDate(startDate!);
    _endDateController.text = _formatDate(endDate!);
  }

  @override
  void dispose() {
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  String _formatDate(DateTime date) {
    final m = date.month.toString().padLeft(2, '0');
    final d = date.day.toString().padLeft(2, '0');
    return "${date.year}-$m-$d";
  }

  Future<void> _pickStartDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: startDate!,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (picked == null) return;

    setState(() {
      startDate = picked;
      _startDateController.text = _formatDate(picked);

      if (endDate != null && !endDate!.isAfter(picked)) {
        endDate = null;
        _endDateController.clear();
      }
    });
  }

  Future<void> _pickEndDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: endDate ?? startDate!.add(const Duration(days: 1)),
      firstDate: startDate!.add(const Duration(days: 1)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (picked == null) return;

    setState(() {
      endDate = picked;
      _endDateController.text = _formatDate(picked);
    });
  }

  bool _datesUnchanged() {
    return startDate!.isAtSameMomentAs(originalStartDate) &&
        endDate!.isAtSameMomentAs(originalEndDate);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LabelText(text: "Start Date"),
          const SizedBox(height: 8),
          CustomTextField(
            readOnly: true,
            controller: _startDateController,
            prefixIcon: Icons.calendar_month,
            hintText: "Select start date",
            validator: startDateValidator,
            onTap: _pickStartDate,
          ),
          const SizedBox(height: 12),
          const LabelText(text: "End Date"),
          const SizedBox(height: 8),
          CustomTextField(
            readOnly: true,
            controller: _endDateController,
            prefixIcon: Icons.calendar_month,
            hintText: "Select end date",
            validator: endDateValidator,
            onTap: _pickEndDate,
          ),
          const SizedBox(height: 20),
          BlocBuilder<BookingHistoryCubit, BookingHistoryState>(
            builder: (context, state) {
              final isEditing = state.editingIds.contains(widget.book.id);

              if (isEditing) {
                return const Center(
                  child: CircularProgressIndicator(color: kPrimaryColor),
                );
              }

              return PrimaryButton(
                text: "Confirm",
                onTap: () {
                  if (!_formKey.currentState!.validate()) return;

                  if (_datesUnchanged()) {
                    showSnackBar(
                      context: context,
                      message: "You didn’t change anything",
                    );
                    return;
                  }

                  context.read<BookingHistoryCubit>().editBooking(
                    booking: widget.book,
                    startDate: _formatDate(startDate!),
                    endDate: _formatDate(endDate!),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
