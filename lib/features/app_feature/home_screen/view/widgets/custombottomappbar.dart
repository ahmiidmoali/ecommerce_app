import 'package:enhanced_ecommerce_app/features/app_feature/const/appcolor.dart';
import 'package:enhanced_ecommerce_app/features/app_feature/home_screen/view/cubit/screen_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<ScreenPageCubit>(context);
    return BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: BlocBuilder<ScreenPageCubit, ScreenPageState>(
          builder: (context, state) {
            return Row(
              children: [
                ...List.generate(controller.mypages.length + 1, (index) {
                  int I = index > 2 ? index - 1 : index;
                  return index == 2
                      ? const Spacer()
                      : _CustomButton(
                          iconData: controller.iconsList[I],
                          onPressed: () {
                            controller.changePage(I);
                          },
                          name: controller.appbarname[I],
                          colorCase: controller.current == I ? true : false);
                })
              ],
            );
          },
        ));
  }
}

class _CustomButton extends StatelessWidget {
  final String name;
  final IconData? iconData;
  final void Function()? onPressed;
  final bool colorCase;
  const _CustomButton(
      {super.key,
      required this.name,
      this.iconData,
      this.onPressed,
      required this.colorCase});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            color: colorCase == true ? AppColor.primaryColor : AppColor.grey2,
          ),
          Text(
            name,
            style: TextStyle(
              color: colorCase == true ? AppColor.primaryColor : AppColor.grey2,
            ),
          )
        ],
      ),
    );
  }
}
