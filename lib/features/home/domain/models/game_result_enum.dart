enum GameResultEnum {
  ongoing,
  win,
  lose,
  draw;
}

GameResultEnum fromGameResultTypeId(int id) => switch (id) {
      1 => GameResultEnum.win,
      2 => GameResultEnum.lose,
      3 => GameResultEnum.draw,
      _ => GameResultEnum.ongoing,
    };
