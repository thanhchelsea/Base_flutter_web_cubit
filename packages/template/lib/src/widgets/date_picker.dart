part of template;

class DatePickerField extends StatefulWidget {
  DatePickerField({
    super.key,
    required this.title,
    this.onChanged,
    this.initDate,
    this.isRequired = false,
    this.enable = true,
    this.validator,
    this.isVertical = true,
  });
  String title;
  Function? onChanged;
  DateTime? initDate;
  bool isRequired;
  bool enable;
  bool isVertical;
  String? Function(dynamic)? validator;
  @override
  State<DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  DateTime selectedDate = DateTime.now();
  DateTime? initDate;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    initDate = widget.initDate;
    controller.text = (widget.initDate ?? DateTime.now())
            .toString()
            .toDateTimeString(format: 'yyyy-MM-dd') ??
        '';
    super.initState();
  }

  @override
  void didUpdateWidget(covariant DatePickerField oldWidget) {
    if (oldWidget.initDate.toString() != widget.initDate.toString()) {
      setState(() {
        initDate = widget.initDate;
        controller.text = (widget.initDate ?? DateTime.now())
                .toString()
                .toDateTimeString(format: 'yyyy-MM-dd') ??
            '';
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !widget.enable,
      child: FormField(
        validator: (value) {
          return widget.validator?.call(selectedDate);
        },
        builder: (field) {
          if (widget.isVertical) {
            return InkWell(
              onTap: () {
                _selectDate(context, field);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    // maxLines: 1,
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: widget.title,
                            style: TextStyle(overflow: TextOverflow.ellipsis)),
                        if (widget.isRequired)
                          const TextSpan(
                            text: "*",
                            style: TextStyle(color: Colors.red),
                          ),
                      ],
                    ),
                  ),
                  const Gap(6),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            AppBoxShadow.ksSmallShadow(),
                          ],
                        ),
                        child: AppTextField(
                          isRequired: widget.isRequired,
                          controller: controller,
                          keyboardType: TextInputType.multiline,
                          hintText: widget.title,
                          backgroundColor: Colors.white,
                          borderColor:
                              field.hasError ? Colors.red : Colors.transparent,

                          // title: widget.title,
                          showShadow: true,
                          enable: false,
                          prefixIcon: Icon(
                            Icons.date_range,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      if (field.hasError)
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          child: Text(
                            field.errorText ?? '',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.red,
                            ),
                          ),
                        )
                    ],
                  ),
                ],
              ),
            );
          }
          return InkWell(
            onTap: () {
              _selectDate(context, field);
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  // maxLines: 1,
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: widget.title,
                          style: TextStyle(overflow: TextOverflow.ellipsis)),
                      if (widget.isRequired)
                        const TextSpan(
                          text: "*",
                          style: TextStyle(color: Colors.red),
                        ),
                    ],
                  ),
                ),
                const Gap(6),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            AppBoxShadow.ksSmallShadow(),
                          ],
                        ),
                        child: AppTextField(
                          isRequired: widget.isRequired,
                          controller: controller,
                          keyboardType: TextInputType.multiline,
                          hintText: widget.title,
                          backgroundColor: Colors.white,
                          borderColor:
                              field.hasError ? Colors.red : Colors.transparent,

                          // title: widget.title,
                          showShadow: true,
                          enable: false,
                          prefixIcon: Icon(
                            Icons.date_range,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      if (field.hasError)
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          child: Text(
                            field.errorText ?? '',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.red,
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  _selectDate(
    BuildContext context,
    FormFieldState<Object?> field,
  ) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(),
          ),
          child: child ?? Container(),
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      field.didChange(picked);
      setState(() {
        selectedDate = picked;
        String date =
            selectedDate.toString().toDateTimeString(format: "yyyy-MM-dd");
        controller.text = date;
        widget.onChanged?.call(selectedDate);
      });
    }
  }
}
