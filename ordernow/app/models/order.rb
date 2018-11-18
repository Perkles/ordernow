class Order < ActiveRecord::Base
    validates :data, :description, :value, presence:  { message: ' - Esse campo é obrigatorio' }
    validates :value, numericality: { greater_than_or_equal_to: 1, message: ' - O valor tem de ser maior que zero' }
end
