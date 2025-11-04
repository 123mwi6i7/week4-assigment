import 'dart:io';

void main() async {
  // A collection to store all entries
  List<Map<String, String>> entries = [];

  print("=== Dart Utility Application ===");
  stdout.write("Enter a word or sentence: ");
  String? input = stdin.readLineSync();

  if (input != null && input.isNotEmpty) {
    // --- STRING MANIPULATION ---
    String concatenated = input + " (added text)";
    String interpolated = "You entered: $input";
    String substring = input.length >= 3 ? input.substring(0, 3) : input;
    String upper = input.toUpperCase();
    String lower = input.toLowerCase();
    String reversed = input.split('').reversed.join('');
    int length = input.length;

    // --- DATE AND TIME ---
    DateTime now = DateTime.now();
    String timestamp = now.toString();

    // --- STORE RESULTS IN A COLLECTION (MAP) ---
    Map<String, String> entry = {
      'original': input,
      'concatenated': concatenated,
      'interpolated': interpolated,
      'substring': substring,
      'uppercase': upper,
      'lowercase': lower,
      'reversed': reversed,
      'length': length.toString(),
      'timestamp': timestamp
    };

    entries.add(entry);

    // --- DISPLAY RESULTS ---
    print("\n--- Results ---");
    entry.forEach((key, value) {
      print("$key: $value");
    });

    // --- FILE HANDLING ---
    File file = File('entries_log.txt');

    try {
      await file.writeAsString("${entry.toString()}\n", mode: FileMode.append);
      print("\n✅ Entry saved successfully to 'entries_log.txt'!");
    } catch (e) {
      print("❌ Error writing to file: $e");
    }

    // --- COLLECTION EXAMPLES ---
    print("\n--- Collection Demonstration ---");

    // List example
    List<String> words = [input, reversed, upper];
    words.add('End');
    print("List: $words");

    // Set example (removes duplicates automatically)
    Set<String> uniqueWords = words.toSet();
    print("Set: $uniqueWords");

    // Map example (stores key-value pairs)
    Map<String, dynamic> summary = {
      'Total Entries': entries.length,
      'Last Entry Time': timestamp
    };
    print("Map: $summary");

    // --- DATE MANIPULATION EXAMPLE ---
    DateTime nextWeek = now.add(Duration(days: 7));
    DateTime lastWeek = now.subtract(Duration(days: 7));
    Duration difference = nextWeek.difference(lastWeek);

    print("\n--- Date Operations ---");
    print("Now: $now");
    print("Next Week: $nextWeek");
    print("Last Week: $lastWeek");
    print("Difference in days: ${difference.inDays}");
  } else {
    print("⚠️ No input provided. Please run the program again.");
  }

  print("\n=== End of Program ===");
}
