class Cliente < ApplicationRecord
  has_one :balanciamentos, class_name: 'Balanciamento', dependent: :restrict_with_exception
end
