import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medicare/patient/appointmentManagement/models/models_for_mapping.dart';

class CustomSlotGrid extends StatelessWidget {
  final List<AvailabilityDto> slots;
  final AvailabilityDto? selectedSlot;
  final void Function(AvailabilityDto) onSlotSelected;

  const CustomSlotGrid({
    super.key,
    required this.slots,
    required this.selectedSlot,
    required this.onSlotSelected,
  });

  @override
  Widget build(BuildContext context) {
    if (slots.isEmpty) {
      return const Center(child: Text('No available slots'));
    }
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: slots.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 3.5,
      ),
      itemBuilder: (context, index) {
        ///This checks if the currently selected slot (selectedSlot) is equal to the slot at this index.
        final slot = slots[index];
        final isSelected = selectedSlot == slot;

        return GestureDetector(
          onTap: () => onSlotSelected(slot),
          child: Container(
            decoration: BoxDecoration(
              color: isSelected ? Colors.blueAccent : Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: isSelected
                  ? Border.all(color: Colors.blue, width: 2)
                  : null,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withAlpha(50),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                )
              ],
            ),
            child: Center(
              child: Text(
                DateFormat('hh:mm a').format(slot.startTime.toLocal()),
                style: TextStyle(fontSize: 16, color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
