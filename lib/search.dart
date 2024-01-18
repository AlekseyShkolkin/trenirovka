import 'package:english_words/english_words.dart' as english_words;
import 'package:flutter/material.dart';

class AppBarSearchExample extends StatefulWidget {
  const AppBarSearchExample({key});

  @override
  AppBarSearchExampleState createState() => AppBarSearchExampleState();
}

class AppBarSearchExampleState extends State<AppBarSearchExample> {
  final List<String> kEnglishWords;

  MySearchDelegate delegate;

  AppBarSearchExampleState()
      : kEnglishWords = List.from(Set.from(english_words.all))
          ..sort(
            (w1, w2) => w1.toLowerCase().compareTo(w2.toLowerCase()),
          ),
        super();

  @override
  void initState() {
    super.initState();
    delegate = MySearchDelegate(kEnglishWords);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
        //   title: const Text('English Words'),
        //   actions: <Widget>[
        //     IconButton(
        //       tooltip: 'Search',
        //       icon: const Icon(Icons.search),
        //       onPressed: () async {
        //         final String selected = await showSearch<String>(
        //           context: context,
        //           delegate: delegate,
        //         );
        //         if (mounted && selected != null) {
        //           ScaffoldMessenger.of(context).showSnackBar(
        //             SnackBar(
        //               content: Text('You have selected the word: $selected'),
        //             ),
        //           );
        //         }
        //       },
        //     ),
        //   ],
        // ),
        // body: Scrollbar(
        //   child: ListView.builder(
        //     itemCount: kEnglishWords.length,
        //     itemBuilder: (context, idx) => ListTile(
        //       title: Text(kEnglishWords[idx]),
        //     ),
        //   ),
        // ),
        );
  }
}

class MySearchDelegate extends SearchDelegate<String> {
  final List<String> words;
  final List<String> history;

  MySearchDelegate(List<String> words)
      : words = words,
        history = <String>[
          'жим штанги лёжа',
          'приседания со штангой на плечах',
          'становая тяга',
          'отжимания от брусьев'
        ],
        super();

  // Leading icon in search bar.
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'назад',
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        // SearchDelegate.close() can return vlaues, similar to Navigator.pop().
        this.close(context, '');
      },
    );
  }

  // Widget of result page.
  @override
  Widget buildResults(BuildContext context) {
    Future.delayed(Duration.zero, () {
      this.close(context, this.query);
    });

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('You have selected the word:'),
            GestureDetector(
              onTap: () {
                // Returns this.query as result to previous screen, c.f.
                // showSearch() above.
                this.close(context, this.query);
              },
              child: Text(
                this.query,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Suggestions list while typing (this.query).
  @override
  Widget buildSuggestions(BuildContext context) {
    final Iterable<String> suggestions = this.query.isEmpty
        ? history
        : words.where((word) => word.startsWith(query));

    return _SuggestionList(
      query: this.query,
      suggestions: suggestions.toList(),
      onSelected: (String suggestion) {
        this.query = suggestion;
        this.history.insert(0, suggestion);
        showResults(context);
      },
    );
  }

  // Action buttons at the right of search bar.
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      if (query.isNotEmpty)
        IconButton(
          tooltip: 'очистить',
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
            showSuggestions(context);
          },
        ),
    ];
  }
}

// Suggestions list widget displayed in the search page.
class _SuggestionList extends StatelessWidget {
  const _SuggestionList(
      {@required this.suggestions,
      @required this.query,
      @required this.onSelected});

  final List<String> suggestions;
  final String query;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.titleMedium;
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int i) {
        final String suggestion = suggestions[i];
        return ListTile(
          leading: query.isEmpty ? const Icon(Icons.history) : const Icon(null),
          // Highlight the substring that matched the query.
          title: RichText(
            text: TextSpan(
              text: suggestion.substring(0, query.length),
              style: textTheme.copyWith(fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                  text: suggestion.substring(query.length),
                  style: textTheme,
                ),
              ],
            ),
          ),
          onTap: () {
            onSelected(suggestion);
          },
        );
      },
    );
  }
}
