class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tweets

  # 中間テーブル名の再定義 : following側もfollower側もどちらもhas_many:relationshipsとなるため、どちらの経路か判別できない。
  # フォローする側とフォローされる側のUserから見た中間テーブルの名前を再定義 & 外部キー制約
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  # throughで中間テーブルと紐付け & 参照モデル指定のため、sourceオプションを使用(参照元のモデルを指すオプション)
  has_many :followings, through: :active_relationships, source: :follower

  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following

  # フォローされているかを判定
  def followed_by?(user)
    # 中間テーブルを参照し、ユーザーidと一致するfollowing_idが存在すればその情報を取得。存在しなければnilを返す。
        # => 該当するユーザーが存在すれば「[#<Relationship:0x00007fb304952e50 id: 1, following_id: 1, follower_id: 1, created_at: Wed, 05 Aug 2020 16:07:15 UTC +00:00, updated_at: Wed, 05 Aug 2020 16:07:15 UTC +00:00>]」のような値を取得する
        # => 該当するユーザーが存在しなければnilを取得する
    follower = passive_relationships.find_by(following_id: user.id)
    return follower.present?
  end
end
