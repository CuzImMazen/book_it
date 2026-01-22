// const String baseUrl = "http://10.147.45.99:8000/api";
import 'package:flutter_dotenv/flutter_dotenv.dart';

final baseUrl = dotenv.env['BASE_URL'] ?? "";
