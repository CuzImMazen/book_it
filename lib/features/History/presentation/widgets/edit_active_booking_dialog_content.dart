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
  late final DateTime originalEndDate;
  DateTime? endDate;

  @override
  void initState() {
    super.initState();
    originalEndDate = DateTime.parse(widget.book.endDate);
    endDate = originalEndDate;
    _endDateController.text = _formatDate(endDate!);
  }

  @override
  void dispose() {
    _endDateController.dispose();
    super.dispose();
  }

  String _formatDate(DateTime date) {
    final m = date.month.toString().padLeft(2, '0');
    final d = date.day.toString().padLeft(2, '0');
    return "${date.year}-$m-$d";
  }

  Future<void> pickEndDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: endDate ?? originalEndDate,
      firstDate: DateTime.now().add(const Duration(days: 1)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (picked != null) {
      setState(() {
        endDate = picked;
        _endDateController.text = _formatDate(picked);
      });
    }
  }

  bool _endDateUnchanged() {
    return endDate!.isAtSameMomentAs(originalEndDate);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const LabelText(text: "End Date :"),
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
        BlocBuilder<BookingHistoryCubit, BookingHistoryState>(
          builder: (context, state) {
            final isEditing = state.editingIds.contains(widget.book.id);
            if (isEditing) {
              return const Center(
                child: CircularProgressIndicator(color: kPrimaryColor),
              );
            } else {
              return PrimaryButton(
                text: "Confirm",
                onTap: () {
                  if (_endDateUnchanged()) {
                    showSnackBar(
                      context: context,
                      message: "You didn’t change anything",
                    );
                    return;
                  }

                  context.read<BookingHistoryCubit>().editBooking(
                    booking: widget.book,
                    endDate: _formatDate(endDate!),
                  );
                },
              );
            }
          },
        ),
      ],
    );
  }
}
