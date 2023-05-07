import 'package:flutter/material.dart';

import '../utils/diacritics.dart';

class BoldLetters extends StatelessWidget {
  /// BoldLetters
  ///
  /// Return a Text with specific letters in bold, example:
  ///
  /// hello **world**
  ///
  const BoldLetters({
    super.key,
    required this.string,
    required this.boldString,
    this.customTextStyle,
    this.overflow = TextOverflow.ellipsis,
  });

  final String string;

  final String boldString;

  final TextStyle? customTextStyle;

  final TextOverflow overflow;

  /// List of option matched in search or primary sentence.
  List<String> get listOfString => string.split(' ');

  /// List of matcher, searcher with special words to match.
  List<String> get listOfBoldString => boldString.split(' ');

  int get sentenceLastItemPositioned => listOfString.length;

  List<String> get listOfBoldStringWithOutDiacritics =>
      removeDiacritics(boldString.toLowerCase()).split(' ');

  @override
  Widget build(BuildContext context) {
    final textStyle = customTextStyle ??
        Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w400,
            );
    // Controls if boldString.isEmpty to return same text without styles
    if (boldString.isEmpty) {
      return Text(
        string,
        style: textStyle,
        textScaleFactor: 1,
        overflow: overflow,
      );
    }
    return RichText(
        overflow: overflow,
        text: TextSpan(
          style: textStyle,
          children: listOfString
              .asMap()
              .map((index, word) {
                // Implements remove diacritics for special match and paint correctly word
                final wordWithOutDiacritics =
                    removeDiacritics(word.toLowerCase());
                TextSpan inlineText = TextSpan(
                  text: "$word"
                      "${index == sentenceLastItemPositioned ? '' : ' '}",
                );
                for (int i = 0; i < listOfBoldString.length; i++) {
                  final hasMatch = wordWithOutDiacritics.contains(
                      removeDiacritics(listOfBoldString[i]).toLowerCase());

                  if (hasMatch) {
                    final listBoldCharacters =
                        removeDiacritics(listOfBoldString[i].toLowerCase())
                            .split('');

                    final listCompatibleCharacters = word.split('');

                    if (listOfBoldStringWithOutDiacritics[i] ==
                        removeDiacritics(word).toLowerCase()) {
                      inlineText = TextSpan(
                        text: '$word ',
                        style: textStyle?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                      );
                    } else {
                      inlineText = TextSpan(
                        children: listCompatibleCharacters
                            .asMap()
                            .map((index2, value) {
                              final character =
                                  "$value${index2 == word.length - 1 ? ' ' : ''}";
                              if (listBoldCharacters.contains(
                                  removeDiacritics(value.toLowerCase()))) {
                                return MapEntry(
                                  index2,
                                  TextSpan(
                                    text: character,
                                    style: textStyle?.copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ); // Bold
                              }

                              return MapEntry(
                                index2,
                                TextSpan(
                                  text: character,
                                ),
                              ); //Simple
                            })
                            .values
                            .toList(),
                      );
                    }
                  }
                }
                return MapEntry(index, inlineText);
              })
              .values
              .toList(),
        ));
  }
}
