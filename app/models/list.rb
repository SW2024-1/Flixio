class List < ApplicationRecord
    # リストは1人のユーザーに紐付く
    belongs_to :user, optional: true
    # リストは複数のListitemを持つ
    has_many :listitems

end
