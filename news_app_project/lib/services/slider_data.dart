import 'package:news_app_project/models/slider_model.dart';

List<silderModel> getSliders()
{
  List<silderModel> slider = [];
  silderModel categoryModel = new silderModel();

  categoryModel.image = "images/business.png";
  categoryModel.name = "Bow to The Authority of SilentForce";
  slider.add(categoryModel);
  categoryModel = new silderModel();

  categoryModel.image = "images/business.png";
  categoryModel.name = "Bow to The Authority of SilentForce";
  slider.add(categoryModel);
  categoryModel = new silderModel();

  categoryModel.image = "images/business.png";
  categoryModel.name = "Bow to The Authority of SilentForce";
  slider.add(categoryModel);
  categoryModel = new silderModel();

  return slider;
}