## フォロー機能の仕組み
- フォローする側とフォローされる側のUserは多対多の関係
  - Followingモデル / Followerモデル / 中間テーブル
- ただしUserモデルは1つしかないため、class_nameオプションを使用して、1つのモデルを便宜的に異なる2つのモデルとする。
- Followingから見て、中間テーブル経由でFollowerのidを取得
- Followerから見て、中間テーブル経由でFollowingのidを取得

## 教訓
- エラーの原因は自分のコーディングのミス
  - PC側やテキストのミスを原因と決めつけず（仮説想定はあり）、ミスを丁寧に仮説・検証する
  - ミスを解らないまま、スキップしない。
  - ミスは細部に宿る

## 要点
- class_nameとは、1つのモデルを、便宜的に2つの別のモデルとして参照できるようにするためのオプションのこと
- sourceとは、参照元のモデルを指すオプションのこと