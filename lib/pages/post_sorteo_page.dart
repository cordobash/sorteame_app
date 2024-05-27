import 'package:app_sorteos/models/boxes.dart';
import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:confetti/confetti.dart';
import 'package:app_sorteos/painter/rueda_painter.dart';
import 'package:app_sorteos/generated/l10n.dart';

class PostPage extends StatefulWidget {
  PostPage({Key? key});

  @override
  State<StatefulWidget> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller; // Controlador de la rueda giratoria
  bool tiempoFuera = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this)
          ..repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return tiempoFuera
        ? ResultadosPage()
        : PopScope(
            canPop: false,
            child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
              ),
              body: Center(
                child: SizedBox(
                  height: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CustomPaint(
                        painter: RuedaPainter(
                            animation: _controller, color: colorGlobal),
                        child: SizedBox(
                          width: 160,
                          height: 170,
                        ),
                      ),
                      Center(
                        child: Text(
                          S.current.timeleft,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              fontFamily: 'Barlow'),
                        ),
                      ),
                      Countdown(
                        seconds: indiceListaConteo,
                        build: (BuildContext context, double tiempo) => Text(
                          tiempo.toInt().toString(),
                          style: TextStyle(fontSize: 60, fontFamily: 'Poetsen'),
                        ),
                        onFinished: () => {
                          setState(() {
                            tiempoFuera = true;
                          })
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}

// Cargamos la otra view
class ResultadosPage extends StatefulWidget {
  @override
  State<ResultadosPage> createState() => _ResultadosPageState();
}

class _ResultadosPageState extends State<ResultadosPage> {
  late ConfettiController _confettiController;

  // Sorteo sorteo = boxSorteo.getAt(boxSorteo.length-1);
  double? _deviceWidth, _deviceHeight;

  @override
  void initState() {
    _confettiController = ConfettiController(duration: Duration(seconds: 15));
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;
    _confettiController.play();
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorGlobal.shade700,
        centerTitle: true,
        title: Text(S.current.draw_result_title,
            style: TextStyle(
                color: Colors.white, fontFamily: 'Manrope', fontSize: 18)),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back, color: Colors.white)),
      ),
      body: Center(
          child: SizedBox(
        height: _deviceHeight! * 0.75,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ConfettiWidget(
              confettiController: _confettiController,
              blastDirection: 80,
              emissionFrequency: 0.6,
              minimumSize: const Size(10, 10),
              maximumSize: const Size(20, 20),
              numberOfParticles: 1,
              gravity: 0.1,
            ),
            Image(
                height: 140,
                width: 120,
                image: AssetImage('lib/src/images/trophy.png')),
            Text(
              S.current.draw_congratulations,
              style: TextStyle(
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w700,
                  fontSize: 16),
            ),
            Container(
              width: _deviceWidth! * 0.80,
              height: _deviceHeight! * 0.09,
              decoration: BoxDecoration(
                color: colorGlobal.shade700,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    "${ganadorSorteo}",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'Barlow'),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ),
            ),
            Text(
              S.current.draw_congratulations_forbeing,
              style: TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              width: _deviceWidth! * 0.80,
              height: _deviceHeight! * 0.08,
              decoration: BoxDecoration(
                color: colorGlobal.shade900,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    "$vTituloSorteo",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        overflow: TextOverflow.ellipsis,
                        fontFamily: 'Barlow'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                width: 200,
                height: 50,
                child: TextButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
                  onPressed: () {
                    setState(() {
                      Navigator.pushNamed(context, '/');
                    });
                  },
                  child: Text(
                    S.current.backtohome,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  colorGlobal,
                  colorGlobal.shade600,
                  colorGlobal.shade700,
                  colorGlobal,
                  colorGlobal.shade600,
                  colorGlobal.shade700,
                  colorGlobal.shade900,
                ])),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
