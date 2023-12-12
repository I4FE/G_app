import 'package:flutter/material.dart';
import 'package:untitled/api.dart';


void main() {
  runApp(const MyApp());
}
void _showHelpDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('도움말'),
        content: const SingleChildScrollView(
          child: ListBody(
            children:  [
              Text('1. 마이크 버튼을 클릭해주세요'),
              Text('2. 스마트폰의 궁금한 기능을 말씀해주세요'),
              Text('3. 지박사가 궁금한 내용을 답해줄 거에요'),
              Text('4. 답변이 이해가 안 되시면 답변 다시듣기 버튼을 눌러주세요'),
              Text('5. 추가로 질문하고 싶으면 질문 다시하기 버튼을 눌러주세요'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('닫기'),
          ),
        ],
      );
    },
  );
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // MaterialApp을 사용하여 앱을 초기화합니다.
    return const MaterialApp(
      // 첫 번째 페이지로 이동
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Scaffold는 앱의 기본 구조를 제공합니다.
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0, // 원하는 높이로 조절
        title: Container(
          margin: const EdgeInsets.only(top: 25),
          child: const Text(
            '지박사',
            style: TextStyle(
              fontFamily: 'Noto Sans',
              color: Colors.white,
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      body: Stack(
        children: [
          // 파란색 네모 배경 (30%)
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              color: Colors.blue,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.25, // 30%
            ),
          ),
          // 하얀색 네모(안내창) 배경 (60%부터 70%까지, 가로 길이는 40%부터 60%까지, 가로 기준으로 가운데 정렬)
          Positioned(
            top: MediaQuery.of(context).size.height * 0.4, // 50%
            left: MediaQuery.of(context).size.width * 0.3 - MediaQuery.of(context).size.width * 0.4 / 2, // 가로 기준 가운데 정렬
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity((0.2)),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width * 0.8, // 40%
              height: MediaQuery.of(context).size.height * 0.05, // 10%
              child: const Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      "클릭 후 말씀해주세요",
                      style: TextStyle(
                        color: Colors.black, // 텍스트 색상
                        fontSize: 16, // 텍스트 크기
                        fontWeight: FontWeight.bold, // 텍스트 굵기
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // 하얀색 네모(질문창) 배경 (20%부터 40%까지, 가로 길이는 40%부터 60%까지, 가로 기준으로 가운데 정렬)
          Positioned(
            top: MediaQuery.of(context).size.height * 0.1, // 20%
            left: MediaQuery.of(context).size.width * 0.3 - MediaQuery.of(context).size.width * 0.4 / 2, // 가로 기준 가운데 정렬
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity((0.2)),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width * 0.8, // 2배로 늘림 (40%)
              height: MediaQuery.of(context).size.height * 0.2, // 40%
            ),
          ),
          // 하얀색 네모 배경 (70%)
          Positioned(
            top: MediaQuery.of(context).size.height * 0.7, // 70%
            left: 0,
            child: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3, // 30%
            ),
          ),
          // 두 번째 페이지로 이동하는 버튼 추가
          // 마이크 버튼 추가
          Positioned(
            top: MediaQuery.of(context).size.height * 0.60,
            left: MediaQuery.of(context).size.width * 0.5 - 25,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue, // 파란색 동그라미의 배경색
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.mic,
                  size: 50,
                  color: Colors.white, // 마이크 아이콘의 색상
                ),
                onPressed: () {
                  // 두 번째 페이지로 이동
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SecondPage()),
                  );
                },
              ),
            ),
          ),
          // 도움말 버튼 추가
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {
                // 도움말 창 열기
                _showHelpDialog(context);
              },
              icon: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.indigo.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: const Offset(0, 2)
                    )
                  ]
                ),
                child:const Icon(
                  Icons.help,
                  color: Colors.white,
                ),
              ),
              tooltip: '도움말',
            ),
          ),
        ],
      ),
    );
  }
}


class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 두 번째 페이지의 UI를 정의
    return Scaffold(
      appBar: AppBar(
        toolbarHeight:80.0,
        title: Container(
          margin: const EdgeInsets.only(top: 25),
          child: const Text(
            '지박사',
            style: TextStyle(
              fontFamily: 'Noto Sans',
              color: Colors.white,
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        leading: Container(
          margin: const EdgeInsets.only(top: 25),
          child: IconButton(
            onPressed: () {
              // 뒤로가기 기능
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.chevron_left,
              color: Colors.white,
              size: 40, // 아이콘의 크기
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          // 상단 30%까지 파란 박스
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              color: Colors.blue,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.25, // 30%
            ),
          ),
          // 하얀 박스(안내창)
          Positioned(
            top: MediaQuery.of(context).size.height * 0.4,
            left: MediaQuery.of(context).size.width * 0.3 - MediaQuery.of(context).size.width * 0.4 / 2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity((0.2)),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.05,
              child: const Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      "듣는 중...",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // 하얀 박스(질문창)
          Positioned(
            top: MediaQuery.of(context).size.height * 0.1,
            left: MediaQuery.of(context).size.width * 0.3 - MediaQuery.of(context).size.width * 0.4 / 2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity((0.2)),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.2,
            ),
          ),
          //하얀박스 배경 부분
          Positioned(
            top: MediaQuery.of(context).size.height * 0.7,
            left: 0,
            child: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
            ),
          ),
          // 로딩창 버튼 추가
          Positioned.fill(
            top: MediaQuery.of(context).size.height * 0.4,
            child: const Align(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            ),
          ),
          //세번째 페이지 이동 부분
          Positioned(
            bottom: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                // 세 번째 페이지로 이동
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ThirdPage()),
                );
              },
              child: const Text('Go to Third Page'),
            ),
          ),
        ],
      ),
    );
  }
}


class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //상단 바
      appBar: AppBar(
        toolbarHeight: 80.0,
        title: Container(
          margin: const EdgeInsets.only(top: 25),
          child: const Text(
            '지박사',
            style: TextStyle(
              fontFamily: 'Noto Sans',
              color: Colors.white,
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        leading: Container(
          margin: const EdgeInsets.only(top: 25),
          child: IconButton(
            onPressed: () {
              // 뒤로가기 기능
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.chevron_left,
              color: Colors.white,
              size: 40, // 아이콘의 크기
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          //파란 배경 박스
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              color: Colors.blue,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.25, // 30%
            ),
          ),
          //하얀 박스 (안내창)
          Positioned(
            top: MediaQuery.of(context).size.height * 0.40,
            left: MediaQuery.of(context).size.width * 0.3 - MediaQuery.of(context).size.width * 0.4 / 2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity((0.2)),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.05,
              child: const Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      "질문 입력중...",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //하얀 박스(질문 창)
          Positioned(
            top: MediaQuery.of(context).size.height * 0.10,
            left: MediaQuery.of(context).size.width * 0.3 - MediaQuery.of(context).size.width * 0.4 / 2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity((0.2)),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.2,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Center(
                child: Text(
                  "어이 지박사, 내가 화면 확대하는 법을 모르겠어. 아들이 손가락으로 뭐 어떻게 하면 된다는데 알려줘",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            top: MediaQuery.of(context).size.height * 0.7,
            left: 0,
            child: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
            ),
          ),
          // 로딩창 버튼 추가
          Positioned.fill(
            top: MediaQuery.of(context).size.height * 0.4,
            child: const Align(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                // 세 번째 페이지로 이동
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FourthPage()),
                );
              },
              child: const Text('Go to Fourth Page'),
            ),
          ),
        ],
      ),
    );
  }
}

class FourthPage extends StatefulWidget {
  const FourthPage({Key? key}) : super(key: key);

  @override
  _FourthPageState createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  String gptResponse = "GPT 답변"; // 초기값

  @override
  void initState() {
    super.initState();
    fetchGPTResponse(); // API 호출
  }

  void fetchGPTResponse() async {
    String userInput = "안녕 gpt, 너는 지박사라는 노인 도우미를 연기해야해. 질문에 친절하게 대답해줘. 지금 너에게 질문하는 사람은 화면의 펀치 줌 기능을 배우고 싶어하는 노인이야. 어이 지박사, 내가 화면 확대하는 법을 모르겠어. 아들이 손가락으로 뭐 어떻게 하면 된다는데 알려줘";
    String response = await getGPT3Response(userInput);
    setState(() {
      gptResponse = response; // API 응답으로 상태 업데이트
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //상단 바
      appBar: AppBar(
        toolbarHeight: 80.0,
        title: Container(
          margin: const EdgeInsets.only(top: 25),
          child: const Text(
            '지박사',
            style: TextStyle(
              fontFamily: 'Noto Sans',
              color: Colors.white,
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          //파란 배경 박스
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              color: Colors.blue,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.25, // 30%
            ),
          ),
          //하얀 박스 (답변창)
          Positioned(
            top: MediaQuery.of(context).size.height * 0.35,
            left: MediaQuery.of(context).size.width * 0.3 - MediaQuery.of(context).size.width * 0.4 / 2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity((0.2)),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.25,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16), // 좌우 마진 추가
                child: SingleChildScrollView(
                  child: Text(
                    gptResponse,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.justify, // 텍스트 정렬 조정
                    softWrap: true,
                  ),
                ),
              ),

            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.1,
            left: MediaQuery.of(context).size.width * 0.3 - MediaQuery.of(context).size.width * 0.4 / 2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity((0.2)),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.2,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Center(
                child: Text(
                  "어이 지박사, 내가 화면 확대하는 법을 모르겠어. 아들이 손가락으로 뭐 어떻게 하면 된다는데 알려줘",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            top: MediaQuery.of(context).size.height * 0.7,
            left: 0,
            child: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
            ),
          ),
          // Refresh 아이콘 버튼 추가
          Positioned(
            top: MediaQuery.of(context).size.height * 0.7 - 30, // 80% 위치에서 30픽셀 위로
            left: MediaQuery.of(context).size.width * 0.2, // 화면 가로 중앙에서 왼쪽으로 이동
            child: Column(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.refresh,
                    color: Colors.blue,
                    size: 40,
                  ),
                  onPressed: () {
                    // handleRefresh 함수 호출
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FourthPage()),
                    );
                  },
                ),
                const SizedBox(height: 5), // 간격 조절
                const Text(
                  "답변 다시 듣기",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15, // 원하는 크기로 조절
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          // 질문 다시하기 아이콘 추가
          Positioned(
            top: MediaQuery.of(context).size.height * 0.7 - 30,
            left: MediaQuery.of(context).size.width * 0.8 - 80,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.mic,
                      size: 40,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      //첫 번째 페이지로 이동
                      Navigator.popUntil((context), (route) => route.isFirst);
                    },
                  ),
                ),
                const SizedBox(height: 5), // 간격 조절
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Text(
                    "질문 다시하기",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}



