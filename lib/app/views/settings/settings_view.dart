import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:retip/app/views/dev/dev_view.dart';
import 'package:retip/app/views/settings/widgets/settings_tile.dart';
import 'package:retip/app/widgets/buttons/rp_back_button.dart';
import 'package:retip/app/widgets/retip_icon.dart';
import 'package:retip/app/widgets/rp_app_bar.dart';
import 'package:retip/app/widgets/rp_divider.dart';
import 'package:retip/app/widgets/rp_icon_button.dart';
import 'package:retip/app/widgets/rp_text.dart';
import 'package:retip/app/widgets/spacer.dart';
import 'package:retip/core/l10n/retip_l10n.dart';
import 'package:retip/core/utils/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import 'cubit/settings_cubit.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final packageInfo = GetIt.I.get<PackageInfo>();
    final l10n = RetipL10n.of(context);
    final version = '${packageInfo.version}+${packageInfo.buildNumber}';

    return Scaffold(
      appBar: RpAppBar(
        leading: const RpBackButton(),
        title: RpText(RetipL10n.of(context).settings),
      ),
      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          final cubit = context.read<SettingsCubit>();

          return ListView(
            padding: const EdgeInsets.symmetric(vertical: Sizer.x2),
            physics: const BouncingScrollPhysics(),
            children: [
              RpDivider(
                text: l10n.appearance,
              ),
              SizedBox(
                height: Sizer.x5 + Sizer.x2,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) =>
                      const HorizontalSpacer(),
                  padding: const EdgeInsets.all(Sizer.x1),
                  itemCount: Colors.primaries.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final color = Colors.primaries[index];
                    final isToggled = color == state.themeColor;

                    return GestureDetector(
                      onTap: () => cubit.setColorTheme(color),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Sizer.x0_5),
                          color: color,
                        ),
                        width: Sizer.x5,
                        height: Sizer.x5,
                        child: isToggled
                            ? Icon(
                                color: Theme.of(context).colorScheme.onPrimary,
                                Icons.check,
                              )
                            : null,
                      ),
                    );
                  },
                ),
              ),
              SettingsTile(
                onTap: cubit.toggleDarkMode,
                title: l10n.themeMode,
                subtitle: state.darkMode ? l10n.dark : l10n.light,
                icon: state.darkMode ? Icons.dark_mode : Icons.light_mode,
                trailing: state.darkMode
                    ? RpIconButton.filled(
                        icon: Icons.toggle_on,
                        onPressed: cubit.toggleDarkMode,
                      )
                    : RpIconButton(
                        icon: Icons.toggle_off_outlined,
                        onPressed: cubit.toggleDarkMode,
                      ),
              ),
              SettingsTile(
                onTap: cubit.toggleBatterySaver,
                title: l10n.batterySaver,
                subtitle: state.batterySaver ? l10n.on : l10n.off,
                icon: state.batterySaver
                    ? Icons.battery_saver
                    : Icons.battery_std,
                trailing: state.batterySaver
                    ? RpIconButton.filled(
                        icon: Icons.toggle_on,
                        onPressed: cubit.toggleBatterySaver,
                      )
                    : RpIconButton(
                        icon: Icons.toggle_off_outlined,
                        onPressed: cubit.toggleBatterySaver,
                      ),
              ),
              RpDivider(
                text: l10n.playback,
              ),
              SettingsTile(
                title: l10n.autoplay,
                icon: Icons.play_circle_outline,
                trailing: RpIconButton(
                  icon: Icons.toggle_off_outlined,
                  onPressed: () {},
                ),
              ),
              SettingsTile(
                title: l10n.crossfade,
                icon: Icons.graphic_eq,
                trailing: RpIconButton(
                  icon: Icons.toggle_off_outlined,
                  onPressed: () {},
                ),
              ),
              SettingsTile(
                title: l10n.equalizer,
                icon: Icons.equalizer,
                trailing: const RpIconButton(icon: Icons.arrow_forward),
              ),
              RpDivider(
                text: l10n.info,
              ),
              SettingsTile(
                title: l10n.aboutApp,
                icon: Icons.info,
                trailing: const RpIconButton(icon: Icons.arrow_forward),
                onTap: () {
                  showAboutDialog(
                    applicationName: l10n.retip,
                    applicationLegalese: l10n.legalese,
                    applicationIcon: const RetipIcon(size: Size.square(64)),
                    applicationVersion: 'v$version',
                    context: context,
                  );
                },
              ),
              SettingsTile(
                title: l10n.checkForUpdate,
                icon: Icons.update,
                trailing: const RpIconButton(icon: Icons.shop),
                onTap: () {
                  final url = Uri.parse(
                    'https://play.google.com/store/apps/details?id=dev.rozpo.retip',
                  );
                  launchUrl(url, mode: LaunchMode.externalApplication);
                },
              ),
              SettingsTile(
                title: l10n.privacyPolicy,
                icon: Icons.privacy_tip,
                trailing: const RpIconButton(icon: Icons.public),
                onTap: () {
                  final url = Uri.parse(
                    'https://github.com/rozpo/retip/blob/main/docs/PRIVACY_POLICY.md',
                  );
                  launchUrl(url, mode: LaunchMode.externalApplication);
                },
              ),
              SettingsTile(
                title: l10n.termsAndConditions,
                icon: Icons.gavel,
                trailing: const RpIconButton(icon: Icons.public),
                onTap: () {
                  final url = Uri.parse(
                      'https://github.com/rozpo/retip/blob/main/docs/TERMS_AND_CONDITIONS.md');
                  launchUrl(url, mode: LaunchMode.externalApplication);
                },
              ),
              SettingsTile(
                title: l10n.licenses,
                icon: Icons.description,
                trailing: const RpIconButton(icon: Icons.arrow_forward),
                onTap: () {
                  showLicensePage(
                    applicationLegalese: l10n.legalese,
                    applicationName: l10n.retip,
                    applicationIcon: const RetipIcon(size: Size.square(64)),
                    applicationVersion: 'v$version',
                    context: context,
                  );
                },
              ),
              if (kReleaseMode == false) ...[
                RpDivider(
                  text: l10n.developer,
                ),
                SettingsTile(
                  title: l10n.developerMenu,
                  icon: Icons.developer_board,
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const DevView(),
                    ),
                  ),
                  trailing: const RpIconButton(icon: Icons.arrow_forward),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}
