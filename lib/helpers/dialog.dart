
var stopCommands = [
  '대화를 그만 하고 싶으시군요?',
  '다른 대화를 해볼까요?',
  '마음이 많이 힘드시군요'
];

var helloCommands = [
  '반가워요! ',
  '안녕하세요 고민이 있으시면 말씀해주세요!',
  '안녕하세요! 잘 지내셨나요?',
];
// 0: thrower / 1: receiver
var additionalMessage = {
  // 16 : Sleep changes Topic
  16:{
    0: [
      "다른 어려운 점은 없으신가요?",
      "그렇군요 알겠습니다."
    ],
    11: [
      "잘 주무신다니 다행이예요! \n다른 어려움은 없으신가요?",
      "원래 잠을 잘 주무셨나요? \n스트레스 받는 일은 없으신가요?"
          "최근에 잠은 잘 주무시나요?",
      "잠을 설치는 일이 많으신가요?",
      "새벽까지 잠을 못 자는 경우가 많으신가요?"
    ],
    12: [
      "잠을 못 자는 원인이 무엇인지 알 수 있을까요?",
      "잠을 잘 못 자서 다른 힘든 점이 있나요?"
    ],
  },
};