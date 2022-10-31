import 'package:flutter/widgets.dart';

import 'service.dart';

Future<void> runService(Service service) async {
  WidgetsFlutterBinding.ensureInitialized();
  await service._initialize();
}

abstract class Service {
  const Service();

  Future<void> _initialize();
}

class DevelopmentService extends Service {
  const DevelopmentService();

  @override
  Future<void> _initialize() async {
    await DatabaseService.developementService();
    RepositoryService.developementService();
    CustomMessages.initialize();
  }
}

class ProductionService extends Service {
  const ProductionService();

  @override
  Future<void> _initialize() async {
    await DatabaseService.productionService();
    RepositoryService.productionService();
    CustomMessages.initialize();
  }
}
