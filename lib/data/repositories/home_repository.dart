import '../models/category_model.dart';
import '../models/service_model.dart';
import '../models/info_item_model.dart';

/// Replace with API calls later.
/// For now, returns clean mock data with SVG paths you will swap.
class HomeRepository {
  const HomeRepository();

  List<CategoryModel> getCategories() => [
    CategoryModel(icon: 'assets/svg/Renovation.svg', label: 'Renovation'),
    CategoryModel(icon: 'assets/svg/Handyman.svg', label: 'Handyman'),
    CategoryModel(icon: 'assets/svg/Moving.svg', label: 'Home shifting'),
    CategoryModel(icon: 'assets/svg/Gardening.svg', label: 'Gardening'),
    CategoryModel(icon: 'assets/svg/Declutter.svg', label: 'Declutter'),
    CategoryModel(icon: 'assets/svg/surface.svg', label: 'Painting'),
  ];

  List<ServiceModel> getPopularServices() => [
    ServiceModel(
      icon: 'assets/svg/Rectangle 37.png',
      label: 'Kitchen Cleaning',
    ),
    ServiceModel(icon: 'assets/svg/Rectangle 38.png', label: 'Sofa Cleaning'),
    ServiceModel(
      icon: 'assets/svg/Rectangle 39.png',
      label: 'Full Home Cleaning',
    ),
  ];

  List<ServiceModel> getCleaningServices() => [
    ServiceModel(
      icon: 'assets/svg/Rectangle 41.png',
      label: 'Kitchen Cleaning',
    ),
    ServiceModel(icon: 'assets/svg/Rectangle 42.png', label: 'Sofa Cleaning'),
    ServiceModel(
      icon: 'assets/svg/Rectangle 43.png',
      label: 'Full Home Cleaning',
    ),
  ];

  List<InfoItemModel> getWhyChooseUs() => const [
    InfoItemModel(
      icon: 'assets/svg/quality.svg',
      title: 'Quality Assurance',
      subtitle: 'Your satisfaction is guaranteed',
    ),
    InfoItemModel(
      icon: 'assets/svg/pricing.svg',
      title: 'Fixed Prices',
      subtitle: 'No hidden costs. Prices are known upfront',
    ),
    InfoItemModel(
      icon: 'assets/svg/hassle.svg',
      title: 'Hassle free',
      subtitle: 'Convenient, time saving and secure',
    ),
  ];

  List<InfoItemModel> getSafetyMeasures() => const [
    InfoItemModel(
      icon: 'assets/svg/mask.png',
      title: 'Usage of masks, gloves & sanitisers',
      subtitle:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dictumst nullam mauris malesuada in. Eget in condimentum porttitor nec tristique penatibus ipsum nunc. ',
    ),
    InfoItemModel(
      icon: 'assets/svg/contactless.png',
      title: 'Low-contact Service Experience',
      subtitle:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dictumst nullam mauris malesuada in. Eget in condimentum porttitor nec tristique penatibus ipsum nunc. ',
    ),
  ];

  /// small round badges row (optional section from screenshot)
  List<InfoItemModel> getBadges() => const [
    InfoItemModel(
      icon: 'assets/svg/bedge1.png',
      title: 'On Demand / Scheduled',
      subtitle: '',
    ),
    InfoItemModel(
      icon: 'assets/svg/bedge2.png',
      title: 'Verified Partners',
      subtitle: '',
    ),
    InfoItemModel(
      icon: 'assets/svg/bedge3.png',
      title: 'Satisfaction Guarantee',
      subtitle: '',
    ),
    InfoItemModel(
      icon: 'assets/svg/bedge4.png',
      title: 'Upfront Pricing',
      subtitle: '',
    ),
    InfoItemModel(
      icon: 'assets/svg/bedge5.png',
      title: 'Highly Trained',
      subtitle: '',
    ),
  ];
}
