import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:catbreeds/ui/pages/landing/cat_breeds_list.dart';

class IOSLandingPage extends ConsumerStatefulWidget {
  const IOSLandingPage({Key? key}) : super(key: key);

  @override
  ConsumerState<IOSLandingPage> createState() => _IOSLandingPageState();
}

class _IOSLandingPageState extends ConsumerState<IOSLandingPage> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Catbreeds'),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoSearchTextField(
                controller: _searchController,
                onChanged: (value) => setState(() {}),
              ),
            ),
            Expanded(
              child: CatBreedsList(
                searchQuery: _searchController.text,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
