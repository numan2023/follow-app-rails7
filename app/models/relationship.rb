class Relationship < ApplicationRecord
  # class_nameオプションとは、1つのモデルに対して、2つのアソシエーションを組む場合に用いる。
    # 便宜的にUserモデルを2つのモデルに分けることができる。
  belongs_to :following, class_name: "User"
  belongs_to :follower, class_name: "User"
end
