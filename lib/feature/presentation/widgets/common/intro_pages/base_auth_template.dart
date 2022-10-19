import 'package:flutter/material.dart';
import 'package:my_flutter_chat/common/app_colors.dart';
import 'package:my_flutter_chat/common/enums.dart';
import 'package:my_flutter_chat/feature/presentation/widgets/common/intro_pages/footer.dart';
import 'package:my_flutter_chat/feature/presentation/widgets/ui/base_box.dart';
import 'package:my_flutter_chat/feature/presentation/widgets/ui/base_button.dart';
import 'package:my_flutter_chat/feature/presentation/widgets/ui/base_wrapper.dart';
import 'package:my_flutter_chat/feature/presentation/widgets/common/intro_pages/toggle_page.dart';

class LinkPage {
  String label;
  PageEnum namePage;

  LinkPage({required this.label, required this.namePage});
}

class BaseAuthTemplate extends StatelessWidget {
  const BaseAuthTemplate({
    Key? key,
    required this.child,
    required this.links,
    required this.textButton,
    required this.clickLink,
    required this.clickNext,
  }) : super(key: key);
  final Widget child;
  final List<LinkPage> links;
  final String textButton;
  final void Function(PageEnum name) clickLink;
  final void Function() clickNext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.purple1,
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: BaseWrapper(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(height: 20),
                    BaseBox(
                      paddingHorizontal: 0,
                      paddingVertical: 0,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                child,
                                BaseButton(
                                  text: textButton,
                                  onTap: clickNext,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(
                              links.length,
                              (index) => TogglePage(
                                text: links[index].label,
                                onTap: ()  {clickLink(links[index].namePage);},
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Footer(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
