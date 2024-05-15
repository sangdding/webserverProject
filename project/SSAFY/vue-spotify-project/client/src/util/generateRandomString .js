const generateRandomString = (num) => {
  const characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
  // 문자열을 요구하는 것이니 대문자 A부터 소문자 z까지 하나의 문자열로 작성한다.
  let result = "";
  // 최종 값을 담을 변수
  const charactersLength = characters.length;
  // 문자열의 길이를 담은 변수
  for (let i = 0; i < num; i++) {
    result += characters.charAt(Math.floor(Math.random() * charactersLength));
    // charAt은 문자열에서 특정 인덱스에 위치한 유니코드 단일 문자를 반환한다.
    // floor는 주어진 숫자에서 가장 큰 수로 반환한다.
    // random은 주어진 숫자에서 랜덤으로 수를 뽑아낸다. 
  }

  return result;
};

export { generateRandomString };
