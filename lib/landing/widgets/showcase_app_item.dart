import 'package:app/landing/widgets/interactive_image_viewer.dart';
import 'package:app/landing/widgets/source_aware_image.dart';
import 'package:app/utilities/showcase_app_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app/landing/landing_screen.dart';
import 'package:app/landing/widgets/animated_image_overlay.dart';
import 'package:app/landing/widgets/external_link_button.dart';

class ShowcaseAppItem extends StatelessWidget {
  final ShowcaseAppModel app;
  final double itemWidth;

  const ShowcaseAppItem(
    this.app, {
    Key? key,
    required this.itemWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: itemWidth,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
          bottomLeft: Radius.circular(4.0),
          bottomRight: Radius.circular(4.0),
        ),
        child: Container(
          color: cardColor,
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: itemWidth * 1.7,
                    child: SourceAwareImage(
                      image: app.image,
                      isNetworkImage: app.isNetworkImage,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned.fill(
                    child: GestureDetector(
                      // When overlay tapped, open full screen interactive image viewer.
                      onTap: () {
                        showGeneralDialog(
                          context: context,
                          barrierDismissible: true,
                          barrierLabel: MaterialLocalizations.of(context)
                              .modalBarrierDismissLabel,
                          pageBuilder: (_, __, ___) {
                            return InteractiveImageViewer(
                              image: app.image,
                              isNetworkImage: app.isNetworkImage,
                            );
                          },
                        );
                      },
                      child: AnimatedImageOverlay(app.topic),
                    ),
                  ),
                ],
              ),
              _buildBottom(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottom() {
    return Padding(
      padding: const EdgeInsets.all(24.0).copyWith(bottom: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: _buildAppName()),
                  ),
                ],
              ),
              const Divider(
                color: dividerColor,
                thickness: 1.5,
                height: 32.0,
              ),
            ],
          ),
          if (app.playStoreURL != null) ...[
            ExternalLinkButton(
              url: app.playStoreURL!,
              iconData: FontAwesomeIcons.googlePlay,
              label: 'Play Store',
            ),
            const SizedBox(height: 10.0),
          ],
          if (app.appStoreURL != null) ...[
            ExternalLinkButton(
              url: app.appStoreURL!,
              iconData: FontAwesomeIcons.appStoreIos,
              label: 'App Store',
            ),
            const SizedBox(height: 10.0),
          ],
          if (app.githubURL != null)
            ExternalLinkButton(
              url: app.githubURL!,
              iconData: FontAwesomeIcons.squareGithub,
              label: 'GitHub',
            ),
          if (app.isCustomUrl)
            ...app.customUrls!.map((e) => ExternalLinkButton(
                  url: e.url,
                  iconData: e.iconData,
                  label: e.name,
                )),
        ],
      ),
    );
  }

  Widget _buildAppName() {
    return Text(
      app.name,
      style: const TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
        color: Colors.white,
        letterSpacing: 1.4,
      ),
    );
  }
}
