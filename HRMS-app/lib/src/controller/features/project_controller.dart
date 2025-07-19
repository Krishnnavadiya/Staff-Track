import 'package:get/get.dart';
import 'package:hrms/src/model/project_model.dart';
import 'package:hrms/src/model/response/project_response_model.dart';
import 'package:hrms/src/repository/feature_repository.dart';

class ProjectController extends GetxController {
  FeatureRepository featureRepository = FeatureRepository();
  RxList<ProjectModel> projects = <ProjectModel>[].obs;
  
  Future<void> getAllProjects() async {
    ProjectResponseModel result = await featureRepository.getAllProjects();
    if (result.success == true) {
      projects.value = result.data!;
    }
  }
}
