1강
- 로그인 기능: 엑세스 토큰과 리프레쉬 토큰을 발급받는 방식으로 구현.
- 기능과 관련지으면서 폴더 구조를 만든다. 
- 0xff = 투명도가 없는 색상.

9강

- 127.0.0.1 = 내 컴퓨터 안에서 연결하는 것. local host랑 같음.
- swagger = api를 만들고 나서 그걸 문서화할 때 가장 효율적이고 대중적인 프레임워크. 서버 개발할 때 반드시 쓸 줄 알아야 함. 

test@codefactory.ai:testtest

12강
- jwt에서 디코딩 해봤을 때 sub  에 있는 게 아이디값.
- iat는 토큰 발급된 시간, ext는 만료되는 시간.

13강
- 일반적인 로컬 호스트에 서버를 생성하면 레이턴시(네트워크가 왕복하는데 걸리는 시간)가 거의 없음. 내 컴에 서버가 있고 거기로 요청을 보내니까. 
- 그러나 현실에서는 그렇지 않고 지금 서버에는 일부러 500ms 정도 레이턴시 설정돼있음.

15강
- initstate에는 await 못 넣음. 그래서 함수를 따로 만들어 줘야 함. 

16강
  AppBar? renderAppBar() {
    if (title == null) {
      return null;
    } else {
      return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          title!,
        ),
      );
    }
  }
  - 이런 식으로 null 될 수 있는 경우를 조건문으로 써줄 때는 else에서 ! 붙여주면 됨. 
  - type: BottomNavigationBarType.shifting 선택된 걸 좀 더 크게 보여줌.

17강
- class _RootTabState extends State<RootTab> with SingleTickerProviderStateMixin{
  
  TabController controller;
  int index = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
    
    탭 컨트롤러에선 vsync랑 SingleTickerProviderStateMixin를 넣어서 이런 식으로 세팅해줘야 함. 
- late와 ? 해주는 것의 차이
late:나중에 값이 입력될 것이므로 최초의 한 번만 null 값을 허용한다. 
? : null을 계속적으로 허용한다. 
지금 이 진도에서는 ?를 쓰면 controller를 쓸 때마다 null처리를 해줘야 함. if controller==null 어쩌구.. 를 계속 해줘야 함. 