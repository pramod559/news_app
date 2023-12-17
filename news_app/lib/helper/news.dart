import 'package:http/http.dart' as http;
import 'package:news_app/models/article.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'package:news_app/secret.dart';

class News {
  List<Article> news = [];

  Future<void> getNews() async {
    try {
      var url = Uri.parse(
          "http://newsapi.org/v2/top-headlines?country=in&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=$apiKey");

      var response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        if (jsonData['status'] == "ok") {
          jsonData["articles"].forEach((element) {
            if (element['urlToImage'] != null &&
                element['description'] != null) {
              Article article = Article(
                title: element['title'],
                author: element['author'],
                description: element['description'],
                urlToImage: element['urlToImage'],
                publshedAt: DateTime.parse(element['publishedAt']),
                content: element["content"],
                articleUrl: element["url"],
              );
              news.add(article);
            }
          });
        }
      } else {
        // Handle HTTP error (e.g., print an error message)
        if (kDebugMode) {
          print("HTTP request failed with status: ${response.statusCode}");
        }
      }
    } catch (e) {
      // Handle other errors (e.g., network error, JSON decoding error)
      if (kDebugMode) {
        if (kDebugMode) {}
        print("Error during HTTP request or JSON decoding: $e");
      }
    }
  }
}

class NewsForCategory {
  List<Article> news = [];

  Future<void> getNewsForCategory(String category) async {
    try {
      var url = Uri.parse(
          "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=$apiKey");

      var response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        if (jsonData['status'] == "ok") {
          jsonData["articles"].forEach((element) {
            if (element['urlToImage'] != null &&
                element['description'] != null) {
              Article article = Article(
                title: element['title'],
                author: element['author'],
                description: element['description'],
                urlToImage: element['urlToImage'],
                publshedAt: DateTime.parse(element['publishedAt']),
                content: element["content"],
                articleUrl: element["url"],
              );
              news.add(article);
            }
          });
        }
      } else {
        // Handle HTTP error (e.g., print an error message)
        if (kDebugMode) {
          print("HTTP request failed with status: ${response.statusCode}");
        }
      }
    } catch (e) {
      // Handle other errors (e.g., network error, JSON decoding error)
      if (kDebugMode) {
        print("Error during HTTP request or JSON decoding: $e");
      }
    }
  }
}





// import 'package:http/http.dart' as http;
// import 'package:news_app/models/article.dart';
// import 'dart:convert';

// import 'package:news_app/secret.dart';

// class News {
//   List<Article> news = [];

//   Future<void> getNews() async {
//     var url = Uri.parse(
//         "http://newsapi.org/v2/top-headlines?country=in&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=$apiKey");

//     var response = await http.get(url);

//     var jsonData = jsonDecode(response.body);

//     if (jsonData['status'] == "ok") {
//       jsonData["articles"].forEach((element) {
//         if (element['urlToImage'] != null && element['description'] != null) {
//           Article article = Article(
//             title: element['title'],
//             author: element['author'],
//             description: element['description'],
//             urlToImage: element['urlToImage'],
//             publshedAt: DateTime.parse(element['publishedAt']),
//             content: element["content"],
//             articleUrl: element["url"],
//           );
//           news.add(article);
//         }
//       });
//     }
//   }
// }

// class NewsForCategorie {
//   List<Article> news = [];

//   Future<void> getNewsForCategory(String category) async {
//     /*String url = "http://newsapi.org/v2/everything?q=$category&apiKey=${apiKey}";*/
//     var url = Uri.parse(
//         "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=$apiKey");

//     var response = await http.get(url);

//     var jsonData = jsonDecode(response.body);

//     if (jsonData['status'] == "ok") {
//       jsonData["articles"].forEach((element) {
//         if (element['urlToImage'] != null && element['description'] != null) {
//           Article article = Article(
//             title: element['title'],
//             author: element['author'],
//             description: element['description'],
//             urlToImage: element['urlToImage'],
//             publshedAt: DateTime.parse(element['publishedAt']),
//             content: element["content"],
//             articleUrl: element["url"],
//           );
//           news.add(article);
//         }
//       });
//     }
//   }
// }
