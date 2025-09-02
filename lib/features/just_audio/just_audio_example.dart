import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:http/http.dart' as http;

class JustAudioExample extends StatefulWidget {
  const JustAudioExample({super.key});

  @override
  State<JustAudioExample> createState() => _JustAudioExampleState();
}

class _JustAudioExampleState extends State<JustAudioExample> {
  final _player = AudioPlayer(
    audioLoadConfiguration: AudioLoadConfiguration(
      androidLoadControl: AndroidLoadControl(
        minBufferDuration: const Duration(seconds: 10),
        maxBufferDuration: const Duration(seconds: 20),
      ),
    ),
  );
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initAudio();
  }

  void _initAudio() async {
    final fileSize = await getFileSize(directUrl);

    if (fileSize == null) {
      print("Could not get file size. Aborting.");
      setState(() {
        _isLoading = false;
      });
      return;
    }

    print("File size is: $fileSize bytes");

    // 2. Now, set the audio source with the correct length
    try {
      await _player.setAudioSource(
        MyCustomSource(fileSize),
        // Add this configuration object
      );
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      print("Error setting audio source: $e");
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: _isLoading
              ? CircularProgressIndicator()
              : IconButton(
                  icon: Icon(Icons.play_arrow, size: 50),
                  onPressed: _player.play,
                ),
        ),
      ),
    );
  }
}

const directUrl =
    'https://archive.org/download/super-mario-64-soundtrack/Super%20Mario%2064%20%28Soundtrack%29/1-02%20Title%20Theme.mp3';

Future<int?> getFileSize(String url) async {
  try {
    final res = await http.head(Uri.parse(url));
    if (res.statusCode == 200) {
      final l = res.headers['content-length'];
      return l != null ? int.parse(l) : null;
    }
  } catch (e) {
    print("Error while fetching file size");
  }
  return null;
}

// Feed your own stream of bytes into the player
class MyCustomSource extends StreamAudioSource {
  final int sourceLength;
  MyCustomSource(this.sourceLength);

  @override
  Future<StreamAudioResponse> request([int? start, int? end]) async {
    start ??= 0;
    end ??= sourceLength;

    print("Player requested bytes from $start to $end");

    final headers = {'Range': 'bytes=$start-${end - 1}'};
    final response = await http.get(Uri.parse(directUrl), headers: headers);
    final decryptedBytes = _decryptChunk(response.bodyBytes);
    final stream = Stream.value(decryptedBytes);

    return StreamAudioResponse(
      sourceLength: sourceLength,
      contentLength: end - start,
      offset: start,
      stream: stream,
      contentType: 'audio/mpeg',
    );
  }
}

Uint8List _decryptChunk(Uint8List encryptedBytes) {
  // Pretending to decrypt...
  return encryptedBytes;
}
