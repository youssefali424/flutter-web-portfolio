// A model that represents portfolio apps on landing page.
class ShowcaseAppModel {
  final String name;
  final String? appStoreURL;
  final String? playStoreURL;
  final String? githubURL;
  final String? pubDevURL;
  final Map<String, String>? customUrls;

  final String image;
  final String topic;

  const ShowcaseAppModel.withNetworkAsset({
    required this.name,
    this.appStoreURL,
    this.playStoreURL,
    this.githubURL,
    this.pubDevURL,
    required this.image,
    required this.topic,
    this.customUrls,
  }) : _isNetworkImage = true;

  const ShowcaseAppModel.withLocalAsset({
    required this.name,
    this.appStoreURL,
    this.playStoreURL,
    this.githubURL,
    this.pubDevURL,
    required this.image,
    required this.topic,
    this.customUrls,
  }) : _isNetworkImage = true;
  const ShowcaseAppModel.withNetworkCustomUrl({
    required this.name,
    required this.customUrls,
    required this.image,
    required this.topic,
  })  : _isNetworkImage = true,
        appStoreURL = null,
        playStoreURL = null,
        githubURL = null,
        pubDevURL = null;

  const ShowcaseAppModel.withLocalCustomUrl({
    required this.name,
    required this.customUrls,
    required this.image,
    required this.topic,
  })  : _isNetworkImage = false,
        appStoreURL = null,
        playStoreURL = null,
        githubURL = null,
        pubDevURL = null;

  final bool _isNetworkImage;
  bool get isNetworkImage => _isNetworkImage;

  bool get isCustomUrl => customUrls != null && customUrls!.isNotEmpty;
}

// List of apps that will be listed on landing page.
const apps = [
  ShowcaseAppModel.withLocalCustomUrl(
    name: 'APPExperts',
    image: 'assets/images/appexperts.jpg',
    customUrls: {
      'Website': 'https://appexperts.io',
      'Facebook': 'https://www.facebook.com/appexperts.io',
      'Twitter': 'https://twitter.com/appexperts_io',
      'Instagram': 'https://www.instagram.com/appexperts.io',
      'LinkedIn': 'https://www.linkedin.com/company/appexpertsio/',
    },
    topic:
        'APPExperts is an Intuitive SaaS Platform that integrates your WordPress website to build a fully-functional iOS and Android application.',
  ),
  ShowcaseAppModel.withLocalAsset(
    name: 'التقويم الهجري والميلادي',
    image: 'assets/images/hijri.jpg',
    appStoreURL:
        "https://apps.apple.com/us/app/التقويم-الهجري-والميلادي/id1532182932",
    playStoreURL:
        "https://play.google.com/store/apps/details?id=com.saudicalendars.calendar_app",
    topic:
        'Hijri and greogrian calendar with all the features you need to know the date and time in both calendars',
  ),
  ShowcaseAppModel.withLocalAsset(
    name: 'مواعيدي و مهامي',
    image: 'assets/images/events.jpg',
    appStoreURL: "https://apps.apple.com/us/app/مواعيدي-و-مهامي/id1459367316",
    playStoreURL:
        "https://play.google.com/store/apps/details?id=appar.calendars.events",
    topic:
        'My tasks and my appointments is a simple and easy to use application that helps you to manage your tasks and appointments',
  ),
  ShowcaseAppModel.withLocalAsset(
    name: 'Saudi Calendar',
    image: 'assets/images/saudi.jpg',
    appStoreURL: "https://apps.apple.com/us/app/تقويم-السعودية/id1479182106",
    playStoreURL:
        "https://play.google.com/store/apps/details?id=com.saudicalendars.app",
    topic: 'Saudi Calendar',
  ),
  ShowcaseAppModel.withLocalAsset(
    name: 'Agamy Institute',
    image: 'assets/images/algamy.jpg',
    appStoreURL: "https://apps.apple.com/eg/app/agamy-institute/id1489591628",
    playStoreURL:
        "https://play.google.com/store/apps/details?id=com.objects.alagamy_institute",
    topic:
        'The first and largest higher institute in Ajami accredited and equivalent to the Ministerial Decree No 146 of the Ministry of Higher Education Duration of study by four academic years conferring a bachelor degree',
  ),
  ShowcaseAppModel.withLocalAsset(
    name: 'Saudi Academic Calendar',
    image: 'assets/images/study.jpg',
    appStoreURL:
        "https://apps.apple.com/us/app/التقويم-الدراسي-السعودي/id1319273089",
    playStoreURL:
        "https://play.google.com/store/apps/details?id=com.saudicalendars.academic",
    topic: 'Saudi Academic Calendar',
  ),
  ShowcaseAppModel.withLocalAsset(
    name: 'Saudi Pension Calendar',
    image: 'assets/images/pension.jpg',
    appStoreURL:
        "https://apps.apple.com/us/app/موعد-رواتب-التقاعد-والمتقاعدين/id1349074395",
    playStoreURL:
        "https://play.google.com/store/apps/details?id=com.saudicalendars.pension",
    topic: 'Saudi Pension Calendar',
  ),
  ShowcaseAppModel.withLocalAsset(
    name: 'Atlas Elevators',
    image: 'assets/images/atlas.jpg',
    appStoreURL: "https://apps.apple.com/eg/app/agamy-institute/id1489591628",
    playStoreURL:
        "https://play.google.com/store/apps/details?id=xicom.Atlas_Elevators&hl=en&gl=US",
    topic:
        'Atlas Elevators Application that offers you full details related to Elevators, cabins etc. Application comes up with a complete catalog and contact module so any queries you can connect with us over the live chat and we will assist you.',
  ),
];
const packages = [
  ShowcaseAppModel.withLocalCustomUrl(
    name: 'Animated Image List',
    image: 'assets/images/animated_list.webp',
    customUrls: {
      'Pub.dev': 'https://pub.dev/packages/animated_image_list',
      'GitHub': 'https://github.com/youssefali424/animated_image_list',
    },
    topic:
        'Flutter Animated image list with parallax effect and image lightbox.',
  ),
  ShowcaseAppModel.withLocalCustomUrl(
    name: 'Animated Navigation Rail',
    image: 'assets/images/rail.gif',
    customUrls: {
      'Pub.dev': 'https://pub.dev/packages/animated_rail',
      'GitHub': 'https://github.com/youssefali424/AnimatedRail',
    },
    topic:
        'Flutter Animated Naviation Rail with multiple cool effects see example project.',
  ),
];
