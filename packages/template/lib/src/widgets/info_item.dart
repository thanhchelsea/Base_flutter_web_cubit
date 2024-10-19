part of template;

class InfoItem extends StatelessWidget {
  InfoItem({
    super.key,
    this.title,
    required this.data,
    this.dataWidget,
    this.isVertical = true,
    this.colorText,
    this.fontSizeText,
    this.colorTitle,
    this.maxLine,
  });
  String? title;
  String data;
  Widget? dataWidget;
  bool isVertical;
  late TextTheme textTheme;
  double? fontSizeText;
  ThemeColorExtension? themeColor;
  Color? colorText;
  Color? colorTitle;
  int? maxLine;
  @override
  Widget build(BuildContext context) {
    textTheme = Theme.of(context).textTheme;
    themeColor = Theme.of(context).extension<ThemeColorExtension>();
    if (!isVertical) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Text(
              title!,
              style: textTheme.labelMedium?.copyWith(
                color: Colors.black38,
                fontSize: fontSizeText,
                fontWeight: FontWeight.w400,
              ),
            ),
          const Gap(4),
          Expanded(
            child: Text(
              data,
              maxLines: maxLine,
              style: textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: colorText,
                  fontSize: fontSizeText,
                  overflow: TextOverflow.ellipsis
                  // color: themeColor?.ksBody,
                  ),
            ),
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(
            title!,
            style: textTheme.labelMedium?.copyWith(
              color: colorTitle ?? themeColor?.ksBody,
            ),
          ),
        const Gap(4),
        Container(
          // width: 200,
          child: Text(
            data,
            maxLines: 1,
            style: textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w600, overflow: TextOverflow.ellipsis,
              color: colorText, fontSize: fontSizeText,
              // color: themeColor?.ksBody,
            ),
          ),
        ),
      ],
    );
  }
}
