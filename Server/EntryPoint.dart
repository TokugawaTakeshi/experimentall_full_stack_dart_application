import "dart:io";

import "package:args/args.dart";
import "package:shelf/shelf.dart" as Shelf;
import "package:shelf/shelf_io.dart" as InputOutput;

const _hostname = "localhost";


class ErrorsCodes {
  static int commandLineUsage = 64;
}



void main(List<String> args) async {

  ArgParser parser = ArgParser()..addOption('port', abbr: 'p');
  ArgResults result = parser.parse(args);

  String port__raw = result["port"] ?? Platform.environment["PORT"] ?? "8080";
  int? port = int.tryParse(port__raw);

  if (port == null) {
    stdout.writeln("Could not parse port value '$port__raw' into a number.");
    exitCode = ErrorsCodes.commandLineUsage;
    return;
  }

  Shelf.Handler handler = const Shelf.Pipeline().
      addMiddleware(Shelf.logRequests()).
      addHandler(_echoRequest);

  HttpServer server = await InputOutput.serve(handler, _hostname, port);
  print("Serving at http://${server.address.host}:${server.port}");
}

Shelf.Response _echoRequest(Shelf.Request request) =>
    Shelf.Response.ok("Request for '${request.url}'");
