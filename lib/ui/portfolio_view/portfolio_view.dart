import 'package:devraphe/l10n/l10n.dart';
import 'package:devraphe/ui/shared_widgets/dumb_widgets/spacing.dart';
import 'package:devraphe/utilities/constants/portfolio_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'portfolio_viewmodel.dart';

class PortFolioView extends StatelessWidget {
  const PortFolioView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PortFolioViewModel>.reactive(
      viewModelBuilder: () => PortFolioViewModel(),
      builder: (
        BuildContext context,
        PortFolioViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppBar(
            actions: [_LanguageSetter()],
          ),
          backgroundColor: const Color(0xffea5e39).withOpacity(0.90),
          body: OrientationBuilder(
            builder: (context, orientation) =>
                orientation == Orientation.portrait
                    ? const _PortraitView()
                    : const _LandscapeView(),
          ),
        );
      },
    );
  }
}

class _LandscapeView extends ViewModelWidget<PortFolioViewModel> {
  const _LandscapeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, PortFolioViewModel model) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) => Padding(
          padding: EdgeInsets.symmetric(
            horizontal: constraints.maxWidth * 0.05,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PortFolioSpacing.smallHeight(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        height: constraints.maxHeight * 0.70,
                        width: constraints.maxWidth,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255)
                              .withOpacity(0.25),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          child: Row(
                            children: [
                              Expanded(
                                child: Image.asset(
                                  'assets/images/official_image.jpeg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [
                                          Colors.black,
                                          Color(0xffea5e39),
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Raphael\nEzekiel',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2,
                                      ),
                                      PortFolioSpacing.height(10.h),
                                      Text(
                                        AppLocalizations.of(context)
                                            .mobileEngineer,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            ?.copyWith(
                                                fontWeight: FontWeight.normal,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .surface),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    PortFolioSpacing.mediumWidth(),
                    Expanded(
                      flex: 5,
                      child: Text(
                        AppLocalizations.of(context).profileSummary,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              height: 1.5,
                            ),
                      ),
                    ),
                  ],
                ),
                PortFolioSpacing.mediumHeight(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        icon: Icon(
                          Icons.add,
                          color: Theme.of(context).colorScheme.surface,
                        ),
                        onPressed: () {
                          model.emailMe('devraphe@gmail.com');
                        },
                        label: Text(AppLocalizations.of(context).hireMe,
                            style: Theme.of(context).textTheme.bodyText1),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(constraints.maxWidth,
                              constraints.maxHeight * 0.09),
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.r),
                            ),
                          ),
                          elevation: 10,
                        ),
                      ),
                    ),
                    PortFolioSpacing.mediumWidth(),
                    Expanded(
                      child: Material(
                        color: Theme.of(context).colorScheme.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.r),
                          ),
                        ),
                        elevation: 10,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10.r),
                          onTap: () => model.dialMyNumber('09068186315'),
                          child: SizedBox(
                            height: constraints.maxHeight * 0.09,
                            width: constraints.maxWidth,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.phoneAlt,
                                  color: Theme.of(context).colorScheme.surface,
                                ),
                                PortFolioSpacing.smallWidth(),
                                const Text('09068186315')
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                PortFolioSpacing.mediumHeight(),
                Text(
                  AppLocalizations.of(context).socialNetwork,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.surface),
                ),
                Divider(
                  thickness: 1,
                  color: Theme.of(context).colorScheme.surface,
                ),
                PortFolioSpacing.mediumHeight(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (var i = 0; i < 3; i++)
                      GestureDetector(
                        onTap: () {
                          model.navigateToWebView(
                              url: model.links[i], title: model.title[i]);
                        },
                        child: Container(
                          padding: EdgeInsets.all(25.0.w),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 5,
                              color: const Color.fromARGB(255, 255, 176, 176),
                            ),
                          ),
                          child: Icon(
                            model.icons[i],
                            color: Theme.of(context).colorScheme.surfaceVariant,
                            size: 30,
                          ),
                        ),
                      )
                  ],
                ),
                PortFolioSpacing.mediumHeight(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PortraitView extends ViewModelWidget<PortFolioViewModel> {
  const _PortraitView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, PortFolioViewModel model) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) => Padding(
          padding: EdgeInsets.symmetric(
              // vertical: constraints.maxHeight * 0.05,
              horizontal: constraints.maxWidth * 0.05),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PortFolioSpacing.smallHeight(),
                Container(
                  height: constraints.maxHeight * 0.30,
                  width: constraints.maxWidth,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255)
                        .withOpacity(0.25),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.blue,
                            child: Image.asset(
                              'assets/images/official_image.jpeg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.black,
                                    Color(0xffea5e39),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                            ),
                            child: Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Raphael\nEzekiel',
                                      style:
                                          Theme.of(context).textTheme.headline1,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      AppLocalizations.of(context)
                                          .mobileEngineer,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.white70,
                                          ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                PortFolioSpacing.mediumHeight(),
                ElevatedButton.icon(
                  icon: Icon(
                    Icons.add,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  onPressed: () {
                    model.emailMe('devraphe@gmail.com');
                  },
                  label: Text(AppLocalizations.of(context).hireMe),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(
                        constraints.maxWidth, constraints.maxHeight * 0.07),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    maximumSize: Size(
                        constraints.maxWidth, constraints.maxHeight * 0.08),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    elevation: 10,
                  ),
                ),
                PortFolioSpacing.mediumHeight(),
                Text(
                  AppLocalizations.of(context).socialNetwork,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Divider(
                  thickness: 1,
                  color: Theme.of(context).colorScheme.surface,
                ),
                PortFolioSpacing.mediumHeight(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (var i = 0; i < 3; i++)
                      GestureDetector(
                        onTap: () {
                          model.navigateToWebView(
                              url: model.links[i], title: model.title[i]);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(25.0),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 5,
                              color: const Color.fromARGB(255, 255, 176, 176),
                            ),
                          ),
                          child: Icon(
                            model.icons[i],
                            color: Colors.black54,
                            size: 30,
                          ),
                        ),
                      )
                  ],
                ),
                PortFolioSpacing.mediumHeight(),
                Text(AppLocalizations.of(context).bio,
                    style: Theme.of(context).textTheme.bodyText1),
                const Divider(
                  thickness: 1,
                ),
                Text(
                  AppLocalizations.of(context).profileSummary,
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                PortFolioSpacing.mediumHeight(),
                Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.mobile,
                      size: 40,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    PortFolioSpacing.width(18.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () => model.dialMyNumber('2349068186315'),
                            child: Text(
                              '+2349068186315',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                          PortFolioSpacing.tinyHeight(),
                          Divider(
                            thickness: 1,
                            color: Theme.of(context).colorScheme.surface,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                PortFolioSpacing.mediumHeight(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LanguageSetter extends ViewModelWidget<PortFolioViewModel> {
  const _LanguageSetter({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, PortFolioViewModel viewModel) {
    final locale = viewModel.locale;
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        value: locale,
        icon: Container(width: 12),
        items: L10n.all.map(
          (locale) {
            final flag = L10n.getLanguageFlag(locale.languageCode);

            return DropdownMenuItem(
              child: Center(
                child: Text(
                  flag,
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              value: locale,
              onTap: () {
                viewModel.setLocale(locale);
              },
            );
          },
        ).toList(),
        onChanged: (_) {},
      ),
    );
  }
}
