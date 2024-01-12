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
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
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
                focusNode: _focusNode,
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
